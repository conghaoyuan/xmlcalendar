<?php
header("Content-type:text/html;charset=utf-8");
$content = $_GET['content'];
$curDayTime = $_GET['day'];
$idDay = "day".substr($curDayTime, 0 ,1);
$idTime = "time".substr($curDayTime, -2);
$arr_content = explode(' ', $content);	//传过来的所有内容
$arr_need_addfiles = array();
if(count($arr_content)!=2){
	echo "<script type='text/javascript'>alert('输入格式不合法,请重新输入');window.location.href='http://xmlcalendar.com'</script>";
}else{
	$arr_week = explode('-', $arr_content[0]);	//要添加的周次
	if(count($arr_week)!=2 || $arr_week[0]>$arr_week[1]){
		echo "<script type='text/javascript'>alert('输入周次不合法,请重新输入');window.location.href='http://xmlcalendar.com'</script>";
	}else{
		for ($i=$arr_week[0]; $i <= $arr_week[1]; $i++) { 
			if($i<10){
				$i = '0'.$i;
			}
			$xmlfile = "./xmldata/calendarxsl".$i.".xml";	//循环出要添加日程的xml文件
			$xmlmodel = "./calendarxslmodel.xml";
			if(!file_exists($xmlfile)){			//如果此xml文件不存在则先创建
				$dom = new DOMDocument('1.0','utf-8');
				$dom->load($xmlmodel);
				$dom->save($xmlfile);
			}
			array_push($arr_need_addfiles, $xmlfile);
		}
		$is_save= addMuliSche($arr_need_addfiles,$idDay,$idTime,$arr_content[1]);
		if($is_save){
			echo "<script type='text/javascript'>alert('循环添加日程成功');window.location.href='http://xmlcalendar.com';location.reload(ture);location.reload(ture);</script>";
		}
		else{
			echo "<script type='text/javascript'>alert('循环添加日程失败');window.location.href='http://xmlcalendar.com';location.reload(ture);</script>";
		}
	}

}

function addMuliSche($xmlFiles ,$idDay ,$idTime,$content)
{
	$dom = new DOMDocument('1.0', 'utf-8');
	foreach ($xmlFiles as $fileKey => $file) {
		$dom->load($file);
		$days = $dom->getElementsByTagName('day');
		$day_length = $days->length;
		for ($i = 0; $i < $day_length; $i++) {
			//echo "<pre>";
			//echo $days->item($i)->getAttribute("id");
			$day = $days->item($i);
			if ($day->getAttribute('id') == $idDay) {
				$times = $day->getElementsByTagName('time');
				$time_length = $times->length;
				for ($j = 0; $j < $time_length; $j++) {
					$time = $times->item($j);
					if ($time->getAttribute('id') == $idTime) {
						if ($content != "null" && $content!="") {
							$time->nodeValue = $content;
						} else {
							$time->nodeValue = "&#160;";
						}
					}
				}
			}
		}
		$dom->save($file);
	}
	return true;
}
