<?php
/* (C) Websplosion LLC, 2001-2021

IMPORTANT: This is a commercial software product
and any kind of using it must agree to the Websplosion's license agreement.
It can be found at http://www.chameleonsocial.com/license.doc

This notice may not be removed from the source code. */
//������ ���������� ����������� ����� � ��. �������� ����������: $enemyLogin � $myLogin
include('common.php');
//���������� �����
$now_time=time();

DB::execute("UPDATE ".$t_name." SET time_in='".$now_time."', enemy=".to_sql($enemyLogin).", ingame='yes' WHERE login=".to_sql($myLogin));

//�����
echo "myOk=ok";
?>