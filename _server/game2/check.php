<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */
//� ������ �� ������ �������� ����������: $enemyLogin (����� ���������), $myLogin (����� ������). ������ ����� ������ $_POST
include('common.php');



DB::query("SELECT * FROM ".$t_name." WHERE login =".to_sql($enemyLogin));
$yes=DB::fetch_row();
//��� ���������� ������ ��� ����
$inGame=$yes['ingame'];
if ($inGame=="yes") {
DB::execute("UPDATE ".$t_name." SET ingame='no' WHERE login=".to_sql($enemyLogin));
}

//��� ��� ����� ��� ������. �������� ������� � �������� �� ������!
echo "ingame=".$inGame;
?>