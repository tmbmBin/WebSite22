function setAllCtrl(ObjFind,Cmd)
{var FName,FId,FType;
 var this_Ctrl;
 var Find=ObjFind.toString().split("|");
 var iCmd;
 var this_Cnt=0;
 if(Find[0].length) FId=(Find[0]+",,").split(",");
 if(Find.length>1) FName=(Find[1]+",,").split(","); 
 if(Find.length>2) FType=(Find[2]+",,").split(",");
 for(var i=0;i<document.all.length;i++)
 {  this_Ctrl=document.all[i];
    if(FId)
    {if(!this_Ctrl.id.length) continue;    
     if(FId[0].length&&this_Ctrl.id.indexOf(FId[0])!=0) continue;         
     if(FId[1].length&&this_Ctrl.id.indexOf(FId[1])<1) continue;
     if(FId[2].length&&(this_Ctrl.id.length<FId[2].length||this_Ctrl.id.indexOf(FId[2])!=this_Ctrl.id.length-FId[2].length)) continue;      
    }
    if(FName) 
    {if(!this_Ctrl.name.length) continue; 
     if(FName[0].length&&this_Ctrl.name.indexOf(FName[0])!=0) continue;
     if(FName[1].length&&this_Ctrl.name.indexOf(FName[1])<1) continue;
     if(FName[2].length&&(this_Ctrl.name.length<FName[2].length||this_Ctrl.name.indexOf(FName[2])!=this_Ctrl.name.length-FName[2].length)) continue;
    }    
    if(FType)
    {if(!this_Ctrl.type.Length) continue
     if(FType[0].length&&this_Ctrl.type.indexOf(FType[0])!=0) continue;
     if(FType[1].length&&this_Ctrl.type.indexOf(FType[1])<1) continue;
     if(FType[2].length&&(this_Ctrl.type.length<FType[2].length||this_Ctrl.type.indexOf(FType[2])!=this_Ctrl.type.length-FType[2].length)) continue;
    }
     if(arguments.length<=1) return document.all[i]; //#94.4.6
     for(iCmd=1;iCmd<arguments.length;iCmd++)
     {this_Ctrl=document.all[i];
      try
       {if(arguments[iCmd].charAt(0)=='#'&&arguments[iCmd].indexOf("=")>=0)
        {if(atoi(arguments[iCmd].substring(1))==this_Cnt)
           eval(arguments[iCmd].substring(arguments[iCmd].indexOf("=")+1));         
        }else
        eval(arguments[iCmd]);
       }
       catch (e){;}
     }
     this_Cnt++;      
 }
 return this_Ctrl; //#94.4.6
}  
function AllCheck(ID,OkFlag)
{if(OkFlag) setAllCtrl(ID,'if(!this_Ctrl.disabled) this_Ctrl.checked=true');
 else       setAllCtrl(ID,'if(!this_Ctrl.disabled) this_Ctrl.checked=false');
}