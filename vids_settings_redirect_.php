<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */

include('./_include/core/main_start.php');
include('./_include/current/vids/start.php');

function do_action()
{
    CVidsTools::setFilter();
    //isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'vids.php'
    redirect('vids.php');
}
do_action();

vids_render_page();
include('./_include/core/main_close.php');
