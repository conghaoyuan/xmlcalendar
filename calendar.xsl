<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>日程管理</title>
                <meta http-equiv="refresh" content="1000" />
                <script type="text/javascript" src="../Common.js"></script>
                <link rel="stylesheet" type="text/css" href="../style.css" />
            </head>
            <body bgcolor="#e3e3e3">
            	<div id="search-box" > 
            	<form name="queryForm" action="../query.php" method="post" onsubmit="return validateForm()">
				    <input name="query" type="text" value="查询周次或者日程内容" onfocus="onFocusInput()" onblur="onBlurInput()" class="input-box" id="input_search"/> 
				    <input type="submit" value="查询" class="button" /> 
				</form>
				</div> 
                <table border="1" rules="all" width="1000" height="600" align="center">
                    <caption class="caption">日程管理</caption>
                    <tr class="header">
                        <td colspan="8" border="0" align="center">
                            <a href="javascript:preWeek()">上一周</a>&#160;
                            <span id="curYearMonth"></span>&#160;
                            <a href="javascript:nextWeek()">下一周</a>&#160;
                            <a href="javascript:curWeek()">当前周</a>
                        </td>
                    </tr>
                    <tr height="30" class="week">
                        <td align="center">时间</td>
                        <td width="122" align="center">星期日</td>
                        <td width="122" align="center">星期一</td>
                        <td width="122" align="center">星期二</td>
                        <td width="122" align="center">星期三</td>
                        <td width="122" align="center">星期四</td>
                        <td width="122" align="center">星期五</td>
                        <td width="122" align="center">星期六</td>
                    </tr>
                    <tr>
                        <td class="time">00:00-02:00</td>
                        <td class="sche_content"><div id="day000" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time00']" /></div></td>
                        <td class="sche_content"><div id="day100" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time00']" /></div></td>
                        <td class="sche_content"><div id="day200" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time00']" /></div></td>
                        <td class="sche_content"><div id="day300" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time00']" /></div></td>
                        <td class="sche_content"><div id="day400" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time00']" /></div></td>
                        <td class="sche_content"><div id="day500" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time00']" /></div></td>
                        <td class="sche_content"><div id="day600" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time00']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">02:00-04:00</td>
                        <td class="sche_content"><div id="day001" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time01']" /></div></td>
                        <td class="sche_content"><div id="day101" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time01']" /></div></td>
                        <td class="sche_content"><div id="day201" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time01']" /></div></td>
                        <td class="sche_content"><div id="day301" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time01']" /></div></td>
                        <td class="sche_content"><div id="day401" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time01']" /></div></td>
                        <td class="sche_content"><div id="day501" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time01']" /></div></td>
                        <td class="sche_content"><div id="day601" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time01']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">04:00-06:00</td>
                        <td class="sche_content"><div id="day002" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time02']" /></div></td>
                        <td class="sche_content"><div id="day102" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time02']" /></div></td>
                        <td class="sche_content"><div id="day202" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time02']" /></div></td>
                        <td class="sche_content"><div id="day302" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time02']" /></div></td>
                        <td class="sche_content"><div id="day402" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time02']" /></div></td>
                        <td class="sche_content"><div id="day502" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time02']" /></div></td>
                        <td class="sche_content"><div id="day602" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time02']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">06:00-08:00</td>
                        <td class="sche_content"><div id="day003" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time03']" /></div></td>
                        <td class="sche_content"><div id="day103" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time03']" /></div></td>
                        <td class="sche_content"><div id="day203" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time03']" /></div></td>
                        <td class="sche_content"><div id="day303" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time03']" /></div></td>
                        <td class="sche_content"><div id="day403" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time03']" /></div></td>
                        <td class="sche_content"><div id="day503" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time03']" /></div></td>
                        <td class="sche_content"><div id="day603" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time03']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">08:00-10:00</td>
                        <td class="sche_content"><div id="day004" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time04']" /></div></td>
                        <td class="sche_content"><div id="day104" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time04']" /></div></td>
                        <td class="sche_content"><div id="day204" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time04']" /></div></td>
                        <td class="sche_content"><div id="day304" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time04']" /></div></td>
                        <td class="sche_content"><div id="day404" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time04']" /></div></td>
                        <td class="sche_content"><div id="day504" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time04']" /></div></td>
                        <td class="sche_content"><div id="day604" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time04']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">10:00-12:00</td>
                        <td class="sche_content"><div id="day005" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time05']" /></div></td>
                        <td class="sche_content"><div id="day105" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time05']" /></div></td>
                        <td class="sche_content"><div id="day205" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time05']" /></div></td>
                        <td class="sche_content"><div id="day305" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time05']" /></div></td>
                        <td class="sche_content"><div id="day405" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time05']" /></div></td>
                        <td class="sche_content"><div id="day505" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time05']" /></div></td>
                        <td class="sche_content"><div id="day605" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time05']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">12:00-14:00</td>
                        <td class="sche_content"><div id="day006" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time06']" /></div></td>
                        <td class="sche_content"><div id="day106" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time06']" /></div></td>
                        <td class="sche_content"><div id="day206" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time06']" /></div></td>
                        <td class="sche_content"><div id="day306" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time06']" /></div></td>
                        <td class="sche_content"><div id="day406" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time06']" /></div></td>
                        <td class="sche_content"><div id="day506" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time06']" /></div></td>
                        <td class="sche_content"><div id="day606" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time06']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">14:00-16:00</td>
                        <td class="sche_content"><div id="day007" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time07']" /></div></td>
                        <td class="sche_content"><div id="day107" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time07']" /></div></td>
                        <td class="sche_content"><div id="day207" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time07']" /></div></td>
                        <td class="sche_content"><div id="day307" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time07']" /></div></td>
                        <td class="sche_content"><div id="day407" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time07']" /></div></td>
                        <td class="sche_content"><div id="day507" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time07']" /></div></td>
                        <td class="sche_content"><div id="day607" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time07']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">16:00-18:00</td>
                        <td class="sche_content"><div id="day008" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time08']" /></div></td>
                        <td class="sche_content"><div id="day108" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time08']" /></div></td>
                        <td class="sche_content"><div id="day208" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time08']" /></div></td>
                        <td class="sche_content"><div id="day308" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time08']" /></div></td>
                        <td class="sche_content"><div id="day408" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time08']" /></div></td>
                        <td class="sche_content"><div id="day508" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time08']" /></div></td>
                        <td class="sche_content"><div id="day608" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time08']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">18:00-20:00</td>
                        <td class="sche_content"><div id="day009" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time09']" /></div></td>
                        <td class="sche_content"><div id="day109" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time09']" /></div></td>
                        <td class="sche_content"><div id="day209" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time09']" /></div></td>
                        <td class="sche_content"><div id="day309" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time09']" /></div></td>
                        <td class="sche_content"><div id="day409" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time09']" /></div></td>
                        <td class="sche_content"><div id="day509" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time09']" /></div></td>
                        <td class="sche_content"><div id="day609" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time09']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">20:00-22:00</td>
                        <td class="sche_content"><div id="day010" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time10']" /></div></td>
                        <td class="sche_content"><div id="day110" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time10']" /></div></td>
                        <td class="sche_content"><div id="day210" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time10']" /></div></td>
                        <td class="sche_content"><div id="day310" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time10']" /></div></td>
                        <td class="sche_content"><div id="day410" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time10']" /></div></td>
                        <td class="sche_content"><div id="day510" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time10']" /></div></td>
                        <td class="sche_content"><div id="day610" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time10']" /></div></td>
                    </tr>
                    <tr>
                        <td class="time">22:00-24:00</td>
                        <td class="sche_content"><div id="day011" onclick="addSch()"><xsl:value-of select="//week/day[@id='day0']/time[@id='time11']" /></div></td>
                        <td class="sche_content"><div id="day111" onclick="addSch()"><xsl:value-of select="//week/day[@id='day1']/time[@id='time11']" /></div></td>
                        <td class="sche_content"><div id="day211" onclick="addSch()"><xsl:value-of select="//week/day[@id='day2']/time[@id='time11']" /></div></td>
                        <td class="sche_content"><div id="day311" onclick="addSch()"><xsl:value-of select="//week/day[@id='day3']/time[@id='time11']" /></div></td>
                        <td class="sche_content"><div id="day411" onclick="addSch()"><xsl:value-of select="//week/day[@id='day4']/time[@id='time11']" /></div></td>
                        <td class="sche_content"><div id="day511" onclick="addSch()"><xsl:value-of select="//week/day[@id='day5']/time[@id='time11']" /></div></td>
                        <td class="sche_content"><div id="day611" onclick="addSch()"><xsl:value-of select="//week/day[@id='day6']/time[@id='time11']" /></div></td>
                    </tr>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>