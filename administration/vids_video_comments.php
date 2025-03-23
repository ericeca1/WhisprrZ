<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */

include("../_include/core/administration_start.php");
require_once("../_include/current/vids/includes.php");

class CPage extends CHtmlBlock
{
	function parseBlock(&$html)
	{
        $pid = ipar('id');
        if ($pid > 0) {
            $video = CVidsTools::getVideoById($pid);
        }
        if (!isset($video) or !is_array($video)) {
            redirect('vids_videos.php');
        }
        $html->assign('video', $video);

        $html->setvar('video_title', $video['subject'] ? '"' . $video['subject'] . '"' : '');

        $page = (intval(param('p')) < 1 ? 1 : intval(param('p')));
        $pagerOnPage = 20;
        $pagerUrl = g('path','url_administration') . 'vids_video_comments.php?id=' . $pid . '&p=%s';

        $itemsTotal = CVidsTools::countCommentsByVideoId($pid);
        $items = CVidsTools::getCommentsByVideoId($pid, (($page - 1) * $pagerOnPage) . ',' . $pagerOnPage);

        $pagesParam = '?action=delete&id=' . $pid;
        if ($itemsTotal > $pagerOnPage) {
            $pagesParam .= '&p=' . $page;
            $pager = new Pager($page, $itemsTotal, $pagerUrl, $pagerOnPage, 1);
            if ($html->varExists('pager_li_modern')) {
				$html->assign('pager_li_modern', $pager->getLiPagesModern());
			} else {
				$html->assign('pager', $pager->getAbPages());
			}
            $html->assign('itemsTotal', $itemsTotal);
            $html->parse('pages');
        }
        $html->setvar('pages_param', $pagesParam);

        $html->items('item', admin_color_lines($items));
        $html->cond(count($items) > 0, 'items', 'noitems');

		parent::parseBlock($html);
	}
}

$page = new CPage("main", $g['tmpl']['dir_tmpl_administration'] . "vids_video_comments.html");
$header = new CAdminHeader("header", $g['tmpl']['dir_tmpl_administration'] . "_header.html");
$page->add($header);
$footer = new CAdminFooter("footer", $g['tmpl']['dir_tmpl_administration'] . "_footer.html");
$page->add($footer);

$page->add(new CAdminPageMenuVids());

include("../_include/core/administration_close.php");