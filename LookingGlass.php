<?php
/* (C) Websplosion LTD., 2001-2014

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */
$area = "login";
include('./_include/core/main_start.php');

class CLookingGlass extends CHtmlBlock
{
    function init()
    {
        global $g;
    }

    function parseBlock(&$html)
    {
        global $g_user, $g;
        $guid = guid();
        $uid = User::getParamUid(0);

        // Manually include the search form content
        $dirTmpl = $g['tmpl']['dir_tmpl_main'];
        $searchFormPath = $dirTmpl . 'looking_glass_search.html';
        
        if (file_exists($searchFormPath)) {
            // Read the file content
            $searchFormContent = file_get_contents($searchFormPath);
            
            // Extract just the looking-glass-search part using regex
            if (preg_match('/<!-- begin_looking_glass_search -->(.*?)<!-- end_looking_glass_search -->/s', $searchFormContent, $matches)) {
                // Replace the include directive with the actual form content
                $searchForm = $matches[1];
                $html->setvar('looking_glass_search_include', $searchForm);
            }
        }

        $tab = get_param('tab', 'photos'); // Determine the active tab (default to 'photos')

        // Handle search parameters - updated to match calendar search modal parameters
        $searchParams = array(
            'country_id' => get_param('country_id', ''),
            'state_id' => get_param('state_id', ''),
            'city_id' => get_param('city_id', ''),
            'looking_for' => array_filter(array(
                'couple' => get_param('looking_for_couple', 0),
                'female' => get_param('looking_for_female', 0),
                'male' => get_param('looking_for_male', 0),
                'transgender' => get_param('looking_for_transgender', 0),
                'nonbinary' => get_param('looking_for_nonbinary', 0),
                'fullswap' => get_param('looking_for_fullswap', 0),
                'softswap' => get_param('looking_for_softswap', 0),
                'bdsm' => get_param('looking_for_bdsm', 0),
                'voyeurism' => get_param('looking_for_voyeurism', 0),
            )),
            'calendar_month' => get_param('calendar_month', ''),
            'calendar_year' => get_param('calendar_year', ''),
            'calendar_distance' => get_param('calendar_distance', ''),
        );


        // Apply search filters
        $searchFilter = '';
        if (!empty($searchParams['country_id'])) {
            $searchFilter .= ' AND `country_id` = ' . to_sql($searchParams['country_id'], 'Number');
        }
        if (!empty($searchParams['state_id'])) {
            $searchFilter .= ' AND `state_id` = ' . to_sql($searchParams['state_id'], 'Number');
        }
        if (!empty($searchParams['city_id'])) {
            $searchFilter .= ' AND `city_id` = ' . to_sql($searchParams['city_id'], 'Number');
        }
        if (!empty($searchParams['looking_for'])) {
            $lookingForFilter = array();
            foreach ($searchParams['looking_for'] as $key => $value) {
                if ($value) {
                    $lookingForFilter[] = '`looking_for` = ' . to_sql($key, 'Text');
                }
            }
            if (!empty($lookingForFilter)) {
                $searchFilter .= ' AND (' . implode(' OR ', $lookingForFilter) . ')';
            }
        }
        
        if ($tab === 'friends') {
            // Fetch the list of friends for the current user
            $friends = DB::field('friends', 'fr_user_id', '`user_id` = ' . to_sql($uid, 'Number'));
            if (!empty($friends)) {
                $friendFilter = ' AND `user_id` IN (' . implode(',', array_map('to_sql', $friends)) . ')';
            } else {
                $friendFilter = ' AND 0'; // No friends, so no photos
            }
        } else {
            $friendFilter = ''; // No filter for other tabs
        }

        // Photos section
        $pageTitle = l('looking_glass_photos');
        $mediaPageTitle = l('photos');
        $pageDescription = '';
        $pageClass = 'photos_list';

        $pageUrl = Common::pageUrl('photos_list') . '?tab=' . $tab; // Ensure the URL includes the tab parameter
        $optionTmplName = Common::getTmplName();

        $vars = array(
            'page_number' => 1,
            'page_class'  => $pageClass,
            'page_title'  => $pageTitle,
            'page_description' => $pageDescription,
            'page_user_id'     => $uid,
            'page_guid' => $guid,
            'url_pages' => $pageUrl,
            'page_type' => 'photos',
            'page_filter' => intval(!$uid),
        );

        $pagerOnPage = Common::getOptionInt('looking_glass_display_photo_count', "options");
        $limit = $pagerOnPage;

        CProfilePhoto::$isGetDataWithFilter = true;
        $itemsTotal = CProfilePhoto::getTotalAccessedPhotos($uid, $friendFilter . $searchFilter); // Apply friend and search filters
        $html->assign('', $vars);

        $class = "Template{$optionTmplName}";
        $rows = $class::parseListPhotos($html, $friendFilter . $searchFilter, $limit, '', true); // Apply friend and search filters
        if ($rows) {
            Common::parsePagesListUrban($html, 1, $itemsTotal, $pagerOnPage, '', '', 'page', '');
        } else {
            $html->parse("list_noitems");
        }

        $html->setvar('looking_glass_group_title', $pageTitle);
        $html->setvar('media_page_link', $pageUrl);
        $html->setvar('media_page_title', $mediaPageTitle);

        // If this is an AJAX request, return only the content
        if (isAjaxRequest()) {
            echo $html->parse('photo_items', false);
            exit;
        }

        $html->parse('photo_items', false);
        $html->parse('looking_glass_group');
        $html->clean('photo_items');

        //---------------------------------------------------------------------------------

        $currentPage = get_param_int('page');
        $currentPage = 1;

        $pageTitle = l('videos');
        $pageDescription = '';
        $pageClass = 'videos_list';

        $pageUrl = Common::pageUrl('vids_list');
        
        $vars = array(
            'page_number' => $currentPage,
            'page_class'  => $pageClass,
            'page_title'  => $pageTitle,
            'page_description' => $pageDescription,
            'page_user_id'     => $uid,
            'page_guid' => $guid,
            'url_pages' => $pageUrl,
            'page_type' => 'videos',
            'page_filter' => intval(!$uid),
            'group_id'    => '',
            'group_type'  => ''
        );

        $pagerOnPage = Common::getOptionInt('looking_glass_display_video_count');
        $mOnBar = Common::getOption('usersinfo_pages_per_list', 'template_options');
        $limit = $pagerOnPage;

        $block = 'list_video';
        $class = "Template{$optionTmplName}";

        $itemsTotal = CProfileVideo::getTotalVideos($uid, $searchFilter, true, ''); // Apply search filter

        if ($html->varExists('auto_play_video')) {
            $html->setvar('auto_play_video', Common::isOptionActive('video_autoplay') ? 'autoplay' : '');
        }

        $html->assign('', $vars);

        $rows = $class::parseListVideos($html, $searchFilter, $limit, $block, '', true); // Apply search filter

        if ($rows) {
            Common::parsePagesListUrban($html, $currentPage, $itemsTotal, $pagerOnPage, $mOnBar, $pageUrl);
        } else {
            $html->parse("list_noitems");
        }

        $html->setvar('looking_glass_group_title', $pageTitle);
        $html->setvar('media_page_link', $pageUrl);
        $html->setvar('media_page_title', $mediaPageTitle);

        $html->parse('video_items', false);
        $html->parse('looking_glass_group');

        parent::parseBlock($html);
    }
}

// Helper function to detect AJAX requests
function isAjaxRequest()
{
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest';
}

$dirTmpl = $g['tmpl']['dir_tmpl_main'];
$tmplList = array(
    'main'   => $dirTmpl . 'looking_glass.html',
    'photo_item'   => $dirTmpl . '_list_photos_item_looking.html',
    'video_item'   => $dirTmpl . '_list_vids_item_looking.html'
);

$page = new CLookingGlass("", $tmplList);

$header = new CHeader("header", $g['tmpl']['dir_tmpl_main'] . "_header.html");
$page->add($header);
$footer = new CFooter("footer", $g['tmpl']['dir_tmpl_main'] . "_footer.html");
$page->add($footer);

include('./_include/core/main_close.php');