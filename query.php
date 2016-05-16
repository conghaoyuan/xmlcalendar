<?php
header("Content-type:text/html;charset=utf-8");
$queryContent = trim($_POST['query']);
if(is_numeric($queryContent)){
	if($queryContent<57 && $queryContent>0){
		if($queryContent<10){
			$queryContent = "0".$queryContent;
		}
		$filename = "./xmldata/calendarxsl{$queryContent}.xml";
		$xmlmodel = "calendarxslmodel.xml";
		if(file_exists($filename)){
			echo "<script type='text/javascript'>window.location.href='http://xmlcalendar.com/xmldata/calendarxsl{$queryContent}.xml'</script>";
		}else{
			$dom = new DOMDocument('1.0','utf-8');
			$dom->load($xmlmodel);
			$dom->save($filename);
			echo "<script type='text/javascript'>window.location.href='http://xmlcalendar.com/".$filename."';</script>";
		}
	}else{
		echo "<script type='text/javascript'>alert('输入周次不合法,请重新输入');window.location.href='http://xmlcalendar.com'</script>";
	}
	
}else{
	queryXMLFiles($queryContent);
}
function queryXMLFiles($queryContent){
	$dir = "./xmldata";
	$xmlFiles = getAllXMLFiles($dir);
	$dom = new DOMDocument('1.0','utf-8');
	// foreach ($xmlFiles as $key => $value) {
	// 	$dom->load("./xmldata/".$value);
	// 	$xpath = new DOMXPath($dom);
	// 	$query="/week/day[contains(time , 'a')]";
	// 	$nodes = $xpath->query($query);
	// 	if (empty($nodes)){
	// 		//没有找到
	// 		$res = "没有该日程";
	// 	}else{
	// 		$res = $nodes->item(0)->nodeValue;
	// 	}
	// 	echo $res."<br>";
	// }
	$res = array();
	$total_query = 0;
	foreach ($xmlFiles as $fileKey => $file) {
		$dom->load("./xmldata/".$file);
		$days = $dom->getElementsByTagName('day');
		$day_length = $days->length;
		$arr_res = array();
		$arr_res_last = array();
		for($i = 0;$i<$day_length;$i++){
		    $day  = $days->item($i);
		    $times = $day->getElementsByTagName('time');
		    $time_length = $times->length;
		    $arr_res['day'.$i] = array();
		    for($j =0;$j<$time_length;$j++){
		        $time = $times->item($j);
				$content = trim($time->nodeValue);
				//$count_day =  count($arr_res['day'.$i]);
				if(strstr($content, $queryContent)){
					//echo $i."-".$j.$content."<br>";
					//array_push($arr_res, $content);
					$total_query ++;
					$arr_res['day'.$i]['time'.$j] = $content;
					// //array_push($arr_res['day'.$i], $content);
				}
		    }
		}
		$res_key = substr($file, 0 ,13);
		$res[$res_key] = $arr_res;
	}
	// echo "<pre>";
	// var_dump($res);
	// echo $total_query;
	echo "<link rel='stylesheet' type='text/css' href='style.css'>";
	echo "<table width='1000' border='1' rules='all' align='center'>
			<caption class='caption'>查询结果</caption>
			<tr class='week'><th>第几周</th><th>星期几</th><th>时间段</th><th>相关日程</th></tr>";
	$str = "";
	foreach ($res as $key_xml => $xml_file_value) {
		foreach ($xml_file_value as $key_day => $day_value) {
			if(count($day_value)!=0){
				foreach ($day_value as $key_time => $time_value) {
					//echo $key_xml."-".$key_day."-".$key_time.":".$time_value."<br>";
					$week = getWeek($key_xml);
					$day = getCurWeek($key_day);
					$time = getCurTime($key_time);
					$sche_url = "http://xmlcalendar.com/xmldata/".$key_xml.".xml";
					$str.="<tr>";
					$str.="<td class='weeks'>{$week}</td>
							<td class='day'>星期{$day}</td>
							<td class='time'>{$time}</td>
							<td class='scheudle'><a href='{$sche_url}'>{$time_value}</a></td>";
					//echo "在{$week} 星期{$day} {$time} 时间段有 <font color='red'><b>{$time_value}</b></font> 相关日程<br>";
					$str.="</tr>";
				}
			}
		}
	}
	echo $str;
	echo "<tr><td colspan='4' align='right' class='total_query'>总共找到<b><font color='red'> {$total_query} </font></b>条查询结果</td></tr>";
	echo "</table>";
}


//取得查询的第多少周
function getWeek($key_xml){
	$week = substr($key_xml, -2);
	return "第 {$week} 周";
}

//取得当前星期几
function getCurWeek($key_day){
    switch ($key_day){
        case "day0": return "日";
            break;
        case "day1": return "一";
            break;
        case "day2": return "二";
            break;
        case "day3": return "三";
            break;
        case "day4": return "四";
            break;
        case "day5": return "五";
            break;
        case "day6": return "六";
            break;
    }
}
//获取在哪个时间段添加日程
function getCurTime($key_time){
    switch ($key_time){
        case "time0" : return "00:00-02:00";
            break;
        case "time1" : return "02:00-04:00";
            break;
        case "time2" : return "04:00-06:00";
            break;
        case "time3" : return "06:00-08:00";
            break;
        case "time4" : return "08:00-10:00";
            break;
        case "time5" : return "10:00-12:00";
            break;
        case "time6" : return "12:00-14:00";
            break;
        case "time7" : return "14:00-16:00";
            break;
        case "time8" : return "16:00-18:00";
            break;
        case "time9" : return "18:00-20:00";
            break;
        case "time10" : return "20:00-22:00";
            break;
        case "time11" : return "22:00-24:00";
            break;
    }
}

function getAllXMLFiles($dir){
	$xmlFiles = array();
	$xmlFilesResult = array();
	if(is_dir($dir)){
		if($dh =opendir($dir)){
			while(($file = readdir($dh))!=false){
				array_push($xmlFiles, $file);
			}
		}
	}
	foreach ($xmlFiles as $key => $value) {
		if($value!='.' && $value!='..'){
			array_push($xmlFilesResult, $value);
		}
	}
	return $xmlFilesResult;
}