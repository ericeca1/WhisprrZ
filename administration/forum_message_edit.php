<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */

include("../_include/core/administration_start.php");

class CForm extends CHtmlBlock
{
	var $message = "";
	var $login = "";
	function action()
	{
		global $g;
		$cmd = get_param("cmd", "");

		if ($cmd == "update")
		{
	        $id = get_param('id');
	        DB::query("SELECT m.* ".
	            "FROM forum_message as m ".
	            "WHERE m.id=" . to_sql($id, 'Number') . " LIMIT 1");
	        if($forum = DB::fetch_row())
	        {
	        	$title = get_param('title');
                $message = get_param('message');
                DB::execute('UPDATE forum_message SET ' .
                    ' title=' . to_sql($title,"Text") .
                    ', message=' . to_sql($message,"Text") .
					' WHERE id=' . $id);
	        }
		redirect("forum_messages.php?action=saved");
		}
	}
	function parseBlock(&$html)
	{
		global $g;

        $id = get_param('id');
        DB::query("SELECT m.* ".
            "FROM forum_message as m ".
            "WHERE m.id=" . to_sql($id, 'Number') . " LIMIT 1");
        if($forum = DB::fetch_row())
        {
			$html->setvar('topic_title', DB::result("SELECT title FROM forum_topic WHERE id=" . to_sql($forum['topic_id']), 0, 2));
        	$html->setvar('id', $forum['id']);
        	$html->setvar('title', htmlentities($forum['title'],ENT_QUOTES,"UTF-8"));
            $html->setvar('message', htmlentities($forum['message'],ENT_QUOTES,"UTF-8"));
        }

		parent::parseBlock($html);
	}
}

$page = new CForm("", $g['tmpl']['dir_tmpl_administration'] . "forum_message_edit.html");
$header = new CAdminHeader("header", $g['tmpl']['dir_tmpl_administration'] . "_header.html");
$page->add($header);
$footer = new CAdminFooter("footer", $g['tmpl']['dir_tmpl_administration'] . "_footer.html");
$page->add($footer);

$page->add(new CAdminPageMenuForums());

include("../_include/core/administration_close.php");