// JScript File

function setShowBudget(parObj)

{
  
    
	var strPath
		
	strPath="";
	var MyParentIndex;
	var MyIndex;
	var bolChkOul=false;
	var bolChkBgtDep=false;
 
	var strPathOul="";
    if(parObj)
    {
        MyParentIndex=parObj.MyParentIndex;
        MyIndex=parObj.MyIndex	
    }	
    else
    {
        MyParentIndex=0;
        MyIndex=0;
    }
	 
		for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];			
					
				if ( e.getAttribute("MyName") == "TBdgAccKindName" && e.getAttribute("MyIndex")==MyParentIndex) //門別
				{
					if (e.value !="" )
					{
						if (strPath !="" )
						{strPath +="&"
						}
						strPath += "myAccKind=" + e.title;
			
					}
				}
				else 
				if ( e.getAttribute("MyName") == "TBdgBgtSourName" && e.getAttribute("MyIndex")==MyParentIndex) //預算來源
				{
					if (e.value !="" )
					{
						if (strPath !="" )
						{strPath +="&"}
						strPath += "mybgtSource=" + e.title;
				
					}
				}	
				
				
				
				else
					
					
				if ( e.getAttribute("MyName") == "TBdgBizName" && e.getAttribute("MyIndex")==MyParentIndex)		//承辦業務
					                            
				{
					if (e.value !="" )
					{
						if (strPath !="" )
						{strPath +="&"}
						strPath += "myBiz=" + e.title;
				
					}
				}
				
				
				else
					
					if ( e.getAttribute("MyName") == "TBdgPalnName" && e.getAttribute("MyIndex")==MyParentIndex) 	//計畫
				{
					if (e.value !="" )
					{
						if (strPath !="" )
						{strPath +="&"}
						strPath += "myPlan=" + e.title;
					
					}
				}
					
					
				else
						
						
						
						
				if (e.getAttribute("MyName") == "DDLdlOulName" && e.getAttribute("MyIndex")==MyIndex && e.getAttribute("MyParentIndex")==MyParentIndex) //再簽用途別(決標用途別)
				{
				
					if (e.value !="" )
					{
						if (strPath !="" )
						{strPath +="&"}
						strPath += "myOul=" + e.value;
						bolChkOul=true;
				
						}										
				}
					
					
					
				else
						
						
					if ( !bolChkOul && e.getAttribute("MyName") == "TBdgOulName" && e.getAttribute("MyIndex")==MyParentIndex) 		//簽證用途別
						{
							if (e.title !="" )
							{						
								strPathOul = "myOul=" + e.title;
						         
							}
						}
				else
				
				
				if (!bolChkBgtDep && e.getAttribute("MyName") == "DDLBgtDep" ) //再簽用途別(決標用途別)
				{
				    
				   
					if (e.value !="" )
					{
						if (strPath !="" )
						{strPath +="&"}
						
					    strPath += "myBgtDep=" + e.value;
						bolChkBgtDep=true;				
						}										
				}
					
					
					
					 
				
				
				
			} // next i

 

if(!bolChkOul)		
{
    if(strPath) strPath+="&"+strPathOul;
    else    strPath=strPathOul;
}	
    if (strPath )
    {		 
    //if (document.all("DDLBgtDep").value !="")
    //			{
    //				if (strPath !="" )
    //					{strPath +="&"}
    //				strPath += "myBgtDep=" + document.all("DDLBgtDep").value;
    //			}
     
        //try{document.getElementById("iFrame").src="../UI.ActSum.WEB/ShowBudget1.aspx?"+strPath;}catch(e){;}
        try{document.getElementById("iFrame").src="../UI.ActSum.WEB/FrmLauncher.aspx?"+strPath+ "&menuid=1785";}catch(e){;}
    }
			
}
