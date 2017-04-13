 
PROJECT.function testJstrlfun() { 
	/// <summary>
	/// testing
	/// </summary>

}

function fnCallSearchDialog()
		{

			var strReturnVal=showModalDialog("FrmSearch.aspx?stageflag=1&mod="+ "<%=strModFlag %>",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

			if (strReturnVal != "Cancel")
				{
					//alert( document.all("TBFindSql").value);
					document.all("TBFindSql").value=strReturnVal;
					//alert( document.all("TBFindSql").value);
					//Form1.TBFindSql.value=strReturnVal;
				}

			//Form1.TBFindSql.value=strReturnVal;

		}

	function fnCallPayDtlDialog(parParams){
parParams +="&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
	var strReturnVal=showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams,window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
	if (strReturnVal != "Cancel" )
	{
		document.all("TBPayDtlData").value=  strReturnVal;
		//document.all("TextBox1").value=  strReturnVal;
	}
}

		


		function checkVisaKind(parVal)
		{

//			if (parseFloat(replaceString(parVal,",","")) >0 && parseFloat(replaceString(parVal,",","")) <=10000 )
//			{

//				document.all("CBAllowanceFlag").checked=true;
//			}
//			else
//			{
//				document.all("CBAllowanceFlag").checked=false;
//			}
		}
	function ShowAddVisaData(parSObj, parTObj)
		{
		    if(document.all("CBAddVisa").checked==true)
		    {
		        document.all("TDAddVisaData1").style.display="block";
		        document.all("TDAddVisaData2").style.display="block";
		    }
		    else 
		    {
		    document.all("TDAddVisaData1").style.display="none";
		    document.all("TDAddVisaData2").style.display="none";
		    }
		}
		
		
		function  fnCallReportMenu(parParams){

	var strParams;
	strParams=parParams;
	 //strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;
	 window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }


		function showfiled(parSObj, parTObj) {
    if (document.all("CBAutoTempPay").checked == true) {
        document.all("TRTmpPayData").style.display = "block";
        document.all("TRTmpPayData1").style.display = "block";
    }
    else {
        document.all("TRTmpPayData").style.display = "none";
        document.all("TRTmpPayData1").style.display = "none";
    }
}
		
function DisableAfterSubmit(){
	var obj = event.srcElement;
	var objs = document.getElementsByTagName('INPUT');
	for(var i=0; i<objs.length; i++){
		if(objs[i].type.toLowerCase() == 'submit'){
			objs[i].disabled = true;
		}
	}
}


