<%@ Page MaintainScrollPositionOnPostback="true" Language="vb" enableEventValidation="false" AutoEventWireup="false" CodeBehind="FrmCaseApply.aspx.vb" Inherits="UI.Case.Web.FrmCaseApply" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html>
<head runat="server">
<title></title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet"/>
<script language="javascript" src="../ScriptFiles/ShowBgtWeb/ShowBudget.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/JSPlanPicker.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/setSeleGroup.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/SearchNum.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/JSComFun.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

		function fnCallPhraseDialog(thisName){
		
		var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		if (strReturnVal != "Cancel" )
		
				{
					document.all(thisName).value=document.all(thisName).value + strReturnVal;
					//Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
				}

			//Form1.TBFindSql.value=strReturnVal;

		}


		function UCDate_Change(calendar){
		var vDay = new Date(calendar.GetSelectedDate());
		document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}
		
		
		function UCNeedDate_Change(calendar){		
		var vDay = new Date(calendar.GetSelectedDate());
		document.getElementById("TBAcmNeedDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}
		
		function UCReturnDate_Change(calendar){
		var vDay = new Date(calendar.GetSelectedDate());
		document.getElementById("TBAcpReturnDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function UCPrePayDate_Change(calendar){
		var vDay = new Date(calendar.GetSelectedDate());
		document.getElementById("TBAcpPrePayDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function UCPassDate_Change(calendar){
		var vDay = new Date(calendar.GetSelectedDate());
		document.getElementById("TBAcmPassDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function fnCallSearchDialog(){

		var strReturnVal=showModalDialog("FrmSearch.aspx?showtype=1&mod=" + "<%=strModFlag %>",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel")
			{
//				Form1.TBFindSql.value=strReturnVal;

				document.all("TBFindSql").value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}
		function setEmpName(parObj) {
			var tmpArray;
//		    var tmpVal;
//		    tmpVal = parObj.options[parObj.selectedIndex].innerText
//		    alter(tmpVal.indexOf(" "));
			tmpArray = parObj.options[parObj.selectedIndex].innerText.split(" ");
			document.all("TBEmpName").value = tmpArray[1];
			//document.all("TBEmpName").value = parObj.options[parObj.selectedIndex].innerText;

		}

		function fnCallPrintReport(parFalg, parAcmWordNum) {
		   // alert(parFlag);

			if (parFalg == "Prod02") {
				//var strReturnVal = showModalDialog("FrmChooseProd.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
				  showModalDialog("FrmChooseProd.aspx?acmWordNum=" + parAcmWordNum , window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
			}
			else {
				//var strReturnVal = showModalDialog("FrmPrintDialog.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
			   showModalDialog("FrmPrintDialog.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
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


	



function  fnCallReportMenu(){
	var strParams;
	 strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;

	 window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=M" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }




	function fnCallTelDialog(thisName){

			var strEmpNo= document.all("DDLStaffName").value;

if (strEmpNo !="")
{
			var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmbasPayName.aspx?staffno=" + strEmpNo +"&funtype=1"  ,window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
			if (strReturnVal != "Cancel" )
				{

					document.all(thisName).value=strReturnVal ;
					//Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
				}

			//Form1.TBFindSql.value=strReturnVal;
}
		}
		
		
		function showfiled(parSObj, parTObj)
		{
		    if(document.all("CBAutoTempPay").checked==true)
		    {
		        document.all("TRTmpPayData").style.display="block";
		        document.all("TRTmpPayData1").style.display="block";
		    }
		    else 
		    {
		        document.all("TRTmpPayData").style.display="none";
		        document.all("TRTmpPayData1").style.display="none";
		    }
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
		
		
				function DisableAfterSubmit(){
	var obj = event.srcElement;
	var objs = document.getElementsByTagName('INPUT');
	for(var i=0; i<objs.length; i++){
		if(objs[i].type.toLowerCase() == 'submit'){
			objs[i].disabled = true;
		}
	}
}
	

		
		
</script>
<style type="text/css" >
	.styTitle4C{width:75px; text-align:right}
	.styTitle5C{width:85px; text-align:right}
	.styData90W{width:90px; text-align:left}
	.styData120W{width:120px; text-align:left}
	.styData100W{width:100px; text-align:left}
</style>

<style>
/* 可摺疊標題 */
.sFoldTitle { background-color: #6699FF; CURSOR: hand; }
.sFoldTitleFont { font-size:10pt; color:#FFFFFF; padding-top:4px; padding-left:4px; }
/* DataGrid寬高 */
.DIV0_width { width: 590px; height: auto; overflow: hidden; border-style: groove; border-width: 1px; }
.DIV1_width { width: 590px; height: 166px; overflow: auto; border-style: groove; border-width: 1px; }
.DIV1_noWidth { width: auto; height: auto; overflow-x: scroll; border-style: groove; border-width: 1px; }
.DIV2_width { width: 590px; height: 95px; overflow: auto; border-style: groove; border-width: 1px; }
.DIV2_noWidth { width: auto; height: auto; overflow-x: scroll; border-style: groove; border-width: 1px; }
.DIV3_width { width: 590px; height: 87px; overflow: auto; border-style: groove; border-width: 1px; }
.DIV3_noWidth { width: auto; height: auto; overflow-x: scroll; border-style: groove; border-width: 1px; }

.DIV1_FreezingCol{
	LEFT: expression(document.getElementById("div_grid_acpDtlExtra").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 0px solid #FFFFFF;
}
.DIV1_FreezingCol2{
	LEFT: expression(document.getElementById("div_grid_acpDtlExtra").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 1px solid #FFFFFF;
}
    </style>

<script language="javascript">
<!--

function show_item(item, sender){
	var item_style = document.all[item].style;

	if(typeof sender != "undefined"){
		if(document.getElementById(sender).src.slice(-8) == 'plus.gif'){
			item_style.display = "block";
		}
		else{
			item_style.display = "none";
		}
	}
	else{

		if(item_style.display == 'none'){
			item_style.display = "block";
		}
		else{
			item_style.display = "none";
		}
	}
}

function sync_title_img(sender){
	if(sender.style.display=='block'){
		document.getElementById("img_" + sender.id).src = "images/minus.gif";
	}
	else {
		document.getElementById("img_" + sender.id).src = "images/plus.gif";
	}
}


function scale_item(sender){
	var pORm;
	if(document.getElementById(sender).src.slice(-8) == 'plus.gif')
		pORm = "+";
	else
		pORm = "-";

//	scale_item_by(pORm, "table");
//	scale_item_by(pORm, "td");
	scale_item_by(pORm, "div");
//	scale_item_by(pORm, "hr");

	if(pORm == "+")
		document.getElementById(sender).src = "images/minus.gif";
	else
		document.getElementById(sender).src = "images/plus.gif";
}

function scale_item_by(pORm, tagName){
	var obj = document.getElementsByTagName(tagName);
	for(var i = 0; i < obj.length; i++)
		try{
			if(obj[i].alt != undefined)
//alert(obj[i].alt);
				if(pORm == "+"){
					obj[i].className = obj[i].alt + "_noWidth";
				}
				else{
					obj[i].className = obj[i].alt + "_width";
				}
		} catch(e){;}
}

function GetIEVer(){
	var x;
	for(i=0; i<10; i++){
		for(z=0; z<10; z++){
			if(navigator.appVersion.match("MSIE " + i + "." + z) != null)
				x = i + "." + z;
		}
	}
	return x;
}

function SetCookie(sName, sValue){
	keepDay = 7;
	setDay = new Date();
	setDay.setTime(setDay.getTime()+(keepDay*1000*60*60*24));
	expDay = setDay.toGMTString();

	document.cookie = sName + "=" + escape(sValue) + "; expires=" + expDay;
}

function GetCookie(sName){
	var aCookie = document.cookie.split("; ");
	for(var i = 0; i < aCookie.length; i++){
		var aCrumb = aCookie[i].split("=");
		if(sName == aCrumb[0])
		return unescape(aCrumb[1]);
	}
	return null;
}

function GetPageName(){
	var strHref = window.location.href;
	var pageName = strHref.slice(strHref.lastIndexOf("/") + 1);
		pageName = (pageName + "?").split("?")[0];
	return pageName;
//	return (window.location.href).slice((window.location.href).lastIndexOf("/") + 1);
}

function jRight(text, numb){
	var str = text;
		str = str.substring(str.length-numb, str.length);
	return str;
}

function set_cookies(){
	try { SetCookie(GetPageName() + ":FoldTitle_12", FoldTitle_12.style.display); } catch (e) {;}	//折疊項目
	try { SetCookie(GetPageName() + ":FoldTitle_20", FoldTitle_20.style.display); } catch (e) {;}	//折疊項目
	try { SetCookie(GetPageName() + ":FoldTitle_11", FoldTitle_11.style.display); } catch (e) {;}	//折疊項目
	try { SetCookie(GetPageName() + ":FoldTitle_50", FoldTitle_50.style.display); } catch (e) { ; } //折疊項目

	try { SetCookie(GetPageName() + ":div_UCActVisa", div_UCActVisa.className); } catch (e) {;}	//縮放表格
	try { SetCookie(GetPageName() + ":div_UCProdApply", div_UCProdApply.className); } catch (e) { ; } //縮放表格
}

function get_cookies() {
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_12"), "FoldTitle_12", "img_FoldTitle_12");} catch (e) {;} 	//折疊項目
	try { SetFold(GetCookie(GetPageName() + ":FoldTitle_20"), "FoldTitle_20", "img_FoldTitle_20");} catch (e) {;} 	//折疊項目
	try { SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11");} catch (e) {;} 	//折疊項目
	try { SetFold(GetCookie(GetPageName() + ":FoldTitle_50"), "FoldTitle_50", "img_FoldTitle_50"); } catch (e) { ; } 	//折疊項目

	try { SetDiv(GetCookie(GetPageName() + ":div_UCActVisa"), "div_UCActVisa", "img12");} catch (e) {;} 	//縮放表格
	try { SetDiv(GetCookie(GetPageName() + ":div_UCProdApply"), "div_UCProdApply", "img20");} catch (e) {;} 	//縮放表格
}

function SetFold(sValue, item, sender){
	if(sValue == "block"){
		document.getElementById(item).style.display = "block";
		document.getElementById(sender).src = "images/minus.gif";
	}
	else{
		document.getElementById(item).style.display = "none";
		document.getElementById(sender).src = "images/plus.gif";
	}
}

function SetDiv(sValue, item, sender){
	document.getElementById(item).className = sValue;
	if(jRight(sValue,7) == "noWidth"){
		document.getElementById(sender).src = "images/minus.gif";
	}
	else{
		document.getElementById(sender).src = "images/plus.gif";
	}
}

//-->






</script>

</head>
<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies();showfiled();ShowAddVisaData();' onunload='set_cookies()'>
	<form id="form1" runat="server">
        <table  id="TablePass" runat="server" style="MARGIN-TOP: 0px; MARGIN-LEFT: 0px; BORDER-COLLAPSE: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
	        <tr>
		        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
			        <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				        <tr>
					        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			                     <table  border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout:fixed">
                                    <tr >
                                        <td style="color: #FF0000; width: 75px;" align="right"><asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label></td>
                                        <td style="width: 110px;" ><asp:TextBox id="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox></td>
                                        <td style="color: #FF0000;width: 85px;" align="right" ></td> 
                                        <td style="width: 110px;"></td>
                                        <td ></td>
                                        <td ></td>
                                    </tr>                                  
                                 </table> 
					        </td>
				        </tr>
			        </table>
		        </td>
	        </tr>
	        <tr bgcolor="#FFFFFF"><td style="height:10px"></td></tr>
        </table> 
     <table border="0" cellpadding="0" style="border-collapse: collapse">
		<tr>
			<td valign="top">
			<!-- 左框架START -->
			<table cellpadding="0" style="border-collapse: collapse" border="0">
				<tr>
					<td valign="top">
					<table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668" bgcolor="#DADEE9">
						<tr>
							<td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
							<!-- ↓審核原因 -->
							
							<!-- 審核原因↑ -->
							<!-- ↓審核 -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 5px">

									<table cellpadding="0" style="border-collapse: collapse; width: 600px" border="0">
										<tr>

											<td align="right">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBAcmUnitPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="單位審核" /></td>
													<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBSecrearyFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="秘書室審核" Visible="False" /></td>
													<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="會計室審核" /></td>
												</tr>
											</table>
											</td>
										</tr>
									</table>

									</td>
								</tr>
							</table>
							<!-- 審核↑ -->
							<!-- ↓區塊(1) -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
									    <tr>
									        <td>
											   <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed; width:600px">
                                                    <tr>
                                                        <td style="text-align:left">
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBAllowanceFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBSeparateFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款" Visible="True" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBEPayment" runat="server" Font-Size="X-Small" TextAlign="Right" Text="電子支付" Visible="True"  onclick="chkTmpPayAndCash();" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBDocFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="簽文" Visible="false" /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="text-align:right">
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAutoTempPay" runat="server" Font-Size="X-Small" TextAlign="Right" Text="逕行暫付" Visible="True" onclick="showfiled(this);chkTmpPayAndCash();" /></td>
	                                                                <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAutoBid" runat="server" Font-Size="X-Small" TextAlign="Right" Text="自動決標" Visible="True"   onclick="chkTmpPayAndCash();"  /></td>
	                                                                <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAddVisa" runat="server" Font-Size="X-Small" TextAlign="Right" Text="加簽" Visible="True"  onclick="ShowAddVisaData(this);"  /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
											</td>
									    </tr>
									</table>
									</td>
								</tr>
							</table>
							<!-- 區塊(1)↑ -->
							<!-- ↓區塊(2) -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="1" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr style="">
											<td width="100" align="right">&nbsp;</td>
											<td width="100"><input id="TBOtherUnitFlag" type="hidden"  runat ="server" /></td>
											<td width="100" align="right">
                                                <asp:TextBox id="TBCateGrpFlag" runat="server" Width="42px" Visible="true"></asp:TextBox></td>
											<td width="100">&nbsp;</td>
											<td width="100" align="right">
												<asp:Literal ID="ltCateGrpText" runat="server" Text="本局/分局" Visible="false"></asp:Literal>
											</td>
											<td width="100" >
												<asp:DropDownList ID="CBCateGrpFlag" runat="server" AutoPostBack="true" Width="100%" Visible="false">
													<asp:ListItem Text="本局流程" Value="0"></asp:ListItem>
													<asp:ListItem Text="分局流程" Value="1"></asp:ListItem>
												</asp:DropDownList>
											</td>
										</tr>
										<tr>
											<td width="100" align="right">動支編號</td>
											<td width="100"><asp:TextBox id="TBAcmWordNum" runat="server" style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
											<td width="100" align="right">動支金額</td>
											<td width="100"><asp:TextBox id="TBAcmMoney" runat="server" MyName="TBAcmMoney" style="text-align:right" BackColor="Transparent" Width="90" onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
											<td width="100" align="right" id="TDAddVisaData1">原簽單號</td>
											<td width="100" id="TDAddVisaData2"><asp:TextBox id="TBAcmTopWordNum" runat="server" Width="90px"></asp:TextBox></td>
										</tr>
										<tr>
											<td width="100" align="right">動支日期</td>
											<td width="100"><asp:TextBox id="TBAcmMarkDate" runat="server" style="text-align: center; background-color: #FFFFE0" Width="90px" ondblclick="JavaScript: UCDate.Show();"></asp:TextBox></td>
											<td width="100" align="right">承辦單位</td>
											<td width="100"><asp:DropDownList id="DDLWorkDep" style="background-color: #FFFFE0" 
                                                    runat="server" Width="90px" AutoPostBack="True"></asp:DropDownList></td>
											<td width="100" align="right">承辦人員</td>
											<td width="100"><asp:TextBox id="TBEmpName" runat="server" style="background-color: #FFFFE0" Width="90px" Enabled="False"></asp:TextBox></td>
										</tr>
										<tr>
											<td width="100" align="right">廠商名稱</td>
											<td colspan="5"><asp:TextBox id="TBAcmPayName" runat="server" ondblclick='fnCallPhraseDialog("TBAcmPayName");'  Width="472px"></asp:TextBox></td>
										</tr>
										<tr>
											<td width="100" align="right">事　　由</td>
											<td width="500" colspan="5" nowrap><asp:TextBox id="TBAcmSubMemo" runat="server" style="background-color: #FFFFE0" Width="472px" Rows="2" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnSubPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..." onclick="fnCallPhraseDialog('TBAcmSubMemo');"/></td>
										</tr>
										<tr>
											<td width="100" align="right">控帳事由</td>
											<td width="500" colspan="5" nowrap>
											    <asp:TextBox id="TBAcmMemo" runat="server"  Width="472px" Rows="2" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..."  onclick="fnCallPhraseDialog('TBAcmMemo');"/></td>
										</tr>
										<tr id="TRTmpPayData" style="display:none">
											<td width="100" align="right" style="display:none">支付日期</td>
											<td width="100" style="display:none"><asp:TextBox id="TBAcpPrePayDate" runat="server" Width="90px" 
                                                    ondblclick="JavaScript: UCReturnDate.Show();"></asp:TextBox></td>
											<td width="100" align="right" style="display:none">支付時間</td>
											<td width="100" style="display:none"><asp:TextBox id="TBAcpPayHour" runat="server" Width="50px" 
                                                    onkeypress="return check_Num()"></asp:TextBox>(小時)</td>
											<td width="100" align="right">轉正日期</td>
											<td width="100"> <asp:TextBox id="TBAcpReturnDate" runat="server" Width="90px" ondblclick="JavaScript: UCReturnDate.Show();"></asp:TextBox> </td>
										</tr>
										<tr>
											<td width="100" align="right"> </td>
											<td width="500" colspan="5" nowrap><asp:Label id="LBShowAllAcmWord" runat="server"></asp:Label></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<!-- ↓區塊(2) --><asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder><!-- 區塊(2)↑ -->
							<!-- ↓區塊(3) --><span id="TRTmpPayData1"><asp:PlaceHolder ID="PlaceHolder7" runat="server"></asp:PlaceHolder></span><!-- 區塊(3)↑ -->
							<!-- ↓區塊(4) --><!-- 區塊(4)↑ -->
							<!-- ↓區塊(5) --><!-- 區塊(5)↑ -->
							<!-- Insert 區塊 here -->
							    
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			<!-- ↓歷史資料 -->
			<table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
				<tr>
					<td>
					<table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
						<tr>
							<td>
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td><asp:button id="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:button></td>
									<td><asp:Button id="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button></td>
									<td><input type="button" id="BtnPrint1" runat="server" style="width: 50px; height: 22px" value="列印" onclick="fnCallReportMenu();" /></td>
									<td></td>
									<td><asp:textbox id="TBSearchSql" runat="server" style="TEXT-ALIGN: center; width: 90px" onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" onblur="if(this.value==''){this.value='尋找動支編號';}" onfocus="this.select()" onclick="this.value=''" AutoPostBack="True">尋找動支編號</asp:textbox><input type="button" style="HEIGHT: 22px; WIDTH: 16px; font-family: Webdings; font-size:8pt" value="s"></td>
									<td><input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" /></td>
									<td><input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" /></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<div id="_freezingDiv" class="DIV0_width">
								<asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
									<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
									<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
									<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
									<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
									<Columns>
										<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
											<HeaderStyle Width="30px" />
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										</asp:ButtonColumn>
										<asp:BoundColumn DataField="acmYear" HeaderText="年度">
											<HeaderStyle Width="30px"></HeaderStyle>
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="簽證系統號" SortExpression="acmNo">
											<HeaderStyle Width="30px"></HeaderStyle>
											<ItemStyle HorizontalAlign="Left"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
											<ItemTemplate>
												<asp:Label ID="Label1" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString())%>'  ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:BoundColumn DataField="DepName" HeaderText="承辦單位" SortExpression="DepName">
											<HeaderStyle Width="80px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="acmWorkUserNo" HeaderText="承辦人員" SortExpression="acmWorkUserNo">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,#}" SortExpression="acmMoney">
											<HeaderStyle Width="70px"></HeaderStyle>
											<ItemStyle HorizontalAlign="Right"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="acmMemo" HeaderText="控帳事由" SortExpression="acmMemo"></asp:BoundColumn>
										<asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動" SortExpression="acmModifyUser">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="M1Counter" HeaderText="M1Counter-10">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="M2Counter" HeaderText="M2Counter-11">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="PCounter" HeaderText="PCounter-12">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="acmBgtKind" HeaderText="結轉-13">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn  Visible="False" DataField="acmWordNum" HeaderText="動支編號-14">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn  Visible="False" DataField="P1Counter" HeaderText="PCounter-15">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
									</Columns>
									<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
								</asp:datagrid>
							</div>
							</td>
						</tr>
						<tr>
							<td>
							<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
								<tr>
									<td><font size="2">共 <asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label> 筆資料</font></td>
									<td align="right">
									<table cellpadding="0" style="border-collapse: collapse" border="0">
										<tr>
											<td><font size="2">只列出｜</font></td>
											<td>
												<asp:DropDownList id="DDLSortMonth" runat="server" AutoPostBack="True">
													<asp:ListItem Value="0">…</asp:ListItem>
													<asp:ListItem Value="1">&nbsp;&nbsp;1月</asp:ListItem>
													<asp:ListItem Value="2">&nbsp;&nbsp;2月</asp:ListItem>
													<asp:ListItem Value="3">&nbsp;&nbsp;3月</asp:ListItem>
													<asp:ListItem Value="4">&nbsp;&nbsp;4月</asp:ListItem>
													<asp:ListItem Value="5">&nbsp;&nbsp;5月</asp:ListItem>
													<asp:ListItem Value="6">&nbsp;&nbsp;6月</asp:ListItem>
													<asp:ListItem Value="7">&nbsp;&nbsp;7月</asp:ListItem>
													<asp:ListItem Value="8">&nbsp;&nbsp;8月</asp:ListItem>
													<asp:ListItem Value="9">&nbsp;&nbsp;9月</asp:ListItem>
													<asp:ListItem Value="10">10月</asp:ListItem>
													<asp:ListItem Value="11">11月</asp:ListItem>
													<asp:ListItem Value="12">12月</asp:ListItem>
												</asp:DropDownList>
											</td>
											<td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											<td><asp:DropDownList ID="DDLSortPassFlag" runat="server" AutoPostBack="True">
													<asp:ListItem Value="0">未審核</asp:ListItem>
													<asp:ListItem Value="1">已審核</asp:ListItem>
													<asp:ListItem Value="">不區分</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			<!--歷史資料↑ -->
			<!-- 左框架END -->
			</td>
			<td width="5">　</td>
			<td valign="top" width="200"><iframe id="iFrame" name="iFrame" border="0" frameborder="0" scrolling="no" width="200" height="520"></iframe></td>
		</tr>
	</table>

	<ComponentArt:CALENDAR id="UCDate"     runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"> </ComponentArt:CALENDAR>
	<ComponentArt:CALENDAR id="UCNeedDate"     runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCNeedDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmNeedDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"> </ComponentArt:CALENDAR>
	<ComponentArt:CALENDAR id="UCPassDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCPassDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmPassDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:CALENDAR>
	<ComponentArt:CALENDAR id="UCReturnDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCReturnDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpReturnDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:CALENDAR>
	<ComponentArt:CALENDAR id="UCPrePayDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCPrePayDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpPrePayDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:CALENDAR>

	<script language="javascript" type="text/javascript">           if (document.all("BtnSave").disabled) setShowBudget();</script>
	<asp:button id="BtnPrint" runat="server" Text="列印" Height="22" Visible="False"></asp:button>
	</form>
</body>
</html>
<script language="javascript" type="text/javascript">
	window.cart_calendar_PostBackOnSameSelection = true; //COMPONENTART:CALENDAR
</script>
