/**
 * Created by Administrator on 2016/4/26.
 */
function getWeek(){
    var totalDays = 0;
    now = new Date();
    years = now.getYear();

    if(years < 1000){
        years +=1900;
    }

    totalDays = getDay();
    var week = Math.round(totalDays/7);
    return week;

}
//判断是否为闰年
function isRun(year){
    if(year%400==0 || (year%100!=0 && year%4==0)){
        return true;
    }
    return false;
}
//取得今天为当年中的第几天
function getDay(){
    var totalDays = 0;
    var now = new Date();
    var days = new Array(12);
    days[0] = 31;
    days[2] = 31;
    days[3] = 30;
    days[4] = 31;
    days[5] = 30;
    days[6] = 31;
    days[7] = 31;
    days[8] = 30;
    days[9] = 31;
    days[10] = 30;
    days[11] = 31;

    //判断是否为闰年，对二月天数进行赋值
    if(isRun(years)){
        days[1] = 29;
    }
    else{
        days[1] = 28;
    }

    if(now.getMonth() == 0){
        totalDays += now.getDate();
    }else{
        var curMonth = now.getMonth();
        for(var i = 0;i<curMonth;i++){
            totalDays += days[i];
        }
        totalDays += now.getDate();
    }
    return totalDays;
}

//调到相关周的xml文件
function hrefToWeek(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    var locationXml = getWeek();
	if(locationXml<10){
		lcationXml = "0"+locationXml;
	}
	var locationLink = "calendarxsl"+locationXml+".xml";
    var hrefToLocation = "http://xmlcalendar.com/xmldata/"+locationLink;
    //alert(hrefToLocation);
    xmlhttp.open("GET",hrefToLocation,false);
	xmlhttp.send();
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200 ){
			window.location.href = hrefToLocation;  //文件存在直接跳转
		}else if(xmlhttp.status == 404){
			window.location.href =	"createxml.php?file="+locationLink;	//文件不存在，先创建xml文件
		}else{
			alert("其他状态");
		}
	}
    //window.location.href = "calendarxsl"+week+".xml";
}

//取得当前星期几
function getCurWeek(curDay){
    switch (curDay){
        case "0": return "日";
            break;
        case "1": return "一";
            break;
        case "2": return "二";
            break;
        case "3": return "三";
            break;
        case "4": return "四";
            break;
        case "5": return "五";
            break;
        case "6": return "六";
            break;
    }
}
//获取在哪个时间段添加日程
function getCurTime(curId){
    switch (curId){
        case "00" : return "00:00-02:00";
            break;
        case "01" : return "02:00-04:00";
            break;
        case "02" : return "04:00-06:00";
            break;
        case "03" : return "06:00-08:00";
            break;
        case "04" : return "08:00-10:00";
            break;
        case "05" : return "10:00-12:00";
            break;
        case "06" : return "12:00-14:00";
            break;
        case "07" : return "14:00-16:00";
            break;
        case "08" : return "16:00-18:00";
            break;
        case "09" : return "18:00-20:00";
            break;
        case "10" : return "20:00-22:00";
            break;
        case "11" : return "22:00-24:00";
            break;
    }
}
//获取当前月份时间

window.onload = function(){
    var now = new Date();
    var curYear = now.getYear()+1900;
    var curMonth = now.getMonth()+1;
    var cur =  curYear+"年"+curMonth+"月";
    var curYearMonth = document.getElementById("curYearMonth");
    var curUrl = window.location.href;
    var xmlName = curUrl.substr(curUrl.length-6,2);
    //alert(xmlName);
    var locationXml = parseInt(xmlName) ;
    //curYearMonth.innerText = cur;
    var curWeek = curYear+" 年 第 "+locationXml+" 周";
    curYearMonth.innerText = curWeek;
}
//判断第几周为本年中的几月份
function getMonthByWeek(week){
    //待实现
}

//上一周
function preWeek(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    var curUrl = window.location.href;
    var xmlName = curUrl.substr(curUrl.length-6,2);
    //alert(xmlName);
    var locationXml = parseInt(xmlName)-1;
    if(locationXml<10){
        var locationXml = "0"+locationXml;
    }
    var locationLink = "calendarxsl"+locationXml+".xml";
    //alert(locationLink);
    xmlhttp.open("GET",locationLink,false);
	xmlhttp.send();
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200 ){
			window.location.href = locationLink;  //文件存在直接跳转
		}else if(xmlhttp.status == 404){
			window.location.href =	"http://xmlcalendar.com/createxml.php?file="+locationLink;	//文件不存在，先创建xml文件
		}else{
			alert("其他状态");
		}
	}

}

//下一周
function nextWeek(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    var curUrl = window.location.href;
    var xmlName = curUrl.substr(curUrl.length-6,2);
    //alert(xmlName);
    var locationXml = parseInt(xmlName)+1;
    if(locationXml<10){
        var locationXml = "0"+locationXml;
    }
    var locationLink = "calendarxsl"+locationXml+".xml";
    //alert(locationLink);
	xmlhttp.open("GET",locationLink,false);
	xmlhttp.send();
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200 ){
			window.location.href = locationLink;  //文件存在直接跳转
		}else if(xmlhttp.status == 404){
			window.location.href =	"http://xmlcalendar.com/createxml.php?file="+locationLink;	//文件不存在，先创建xml文件
		}else{
			alert("其他状态");
		}
	}
    
}

//当前周
function curWeek(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    var curWeek = getWeek();

    if(curWeek<10){
        var curWeek = "0"+curWeek;
    }
    var locationLink = "calendarxsl"+curWeek+".xml";
    xmlhttp.open("GET",locationLink,false);
	xmlhttp.send();
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200 ){
			window.location.href = locationLink;  //文件存在直接跳转
		}else if(xmlhttp.status == 404){
			window.location.href =	"createxml.php?file="+locationLink;	//文件不存在，先创建xml文件
		}else{
			alert("其他状态");
		}
	}
}

//解析要操作的xml文件
function parseXML(xmlFile , curId , content,xmlId){
    //console.log(content);
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET",xmlFile,false);
    xmlhttp.send();
    xmlDoc=xmlhttp.responseXML;

    var idDay = "day"+curId.charAt(0);
    var idTime = "time"+curId.substr(1,2);
    var idWeek = xmlId;
	window.location.href = "http://xmlcalendar.com/parsexmldom.php?week="+idWeek+"&day="+idDay+"&time="+idTime+"&content="+content;

}

//function getValue(){
//    var code = xmlDoc.getElementsByTagName("time");
//    console.log(code);
//}


function addSch(){
    var curElement = window.event.srcElement;    //获取当前除事件的元素
    //console.log(curElement);
    var curId = curElement.getAttribute("id");   //获取当前元素id

    var curDayTime = curId.substr(curId.length-3,3);  //获取当前元素id 用于xml文件添加日程 锁定添加位置 如“000  001  100”
    var curAddTime = curId.substr(curId.length-2,2);  //获取当前id的最后值可用于锁定时间段
    var curAddTime1 = getCurTime(curAddTime);     //处理后的时间段
    var curChooseWeek = curId.charAt(3);        //选中时间段的星期
    //console.log(curId);
    var now = new Date();
    var curYear = now.getYear()+1900;  //获取当前年份
    var curMonth = now.getMonth()+1;
    var curDate = now.getDate();
    var curWeek = "星期"+getCurWeek(curChooseWeek);
    var curWeekNum = getWeek();
    //获取要解析的xml文件
    var curUrl = window.location.href;
    var xmlName = curUrl.substr(curUrl.length-6,2);
    //alert(xmlName);
    var locationXml = parseInt(xmlName);
    //var choose_day = curYear + "年" + curMonth + "月" + curDate + "日 第"+curWeekNum+ "周 " + curWeek
        + " " + curAddTime1;
    var choose_day = curYear + "年" + " 第"+locationXml+ "周 " + curWeek
        + " " + curAddTime1;
    if(confirm("需要循环添加吗")){
        var scheudle = prompt("请输入要循环添加的周次和日程以空格隔开 如：(1-3 开会)");
        if(scheudle!=null){ 
            window.location.href="../mul_sche_add.php?content="+scheudle+"&day="+curDayTime;
        }else{
            alert("取消日程循环添加、修改或删除");
        }
    }else{
        var scheudle = prompt("请在 "+choose_day+" 时间段添加日程","");
        
        if(locationXml<10){
            var locationXml = "0"+locationXml;
        }
        var locationLink = "calendarxsl"+locationXml+".xml";
        //alert(locationLink);
        if(scheudle!=null){
            parseXML(locationLink,curDayTime,scheudle,locationXml);
        }else{
            alert("取消日程添加、修改或删除");
        }
    }
}

function validateForm(){
    var queryContent = document.forms['queryForm']['query'].value;
    if(queryContent==null || queryContent==""){
        alert("请输入查询内容");
        return false;
    }
    return true;
}

function onFocusInput(){
    var search = document.getElementById("input_search");
    if(search.value =='查询周次或者日程内容'){search.value =''}
}

function onBlurInput(){
    var search = document.getElementById("input_search");
    if(search.value == ''){
        search.value = '查询周次或者日程内容'
    }
}