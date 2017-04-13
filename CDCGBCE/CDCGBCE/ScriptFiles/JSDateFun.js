

	/// <summary>
	/// 取得今天民國日期
	/// </summary>
    /// <returns type=""></returns>
function GetTodayChtDate() {
    /// <summary>
    /// 取得今天民國日期
    /// </summary>
    /// <returns type=""></returns>


	    var tmpDate = new Date();
	    var month = tmpDate.getMonth()+1;  
	    var day = tmpDate.getDate();
	    var year = tmpDate.getFullYear();

        return year-1911 + "/"  + month + "/" + day; 	

}






/*
==========================================================================
功能說明：取得今天西元日期
傳入參數：		 
			
傳回參數：
         
範    例：
備    註：
==========================================================================
*/
function GetTodayWestDate()
{

	    var tmpDate = new Date();
	    var month = tmpDate.getMonth()+1;  
	    var day = tmpDate.getDate();
	    var year = tmpDate.getFullYear();

        return year + "/"  + month + "/" + day; 	

}






/*
==========================================================================
功能說明：檢查西元年日期是否正確
傳入參數：
			y, m, d	:傳入的數字。
			
傳回參數：
         
範    例：
備    註：
==========================================================================
*/
function validateDate (y, m, d)
{
    //日數不合理
    if (y < 1 || m < 1 || m > 12 || d < 1) return false;

    if ((y%4 == 0 || y%400 == 0) && y%100 != 0)
        if (m == 2 && d > 29) return false;
    else
         //閏年的日數不合理
        if (m == 2 && d > 28) return false;
   
     //小月的日數不合理
    if ((m == 4 || m == 6 || m == 9 || m == 11)  && d > 30) return false;
   
  //大月的日數不合理
    if (d > 31) return false;
  

    return true; //通過驗證
}


/*
==========================================================================
功能說明:日期加年
傳入參數:
			num		:傳入的數字。
			decimal	:保留小數位數。
傳回參數:Error   : Return false
         Success : Return 格式化後數字字串
==========================================================================
*/ 
 function  rqaddyears(rq1,ns)
  {
 if  (rq1.length == 10 )  {
y = parseInt(rq1.substring( 0 , 4 )) + ns
m = parseInt(rq1.substring( 5 , 7 ))
d = parseInt(rq1.substring( 8 , 10 ))

} else   if  (rq1.length == 8 )  {
y = parseInt(rq1.substring( 0 , 4 )) + ns
m = parseInt(rq1.substring( 4 , 6 ))
d = parseInt(rq1.substring( 6 , 8 ))
} else  {
 return   "" ;
} 
 var  str  = y + rq1.substring( 4 , 10 );
 if  (m == 2   &&  d == 29 )  {
str = y + rq1.substring( 4 , 7 ) + " -28 " ;
} 
 
 return  str
} 
 
 
 
 
/*
==========================================================================
功能說明:日期加上iMonths月後的日期
傳入參數:
			strDate	:傳入的數字。
			iMonths	:要加的月份數量。
傳回參數: 回傳日期。 
==========================================================================
*/

 
function  DateAddMonth(strDate,iMonths)
{
    var  thisYear  =  parseFloat(strDate.substring( 0 , 4 ));
    var  thisMonth  =  parseFloat(strDate.substring( 5 , 7 ));
    var  thisDate  =  parseFloat(strDate.substring( 8 , 10 ));
    var  d  = thisYear  * 12   +  thisMonth  +  parseFloat(iMonths);

    var  newMonth  =  d  %   12 ;
    if  (newMonth == 0 )
	{
		newMonth = 12;
	} 
	
	
    var  newYear  =  (d - newMonth) / 12;
    var  newDate  =  thisDate;
    var  iMonthLastDate = getMonthLastDate(newYear,newMonth)
    
    if  (newDate > iMonthLastDate) newDate = iMonthLastDate;
    
    var  newDay = "" ;

	newDay  +=  newYear;
    
    if (newMonth < 10 )
    {
		newDay  += "-" + "0" + newMonth;
	} 
	else
	{
		newDay  += "-" + newMonth;
	} 
 
    if  (newDate < 10 )
    {
		newDay += "-" + "0" + newDate;
	}
	else
	{
		newDay  += "-" + newDate;
	}
	
	return (newDay);                                 //  回傳日期。 
 } 
  
 
/*
==========================================================================
功能說明:傳回該月份的最後一天日期
傳入參數:
			iYear	:傳入年份。
			iMonth	:傳入月份。
傳回參數: 回傳日期。
===========================================================================
*/

function  getMonthLastDate(iYear,iMonth)
{
	var  dateArray = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	var  days = dateArray[iMonth - 1 ];
  
	if ((((iYear % 4 == 0) && (iYear % 100 != 0)) || (iYear % 400 == 0)) && iMonth == 2)
	{
		days = 29 ;
	} 
	
  return  days;
  
} 










/*
==========================================================================
功能說明：算指定日期到今天是多少年
傳入參數：
			iYear	:傳入年份。
			iMonth	:傳入月份。
傳回參數： 回傳年的數量。
範    例：
備    註：
===========================================================================
*/
 
function  cal_years(rq)
{
	var  years;
	var  todaystr;
	todaystr = new  Date()
	
	var  dDate = todaystr;
	var  month1 =  dDate.getMonth() + 1 ;
	var  year1 =  dDate.getFullYear();
	var  day1 = dDate.getDate()
	var  year2 =  rq.substr( 0 , 4 );
	var  month2 =  rq.substr( 5 , 2 );
	var  day2 = rq.substr( 8 , 2 );
	// alert("-----------dDate-"+dDate+" year1"+year1+" month1"+month1+" day1"+day1); 
	
	years = year1 - year2 - 0 ;
	
	if (month2 > month1)    // 月份未到，years-1 
	{
		years = years - 1 ;
	} 
	else 
	{
		if  ((month1 == month2) && (day2 > day1))   // 月份到了，但日未到，years-1 
		{
			years  =  years  -   1 ;
		} 
	} 
	// alert("-----------years-"+years); 
	return  years;
} 
 
 
 
 
 
 
 /*
==========================================================================
功能說明：算指定日期到今天是多少年
傳入參數：
			iYear	:傳入年份。
			iMonth	:傳入月份。
傳回參數： 回傳年的數量。
範    例：
備    註：
===========================================================================
*/

 
function  cal_years1(rq1,rq2)
{
	var  years;
	var  year1 =  rq1.substr( 0 , 4 );
	var  month1 =  rq1.substr( 5 , 2 );
	var  day1 = rq1.substr( 8 , 2 );
	var  year2 =  rq2.substr( 0 , 4 );
	var  month2 =  rq2.substr( 5 , 2 );
	var  day2 = rq2.substr( 8 , 2 );
	// alert("-----------dDate-"+dDate+" year1"+year1+" month1"+month1+" day1"+day1); 
	years = year1 - year2 - 0 ;
	
	if (month2 > month1)    // 月份未到，years-1 
	{
		years  =  years  -   1 ;
	} 
	else 
	{
		if  ( (month1  ==  month2)  &&  (day2  >  day1))   // 月份到了，但日未到，years-1 
		{
			years = years - 1;
		} 
	} 
	// alert("-----------years-"+years); 
	return  years;
} 
 
 
 
/*
==========================================================================
功能說明：計算兩日期相隔幾天
傳入參數：
			iYear	:傳入年份。
			iMonth	:傳入月份。
傳回參數： 回傳年的數量。
範    例：
備    註：rq2>=rq1
===========================================================================
*/

function  cal_days(rq1,rq2)
{   
	var  d, s, t, d1 , d2, s1 , s2;
    var  DyMilli = 24 * 60 * 60 * 1000 ;   // 一天的毫秒數
     // d = new Date(); 
    d = todaystr
	s = d.getTime();   // 系統日期與1970年1月1日午夜全球標準准的毫秒數 
 
    var  days;
    // 系統日期、年、月、日 
    // var dDate = new Date(); 
    var  dDate = todaystr
    var  month =  dDate.getMonth() + 1 ;
    var  year =  dDate.getFullYear();
    var  day = dDate.getDate();
    
    d = new  Date(year,month - 1 ,day);
    s  =  d.getTime()
    
    var  month1;
    var  month2;
    var  year1;
    var  year2;
    var  day1;
    var  day2;


	if  (rq1 == "")
	{
		s1 = s;
		month1 =  month;
		year1 =  year;
		day1 =  day;
	} 
	else 
	{
		year1 =  rq1.substr( 0 , 4 );
		month1 =  rq1.substr( 5 , 2 );
		day1 = rq1.substr( 8 , 2 );
		d1 = new  Date(year1,month1 - 1 ,day1);
		s1 = d1.getTime();
	} 

	if  (rq2 == "")
	{
		s2 = s;
		month2 =  month;
		year2 =  year;
		day2 =  day;
	} 
	else 
	{
		year2 =  rq2.substr( 0 , 4 );		
		month2 =  rq2.substr( 5 , 2 );
		day2 = rq2.substr( 8 , 2 );
		d2 = new  Date(year2,month2 - 1 ,day2);
		s2 = d2.getTime();
	} 
	
	// alert("rq1:"+rq1+" rq2:"+rq2+" y1:"+year1+" y2:"+year2+" m1:"+month1+" m2:"+month2+" d1:"+day1+" d2:"+day2); 
	days = Math.round((s2 - s1) / DyMilli);
	// alert("days:"+days); 
	
	return  days;
} 

//===========================================================

function checkDate(arg_intYear, arg_intMonth, arg_intDay)
{
    //月數從0開始，所以要將參數減一
    var objDate = new Date(arg_intYear, arg_intMonth-1, arg_intDay);
    //檢查月份是否小於12大於1
    if((parseInt(arg_intMonth,10) > 12) || (parseInt(arg_intMonth,10) < 1))
    {
        return false;
    }
    else
  {
        //如果objDate日數進位不等於傳入的arg_intDay，代表天數格式錯誤，另外月份進位也代表日期格式錯誤
        if((parseInt(arg_intDay,10) != parseInt(objDate.getDate(),10))||(parseInt(arg_intMonth,10)!= parseInt((objDate.getMonth()+1),10)))
        {
            return false;
        }
        else
        {
            return true;
        }
    }
}




//============================================================

   

function GetWeekDayCht(parYear, parMonth, parDay) {

  //將所選的日期合併 且 轉換成日期格式
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate = parYear + "/" + parMonth + "/" + parDay;
  var strDate = new Date(strTmpDate);

  //取得 年: 要用getYear()函數, 在此可用 var year=then.getYear();
  //取得 月: 要用getMonth()函數, 在此可用 var month=then.getMonth()+1;
  
  //取得 星期幾
  var intWeekDay = strDate.getDay()+1;
  
  //取得 日
  var strTmpDay=strDate.getDate(); 

  var weekday = new Array(6);
  weekday[1]="星期日";
  weekday[2]="星期一";
  weekday[3]="星期二";
  weekday[4]="星期三";
  weekday[5]="星期四";
  weekday[6]="星期五";
  weekday[7]="星期六";
  //判斷日期合法性,在此用 所選的日與取得之日 做比對
  //Ex:2011/6/31 -->  所選的日:31  取得之日:1 (javascript規則)
  //Ex:2011/7/31 -->  所選的日:31  取得之日:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  weekday[intWeekDay]; }
}



function GetWeekDay(parYear, parMonth, parDay) {

  //將所選的日期合併 且 轉換成日期格式
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate = parYear + "/" + parMonth + "/" + parDay;
  var strDate = new Date(strTmpDate);

  //取得 年: 要用getYear()函數, 在此可用 var year=then.getYear();
  //取得 月: 要用getMonth()函數, 在此可用 var month=then.getMonth()+1;
  
  //取得 星期幾
  var intWeekDay = strDate.getDay()+1;
  
  //取得 日
  var strTmpDay=strDate.getDate(); 
 
  //判斷日期合法性,在此用 所選的日與取得之日 做比對
  //Ex:2011/6/31 -->  所選的日:31  取得之日:1 (javascript規則)
  //Ex:2011/7/31 -->  所選的日:31  取得之日:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  intWeekDay; }
}


function GetWeekDayEng(parYear, parMonth, parDay) {

  //將所選的日期合併 且 轉換成日期格式
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate = parYear + "/" + parMonth + "/" + parDay;
  var strDate = new Date(strTmpDate);

  //取得 年: 要用getYear()函數, 在此可用 var year=then.getYear();
  //取得 月: 要用getMonth()函數, 在此可用 var month=then.getMonth()+1;
  
  //取得 星期幾
  var intWeekDay = strDate.getDay()+1;
  
  //取得 日
  var strTmpDay=strDate.getDate(); 
 
  var weekday = new Array(6);
  weekday[1]="Sunday";
  weekday[2]="Monday";
  weekday[3]="Tuesday";
  weekday[4]="Wednesday";
  weekday[5]="Thursday";
  weekday[6]="Friday";
  weekday[7]="Saturday";
  //判斷日期合法性,在此用 所選的日與取得之日 做比對
  //Ex:2011/6/31 -->  所選的日:31  取得之日:1 (javascript規則)
  //Ex:2011/7/31 -->  所選的日:31  取得之日:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  weekday[intWeekDay]; }
}
 


 function GetWeekDay(parDate) {

  //將所選的日期合併 且 轉換成日期格式
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate =parDate;
  var strDate = new Date(strTmpDate);

  //取得 年: 要用getYear()函數, 在此可用 var year=then.getYear();
  //取得 月: 要用getMonth()函數, 在此可用 var month=then.getMonth()+1;
  
  //取得 星期幾
  var intWeekDay = strDate.getDay()+1;
  
  //取得 日
  var strTmpDay=strDate.getDate(); 
 
  //判斷日期合法性,在此用 所選的日與取得之日 做比對
  //Ex:2011/6/31 -->  所選的日:31  取得之日:1 (javascript規則)
  //Ex:2011/7/31 -->  所選的日:31  取得之日:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  intWeekDay; }
}




function DateDifference(y1,m1,d1,y2,m2,d2)
{
   var StartDate = y1 + "/" + m1 + "/" + d1;
   var EndDate =  y2 + "/" + m2 + "/" + d2;
 
   var myStartDate = new Date(StartDate);
   var myEndDate = new Date(EndDate);

   // 天數，86400000是24*60*60*1000，除以86400000就是有幾天
     return (myEndDate - myStartDate)/ 86400000 ;

  
}


    function DateDifference(parSDate, parEDate) {
        var StartDate = parSDate;
        var EndDate = parEDate;

        var myStartDate = new Date(StartDate);
        var myEndDate = new Date(EndDate);

        // 天數，86400000是24*60*60*1000，除以86400000就是有幾天
        return (myEndDate - myStartDate) / 86400000;


    }
 
//function IsNumeric(n) {
//	// 判斷內容是否為數字
//	return (n - 0) == n && n.length > 0;
//}
//function IsValidDate(n) {
//	// 將民國日期轉為西元日期以判斷日期是否合法
//	if (n.length < 6 || n.length > 7) {
//		// 長度必須為 6 或 7
//		return false;
//	} else if (!IsNumeric(n)) {
//		// 內容必須為數字
//		return false;
//	} else if (n.length == 6) {
//		// 若只輸入六個字元, 將年份湊足三碼
//		n = '0' + n;
//	}
//	// 將民國年轉成西元年
//	y = parseInt(n.substr(0,3),10) + 1911;
//	m = parseInt(n.substr(3,2),10) - 1;
//	d = parseInt(n.substr(5,2),10);
//	// 將日期字串轉成日期物件
//	var x = new Date(y,m,d);
//	if (isNaN(x.getTime())) {
//		// 若無法轉成日期物件表示輸入資料不合法
//		return false;
//	} else {
//		// 若輸入內容與轉換成日期格式後的資料一致, 表示日期合法
//		if (y == x.getFullYear() && m == x.getMonth() && d == x.getDate()) {		
//			return true;
//		} else {
//			return false;
//		}
//	}
//}
// 

 function CDateToWDate(parCDate) {
	// 將民國日期轉為西元日期以判斷日期是否合法

    var arrDate = parCDate.split("/");
    var strTmpDate = parseInt(arrDate[0], 10) + 1911 + '/' + parseInt(arrDate[1], 10) + '/' + parseInt(arrDate[2], 10)


    var y = parseInt(arrDate[0], 10) + parseInt(1911);
    var m = parseInt(arrDate[1], 10);
    var d = parseInt(arrDate[2], 10);

//	if (n.length < 6 || n.length > 7) {
//		// 長度必須為 6 或 7
//		return false;
//	} else if (!IsNumeric(n)) {
//		// 內容必須為數字
//		return false;
//	} else if (n.length == 6) {
//		// 若只輸入六個字元, 將年份湊足三碼
//		n = '0' + n;
//	}
//	// 將民國年轉成西元年
//	y = parseInt(n.substr(0,3),10) + 1911;
//	m = parseInt(n.substr(3,2),10) - 1;
//	d = parseInt(n.substr(5,2),10);
	// 將日期字串轉成日期物件
	var x = new Date(y,m,d);
	if (isNaN(x.getTime())) {
		// 若無法轉成日期物件表示輸入資料不合法
		return "";
	} else {
		// 若輸入內容與轉換成日期格式後的資料一致, 表示日期合法
		if (y == x.getFullYear() && m == x.getMonth() && d == x.getDate()) {
		    return strTmpDate;
		} else {
			return "";
		}
	}
}




//http://fuanyu.iteye.com/blog/450007
function GetWorkingDays(parSDate, parEDate) {
    /// <summary>
    /// 
    /// </summary>

    var strTmpSDate = CDateToWDate(parSDate);
    var strTmpEDate = CDateToWDate(parEDate);

    var holidays = new Array();
    holidays[holidays.length] = new Date(strTmpSDate);
    holidays[holidays.length] = new Date(strTmpEDate);

   return calculateWorkDays(strTmpSDate, strTmpEDate, holidays);

}

function calculateWorkDays(parSDate, parEDate, holidayArray) {
    var from = new Date();
    var to = new Date();
    var fromTime = Date.parse(parSDate);
    var toTime = Date.parse(parEDate);
    from.setTime(fromTime);
    from.setHours(0);
    from.setMinutes(0);
    from.setSeconds(0);
    var orgTime = from.getTime();

    to.setTime(toTime);
    to.setHours(0);
    to.setMinutes(0);
    to.setSeconds(0);

    if (from.getTime() > to.getTime()) {
        return 0;
    }
    //把起始日都修正到星期六 javascript的星期?0?始，所以+1??理 
    var sDayofWeek = from.getDay() + 1;
    var workdays = 0;

    if (sDayofWeek > 1 && sDayofWeek < 7) {
        from.setDate(from.getDate() - (sDayofWeek % 7));
        workdays -= ((sDayofWeek - 2) > 0) ? sDayofWeek - 2 : 0;
    }
    //?算??日期之?的天? 

    var totalDays = (to.getTime() - from.getTime()) / (1000 * 60 * 60 * 24) + 1;
    workdays += Math.floor(totalDays / 7) * 5;

    //修正最后剩余天? 
    if ((totalDays % 7 - 2) > 0) {
        workdays += (totalDays % 7 - 2);
    }

    if (holidayArray != null) {
        for (var i = 0; i < holidayArray.length; i++) {
            if (holidayArray[i].getTime() > orgTime && holidayArray[i].getTime() < to.getTime()) {
                if (holidayArray[i].getDay() > 0 && holidayArray[i].getDay() < 6) {
                    workdays--;
                }
            }
        }
    }

    return workdays;
} 
