function setShowBudget(parObj)

{
 
	var strPath="a=1";
	
	if (document.all("DDLBgtDep").value !="" )
		{
			strPath +="&BgtDepCode=" + document.all("DDLBgtDep").value 
			
		}
	
	
	
	if (document.all("DDLAccKind").value !="" )
		{
			strPath +="&acckind=" + document.all("DDLAccKind").value 
			
		}
	
	if (document.all("DDLPlanName").value !="" )
		{
			strPath +="&plancode=" + document.all("DDLPlanName").value 
			
		}
	
	
	if (document.all("DDLOulOut").value !="" )
		{
			strPath +="&oulcode=" + document.all("DDLOulOut").value 
			
		}
	
		if (document.all("TBBgtYear").value !="" )
		{
			strPath +="&bgtyear=" + document.all("TBBgtYear").value 
			
		}
	
		if (document.all("DDLBgtSour").value !="" )
		{
			strPath +="&bgtsource=" + document.all("DDLBgtSour").value 
			
		}
//-------------------------------------------	
if (strPath !="" ){strPath +="&"}
strPath+="mod=" + "<%=strModFlag%>"
		if (strPath )
		{		 
		    try{document.getElementById("iFrame").src="../UI.ActSum.WEB/FrmPlanBgtAdj.aspx?"+strPath;}catch(e){;}
		}
			
}