<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */
global $g;
$g['is_router_page'] = 1;
include("./_include/core/main_start.php");

global $p;
global $g_user;
$g['router']['load_core'] = 0;
$g['is_router_page'] = 0;
$page = Router::getIncludePage(null, true);

if ($page) {
    include($page);
} else {
    pageNotFound();
}

include_once("./_include/core/main_close.php");