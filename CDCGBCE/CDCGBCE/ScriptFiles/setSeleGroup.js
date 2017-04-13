//<!--
//----------
//var:v1.00  
//author:nickey 98/11/10
//fun:Transation for Select:Option to Select:OptGroup
//----------
//<script language="javascript" src=setSeleGroup.js>

function setSeleGroup(setObj,GroupMark,GroupBgColor,GroupColor)
{//if(!GroupMark) GroupMark="--";
	 
 with(setObj)
  for(var i=options.length-1;i>=0;i--)
//  if(options[i].disabled||(GroupHead&&options[i].value.indexOf(GroupHead)==0)) //Head
//  if(options[i].disabled||(GroupHead&&options[i].value.indexOf(GroupHead)>=0)) //Any
  if(options[i].disabled||(GroupMark&&options[i].value.indexOf(GroupMark)==options[i].value.length-GroupMark.length)) //Last
   {    var Obj=document.createElement("optgroup");    
        Obj.label=options[i].text;
        if(GroupBgColor) Obj.style.background=GroupBgColor;
        if(GroupColor) Obj.style.color=GroupColor;
        insertBefore(Obj,options[i]);
        options.remove(i);          
   }
}
function tranSeleGroup(setObj,GroupMark,GroupBgColor,GroupColor) //onclick only one
{
	if(setObj&&!setObj._GroupFlag)
 {setObj._GroupFlag=true;
  setSeleGroup(setObj,GroupMark,GroupBgColor,GroupColor);
 }
}
//</script>
//-->
