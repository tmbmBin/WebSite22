// JScript source code by nickey 99.1.6
// email:nickey@ms50.url.com.tw

function cint(val,retDef)
   {return (val==null||isNaN(val))?((retDef==null)?0:retDef):val.valueOf();}
function atoi(Str,retDef)
   {return cint(((Str)?parseInt(Str.replace(/,/g,"")):Str),retDef);}
function FindTagName(setObj, tagName) {
    if (!tagName) tagName = "TR";
    while (setObj) {
        if (setObj.tagName == tagName) {
            return setObj;
        }
        setObj = setObj.parentNode;
    }
    return null;
 }
//--------------------------------------------------
//get string:add(',')
//--------------------------------------------------
function NumToFStr(Val,n)
{var EditStr="";
 var EndStr="",i,Pos;
 var Str=(n!=null||isNaN(Val)) ?number_format(Val, n).toString():Val.toString();
 var MilusFlag=(Str.charCodeAt(0)==45);
 if(MilusFlag) Str=Str.substring(1); 
 if(Str.indexOf(".")!=-1)
 {EndStr=Str.substring(Str.indexOf(".")); 
  Str=Str.substring(0,Str.indexOf("."))
 } 
 Pos=Str.length % 3;   
 for(i=0;i<Str.length;i++)
 { if(i>0&&i>=Pos&&(i-Pos)%3==0)
      EditStr=EditStr+","; 
   EditStr=EditStr+Str.substring(i,i+1);
 }  

 if(MilusFlag) return "-"+EditStr+EndStr;
 return EditStr+EndStr;
}
//--------------------------------------------------
//get numeric:get(0-9,'.','-')out(',')
//--------------------------------------------------
function GetNum(Str,DefVal)
{var EditStr="";
if(Str)
{if(isNaN(Str)&&Str.indexOf(',')<0)
 {try
  { Str=eval(Str).toString();
  }catch (e){;}
 } 
 for(var i=0;i<Str.length;i++)
 {if((Str.charCodeAt(i)>=48&&Str.charCodeAt(i)<=57)||Str.charCodeAt(i)==46||Str.charCodeAt(i)==45) //'0'~'9','.','-'
    EditStr=EditStr+Str.substring(i,i+1);
 }
} 
 var Val=parseFloat(EditStr);  
 if(isNaN(Val)) Val=0;
 else if(Str.charCodeAt(0)==45) Val*=-1;  //'-'
 if(!Val&&DefVal&&!isNaN(parseFloat(DefVal))) Val=parseFloat(DefVal);
 return Val;
}
//--------------------------------------------------
function GetZeroDef(Val,DefVal)
{if(!Val||Val==0||Val=="") return DefVal;
 return Val;
}
//--------------------------------------------------
//get numeric:dec in 5 out 4
//--------------------------------------------------
function number_format(number, n)
{   if(typeof(number)!="number")    
       number=GetNum(number);
    var kind=2;
    if(isNaN(n)) {n=0;kind=0;}    
    else if(n<=0) {n=n*-1;kind=1;} 
    if(kind)       
    {for(var i=0;i<n;i++) number*=10;    
     number = Math.round(parseFloat(number)); 
    }         
    var MilusFlag;    
    if(number<0)
    { MilusFlag=true;number*=-1;}
    else MilusFlag=false;    
    var num=number.toString();                
   if(kind) 
    if(num.length<=n)
    { for(var i=0;i<n-num.length;i++)
       num='0'+num;
       num='0.'+num;       
    }else 
      num=num.substring(0,num.length-n)+'.'+num.substring(num.length-n,num.length);              
    //for(var i=0;i<n;i++) number/=10;      
    //var num = parseFloat(number).toString();
    if(MilusFlag) num="-"+num;
    var point= num.indexOf('.');    
    if(kind<2) 
    {if(kind==1&&point>=0) 
     {while(num.length>1&&(num.charAt(num.length-1)=='0'||num.charAt(num.length-1)=='.')) 
       { num=num.substring(0,num.length-1);
         if(num.indexOf('.')<0) break; 
       }       
     }
     return num; 
    }     
    if(point == -1)
    { if(n>0)
      { num += '.';
        for(var i=0;i<n;i++)
            num += '0';
      }      
       return num;
    }
    for(var i=0; i< (n - (num.substring(point+1,num.length)).length);i++)
    {        num += '0';
    }        
return num;
}
//--------------------------------------------------
function FindObj(Val,Name,OwnObj,CmpStrFlag,CmpCaseFlag,AllFlag)
{var setObj;
 if(!OwnObj) OwnObj=document.body.all;
 if(!Name) Name="id";
 var my_array =null; 
 var my_array_Cnt=0;
 for(var i=0;i<OwnObj.length;i++)
 {try{
    setObj=OwnObj[i];   
    if(CmpStr(eval("setObj."+Name),Val,CmpStrFlag))
    { if(AllFlag)
      { if(!my_array) my_array= new Array(); 
        my_array[my_array_Cnt++]=setObj; 
      } 
      else
       return setObj;   
    }
  }catch (e){;}
 }
 return my_array;
}
function CmpStr(Str1,Str2,CmpStrFlag,CmpCaseFlag)
{ if((Str1+"").length<(Str2+"").length) return false;
  if(CmpStrFlag==1) Str1=(Str1+"").substr(0,(Str2+"").length);//Left
  else if(CmpStrFlag==2) Str1=(Str1+"").substr((Str1+"").length-(Str2+"").length); //Right
  if(CmpCaseFlag) 
  {Str1=Str1.toString.toUpperCase();
   Str2=Str2.toString.toUpperCase();
  }
  return (Str1==Str2);
}
function HideMyRow(setObj)
{if(setObj&&setObj.checked)
 {var TRObj=FindTagName(setObj,"TR");
  if(TRObj)  TRObj.style.display='none';
  return TRObj;
 } 
 return null;
}
function HideTableRow(setObj,FieldVal,FieldName,CmpStrFlag,CmpCaseFlag)
{ var Obj;  
  if(typeof(setObj)!="object") setObj=document.all[setObj];
  if(!FieldVal&&!FieldName) {FieldVal="checkbox";FieldName="type";}
  if(typeof(setObj)=="object" && setObj.tagName=="TABLE")
   for(var i=0;i<setObj.rows.length;i++)
   {Obj=FindObj(FieldVal,FieldName,setObj.rows(i).all,CmpStrFlag,CmpCaseFlag);    
    if(Obj&&Obj.checked)
    { //setObj.deleteRow(i);
      setObj.rows(i).style.display='none';
    }
   }
}