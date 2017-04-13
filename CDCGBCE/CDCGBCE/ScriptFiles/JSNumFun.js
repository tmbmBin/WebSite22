/*
==========================================================================
功能說明:傳入數字，及小數位數，傳回格式化後數字字串
傳入參數:
			num		:傳入的數字。
			decimal	:保留小數位數。
傳回參數:Error   : Return false
         Success : Return 格式化後數字字串
==========================================================================
*/
function FormatNumber(num,decimal )
{
	var tmpNumber1=num.toString();//轉成文字型態
	var numlen=tmpNumber1.length;//取得字數
	var decimalIdx=tmpNumber1.indexOf('.');//取得小數點所在位置
	var Intlen;
	var decimallen;
	
	if(decimalIdx!=-1)
		decimallen=numlen-decimalIdx-1;//依據小數點位置，算出整數長度
	else
		decimalIdx=0;
		
	
	var tmpNumber2;	
	if(decimal!=0)
	{
		tmpNumber2 = num*(Math.pow(10,decimal));
		tmpNumber2=Math.round(tmpNumber2)/(Math.pow(10,decimal));
	}
	else
		tmpNumber2 = tmpNumber1 + '.0';
		
		
	//四捨五入到指定位置結束
	
	//window.alert('四捨五入後的數字：' + tmpNumber2);
	var decimalNum='';//宣告小數點後文字
	if(tmpNumber1.indexOf('.')!=-1)
		decimalNum = tmpNumber2.toString().substring(tmpNumber2.toString().indexOf('.')+1,tmpNumber2.toString().indexOf('.')+decimal+1);//取得小數點位數
		//window.alert('小數點文字：' + decimalNum);
		
	
	var rtndecimal=decimalNum;
	for(j=0;j<(decimal-decimalNum.length);j++)
		rtndecimal = rtndecimal + '0';
		//window.alert('補0後的小數後文字:' + rtndecimal);
		
		var IntNum;//宣告整數文字
		//window.alert('小數點位置：' + tmpNumber2.toString().indexOf('.'));
		
		//取得整數文字
		IntNum=tmpNumber2.toString().substring(tmpNumber2.toString().indexOf('.'),0);
		if(tmpNumber2.toString().indexOf('.')==-1)
			IntNum = tmpNumber2.toString();
		if(tmpNumber2.toString().indexOf('.')==0)
			IntNum = '0';	
			//window.alert('整數文字：' + IntNum);
		
		var lpcnt = Math.floor(IntNum.length/3);
		
		if(IntNum.substring(0,1)=='-')
			lpcnt--;
			//	window.alert(lpcnt);
			
			var tmpNumber3='';
			
			for(i=0;i<lpcnt;i++)
			{
				tmpNumber3=',' + IntNum.substring(IntNum.length,IntNum.length-3).toString() + tmpNumber3;
				IntNum=IntNum.substring(IntNum.length-3,0);
			}
			
		//window.alert('格式化後的整數：' + tmpNumber3)
		tmpNumber3 = IntNum + tmpNumber3;
		
		if(tmpNumber3.substring(0,1)==',')
			tmpNumber3 = tmpNumber3.substring(1,tmpNumber3.length);
			
			if (rtndecimal != "") 
			{
				return tmpNumber3 + '.' + rtndecimal;	
			}
			else
			{
				return tmpNumber3
			}
		
	
	
	//parObj.value= tmpNumber3 + '.' + rtndecimal;
	
	
	
}





/*
================================================================================
功能說明︰判斷是否為整數、正整數、負整數、正整數+0、負整數+0
傳入參數︰ 
			parTxt:測試字元串。
			sign:+ or - or empty
			zero:empty or 0
傳回參數︰ 
			
================================================================================
*/


function IsInt(parTxt,sign,zero)
{
    var reg;
    var bolzero;

    if(Trim(parTxt)=="")
    {
        return false;
    }
    else
    {
        parTxt=parTxt.toString();
    }

    if((sign==null)||(Trim(sign)==""))
    {
        sign="+-";
    }

    if((zero==null)||(Trim(zero)==""))
    {
        bolzero=false;
    }
    else
    {
        zero=zero.toString();
        if(zero=="0")
        {
            bolzero=true;
        }
        else
        {
           alert("檢查是否包含0參數，只可為(空、0)");
        }
    }

    switch(sign)
    {
        case "+-":
            //整數
            reg=/(^-?|^\+?)\d+$/;
            break;
        case "+":
            if(!bolzero)
            {
                //正整數
                reg=/^\+?[0-9]*[1-9][0-9]*$/;
            }
            else
            {
                //正整數+0
                //reg=/^\+?\d+$/;
                reg=/^\+?[0-9]*[0-9][0-9]*$/;
            }
            break;
        case "-":
            if(!bolzero)
            {
                //負整數
                reg=/^-[0-9]*[1-9][0-9]*$/;
            }
            else
            {
                //負整數+0
                //reg=/^-\d+$/;
                reg=/^-[0-9]*[0-9][0-9]*$/;
            }
            break;
        default:
            alert("檢查符號參數，只可為(空、+、-)");
            return false;
            break;
    }

    var r=parTxt.match(reg);
    if(r==null)
    {
        return false;
    }
    else
    {
        return true;
    }
}



/*
================================================================================
功能說明︰判斷是否為浮點數、正浮點數、負浮點數、正浮點數+0、負浮點數+0
傳入參數︰ 
			parTxt:測試字元串。
			sign:+ or - or empty
			zero:empty or 0
傳回參數︰ 
			
================================================================================
*/

function IsFloat(parTxt,sign,zero)
{
	//alert(parTxt);
    var reg;
    var bolzero;

    if(Trim(parTxt)=="")
    {
        return false;
    }
    else
    {
        parTxt=parTxt.toString();
    }

    if((sign==null)||(Trim(sign)==""))
    {
        sign="+-";
    }

    if((zero==null)||(Trim(zero)==""))
    {
        bolzero=false;
    }
    else
    {
        zero=zero.toString();
        if(zero=="0")
        {
            bolzero=true;
        }
        else
        {
            alert("檢查是否包含0參數，只可為(空、0)");
        }
    }

    switch(sign)
    {
        case "+-":
            //浮點數
            reg=/^((-?|\+?)\d+)(\.\d+)?$/;
            break;
        case "+":
            if(!bolzero)
            {
                //正浮點數
                reg=/^\+?(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            }
            else
            {
                //正浮點數+0
                reg=/^\+?\d+(\.\d+)?$/;
            }
            break;
        case "-":
            if(!bolzero)
            {
                //負浮點數
                reg=/^-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            }
            else
            {
                //負浮點數+0
                reg=/^((-\d+(\.\d+)?)|(0+(\.0+)?))$/;
            }
            break;
        default:
            alert("檢查符號參數，只可為(空、+、-)");
            return false;
            break;
    }

    var r=parTxt.match(reg);
    if(r==null)
    {
        return false;
    }
    else
    {
        return true;
    }
}






/*
================================================================================
功能說明︰判斷是否為數字
傳入參數︰ 
			parVal:傳入的值。
傳回參數︰ 
			
================================================================================
*/

  function  isNumeric(parVal)  
  {
	if  (parVal== "" )
		return false ;
		
		var l = parVal.length;
		var count = 0 ;
		
		for ( var  i = 0 ; i < l; i ++ )
		{
			var digit = parVal.charAt(i);
			if (digit ==  ".")
			{
				++ count;
				if (count > 1 ) return false;
			} 
			else
			{
				if (digit < "0" || digit > "9")
				return false;
			}
		} 
 		return true;
} 
 


/*
================================================================================
2
功能說明︰判斷是否為數字
傳入參數︰ 
			parVal:傳入的值。
傳回參數︰ 
			
================================================================================
*/


 function  isNum(parVal)
  {
     if  (parVal == "" )
      { return false;
    } 
 
    re = new RegExp("[^0-9]");
     var s;
     if (s = parVal.match(re))
       {
        
         return false;
     } 
     return true;
} 
 

function IsNumericV3(strString) 
{ 
    var strValidChars = "0123456789"; 
    var strChar; 
    var blnResult = true; 
    //var strSequence = document.frmQuestionDetail.txtSequence.value; 
    //test strString consists of valid characters listed above 
    if (strString.length == 0) 
        return false; 
    for (i = 0; i < strString.length && blnResult == true; i++) 
    { 
        strChar = strString.charAt(i); 
        if (strValidChars.indexOf(strChar) == -1) 
        { 
            blnResult = false; 
        } 
     } 
return blnResult; 
}



function sortNumber(a,b)
{
return a - b
//範例
//var arr = new Array(6)
//arr[0] = "10"
//arr[1] = "5"
//arr[2] = "40"
//arr[3] = "25"
//arr[4] = "1000"
//arr[5] = "1"

//document.write(arr + "<br />")
//document.write(arr.sort(sortNumber))

}



 function fmtMoneyV1( n, c, d, t )
    {//fmtMoney( 123456789.12345, 2, '.', ',' );
	if(n=="") n=0;
	var m = (c = Math.abs(c) + 1 ? c : 2, d = d || ",", t = t || ".", /([+-]?)(\d+)(?:(\.\d+)|)/.exec(n + "")), x = m[1].length > 3 ? m[1].length % 3 : 0;
	    return ( x ? m[1].substr(0, x) + t : "") + m[1].substr(x).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + (+m[2] || 0).toFixed(c).substr(2) : ""); 
    }

 
    function fmtMoney(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}


    function fmtMoneyv2(number) { 

var num = number.replace(new RegExp(",","g"),""); 

// 正负号处理 
var symble = ""; 
if(/^([-+]).*$/.test(num)) { 
symble = num.replace(/^([-+]).*$/,"$1"); 
num = num.replace(/^([-+])(.*)$/,"$2"); 
} 

if(/^[0-9]+(\.[0-9]+)?$/.test(num)) { 
var num = num.replace(new RegExp("^[0]+","g"),""); 
if(/^\./.test(num)) { 
num = "0" + num; 
} 

var decimal = num.replace(/^[0-9]+(\.[0-9]+)?$/,"$1"); 
var integer= num.replace(/^([0-9]+)(\.[0-9]+)?$/,"$1"); 

var re=/(\d+)(\d{3})/ 

while(re.test(integer)){ 
integer　=integer.replace(re,"$1,$2") 
} 
return symble + integer　+ decimal; 

} else { 
return number; 
} 
} 
