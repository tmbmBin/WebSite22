<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmTrlPayDomesticV1.aspx.vb" Inherits="UI.CDCTrl.Web.FrmTrlPayDomesticV1" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSDateFun.js"></script>


    <script type="text/javascript" src="../ScriptFiles/ShowBgtWeb/ShowBudget.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSPlanPicker.js"></script>
    <script type="text/javascript" src="../ScriptFiles/setSeleGroup.js"></script>
    <script type="text/javascript" src="../ScriptFiles/SearchNum.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSComFun.js"></script>
    <script type="text/javascript" src="../UI.CDCTrl.UC/ScriptFiles/UCActPayDtlTrl.js"></script>
    <script type="text/javascript" src="ScriptFiles/FrmTrlPayDomestic.js"></script>

    <script type="text/javascript">

        function fnCallSearchDialog() {

            var strReturnVal = showModalDialog("FrmSearch.aspx?stageflag=1&mod=" + "<%=strModFlag %>", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                document.all("TBFindSql").value = strReturnVal;
            }

        }

        function fnCallPayDtlDialog(parParams) {
            parParams += "&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
            var strReturnVal = showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams, window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            if (strReturnVal != "Cancel") {
                document.all("TBPayDtlData").value = strReturnVal;
            }
        }



        function fnCallPrntWeb() {
            var strParams;

            if (document.all("DDLReport").value == "Gen01" || document.all("DDLReport").value == "Gen03") {
                strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("ctl05_TBAcmWordNum").title + "&acmwordnum=" + document.all("ctl05_TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %> + "&acpPayNo=1" + "&acmkidnum=<%=strDefKidNum  %>";

                window.open("../UI.ActReports.Web/FrmRptGen01.aspx?rptflag=" + document.all("DDLReport").value + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');
            }
        }

        function checkVisaKind(parVal) {

            //			if (parseFloat(replaceString(parVal,",","")) >0 && parseFloat(replaceString(parVal,",","")) <=10000 )
            //			{

            //				document.all("CBAllowanceFlag").checked=true;
            //			}
            //			else
            //			{
            //				document.all("CBAllowanceFlag").checked=false;
            //			}
        }
        function ShowAddVisaData(parSObj, parTObj) {
            if (document.all("CBAddVisa").checked == true) {
                document.all("TDAddVisaData1").style.display = "block";
                document.all("TDAddVisaData2").style.display = "block";
            }
            else {
                document.all("TDAddVisaData1").style.display = "none";
                document.all("TDAddVisaData2").style.display = "none";
            }
        }


        function fnCallReportMenu(parParams) {

            var strParams;
            strParams = parParams;
            //strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;
            window.open("../UI.CDCTrlRpt.Web/FrmPrintMenu.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

        }


        function showfiled(parSObj, parTObj) {
            //    if (document.all("CBAutoTempPay").checked == true) {
            //        document.all("TRTmpPayData").style.display = "block";
            //        document.all("TRTmpPayData1").style.display = "block";
            //    }
            //    else {
            //        document.all("TRTmpPayData").style.display = "none";
            //        document.all("TRTmpPayData1").style.display = "none";
            //    }
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

    <style>
        /* 可摺疊標題 */
        .sFoldTitle {
            background-color: #6699FF;
            CURSOR: hand;
        }

        .sFoldTitleFont {
            font-size: 10pt;
            color: #FFFFFF;
            padding-top: 4px;
            padding-left: 4px;
        }
        /* DataGrid寬高 */
        .DIV0_width {
            width: 590px;
            height: auto;
            overflow: hidden;
            border-style: groove;
            border-width: 1px;
        }

        .DIV1_width {
            width: 590px;
            height: 166px;
            overflow: auto;
            border-style: groove;
            border-width: 1px;
        }

        .DIV1_noWidth {
            width: auto;
            height: auto;
            overflow-x: scroll;
            border-style: groove;
            border-width: 1px;
        }

        .DIV2_width {
            width: 590px;
            height: 95px;
            overflow: auto;
            border-style: groove;
            border-width: 1px;
        }

        .DIV2_noWidth {
            width: auto;
            height: auto;
            overflow-x: scroll;
            border-style: groove;
            border-width: 1px;
        }

        .DIV3_width {
            width: 590px;
            height: 87px;
            overflow: auto;
            border-style: groove;
            border-width: 1px;
        }

        .DIV3_noWidth {
            width: auto;
            height: auto;
            overflow-x: scroll;
            border-style: groove;
            border-width: 1px;
        }

        .DIV1_FreezingCol {
            LEFT: expression(document.getElementById("div_grid_acpDtlExtra").scrollLeft+1);
            /*freezingDiv is the name of the div to make your datagrid scrollable */
            POSITION: relative;
            z-index: 9;
            border-top: 0px solid #FFFFFF;
            border-bottom: 0px solid;
            border-left: 0px solid #003366;
            border-right: 0px solid #FFFFFF;
        }

        .DIV1_FreezingCol2 {
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

    <script type="text/javascript">
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
            } catch (e) {; }
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
        try { SetCookie(GetPageName() + ":FoldTitle_11", FoldTitle_11.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_20", FoldTitle_20.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_14", FoldTitle_14.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_16", FoldTitle_16.style.display); } catch (e) {; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_50", FoldTitle_50.style.display); } catch (e) {; } //折疊項目


        try { SetCookie(GetPageName() + ":div_UCProdApply", div_UCProdApply.className); } catch (e) {; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCActPayVisa", div_UCActPayVisa.className); } catch (e) {; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCPayName", div_UCPayName.className); } catch (e) {; } //縮放表格
    }

    function get_cookies() {
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_20"), "FoldTitle_20", "img_FoldTitle_20"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_14"), "FoldTitle_14", "img_FoldTitle_14"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_16"), "FoldTitle_16", "img_FoldTitle_16"); } catch (e) {; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_50"), "FoldTitle_50", "img_FoldTitle_50"); } catch (e) {; } //折疊項目

        try { SetDiv(GetCookie(GetPageName() + ":div_UCProdApply"), "div_UCProdApply", "img20"); } catch (e) {; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCActPayVisa"), "div_UCActPayVisa", "img14"); } catch (e) {; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCPayName"), "div_UCPayName", "img16"); } catch (e) {; } //縮放表格
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
<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies();ShowAddVisaData();' onunload='set_cookies()'>
    <form id="form1" runat="server">
        <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
        <table id="TablePass" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                                <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                    <tr>
                                        <td style="color: #FF0000; width: 75px; text-align: right;">
                                            <asp:Label ID="LBPassDate" runat="server" Text="核支日期" Width="75px"></asp:Label>
                                        </td>
                                        <td style="width: 70px; text-align: left;">
                                            <asp:TextBox ID="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" Style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox></td>
                                        <td style="color: #FF0000; width: 350px;" align="right" colspan="3">
                                            <asp:Label ID="labT" runat="server" Text="國內差旅單元操作上如有問題請洽系統廠商：<br/>台灣敏腦(股)公司 陳先生<br/>＜bin@tmbm.com.tw＞ 02-22503488" Width="330px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td style="height: 10px"></td>
            </tr>
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
                                            <div id="divdatamsg" runat="server" style="position: absolute; width: auto; height: auto; z-index: 3">
                                                <table border="0" cellpadding="0" cellspacing="0" style="background-color: Aqua">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="LBDataMsg" runat="server" Text="" ForeColor="Red" Font-Size="X-Small"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </div>


                                            <!-- ↓審核 -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 5px">
                                                        <input runat="server" id="TBOtherUnitFlag" type="hidden" />
                                                        <table cellpadding="0" style="border-collapse: collapse; width: 590px" border="0">
                                                            <tr>
                                                                <td align="right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td align="right" style="padding-left: 5px; display: block" nowrap>
                                                                                <asp:CheckBox ID="CBAcmUnitPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Visible="True" Text="單位審核" /></td>
                                                                            <td align="right" style="padding-left: 5px; display: none" nowrap>
                                                                                <asp:CheckBox ID="CBSecrearyFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="秘書室審核" /></td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="會計室審核" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>

                                            <!-- 審核↑ -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 602px" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 0px">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed; width: 600px">
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAllowanceFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBSeparateFlag"
                                                                                    runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款"
                                                                                    Visible="False" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBEPayment" runat="server"
                                                                                    Font-Size="X-Small" TextAlign="Right" Text="電子支付" Visible="False" /></td>
                                                                            <td style="padding-right: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBDocFlag" runat="server"
                                                                                    Font-Size="X-Small" TextAlign="Right" Text="簽文" Visible="False" />
                                                                            </td>
                                                                            <td></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="text-align: right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td style="padding-right: 5px" nowrap>&nbsp;</td>
                                                                            <td style="padding-right: 5px" nowrap>&nbsp;</td>
                                                                            <td style="padding-right: 5px; display: none" nowrap>
                                                                                <asp:CheckBox ID="CBAutoTempPay"
                                                                                    runat="server" Font-Size="X-Small" TextAlign="Right" Text="逕行暫付"
                                                                                    Visible="False" onclick="showfiled(this);chkTmpPayAndCash();" />
                                                                                <asp:CheckBox ID="CBAddVisa" runat="server" Font-Size="X-Small"
                                                                                    TextAlign="Right" Text="加簽"
                                                                                    onclick="ShowAddVisaData(this);" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>

                                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                            <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                                            <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>

                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 0px">
                                                        <table cellpadding="2" cellspacing="0" style="table-layout: fixed" border="0">
                                                            <tr>
                                                                <td>&nbsp;<input runat="server" id="TBPayDtlData" type="hidden" /></td>
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
                                                    <td>
                                                        <asp:Button ID="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <input type="button" id="BtnPrint1" runat="server"
                                                            style="width: 50px; height: 22px" value="列印" visible="True" /></td>
                                                    <td>
                                                        <asp:TextBox ID="TBSearchSql" runat="server" Style="text-align: center; width: 90px" onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" onblur="if(this.value==''){this.value='尋找動支編號';}" onfocus="this.select()" onclick="this.value=''" AutoPostBack="True">尋找動支編號</asp:TextBox><input type="button" style="height: 22px; width: 16px; font-family: Webdings; font-size: 8pt" value="s"></td>
                                                    <td>
                                                        <input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" />
                                                        <input id="TBAbsenceNo" runat="server" type="hidden" name="TBAbsenceNo" />
                                                    </td>
                                                    <td>
                                                        <input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" />
                                                        <asp:Button ID="btnChooseTrlData" runat="server" Text="選取出差資料"
                                                            BackColor="#00CC00" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="_freezingDiv" class="DIV0_width">
                                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
                                                    <HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
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
                                                                <asp:Label ID="Label1" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
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
                                                        <asp:BoundColumn Visible="False" DataField="P1Counter" HeaderText="P1Counter-10">
                                                            <HeaderStyle Width="60px"></HeaderStyle>
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
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
                                                                    <asp:DropDownList ID="DDLSortMonth" runat="server" AutoPostBack="True">
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
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortDep" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortAccPassFlag" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                        <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                        <asp:ListItem Value="">不區分</asp:ListItem>
                                                                    </asp:DropDownList></td>
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
                <td width="5"></td>
                <td valign="top" width="200">
                    <iframe id="iFrame" name="iFrame" border="0" frameborder="0" scrolling="no" width="200" height="520"></iframe>
                </td>
            </tr>
        </table>

        <script type="text/javascript">	  if (document.all("BtnSave").disabled) setShowBudget();  </script>
    </form>
</body>
</html>
