<?php
header("Content-type:text/html;charset=utf-8");
$curWeek = $_GET['week'];
$idDay = $_GET['day'];
$idTime = $_GET['time'];
$content = $_GET['content'];
$xml = "calendarxsl".$curWeek.".xml";
$dom = new DOMDocument('1.0','utf-8');
$dom->load('./xmldata/'.$xml);
$days = $dom->getElementsByTagName('day');
$day_length = $days->length;
for($i = 0;$i<$day_length;$i++){
    //echo "<pre>";
    //echo $days->item($i)->getAttribute("id");
    $day  = $days->item($i);
    if( $day->getAttribute('id') == $idDay){
        $times = $day->getElementsByTagName('time');
        $time_length = $times->length;
        for($j =0;$j<$time_length;$j++){
            $time = $times->item($j);
            if($time->getAttribute('id') == $idTime){
				if($content != "null" && $content!=""){
					$time->nodeValue = $content;
				}else{
					$time->nodeValue = "&#160;";
				}
            }
        }
    }
}
$is_save = $dom->save("./xmldata/".$xml);
if($is_save){
    if($content==""){
        echo "<script type='text/javascript'>alert('删除日程成功');window.location.href='http://xmlcalendar.com/xmldata/".$xml."';location.reload(ture);location.reload(ture);</script>";
    }else{
        echo "<script type='text/javascript'>alert('添加或修改日程成功');window.location.href='http://xmlcalendar.com/xmldata/".$xml."';location.reload(ture);location.reload(ture);</script>";
    }
}
else{
    echo "<script type='text/javascript'>alert('添加日程失败');window.location.href='http://xmlcalendar.com/xmldata/".$xml."';location.reload(ture);</script>";
}