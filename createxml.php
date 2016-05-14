<?php
header("Content-type:text/html;charset=utf-8");
$file = $_GET['file'];
$xmlmodel = "calendarxslmodel.xml";
$dom = new DOMDocument('1.0','utf-8');
$dom->load($xmlmodel);
//var_dump($dom->getElementsByTagName('day'));
$dom->save("./xmldata/".$file);
//echo "<script type='text/javascript'>window.location.href=history.go(-1);</script>";
echo "<script type='text/javascript'>window.location.href='http://xmlcalendar.com/xmldata/".$file."';</script>";