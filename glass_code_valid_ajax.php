<?php
/* (C) Websplosion LTD., 2001-2014

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */

$area = 'login';
include('./_include/core/main_start.php');
include('./_include/current/glass/start.php');

function do_action()
{
    if (CVidsTools::validateVideoCode()) {
        echo 'ok';
    } else {
        echo 'bad';
    }
}
do_action();

vids_render_page();
include('./_include/core/main_close.php');
