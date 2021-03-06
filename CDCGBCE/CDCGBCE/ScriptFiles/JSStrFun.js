
/*
==========================================================================
功能說明:傳入字串，傳回去除左邊空白字串
傳入參數:
			value:傳入的值。
傳回參數:
==========================================================================
*/

function LTrim(value)
{
	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");
}



/*
==========================================================================
功能說明:傳入字串，傳回去除右邊空白字串
傳入參數:
			value	:傳入的值。
傳回參數:
==========================================================================
*/


function RTrim(value)
{
	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");
}



/*
==========================================================================
功能說明:傳入字串，傳回去除左右邊空白字串
傳入參數:
			value	:傳入的值。
傳回參數:
==========================================================================
*/

function Trim(value)
{
	return LTrim(RTrim(value));
}





/*
==========================================================================
功能說明:檢查是否為email的格式
傳入參數:
			value	:傳入的值。
傳回參數:
==========================================================================
*/

 
function isEmail(parEMail)
{
	
	invalidChars  = "/;,:{}[]|*%$#!()`<>? ";
	if (parEMail == "" )
	{
		return false ;
	}
	
	for  (i = 0 ; i < invalidChars.length; i++ )
	{
		badChar  =  invalidChars.charAt(i) ;
		if (parEMail.indexOf(badChar, 0 ) > -1)
		{
			return false ;
		} 
	} 
	
	atPos  =  parEMail.indexOf( "@" , 1 );
	if (atPos == -1)
	{
		return false ;
	} 
   
	if (parEMail.indexOf( "@", atPos + 1) != -1)
	{
		return false ;
	}
 
	periodPos  =  parEMail.indexOf( "." ,atPos)
	if (periodPos == -1)
	{
		return false ;
	} 
 
	if ( atPos + 2 > periodPos)
	{
		return false ;
	} 
 
	if (periodPos + 3 > parEMail.length)
	{
		return   false ;
	}  
	
	
	return true ;
}



/*
==========================================================================
功能說明:取代指定的字
傳入參數:
			sString:		傳入的字串。
			sReplaceThis:	傳入的被取代文字。
			sWithThis:		傳入的取代成的文字。
傳回參數:
==========================================================================
*/


function replaceString(sString, sReplaceThis, sWithThis) 
	{ 
		if (sReplaceThis != "" && sReplaceThis != sWithThis)
		{
			var counter = 0;
			var start = 0;
			var before = "";
			var after = "";
			
			while (counter<sString.length)
			{
				start = sString.indexOf(sReplaceThis, counter);
				if (start == -1)
				{
					break;
				}
				 else
				 {
					before = sString.substr(0, start);
					after = sString.substr(start + sReplaceThis.length, sString.length);
					sString = before + sWithThis + after;
					counter = before.length + sWithThis.length;
				}
			}
		}
		
		return sString;
	}



/*
==========================================================================
功能說明:計算字串長度
傳入參數:
傳回參數:
==========================================================================

Function taLimit is used for the Key Press event for the text box or text area :
 When a key is pressed this function checks if the total number of characters typed 
 equals the limit given by the property maxLength for the field. 
 If the limit is reached then it return false thus not allowing any further key press event.


Function taCount is used for the Key Up event : 
We use this to change the value of the counter displayed and to truncate 
the excess characters if any (example if someone has cut and pasted the value into the field when we have allowed paste).
 To disable paste add the property onpaste="return false" to the field. 
 We use the inner text property of the span element to change the counter displayed. 


*/

function strLength() {
	var taObj=event.srcElement;
	if (taObj.value.length==taObj.maxLength*1) return false;
}

function taCount(visCnt) { 
	var taObj=event.srcElement;
	if (taObj.value.length>taObj.maxLength*1) taObj.value=taObj.value.substring(0,taObj.maxLength*1);
	if (visCnt) visCnt.innerText=taObj.maxLength-taObj.value.length;
}



/*
==========================================================================
功能說明:計算字串長度
傳入參數:
		 
傳回參數:
==========================================================================
*/
function countLength(stringToCount)
{
    //計算有幾個全型字、中文字...  
    var c = stringToCount.match(/[^ -~]/g);  
    return stringToCount.length + (c ? c.length : 0);
}



/*
==========================================================================
功能說明:計算字串長度
傳入參數:
 
傳回參數:
用法：
// var str = "我是puma";   

// alert("字元數:"+str.length); //中文字(2),英文字(4),總共(6)  

// alert("byte數:"+str.Blength()); //中文字(4),英文字(4),總共(8)  
==========================================================================
*/

String.prototype.lengthByBytes = function() {   

     var arr = this.match(/[^\x00-\xff]/ig);   

     return  arr == null ? this.length : this.length + arr.length;   

 }   

    


