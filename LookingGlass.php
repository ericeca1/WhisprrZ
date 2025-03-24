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
    private $searchFilter = '';
    private $friendFilter = '';
    
    function init()
    {
        global $g;
        // Initialization
    }

    function parseBlock(&$html)
    {
        global $g_user, $g;
        $guid = guid();
        $uid = User::getParamUid(0);
        $offset = get_param('offset', 'photos');

        // Process search parameters
        $this->processSearchParams();
        
        // Process tab filters
        $this->processTabs($uid);
        
        // Clear any existing content to prevent duplication
        $html->clean('photo_items');
        $html->clean('video_items');
        $html->clean('live_video_items');
        $html->clean('partyhouz_items');
        $html->clean('looking_glass_group'); // Clear the parent group to prevent nested duplicates
        
        // Set common page title based on active section first
        $pageTitle = l('looking_glass');
        if ($offset == 'live') {
            $pageTitle = l('live_streams');
        } else if ($offset == 'videos') {
            $pageTitle = l('videos');
        } else if ($offset == 'partyhouz') {
            $pageTitle = l('partyhouz_events');
        } else {
            $pageTitle = l('photos');
        }
        
        // Set the page title for the template
        $html->setvar('looking_glass_group_title', $pageTitle);
        
        // Render all sections to ensure content is available
        $this->renderPhotoSection($html, $uid, $guid, $pageTitle);
        $this->renderVideoSection($html, $uid, $guid, $pageTitle);
        $this->renderLiveVideoSection($html, $uid, $guid);
        $this->renderPartyhouzSection($html, $uid, $guid);

        // Parse the containing group just once
        $html->parse('looking_glass_group');
        
        parent::parseBlock($html);
    }
    
    private function processSearchParams()
    {
        // Process search parameters
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

        // Create the search filter SQL
        $this->searchFilter = '';
        if (!empty($searchParams['country_id'])) {
            $this->searchFilter .= ' AND `country_id` = ' . to_sql($searchParams['country_id'], 'Number');
        }
        if (!empty($searchParams['state_id'])) {
            $this->searchFilter .= ' AND `state_id` = ' . to_sql($searchParams['state_id'], 'Number');
        }
        if (!empty($searchParams['city_id'])) {
            $this->searchFilter .= ' AND `city_id` = ' . to_sql($searchParams['city_id'], 'Number');
        }
        if (!empty($searchParams['looking_for'])) {
            $lookingForFilter = array();
            foreach ($searchParams['looking_for'] as $key => $value) {
                if ($value) {
                    $lookingForFilter[] = '`looking_for` = ' . to_sql($key, 'Text');
                }
            }
            if (!empty($lookingForFilter)) {
                $this->searchFilter .= ' AND (' . implode(' OR ', $lookingForFilter) . ')';
            }
        }
    }
    
    private function processTabs($uid)
    {
        $tab = get_param('tab', 'photos');
        
        if ($tab === 'friends') {
            // Fetch the list of friends for the current user
            $friends = DB::field('friends', 'fr_user_id', '`user_id` = ' . to_sql($uid, 'Number'));
            if (!empty($friends)) {
                $this->friendFilter = ' AND `user_id` IN (' . implode(',', array_map('to_sql', $friends)) . ')';
            } else {
                $this->friendFilter = ' AND 0'; // No friends, so no photos
            }
        }
    }
    
    private function renderPhotoSection(&$html, $uid, $guid, $pageTitle = null)
    {
        // Don't redefine these if we already have them from the parent method
        if ($pageTitle === null) {
            $pageTitle = l('looking_glass_photos');
        }
        
        $mediaPageTitle = l('photos');
        $pageDescription = '';
        $pageClass = 'photos_list';
        $tab = get_param('tab', 'photos');

        $pageUrl = Common::pageUrl('photos_list') . '?tab=' . $tab;
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
        $filter = $this->friendFilter . $this->searchFilter;
        $itemsTotal = CProfilePhoto::getTotalAccessedPhotos($uid, $filter);
        $html->assign('', $vars);

        $class = "Template{$optionTmplName}";
        $rows = $class::parseListPhotos($html, $filter, $limit, '', true);
        
        if ($rows) {
            Common::parsePagesListUrban($html, 1, $itemsTotal, $pagerOnPage, '', '', 'page', '');
        } else {
            $html->parse("list_noitems");
        }

        // Only set these if we're directly rendering this section
        $html->setvar('media_page_link', $pageUrl);
        $html->setvar('media_page_title', $mediaPageTitle);

        $html->setvar('looking_glass_group_title', $pageTitle);

        // If this is an AJAX request, return only the content
        if (isAjaxRequest()) {
            echo $html->parse('photo_items', false);
            exit;
        }

        // Only parse the items, not the container again
        $html->parse('photo_items', false);
        
        // Do NOT parse looking_glass_group here - that would cause duplication
    }
    
    private function renderVideoSection(&$html, $uid, $guid, $pageTitle = null)
    {
        // Don't redefine these if we already have them from the parent method
        if ($pageTitle === null) {
            $pageTitle = l('videos');
        }
        
        $mediaPageTitle = l('videos');
        $pageDescription = '';
        $pageClass = 'videos_list';
        $pageUrl = Common::pageUrl('vids_list');
        $optionTmplName = Common::getTmplName();
        
        $vars = array(
            'page_number' => 1,
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

        $pagerOnPage = Common::getOptionInt('looking_glass_display_video_count', "options");
        if (!$pagerOnPage) {
            $pagerOnPage = 12; // Default number if not set
        }
        $limit = $pagerOnPage;

        $block = 'list_video';
        $class = "Template{$optionTmplName}";

        $itemsTotal = CProfileVideo::getTotalVideos($uid, $this->searchFilter, true, '');

        if ($html->varExists('auto_play_video')) {
            $html->setvar('auto_play_video', Common::isOptionActive('video_autoplay') ? 'autoplay' : '');
        }

        $html->assign('', $vars);

        $rows = $class::parseListVideos($html, $this->searchFilter, $limit, $block, '', true);

        if ($rows) {
            Common::parsePagesListUrban($html, 1, $itemsTotal, $pagerOnPage, '', $pageUrl);
        } else {
            $html->parse("list_noitems");
        }

        // Only set these if we're directly rendering this section
        $html->setvar('media_page_link', $pageUrl);
        $html->setvar('media_page_title', $mediaPageTitle);
        $html->setvar('looking_glass_group_title', $pageTitle);

        // Only parse the items, not the container again
        $html->parse('video_items', false);
        
        // Debug output to help troubleshoot
        error_log("Rendered video section with {$rows} videos");
    }

    /**
     * Render live video content section
     */
    private function renderLiveVideoSection(&$html, $uid, $guid)
    {
        $liveVideos = $this->getLiveVideos();
        
        if (!empty($liveVideos)) {
            foreach ($liveVideos as $liveVideo) {
                // Set template variables for each live video
                $html->setvar('id', $liveVideo['id']);
                $html->setvar('title', $liveVideo['title']);
                $html->setvar('thumbnail', $liveVideo['thumbnail']);
                $html->setvar('url', $liveVideo['url']);
                $html->setvar('host_name', $liveVideo['host_name']);
                $html->setvar('host_photo', $liveVideo['host_photo']);
                $html->setvar('viewers', $liveVideo['viewers']);
                $html->setvar('user_id', isset($liveVideo['user_id']) ? $liveVideo['user_id'] : 1001);
                
                // Parse template for this live video item
                $html->parse('live_video_item', true);
            }
        } else {
            // No live videos available
            $html->setvar('live_video_item', '<div class="no-live-streams">No live streams available</div>');
            $html->parse('live_video_item', false);
        }

        // Parse the container
        $html->parse('live_video_items', false);
    }

    /**
     * Get current live video streams
     * @return array
     */
    private function getLiveVideos()
    {
        // Mock data for testing
        return [
            [
                'id' => 1,
                'title' => 'Live from Miami Beach',
                'thumbnail' => 'images/videos/thumbnails/live1.jpg',
                'url' => 'videos/live/stream1.m3u8',
                'host_name' => 'Sarah Johnson',
                'host_photo' => 'images/users/user1.jpg',
                'viewers' => 342,
                'user_id' => 1001
            ],
            [
                'id' => 2,
                'title' => 'Friday Night Party Stream',
                'thumbnail' => 'images/videos/thumbnails/live2.jpg',
                'url' => 'videos/live/stream2.m3u8',
                'host_name' => 'Mike Stevens',
                'host_photo' => 'images/users/user2.jpg',
                'viewers' => 187,
                'user_id' => 1002
            ],
            [
                'id' => 3,
                'title' => 'Downtown Tour',
                'thumbnail' => 'images/videos/thumbnails/live3.jpg',
                'url' => 'videos/live/stream3.m3u8',
                'host_name' => 'Jessica Williams',
                'host_photo' => 'images/users/user3.jpg',
                'viewers' => 156,
                'user_id' => 1003
            ],
            [
                'id' => 4,
                'title' => 'DJ Mix Session Live',
                'thumbnail' => 'images/videos/thumbnails/live4.jpg',
                'url' => 'videos/live/stream4.m3u8',
                'host_name' => 'DJ Maxwell',
                'host_photo' => 'images/users/user4.jpg',
                'viewers' => 421,
                'user_id' => 1004
            ]
        ];
    }

    /**
     * Render partyhouz content section
     */
    private function renderPartyhouzSection(&$html, $uid, $guid)
    {
        $partyhouzEvents = $this->getPartyhouzEvents();
        
        if (!empty($partyhouzEvents)) {
            foreach ($partyhouzEvents as $event) {
                // Set template variables for each event
                $html->setvar('partyhouz_id', $event['id']);
                $html->setvar('partyhouz_title', $event['title']);
                $html->setvar('partyhouz_image', $event['image']);
                $html->setvar('partyhouz_date', $event['date']);
                $html->setvar('partyhouz_location', $event['location']);
                $html->setvar('partyhouz_attendees', $event['attendees']);
                $html->setvar('partyhouz_host', $event['host']);
                
                // Parse template for this partyhouz item
                $html->parse('partyhouz_item', true);
            }
        } else {
            // No events available
            $html->setvar('partyhouz_item', '<div class="no-events">No upcoming events found</div>');
            $html->parse('partyhouz_item', false);
        }
        
        // Parse the container
        $html->parse('partyhouz_items', false);
    }

    /**
     * Get upcoming partyhouz events
     * @return array
     */
    private function getPartyhouzEvents()
    {
        // Mock data for testing
        return [
            [
                'id' => 1,
                'title' => 'Summer Beach Party',
                'image' => 'images/partyhouz/event1.jpg',
                'date' => 'June 15, 2023',
                'location' => 'Miami Beach, FL',
                'attendees' => 42,
                'host' => 'John Doe'
            ],
            [
                'id' => 2,
                'title' => 'Downtown Dance Night',
                'image' => 'images/partyhouz/event2.jpg',
                'date' => 'June 22, 2023',
                'location' => 'New York, NY',
                'attendees' => 87,
                'host' => 'Jane Smith'
            ],
            [
                'id' => 3,
                'title' => 'Rooftop Cocktail Social',
                'image' => 'images/partyhouz/event3.jpg',
                'date' => 'July 8, 2023',
                'location' => 'Los Angeles, CA',
                'attendees' => 64,
                'host' => 'Robert Taylor'
            ],
            [
                'id' => 4,
                'title' => 'Yacht Club Mixer',
                'image' => 'images/partyhouz/event4.jpg',
                'date' => 'July 15, 2023',
                'location' => 'San Diego, CA',
                'attendees' => 31,
                'host' => 'Emily Parker'
            ]
        ];
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
    'video_item'   => $dirTmpl . '_list_vids_item_looking.html',
    'live_video_item' => $dirTmpl . '_list_live_video_item_looking.html',
    'partyhouz_item' => $dirTmpl . '_list_partyhouz_item_looking.html'
);

$page = new CLookingGlass("", $tmplList);

$header = new CHeader("header", $g['tmpl']['dir_tmpl_main'] . "_header.html");
$page->add($header);
$footer = new CFooter("footer", $g['tmpl']['dir_tmpl_main'] . "_footer.html");
$page->add($footer);
 
include('./_include/core/main_close.php');
