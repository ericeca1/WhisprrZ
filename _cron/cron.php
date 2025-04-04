<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */

if (php_sapi_name() === 'cli') {
    $_SERVER['REQUEST_URI'] = '/_cron/cron.php';
    $_SERVER['HTTP_HOST'] = 'whisprrz.com';
    $_SERVER['SERVER_NAME'] = 'whisprrz.com';
    $_SERVER['DOCUMENT_ROOT'] = '/home/eric/public_html/htdocs/whisprrz.com';
    $_SERVER['SCRIPT_NAME'] = '/_cron/cron.php';
    $_SERVER['REMOTE_ADDR'] = '127.0.0.1';
}

$g['to_root'] = __DIR__ .'/../';
include($g['to_root'] . '_include/core/main_start.php');

$logFile = $g['path']['dir_logs'] . 'cron.txt';
$logActive = true;
if ($logActive) {
    file_put_contents($logFile, date('Y-m-d H:i:s') . " START\n", FILE_APPEND);
}

$min = intval(date('i'));
$hour = intval(date('H'));

if ($min == 0) {
    Flashchat::clearHistory();
}

if ($min % 1 == 0) {
    //DB::execute("UPDATE user SET hide_time=(hide_time-10), last_visit=last_visit WHERE hide_time>0");

    if (!Common::isOptionActive('hide_profile_enabled')) {
        $sql = "UPDATE `user`
                    SET `hide_time` = 0
                    WHERE `hide_time` > 0";
        DB::execute($sql);
    }
    // use as online
    $onlineCount = trim($g['options']['use_as_online_count']);

    if ($onlineCount != 0) {
        $onlineRange = explode('-', $onlineCount);
        if(!isset($onlineRange[1])) {
            $count = intval($onlineRange[0]);
        } else {
            $count = rand(intval(trim($onlineRange[0])), intval(trim($onlineRange[1])));
        }

        if($count) {
            $timeDelta = 60 * (2 + $g['options']['online_time']);

            // update users
            $sql = 'UPDATE user
                SET last_visit = ' . to_sql(date('Y-m-d H:i:s', time() - $timeDelta), 'Text') . '
                WHERE hide_time = 0
                    AND use_as_online = 1';
            DB::execute($sql);

            // update only online members
            // +60 minutes if cron can runs only every 30 minutes or more
            $timeoutForCron = 60 * 60;
            $sql = 'UPDATE user
                SET last_visit = ' . to_sql(date('Y-m-d H:i:s', time() + $timeDelta + $timeoutForCron), 'Text') . '
                WHERE hide_time = 0
                    AND use_as_online = 1
                ORDER BY RAND() LIMIT ' . intval($count);
            DB::execute($sql);
        }
    }

    if(!IS_DEMO) {
        include_once(dirname(__FILE__) . '/../_include/current/match_mail.php');
        Match_Mail::run();
    } else {
		LiveStreaming::updateDemoData();
	}

    /*$lastDataPostWall = Common::getOption('last_date', 'event_wall_birthday');
    $currentDate = date('Y-m-d');
    if ($currentDate > $lastDataPostWall && date('H:i:s') >= '10:00:00') {
        $sql = 'SELECT `user_id`, `name` FROM `user` WHERE DATE_FORMAT(`birth`, "%m-%d") = ' . to_sql(date('m-d'), 'Text');
        $users = DB::rows($sql);
        foreach ($users as $user) {
            Wall::add('comment', 0, $user['user_id'], 'item_birthday', false, 0, 'friends');
        }
        Config::updateAll('event_wall_birthday', array('last_date' => $currentDate));
    }*/

    $debug = false;

    DB::query('SELECT * FROM massmail WHERE status = 0 ORDER BY id ASC LIMIT 1');
    if (DB::num_rows()) {
        $massmail = DB::fetch_row();
        debug_log("MASSMAIL", print_r($massmail, true));

        $subject = $massmail['subject'];

        // limit based on settings
        $limit = (isset($g['massmail']['limit']) ? $g['massmail']['limit'] : 10);
        $where = '';
        if ($massmail['users'] == 0 && $massmail['other'] == 0 && $massmail['partners'] == 1 && $massmail['send_partner'] != 1) {
            $sql = "UPDATE massmail SET send_partner=1 WHERE id=" . $massmail['id'];
            debug_log("SQL PARTNERS ONLY START", $sql);
            DB::execute($sql);
            $massmail['send_partner'] = 1;
        }

        if ($massmail['send_partner'] != 1) {
            $isSendToConfirmedOnly = Common::isOptionActive('send_emails_only_to_confirmed_emails');

            $whereUsers = '';

            if ($massmail['users'] == 1) {
                $where = 'use_as_online = 0 AND u.ban_global = 0 AND u.user_id != 0 AND u.lang IN (' . $massmail['languages'] . ') AND ';
                if($isSendToConfirmedOnly) {
                    $where .= ' u.active_code = "" AND ';
                }

                if($massmail['users_filter']) {
                    $massmailUsersFilter = json_decode($massmail['users_filter'], true);
                    if($massmailUsersFilter) {

                        if(isset($massmailUsersFilter['paid']) && $massmailUsersFilter['paid'] !== '') {
                            $freeOrientationsWhere = '';
                            $freeOrientations = DB::select('const_orientation', '`free` != "none"');
                            if($freeOrientations) {
                                $freeOrientationsList = array();
                                foreach($freeOrientations as $freeOrientation) {
                                    $freeOrientationsList[] = $freeOrientation['id'];
                                }
                                $freeOrientationsWhere = implode(',', $freeOrientationsList);
                            }

                            if($massmailUsersFilter['paid'] === '1') {
                                $wherePaid = '(u.gold_days > 0 AND u.type != "none")';
                                if($freeOrientationsWhere) {
                                    $whereUsers .= "($wherePaid OR (u.orientation IN ($freeOrientationsWhere))) AND ";
                                } else {
                                    $whereUsers .= $wherePaid . ' AND ';
                                }
                            } elseif($massmailUsersFilter['paid'] === '0') {
                                $whereUsers .= '(u.gold_days = 0 OR u.type = "none") AND ' . ($freeOrientationsWhere ? " u.orientation NOT IN ($freeOrientationsWhere) AND" : '');
                            }
                        }

                        if(isset($massmailUsersFilter['orientation']) && count($massmailUsersFilter['orientation'])) {
                            $orientations = implode(',', $massmailUsersFilter['orientation']);
                            $whereUsers .= ' u.orientation IN (' . to_sql($orientations, 'Plain') . ') AND ';
                        }

                        if(isset($massmailUsersFilter['date_register_from']) && $massmailUsersFilter['date_register_from']) {
                            $whereUsers .= ' u.register >= ' . to_sql($massmailUsersFilter['date_register_from'] . ' 00:00:00') . ' AND ';
                        }

                        if(isset($massmailUsersFilter['date_register_to']) && $massmailUsersFilter['date_register_to']) {
                            $whereUsers .= ' u.register <= ' . to_sql($massmailUsersFilter['date_register_to'] . ' 23:59:59') . ' AND ';
                        }

                        if(isset($massmailUsersFilter['last_visit_from']) && $massmailUsersFilter['last_visit_from']) {
                            $whereUsers .= ' u.last_visit >= ' . to_sql($massmailUsersFilter['last_visit_from'] . ' 00:00:00') . ' AND ';
                        }

                        if(isset($massmailUsersFilter['last_visit_to']) && $massmailUsersFilter['last_visit_to']) {
                            $whereUsers .= ' u.last_visit <= ' . to_sql($massmailUsersFilter['last_visit_to'] . ' 23:59:59') . ' AND ';
                        }

                        if(isset($massmailUsersFilter['age_from']) && $massmailUsersFilter['age_from']) {
                            $whereUsers .= ' u.birth <= ' . to_sql(date('Y-m-d', strtotime('-' . $massmailUsersFilter['age_from'] . 'year'))) . ' AND ';
                        }

                        if(isset($massmailUsersFilter['age_to']) && $massmailUsersFilter['age_to']) {
                            $whereUsers .= ' u.birth >= ' . to_sql(date('Y-m-d', strtotime('-' . $massmailUsersFilter['age_to'] . 'year'))) . ' AND ';
                        }
                    }
                }

                $where .= $whereUsers;
            }

            if ($massmail['other'] == 1) {
                $where = 'u.user_id IS NULL AND ';
            }
            if ($massmail['users'] == 1 && $massmail['other'] == 1) {
                $whereAddon = '';
                if($isSendToConfirmedOnly) {
                    $whereAddon = ' AND u.active_code = ""';
                }
                $where = '(u.user_id IS NULL OR (' . $whereUsers . ' use_as_online = 0 AND u.ban_global = 0 AND u.lang IN (' . $massmail['languages'] . ') ' . $whereAddon . ' ) ) AND ';
            }

            // choose by language
            // select mails category
            $sql = "SELECT e.id, e.mail, u.user_id, u.name FROM email AS e LEFT JOIN user AS u ON e.mail=u.mail WHERE $where e.id>0 ORDER BY e.id DESC LIMIT 1";
            debug_log("LAST ID", $sql);
            $last_id = DB::result($sql);

            $sql = "SELECT e.id, e.mail, u.user_id, u.name FROM email AS e LEFT JOIN user AS u ON e.mail=u.mail WHERE $where e.id>" . $massmail['last_id'] . " ORDER BY e.id ASC LIMIT $limit";
            //echo $sql;
            DB::query($sql);

            debug_log("SQL", $sql);
            debug_log("MAIL SELECTED", DB::num_rows());

            if (DB::num_rows() == 0) {

                if ($massmail['partners'] == 0) {
                    $sql = "UPDATE massmail SET last_id=0, status=2, send_partner=0 WHERE id=" . $massmail['id'];
                    debug_log("SQL CLOSE", $sql);
                    DB::execute($sql);
                } else {
                    $sql = "UPDATE massmail SET last_id=0, send_partner=1 WHERE id=" . $massmail['id'];
                    debug_log("SQL PARTNERS START", $sql);
                    DB::execute($sql);
                    $massmail['send_partner'] = 1;
                    $massmail['last_id'] = 0;
                }
            }
        }
        // NOW START PARTNERS MAILS
        // NO MAILS IN THIS MASSMAIL > CLOSE

        if ($massmail['partners'] == 1 && $massmail['send_partner'] == 1) {

            $where = 'lang IN (' . $massmail['languages'] . ') AND ';

            // select last partner
            $sql = "SELECT partner_id FROM partner WHERE $where 1 ORDER BY partner_id DESC LIMIT 1";
            debug_log("PARTNER LAST ID", $sql);
            $last_id = DB::result($sql);

            $sql = "SELECT mail, name, partner_id AS id FROM partner WHERE $where partner_id>" . $massmail['last_id'] . " ORDER BY partner_id ASC LIMIT $limit";
            DB::query($sql);

            if (DB::num_rows() == 0) {
                $sql = "UPDATE massmail SET last_id=0, status=2, send_partner=0 WHERE id=" . $massmail['id'];
                debug_log("SQL CLOSE", $sql);
                DB::execute($sql);
            }
        }

        $i = 1;

        while ($row = DB::fetch_row()) {
            $text = str_replace("{title}", $g['main']['title'], $massmail['text']);
            if (!isset($row['name']))
                $row['name'] = "";
            $text = str_replace("{name}", $row['name'], $text);

            if (!$debug) {
                send_mail($row['mail'], $g['main']['info_mail'], $subject, $text);
                debug_log('mail sent', $row['mail'] . ':' . $g['main']['info_mail']);
            } else {
                debug_log('mail sent', $row['mail'] . ':' . $g['main']['info_mail'] . ':' . $subject . ':' . $text);
            }
            // UPDATE last_id
            $sql = "UPDATE massmail SET last_id=" . $row['id'] . ", emails_sent = emails_sent + 1 WHERE id=" . $massmail['id'];
            debug_log($i++ . " :: SQL UPDATE", $sql);
            DB::execute($sql);
            if ($row['id'] == $last_id) {
                $sql = "UPDATE massmail SET last_id=0, status=2, send_partner=0 WHERE id=" . $massmail['id'];
                debug_log("SQL FINISH", $sql);
                DB::execute($sql);
            }
        }
    }
}

function debug_log($msg, $val)
{
    return;
    global $debug;
    print "$msg :: $val <br>";
}

if ($min % 10 == 0) {
    DB::delete('city_moving', '`created` < ' . to_sql((date('Y-m-d H:i:00', time() - 600))));
}

// Hourly
$timeCronHourly = Common::getOption('date','cron_hourly');

if (date('Y-m-d H')>$timeCronHourly){
    Config::update('cron_hourly', 'date', date('Y-m-d H'));

    $date = date('Y-m-d');
    $hour = intval(date('H'));

    if (Common::isEnabledAutoMail('end_paid') && !Common::isOptionActive('free_site')) {
        DB::query('SELECT * FROM user WHERE gold_days=1 AND payment_day<"'.$date.'" AND payment_hour='.$hour. '');
        while ($row = DB::fetch_row()) {
            $vars = array(
                'title' => $g['main']['title'],
                'name' => $row['name'],
            );
            Common::sendAutomail($row['lang'], $row['mail'], 'end_paid', $vars);
        }
    }
    // update only profiles that will be free now
    $data = array('type' => 'none');
    if (!User::isAllowedInvisibleMode(false)) {
        $data['set_hide_my_presence'] = 2;
        $data['set_do_not_show_me_visitors'] = 2;
    }
    DB::update('user', $data, '`gold_days` = 1  AND payment_day<"'.$date.'" AND payment_hour='.$hour. '');

    DB::execute('UPDATE user SET gold_days=(gold_days-1), last_visit=last_visit WHERE gold_days>0  AND payment_day<"'.$date.'" AND payment_hour='.$hour. ';');

    $numberDaysDeleteProfile = abs(intval(Common::getOption('number_days_delete_profile_unconfirmed_email')));
    if ($numberDaysDeleteProfile) {
        $timeDelta = abs(intval(Common::getOption('join_unconfirmed_email_max_days'))) + $numberDaysDeleteProfile;
        $timeDelta *= 24 * 60 * 60;
        $dateWhere = date('Y-m-d H:i:s', time() - $timeDelta);

        $usersDelete = DB::rows("SELECT `user_id` FROM `user` WHERE active_code != '' AND `change_mail` < " . to_sql($dateWhere));
        foreach ($usersDelete as $user) {
            delete_user($user['user_id']);
        }
    }
}

// Daily
$date = date('Y-m-d');

if ($hour == 0) {
    clearOldFilesSite();

    $timecron = Common::getOption('date','cron');
    if($timecron != $date) {
        Config::update('cron', 'date', $date);
        DB::update('user', array('sp_sending_messages_per_day' => 0));
    }
    DB::delete('city_link', '`temp` = 1 AND `system` = 0 AND `created` < ' . to_sql((date('Y-m-d H:i:00', time() - 3600*24*7))));
    $usersVisitor = DB::select('city_users', '`user_id` = 0 AND `last_visit` < ' . to_sql((date('Y-m-d H:i:00', time() - 3600*24*7))));
    foreach ($usersVisitor as $user) {
        City::deleteUser($user['id'], true);
    }
    City::deleteOldItemInRoomForStreetChat();

    ImAudioMessage::deleteNotUsedFiles();
}

if ($hour == 10) {
    $lastDataPostWall = Common::getOption('last_date', 'event_wall_birthday');
    if ($date != $lastDataPostWall) {
        if ($lastDataPostWall === null) {
            Config::add('event_wall_birthday', 'last_date', 0, 'max', 0);
        }
        Config::update('event_wall_birthday', 'last_date', $date);
        $dateBirthday = date('m-d');
        $whereDate = '';
        if ($dateBirthday == '03-01' && !checkdate('02', '29', date('Y'))) {
            $whereDate = " OR DATE_FORMAT(`birth`, \"%m-%d\") = '02-29'";
        }
        $sql = 'SELECT `user_id`, `name`
                  FROM `user`
                 WHERE DATE_FORMAT(`birth`, "%m-%d") = ' . to_sql(date('m-d'))
                 . $whereDate;
        $users = DB::rows($sql);
        foreach ($users as $user) {
            Wall::add('comment', 0, $user['user_id'], 'item_birthday', false, 0, 'friends');
        }
    }
}

if ($min % 1 == 0) {
    $sql = "SELECT m.*, po.partyhou_ids, po.open_partyhouz_id, po.resets 
            FROM partyhouz_partyhou AS m
            LEFT JOIN partyhouz_open AS po 
            ON FIND_IN_SET(m.partyhou_id, po.partyhou_ids)
            WHERE m.is_open_partyhouz = 1
            AND po.is_disabled = 0
            AND TIMESTAMPDIFF(MINUTE, m.partyhou_datetime , NOW()) >= po.resets
            AND m.partyhou_id = TRIM(TRAILING ',' FROM SUBSTRING_INDEX(po.partyhou_ids, ',', -1))";

    $rows = DB::rows($sql);
    foreach ($rows as $row) {
        $partyhou_id = $row['partyhou_id'];
        $open_partyhouz_id = $row['open_partyhouz_id']; 
    	$partyhou_ids = explode(',', $row['partyhou_ids']);
    	$resets = $row['resets'];
        
        unset($row['partyhou_id']);
        unset($row['open_partyhouz_id']);
        unset($row['partyhou_ids']);
        unset($row['resets']);
        
        $originalDateTime = new DateTime();
        $row['partyhou_datetime'] = $originalDateTime->format('Y-m-d H:i:s');

        $filteredRow = array_filter($row, function ($key) {
            return is_string($key);
        }, ARRAY_FILTER_USE_KEY);
        
        $columns = array_keys($filteredRow);
        $values = array_values($filteredRow);
        
        $columnsString = implode(", ", $columns);
        $valuesString = implode(", ", array_map(function ($value) {
            return "'" . addslashes($value) . "'";
        }, $values));

        DB::execute("INSERT INTO partyhouz_partyhou ($columnsString) VALUES ($valuesString)");
        $new_partyhou_id = DB::insert_id();
        if ($new_partyhou_id) {
            array_push($partyhou_ids, $new_partyhou_id);
            if( count($partyhou_ids) > 20 ) {
                $partyhou_ids = array_slice($partyhou_ids, 10);
            }
            $partyhou_ids = implode(",", $partyhou_ids);
            $updateSql = "UPDATE partyhouz_open 
                            SET partyhou_ids = " . to_sql($partyhou_ids, 'Text') . "
                            WHERE open_partyhouz_id = $open_partyhouz_id";
            DB::execute($updateSql);
        }
    }

    //Delete Partyhouz
    $delete_open_partyhou_enable = Common::getOption('delete_partyhouz_enable', 'options');
    $delete_open_partyhou_time = Common::getOption('delete_open_partyhouz_everytime', 'options');
    if ($delete_open_partyhou_enable == 'Y') {
        $current_time = date('Y-m-d H:i:s');
    
        $delete_partyhou_sql = "
            SELECT m.*, po.*
            FROM partyhouz_partyhou AS m 
            LEFT JOIN partyhouz_open AS po ON FIND_IN_SET(m.partyhou_id, po.partyhou_ids)
            WHERE m.is_open_partyhouz = 1 
            AND TIMESTAMPDIFF(MINUTE, m.partyhou_datetime, '$current_time') >= $delete_open_partyhou_time
        ";
        
        $delete_partyhou_rows = DB::rows($delete_partyhou_sql);
        foreach ($delete_partyhou_rows as $row) {
            $partyhou_id = $row['partyhou_id'];
            $partyhou_ids = $row['partyhou_ids'];
            $partyhou_ids_array = explode(',', $partyhou_ids);
            if (end($partyhou_ids_array) != $partyhou_id) {
                CpartyhouzTools::delete_partyhou($partyhou_id, true);
                
                $update_ids_sql = "UPDATE partyhouz_open SET partyhou_ids = 
                TRIM(BOTH ',' FROM REPLACE(CONCAT(',', partyhou_ids, ','), CONCAT(',', '$partyhou_id', ','), ','))
                WHERE FIND_IN_SET('$partyhou_id', partyhou_ids)";

                DB::execute($update_ids_sql);
            }
        }
    }
}

if(EmailQueue::isActive()) {
    $emailQueue = new EmailQueue();
    $emailQueue->send();
}

echo 'Cron works';

if($logActive) {
    file_put_contents($logFile, date('Y-m-d H:i:s') . " END\n", FILE_APPEND);
}

include($g['to_root']. '_include/core/main_close.php');