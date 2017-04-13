<%@ Page MaintainScrollPositionOnPostback="true" Language="vb" AutoEventWireup="false" CodeBehind="FrmCaseSubApply.aspx.vb" Inherits="UI.Case.Web.FrmCaseSubApply" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" /> 
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
	<script language="javascript" src="../ScriptFiles/ShowBgtWeb/ShowBudget1.js" />
	<script language="javascript" src="../ScriptFiles/SearchNum.js" type="text/javascript"></script>
	<script language="javascript" src="../ScriptFiles/JSComFun.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/setSeleGroup.js" type="text/javascript"></script>

	<script language="javascript" type="text/javascript">



	    function fnCallPhraseDialog(thisName) {

	        var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

	        if (strReturnVal != "Cancel") {
	            document.all(thisName).value = document.all(thisName).value + strReturnVal;
	        }

	        //Form1.TBFindSql.value=strReturnVal;

	    }


	    function fnCallSearchDialog() {

	        var strReturnVal = showModalDialog("FrmSearch.aspx?stageflag=2&mod=" + "<%=strModFlag %>", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

	        if (strReturnVal != "Cancel") {
	            //Form1.TBFindSql.value=strReturnVal;
	            document.all("TBFindSql").value = strReturnVal;
	        }

	        //Form1.TBFindSql.value=strReturnVal;

	    }



	    function DisableAfterSubmit() {
	        var obj = event.srcElement;
	        var objs = document.getElementsByTagName('INPUT');
	        for (var i = 0; i < objs.length; i++) {
	            if (objs[i].type.toLowerCase() == 'submit') {
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

<script language="javascript" type="text/javascript">
<!--
    function showfiled(parSObj, parTObj) {
        if (document.all("CBAutoTempPay").checked == true)
        { document.all("TRTmpPayData").style.display = "block"; }
        else { document.all("TRTmpPayData").style.display = "none"; }
    }
		

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
        try { SetCookie(GetPageName() + ":FoldTitle_12", FoldTitle_12.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_20", FoldTitle_20.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_11", FoldTitle_11.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_40", FoldTitle_40.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_42", FoldTitle_42.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_50", FoldTitle_50.style.display); } catch (e) { ; } //折疊項目

        try { SetCookie(GetPageName() + ":div_UCActVisa", div_UCActVisa.className); } catch (e) { ; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCProdApply", div_UCProdApply.className); } catch (e) { ; } //縮放表格
    }

    function get_cookies() {
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_12"), "FoldTitle_12", "img_FoldTitle_12"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_20"), "FoldTitle_20", "img_FoldTitle_20"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_40"), "FoldTitle_40", "img_FoldTitle_40"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_42"), "FoldTitle_42", "img_FoldTitle_42"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_50"), "FoldTitle_50", "img_FoldTitle_50"); } catch (e) { ; } //折疊項目

        try { SetDiv(GetCookie(GetPageName() + ":div_UCActVisa"), "div_UCActVisa", "img12"); } catch (e) { ; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCProdApply"), "div_UCProdApply", "img20"); } catch (e) { ; } //縮放表格
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


    function fnCallReportMenu(parParams) {

        var strParams;
        strParams = parParams;
        window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=M1" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

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

//-->
</script>

</head>
<body  topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies();showfiled();' onunload='set_cookies()'>
    <form id="form1" runat="server">
    

      <table id="TablePass" runat="server" style="MARGIN-TOP: 0px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
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
	        <tr bgcolor="#FFFFFF"><td style="height:5px"></td></tr>
        </table>
      <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="600" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
			<tr>
			    <td>
					<table cellpadding="0" style="border-collapse: collapse; width:600px" border="0">
						<tr>
							<td align="right">
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBAcmUnitPassFlag" runat="server" Font-Size="X-Small"  TextAlign="Left" Text="單位審核" /></td>
									<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBSecrearyFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="秘書室審核" Visible="False" /></td>
									<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="會計室審核" /></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
 			    </td>
			</tr>
				<tr>
					<td>
                        <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed; width:600px">
                            <tr>
                                <td style="text-align:left">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBAllowanceFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金" Visible="True" /></td>
                                            <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBSeparateFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款" Visible="True" /></td>
                                            <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBEPayment" runat="server" Font-Size="X-Small" TextAlign="Right" Text="電子支付" Visible="True" /></td>
                                            <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBDocFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="簽文" Visible="false" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="text-align:right">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAutoTempPay" runat="server" Font-Size="X-Small" TextAlign="Right" Text="逕行暫付" Visible="True" onclick="showfiled(this);" /></td>
	                                        <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAutoBid" runat="server" Font-Size="X-Small" TextAlign="Right" Text="自動決標" Visible="True"   onclick="chkTmpPayAndCash();"  /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
					</td>
				</tr>
				<tr>
				    <td>
                        <table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
							<tr>
								<td align="right" style="width: 75px">動支編號</td>
								<td style="width: 110px">
								    <asp:TextBox ID="TBAcmWordNum" runat="server" Width="70px" BackColor="Transparent" onfocus="this.blur();"></asp:TextBox>
								    <asp:TextBox ID="TBWordSubNum" runat="server" Width="15px" BackColor="Transparent" onfocus="this.blur();" style="text-align:center">0</asp:TextBox></td>
								<td align="right" style="width: 70px">請示日期</td>
								<td style="width: 120px"><asp:TextBox ID="TBAcmMarkDate" runat="server" Width="113px"  onfocus="this.blur();" style="text-align:center" BackColor="Transparent"  ></asp:TextBox></td>
								<td align="right" style="width: 85px">動支金額</td>
								<td><asp:TextBox ID="TBAcmMoney" runat="server" Width="113px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney"></asp:TextBox></td>
							</tr>
                        </table>
				    </td>
				</tr>
				<tr>
				    <td><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder></td>
				</tr>
				<tr>
				    <td><asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder></td>
				</tr>
				<tr>
					<td><asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder></td>
				</tr>
				<tr>
					<td><asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder></td>
				</tr>
				<tr  id="TRTmpPayData1"  >
					<td><asp:PlaceHolder ID="PlaceHolder7" runat="server"></asp:PlaceHolder></td>
				</tr>
			</table>
		</td>
		<td valign="top" width="200" bgcolor="#ffffff" rowspan="3"><iframe id="iFrame" border="0" name="iFrame" frameborder="0" width="200" scrolling="no" height="500"></iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="10"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
				<tr>
					<td valign="bottom" align="left">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
								<td valign="bottom" align="center">
                                    <input type="button" id="BtnPrint1"  runat="server" style="width: 40px; height: 22px" value="列印" visible="True" /><asp:button id="BtnPrint" 
                                        runat="server" Text="列印" Height="22" Visible="False"  ></asp:button></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">&nbsp;</td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找動支編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找動支編號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server"><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
									<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
									<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
									<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
									<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
									<Columns>
										<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small"></ItemStyle>
											<HeaderStyle Width="30px" />
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
											<HeaderStyle Width="80px"></HeaderStyle>
											<ItemTemplate>
												<asp:Label ID="Label1" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:BoundColumn DataField="DepName" HeaderText="承辦單位" SortExpression="DepName"></asp:BoundColumn>
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
										<asp:BoundColumn Visible="false" DataField="M2Counter" HeaderText="M2Counter-11">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="false" DataField="PCounter" HeaderText="PCounter-12">
											<HeaderStyle Width="60px"></HeaderStyle>
										</asp:BoundColumn>
									</Columns>
									<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
								</asp:datagrid></td>
				</tr>
				<tr>
					<td align="right">
					                        <table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                                    <tr>                                    
                                    <td style="width:200px; font-size:10pt" >共　<asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label>　筆資料｜</td>
                                    <td><font size="2">只列出｜</font></td>
                                    <td>&nbsp;<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
                                                                    <asp:ListItem Value="0">......</asp:ListItem>
                                                                    <asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
                                                                    <asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
                                                                    <asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
                                                                    <asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
                                                                    <asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
                                                                    <asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
                                                                    <asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
                                                                    <asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
                                                                    <asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
                                                                    <asp:ListItem Value="10">10月</asp:ListItem>
                                                                    <asp:ListItem Value="11">11月</asp:ListItem>
                                                                    <asp:ListItem Value="12">12月</asp:ListItem>
                                                            </asp:dropdownlist>
                                    </td>
                                    <td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
                                    <td><asp:dropdownlist id="DDLSortPassFlag" runat="server" AutoPostBack="True">
                                                                    <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                    <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                    <asp:ListItem Value="">不區分</asp:ListItem>
                                                                    
                                                                    
                                    </asp:dropdownlist></td>
                                    <td><font size="2">&nbsp;
                                        </font></td>

                                    </tr>
                            </table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
	<script language="javascript">	    setShowBudget();</script>
    </form>
</body>
</html>
    </form>
</body>
</html>
