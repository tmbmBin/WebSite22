

	/// <summary>
	/// ���o���ѥ�����
	/// </summary>
    /// <returns type=""></returns>
function GetTodayChtDate() {
    /// <summary>
    /// ���o���ѥ�����
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
�\�໡���G���o���Ѧ褸���
�ǤJ�ѼơG		 
			
�Ǧ^�ѼơG
         
�d    �ҡG
��    ���G
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
�\�໡���G�ˬd�褸�~����O�_���T
�ǤJ�ѼơG
			y, m, d	:�ǤJ���Ʀr�C
			
�Ǧ^�ѼơG
         
�d    �ҡG
��    ���G
==========================================================================
*/
function validateDate (y, m, d)
{
    //��Ƥ��X�z
    if (y < 1 || m < 1 || m > 12 || d < 1) return false;

    if ((y%4 == 0 || y%400 == 0) && y%100 != 0)
        if (m == 2 && d > 29) return false;
    else
         //�|�~����Ƥ��X�z
        if (m == 2 && d > 28) return false;
   
     //�p�몺��Ƥ��X�z
    if ((m == 4 || m == 6 || m == 9 || m == 11)  && d > 30) return false;
   
  //�j�몺��Ƥ��X�z
    if (d > 31) return false;
  

    return true; //�q�L����
}


/*
==========================================================================
�\�໡��:����[�~
�ǤJ�Ѽ�:
			num		:�ǤJ���Ʀr�C
			decimal	:�O�d�p�Ʀ�ơC
�Ǧ^�Ѽ�:Error   : Return false
         Success : Return �榡�ƫ�Ʀr�r��
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
�\�໡��:����[�WiMonths��᪺���
�ǤJ�Ѽ�:
			strDate	:�ǤJ���Ʀr�C
			iMonths	:�n�[������ƶq�C
�Ǧ^�Ѽ�: �^�Ǥ���C 
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
	
	return (newDay);                                 //  �^�Ǥ���C 
 } 
  
 
/*
==========================================================================
�\�໡��:�Ǧ^�Ӥ�����̫�@�Ѥ��
�ǤJ�Ѽ�:
			iYear	:�ǤJ�~���C
			iMonth	:�ǤJ����C
�Ǧ^�Ѽ�: �^�Ǥ���C
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
�\�໡���G����w����줵�ѬO�h�֦~
�ǤJ�ѼơG
			iYear	:�ǤJ�~���C
			iMonth	:�ǤJ����C
�Ǧ^�ѼơG �^�Ǧ~���ƶq�C
�d    �ҡG
��    ���G
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
	
	if (month2 > month1)    // �������Ayears-1 
	{
		years = years - 1 ;
	} 
	else 
	{
		if  ((month1 == month2) && (day2 > day1))   // �����F�A���饼��Ayears-1 
		{
			years  =  years  -   1 ;
		} 
	} 
	// alert("-----------years-"+years); 
	return  years;
} 
 
 
 
 
 
 
 /*
==========================================================================
�\�໡���G����w����줵�ѬO�h�֦~
�ǤJ�ѼơG
			iYear	:�ǤJ�~���C
			iMonth	:�ǤJ����C
�Ǧ^�ѼơG �^�Ǧ~���ƶq�C
�d    �ҡG
��    ���G
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
	
	if (month2 > month1)    // �������Ayears-1 
	{
		years  =  years  -   1 ;
	} 
	else 
	{
		if  ( (month1  ==  month2)  &&  (day2  >  day1))   // �����F�A���饼��Ayears-1 
		{
			years = years - 1;
		} 
	} 
	// alert("-----------years-"+years); 
	return  years;
} 
 
 
 
/*
==========================================================================
�\�໡���G�p������۹j�X��
�ǤJ�ѼơG
			iYear	:�ǤJ�~���C
			iMonth	:�ǤJ����C
�Ǧ^�ѼơG �^�Ǧ~���ƶq�C
�d    �ҡG
��    ���Grq2>=rq1
===========================================================================
*/

function  cal_days(rq1,rq2)
{   
	var  d, s, t, d1 , d2, s1 , s2;
    var  DyMilli = 24 * 60 * 60 * 1000 ;   // �@�Ѫ��@���
     // d = new Date(); 
    d = todaystr
	s = d.getTime();   // �t�Τ���P1970�~1��1��ȩ]���y�зǭ㪺�@��� 
 
    var  days;
    // �t�Τ���B�~�B��B�� 
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
    //��Ʊq0�}�l�A�ҥH�n�N�Ѽƴ�@
    var objDate = new Date(arg_intYear, arg_intMonth-1, arg_intDay);
    //�ˬd����O�_�p��12�j��1
    if((parseInt(arg_intMonth,10) > 12) || (parseInt(arg_intMonth,10) < 1))
    {
        return false;
    }
    else
  {
        //�p�GobjDate��ƶi�줣����ǤJ��arg_intDay�A�N��ѼƮ榡���~�A�t�~����i��]�N�����榡���~
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

  //�N�ҿ諸����X�� �B �ഫ������榡
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate = parYear + "/" + parMonth + "/" + parDay;
  var strDate = new Date(strTmpDate);

  //���o �~: �n��getYear()���, �b���i�� var year=then.getYear();
  //���o ��: �n��getMonth()���, �b���i�� var month=then.getMonth()+1;
  
  //���o �P���X
  var intWeekDay = strDate.getDay()+1;
  
  //���o ��
  var strTmpDay=strDate.getDate(); 

  var weekday = new Array(6);
  weekday[1]="�P����";
  weekday[2]="�P���@";
  weekday[3]="�P���G";
  weekday[4]="�P���T";
  weekday[5]="�P���|";
  weekday[6]="�P����";
  weekday[7]="�P����";
  //�P�_����X�k��,�b���� �ҿ諸��P���o���� �����
  //Ex:2011/6/31 -->  �ҿ諸��:31  ���o����:1 (javascript�W�h)
  //Ex:2011/7/31 -->  �ҿ諸��:31  ���o����:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  weekday[intWeekDay]; }
}



function GetWeekDay(parYear, parMonth, parDay) {

  //�N�ҿ諸����X�� �B �ഫ������榡
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate = parYear + "/" + parMonth + "/" + parDay;
  var strDate = new Date(strTmpDate);

  //���o �~: �n��getYear()���, �b���i�� var year=then.getYear();
  //���o ��: �n��getMonth()���, �b���i�� var month=then.getMonth()+1;
  
  //���o �P���X
  var intWeekDay = strDate.getDay()+1;
  
  //���o ��
  var strTmpDay=strDate.getDate(); 
 
  //�P�_����X�k��,�b���� �ҿ諸��P���o���� �����
  //Ex:2011/6/31 -->  �ҿ諸��:31  ���o����:1 (javascript�W�h)
  //Ex:2011/7/31 -->  �ҿ諸��:31  ���o����:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  intWeekDay; }
}


function GetWeekDayEng(parYear, parMonth, parDay) {

  //�N�ҿ諸����X�� �B �ഫ������榡
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate = parYear + "/" + parMonth + "/" + parDay;
  var strDate = new Date(strTmpDate);

  //���o �~: �n��getYear()���, �b���i�� var year=then.getYear();
  //���o ��: �n��getMonth()���, �b���i�� var month=then.getMonth()+1;
  
  //���o �P���X
  var intWeekDay = strDate.getDay()+1;
  
  //���o ��
  var strTmpDay=strDate.getDate(); 
 
  var weekday = new Array(6);
  weekday[1]="Sunday";
  weekday[2]="Monday";
  weekday[3]="Tuesday";
  weekday[4]="Wednesday";
  weekday[5]="Thursday";
  weekday[6]="Friday";
  weekday[7]="Saturday";
  //�P�_����X�k��,�b���� �ҿ諸��P���o���� �����
  //Ex:2011/6/31 -->  �ҿ諸��:31  ���o����:1 (javascript�W�h)
  //Ex:2011/7/31 -->  �ҿ諸��:31  ���o����:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  weekday[intWeekDay]; }
}
 


 function GetWeekDay(parDate) {

  //�N�ҿ諸����X�� �B �ഫ������榡
  //var dob = parYear + "/" + parMonth + "/" + parDay;
  var strTmpDate =parDate;
  var strDate = new Date(strTmpDate);

  //���o �~: �n��getYear()���, �b���i�� var year=then.getYear();
  //���o ��: �n��getMonth()���, �b���i�� var month=then.getMonth()+1;
  
  //���o �P���X
  var intWeekDay = strDate.getDay()+1;
  
  //���o ��
  var strTmpDay=strDate.getDate(); 
 
  //�P�_����X�k��,�b���� �ҿ諸��P���o���� �����
  //Ex:2011/6/31 -->  �ҿ諸��:31  ���o����:1 (javascript�W�h)
  //Ex:2011/7/31 -->  �ҿ諸��:31  ���o����:31 
  if (parDay != strTmpDay) return "" ;
  else {  return  intWeekDay; }
}




function DateDifference(y1,m1,d1,y2,m2,d2)
{
   var StartDate = y1 + "/" + m1 + "/" + d1;
   var EndDate =  y2 + "/" + m2 + "/" + d2;
 
   var myStartDate = new Date(StartDate);
   var myEndDate = new Date(EndDate);

   // �ѼơA86400000�O24*60*60*1000�A���H86400000�N�O���X��
     return (myEndDate - myStartDate)/ 86400000 ;

  
}


    function DateDifference(parSDate, parEDate) {
        var StartDate = parSDate;
        var EndDate = parEDate;

        var myStartDate = new Date(StartDate);
        var myEndDate = new Date(EndDate);

        // �ѼơA86400000�O24*60*60*1000�A���H86400000�N�O���X��
        return (myEndDate - myStartDate) / 86400000;


    }
 
//function IsNumeric(n) {
//	// �P�_���e�O�_���Ʀr
//	return (n - 0) == n && n.length > 0;
//}
//function IsValidDate(n) {
//	// �N�������ର�褸����H�P�_����O�_�X�k
//	if (n.length < 6 || n.length > 7) {
//		// ���ץ����� 6 �� 7
//		return false;
//	} else if (!IsNumeric(n)) {
//		// ���e�������Ʀr
//		return false;
//	} else if (n.length == 6) {
//		// �Y�u��J���Ӧr��, �N�~���ꨬ�T�X
//		n = '0' + n;
//	}
//	// �N����~�ন�褸�~
//	y = parseInt(n.substr(0,3),10) + 1911;
//	m = parseInt(n.substr(3,2),10) - 1;
//	d = parseInt(n.substr(5,2),10);
//	// �N����r���ন�������
//	var x = new Date(y,m,d);
//	if (isNaN(x.getTime())) {
//		// �Y�L�k�ন��������ܿ�J��Ƥ��X�k
//		return false;
//	} else {
//		// �Y��J���e�P�ഫ������榡�᪺��Ƥ@�P, ��ܤ���X�k
//		if (y == x.getFullYear() && m == x.getMonth() && d == x.getDate()) {		
//			return true;
//		} else {
//			return false;
//		}
//	}
//}
// 

 function CDateToWDate(parCDate) {
	// �N�������ର�褸����H�P�_����O�_�X�k

    var arrDate = parCDate.split("/");
    var strTmpDate = parseInt(arrDate[0], 10) + 1911 + '/' + parseInt(arrDate[1], 10) + '/' + parseInt(arrDate[2], 10)


    var y = parseInt(arrDate[0], 10) + parseInt(1911);
    var m = parseInt(arrDate[1], 10);
    var d = parseInt(arrDate[2], 10);

//	if (n.length < 6 || n.length > 7) {
//		// ���ץ����� 6 �� 7
//		return false;
//	} else if (!IsNumeric(n)) {
//		// ���e�������Ʀr
//		return false;
//	} else if (n.length == 6) {
//		// �Y�u��J���Ӧr��, �N�~���ꨬ�T�X
//		n = '0' + n;
//	}
//	// �N����~�ন�褸�~
//	y = parseInt(n.substr(0,3),10) + 1911;
//	m = parseInt(n.substr(3,2),10) - 1;
//	d = parseInt(n.substr(5,2),10);
	// �N����r���ন�������
	var x = new Date(y,m,d);
	if (isNaN(x.getTime())) {
		// �Y�L�k�ন��������ܿ�J��Ƥ��X�k
		return "";
	} else {
		// �Y��J���e�P�ഫ������榡�᪺��Ƥ@�P, ��ܤ���X�k
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
    //��_�l�鳣�ץ���P���� javascript���P��?0?�l�A�ҥH+1??�z 
    var sDayofWeek = from.getDay() + 1;
    var workdays = 0;

    if (sDayofWeek > 1 && sDayofWeek < 7) {
        from.setDate(from.getDate() - (sDayofWeek % 7));
        workdays -= ((sDayofWeek - 2) > 0) ? sDayofWeek - 2 : 0;
    }
    //?��??�����?����? 

    var totalDays = (to.getTime() - from.getTime()) / (1000 * 60 * 60 * 24) + 1;
    workdays += Math.floor(totalDays / 7) * 5;

    //�ץ��̦Z�ѧE��? 
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
