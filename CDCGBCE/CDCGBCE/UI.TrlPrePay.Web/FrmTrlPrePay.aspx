<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmTrlPrePay.aspx.vb" Inherits="UI.TrlPrePay.Web.FrmTrlPrePay" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
<base target="_self" />
<style  type="text/css">
.objVisible{display:none}
</style>
<script language="javascript" src="../ScriptFiles/ShowBgtWeb/ShowPayBudget.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/SearchNum.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/setSeleGroup.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/JSComFun.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/TableSum.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/TableTools.js" type="text/javascript"></script>

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
function fnCallPayDtlDialog(parParams){
parParams +="&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
	var strReturnVal=showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams,window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
	if (strReturnVal != "Cancel" )
	{
		document.all("TBPayDtlData").value=  strReturnVal;
		//document.all("TextBox1").value=  strReturnVal;
	}
}

function UCDate_Change(calendar){
var vDay = new Date(calendar.GetSelectedDate());
document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
}

function fnCallSearchDialog(){
		var strReturnVal=showModalDialog("FrmSearchPay.aspx?showtype=1&mod=" + "<%=strModFlag %>",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		if (strReturnVal != "Cancel")
			{
//				Form1.TBFindSql.value=strReturnVal;
				document.all("TBFindSql").value=strReturnVal;
			}
		//Form1.TBFindSql.value=strReturnVal;
		}

function  fnCallPrntWeb()
{
	var strParams;

  // alert("&acmwordnum=" + document.all("TBAcmWordNum").value );
  if (document.all("DDLReport").value == "Gen01" || document.all("DDLReport").value == "Gen03" || document.all("DDLReport").value == "Prod01")
  {
   // alert("11");
	//var tmpVal="<%=strDefKidNum%>" ;
	//alert( document.all("ctl04_DDLPayNo").value);
	 strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acpPayNo=" +  document.all("ctl05_DDLPayNo").value + "&acmkidnum=<%=strDefKidNum  %>";
	// alert(strParams);
	 window.open("../UI.ActReports.Web/FrmRptGen01.aspx?rptflag=" +  document.all("DDLReport").value + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }
  else
  {

	 strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acpPayNo=" +  document.all("ctl05_DDLPayNo").value + "&acmkidnum=<%=strDefKidNum %>" ;
	 window.open("../UI.ActReports.Web/FrmRptWeb.aspx?rptflag=" +  document.all("DDLReport").value + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }
}


function  fnCallReportMenu1(){

	var strParams;
	 strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;
	 window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }


function  fnCallReportMenu(parParams){

	var strParams;
	strParams=parParams;
	 //strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;
	 window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }

  	function ShowProdData()
		{
		    //if(document.all("CBProdData").checked==true)
            
//            if(document.all("CBDocFlag").checked==true)
//		    {
//		        document.all("TRProdData").style.display="block";
//		        document.all("TRProdData1").style.display="block";
//		    }
//		    else {
//		        document.all("TRProdData").style.display="none";
//		        document.all("TRProdData1").style.display="none";
//		    }
		}
		
		function ShowTmpPayData(parSObj, parTObj)
		{
		    if(document.all("CBAutoTempPay").checked==true)
		    {
		        document.all("TRTmpPayData").style.display="block";
		        document.all("TRTmpPayData1").style.display="block";
		    }
		    else {
		        document.all("TRTmpPayData").style.display="none";
		        document.all("TRTmpPayData1").style.display="none";
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

    function show_item(item, sender) {
        var item_style = document.all[item].style;

        if (typeof sender != "undefined") {
            if (document.getElementById(sender).src.slice(-8) == 'plus.gif') {
                item_style.display = "block";
            }
            else {
                item_style.display = "none";
            }
        }
        else {

            if (item_style.display == 'none') {
                item_style.display = "block";
            }
            else {
                item_style.display = "none";
            }
        }
    }

    function sync_title_img(sender) {
        if (sender.style.display == 'block') {
            document.getElementById("img_" + sender.id).src = "images/minus.gif";
        }
        else {
            document.getElementById("img_" + sender.id).src = "images/plus.gif";
        }
    }


    function scale_item(sender) {
        var pORm;
        if (document.getElementById(sender).src.slice(-8) == 'plus.gif')
            pORm = "+";
        else
            pORm = "-";

        //	scale_item_by(pORm, "table");
        //	scale_item_by(pORm, "td");
        scale_item_by(pORm, "div");
        //	scale_item_by(pORm, "hr");

        if (pORm == "+")
            document.getElementById(sender).src = "images/minus.gif";
        else
            document.getElementById(sender).src = "images/plus.gif";
    }

    function scale_item_by(pORm, tagName) {
        var obj = document.getElementsByTagName(tagName);
        for (var i = 0; i < obj.length; i++)
            try {
                if (obj[i].alt != undefined)
                //alert(obj[i].alt);
                    if (pORm == "+") {
                        obj[i].className = obj[i].alt + "_noWidth";
                    }
                    else {
                        obj[i].className = obj[i].alt + "_width";
                    }
            } catch (e) { ; }
    }

    function GetIEVer() {
        var x;
        for (i = 0; i < 10; i++) {
            for (z = 0; z < 10; z++) {
                if (navigator.appVersion.match("MSIE " + i + "." + z) != null)
                    x = i + "." + z;
            }
        }
        return x;
    }

    function SetCookie(sName, sValue) {
        keepDay = 7;
        setDay = new Date();
        setDay.setTime(setDay.getTime() + (keepDay * 1000 * 60 * 60 * 24));
        expDay = setDay.toGMTString();

        document.cookie = sName + "=" + escape(sValue) + "; expires=" + expDay;
    }

    function GetCookie(sName) {
        var aCookie = document.cookie.split("; ");
        for (var i = 0; i < aCookie.length; i++) {
            var aCrumb = aCookie[i].split("=");
            if (sName == aCrumb[0])
                return unescape(aCrumb[1]);
        }
        return null;
    }

    function GetPageName() {
        var strHref = window.location.href;
        var pageName = strHref.slice(strHref.lastIndexOf("/") + 1);
        pageName = (pageName + "?").split("?")[0];
        return pageName;
        //	return (window.location.href).slice((window.location.href).lastIndexOf("/") + 1);
    }

    function jRight(text, numb) {
        var str = text;
        str = str.substring(str.length - numb, str.length);
        return str;
    }

    function set_cookies() {
        try { SetCookie(GetPageName() + ":FoldTitle_15", FoldTitle_15.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_16", FoldTitle_16.style.display); } catch (e) { ; } //折疊項目

        try { SetCookie(GetPageName() + ":div_UCPayVisa", div_UCPayVisa.className); } catch (e) { ; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCPayName", div_UCPayName.className); } catch (e) { ; } //縮放表格
    }

    function get_cookies() {
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_15"), "FoldTitle_15", "img_FoldTitle_15"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_16"), "FoldTitle_16", "img_FoldTitle_16"); } catch (e) { ; } //折疊項目

        try { SetDiv(GetCookie(GetPageName() + ":div_UCPayVisa"), "div_UCPayVisa", "img15"); } catch (e) { ; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCPayName"), "div_UCPayName", "img16"); } catch (e) { ; } //縮放表格
    }

    function SetFold(sValue, item, sender) {
        if (sValue == "block") {
            document.getElementById(item).style.display = "block";
            document.getElementById(sender).src = "images/minus.gif";
        }
        else {
            document.getElementById(item).style.display = "none";
            document.getElementById(sender).src = "images/plus.gif";
        }
    }

    function SetDiv(sValue, item, sender) {
        document.getElementById(item).className = sValue;
        if (jRight(sValue, 7) == "noWidth") {
            document.getElementById(sender).src = "images/minus.gif";
        }
        else {
            document.getElementById(sender).src = "images/plus.gif";
        }
    }

//-->
</script>
</head>
<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies();ShowTmpPayData();ShowProdData(this);' onunload='set_cookies()'>

    <form id="form1" runat="server">
 <!-- ↓審核原因 -->
		<table id="TablePass" runat="server" style="MARGIN-TOP: 0px; MARGIN-LEFT: 0px; BORDER-COLLAPSE: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
	        <tr>
		        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
			        <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				        <tr>
					        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			                     <table  border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout:fixed">
                                    <tr >
                                        <td style="color: #FF0000; width: 75px;" align="right"><asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label></td>
                                        <td style="width: 110px;" ><asp:TextBox ID="TBAcpPassDate" runat="server" MyName="TBAcpPassDate" style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript:UCPassDate.Show();" ></asp:TextBox></td>
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
	        <tr bgcolor="#FFFFFF"><td style="height:5px"></td></tr>
        </table>
		<!-- 審核原因↑ -->
	
	<table border="0" cellpadding="0" style="border-collapse: collapse">
		<tr>
			<td valign="top">
			<!-- 左框架START -->
			<table cellpadding="0" style="border-collapse: collapse" border="0">
				<tr>
					<td valign="top">
					<table cellpadding="0" style="border-collapse:collapse" border="1" bordercolor="#666668" bgcolor="#DADEE9">
						<tr>
							<td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
								 <div id="divdatamsg" runat="server" style="position: absolute; width: auto; height:auto; z-index: 3"  >
	    <table border="0" cellpadding="0"cellspacing="0"  style="background-color: Aqua">
	        <tr>
	            <td><asp:Label ID="LBDataMsg" runat="server" Text="" ForeColor="Red" Font-Size="X-Small" ></asp:Label></td>
	        </tr>
	    </table>
	</div>

							<!-- ↓審核 -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 5px">

									<table cellpadding="0" style="border-collapse: collapse; width:590px" border="0">
										<tr>

											<td align="right">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" style="padding-left: 5px" nowrap>
                                                        <asp:CheckBox id="CBAcpUnitPassFlag" runat="server" Font-Size="X-Small" 
                                                            TextAlign="Left" Text="單位審核" Visible="true" /></td>
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
							<!-- ↓區塊(0) -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 602px" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
									    <tr>
									        <td>
											   <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed; width:100%">
                                                    <tr>
                                                        <td style="text-align:left; display:none">
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBAllowanceFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBSeparateFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款" Visible="True"  Enabled="False" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBEPayment" runat="server" Font-Size="X-Small" TextAlign="Right" Text="電子支付" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBDocFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="簽文" Visible="True"  Enabled="False" onclick="ShowProdData();"/></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="text-align:right">
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAutoTempPay" runat="server" Font-Size="X-Small" TextAlign="Right" Text="逕行暫付" Visible="True" onclick="ShowTmpPayData(this);chkTmpPayAndCash();" Enabled="False" /></td>
	                                                                <td style="padding-right: 5px; " nowrap>&nbsp;</td>
	                                                                <td style="padding-right: 5px" nowrap>&nbsp;</td>
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
							<!-- 區塊(0)↑ -->
							<!-- ↓區塊(1) -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="2" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr>
											<td width="100" align="right">動支編號</td>
											<td width="100"><asp:TextBox ID="TBAcmWordNum" runat="server" style="text-align:center" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
											<td width="100" align="right">請示日期</td>
											<td width="100"><asp:TextBox ID="TBAcmMarkDate" runat="server" style="text-align:center" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
											<td width="100" align="right">動支金額</td>
											<td width="100"><asp:TextBox ID="TBAcmMoney" runat="server" MyName ="TBAcmMoney" style="text-align:right" BackColor="Transparent" Width="90px" onfocus="this.blur();"></asp:TextBox></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<!-- 區塊(1)↑ -->
							<!-- ↓區塊(2) --><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><!-- 區塊(2)↑ -->
							<!-- ↓區塊(3) --><asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder><!-- 區塊(3)↑ -->
							<!-- ↓區塊(4) --><!-- 區塊(4)↑ -->
							<!-- ↓區塊(5) --><!-- 區塊(5)↑ -->
							<!-- Insert 區塊 here --><span id="TRTmpPayData1"><asp:PlaceHolder ID="PlaceHolder7" runat="server"></asp:PlaceHolder></span>
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="2" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr>
										<td>
                                            <input id="BtnPayDtlData" runat="server" type="button" value="黏存單付款說明"   />
                                            <input runat="server" id="TBPayDtlData" type="hidden" />
                                            <asp:Label ID="Label1" runat="server" Text="←本功能請編輯存檔主資料後，才能繼續編輯黏存單付款說明。" 
                                                Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                            </td>
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
									<td><asp:Button id="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px" ></asp:Button></td>
									<td><asp:Button id="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button></td>
									<td><input type="button" id="BtnPrint1" runat="server" style="width: 50px; height: 22px" value="列印" /></td>
									<td style="display:none"><asp:DropDownList ID="DDLReport" runat="server">
											<asp:ListItem Value="Gen01">支出憑證黏存單</asp:ListItem>
											<asp:ListItem Value="Gen03">支出科目分攤表</asp:ListItem>
											<asp:ListItem Value="Gen02">分批(期)付款表</asp:ListItem>
										</asp:DropDownList></td>
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
									<asp:TemplateColumn HeaderText="動支系統號" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LBdgAcmNo" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                     </asp:TemplateColumn>
									<asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate">
										<HeaderStyle Width="60px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
										<ItemTemplate>
											<asp:Label ID="Label1" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'  ></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="承辦單位">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LBdgWorkDepName" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.DepName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkUnitNo").ToString()) %>'></asp:Label>
                                        </ItemTemplate>                                       
                                    </asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="承辦人員" SortExpression="acmWorkUserNo">
										<ItemTemplate>
											<asp:Label ID="Label2" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkUserNo").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmEmpNo").ToString()) %>' ondblclick="clipboardData.setData('text', this.title)" ></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,#}" SortExpression="acmMoney">
										<HeaderStyle Width="70px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Right"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="acmMemo" HeaderText="控帳事由" SortExpression="acmMemo"></asp:BoundColumn>
									<asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動" SortExpression="acmModifyUser">
										<HeaderStyle Width="60px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="P1Counter" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LBdgP1Cnt" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtKind").ToString()) %>'></asp:Label>
                                        </ItemTemplate>                                  
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="結轉-11" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LBdgAcmBgtKind" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtKind").ToString()) %>'></asp:Label>
                                        </ItemTemplate>                                      
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="再簽次號">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LBdgAcmNo1" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString()) %>'></asp:Label>
                                        </ItemTemplate>                                    
                                    </asp:TemplateColumn>
                                    									<asp:TemplateColumn HeaderText="分局旗標" Visible="false">                                        
                                        <ItemTemplate>
                                            <asp:Label ID="LBdgAcmCateGrpFlag" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmCateGrpFlag").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>

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
											<td><asp:dropdownlist id="DDLSortPassFlag" runat="server" AutoPostBack="True">
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

	<ComponentArt:CALENDAR id="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
		ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
		DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
		NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
		PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
		SelectedDayCssClass="selectedday">
	</ComponentArt:CALENDAR>
	<asp:button id="BtnPrint" runat="server" Text="列印" Height="22" Visible="False"></asp:button>
	<script language="javascript">	    if (document.all("BtnSave").disabled) setShowBudget();</script>
    </form>
</body>
</html>
