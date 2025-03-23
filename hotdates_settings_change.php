<?php
/* (C) Websplosion LTD., 2001-2014

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */

include("./_include/core/main_start.php");
require_once("./_include/current/hotdates/tools.php");

$settings = CHotdatesTools::settings();

$category_id = intval(get_param('category_id', $settings['category_id']));
CHotdatesTools::setting_set('category_id', $category_id);

CHotdatesTools::settings_save();

//$return_to = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "hotdates.php";
$return_to = "hotdates.php";
redirect($return_to);

include("./_include/core/main_close.php");
