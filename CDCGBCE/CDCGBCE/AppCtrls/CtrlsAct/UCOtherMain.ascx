<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCOtherMain.ascx.vb" Inherits="AppCtrls.UCOtherMain" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<link href="../Content/base.css" rel="stylesheet" />
<link href="../Content/layout.css" rel="stylesheet" />
<link href="../Content/MultiViewTabs.css" rel="stylesheet" />
<link href="../Content/kendo/2014.1.416/kendo.common.core.min.css" rel="stylesheet" />
<link href="../Content/kendo/2014.1.416/kendo.silver-themebuilder.min.css" rel="stylesheet" />
<link href="../Scripts/jquery.pagination/pagination-fix.css" rel="stylesheet" />

<script src="../Scripts/jquery-1.11.1-fix.js"></script>
<script src="../Scripts/base.js"></script>
<script src="../Scripts/json2.js"></script>
<script src="../Scripts/jquery.blockUI.js"></script>
<script src="../Scripts/jquery.validate.js"></script>
<script src="../Scripts/jquery.validate.messages_zh_TW.js"></script>
<script src="../Scripts/jquery.validate.inline.js"></script>
<script src="../Scripts/kendo/2014.1.416/kendo.ui.core-chinese.min.js"></script>
<script src="../Scripts/kendo/2014.1.416/cultures/kendo.culture.zh-TW-chinese.min.js"></script>
<script src="../Scripts/jquery.MyKendo/jquery.MyKendoAll.js"></script>
<script src="../Scripts/MyLibraryJs/MyLibraryJs.js"></script>
<script src="../Scripts/jquery.pagination/jquery.pagination.js"></script>
<script src="../Scripts/URI/URI.js"></script>


<div id="win1" style="display: none;">
    <asp:TextBox ID="txtTmpNo" runat="server" onfocus="blur()" Style="display: none;"> </asp:TextBox>
    <asp:TextBox ID="txtTmpName" runat="server" onfocus="blur()" Style="display: none;"></asp:TextBox>
</div>
<!--受款人被開啟的頁面--->
<table _ondblclick="alert('14:UCActMain.ascx')" cellpadding="0" style="table-layout: fixed; border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
    <tr>
        <td style="padding: 0px">
            <table cellspacing="0" style="table-layout: fixed; border-collapse: collapse; width: 100%; padding: 2px;" border="0">
                <tr style="height: 0px">
                    <td style="width: 80px; text-align: right"></td>
                    <td style="width: 100px; text-align: left"></td>
                    <td style="width: 80px; text-align: right"></td>
                    <td style="width: 100px; text-align: left"></td>
                    <td style="width: 80px; text-align: right"></td>
                    <td style="width: 100px; text-align: left"></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 80px; text-align: right">動支編號</td>
                    <td style="width: 100px; text-align: left">
                        <asp:TextBox ID="TBAcmWordNum" runat="server" Style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();">09601234</asp:TextBox></td>
                    <td style="width: 80px; text-align: right">報支金額</td>
                    <td style="width: 100px; text-align: left">
                        <asp:TextBox ID="TBAcmMoney" runat="server" MyName="TBAcmMoney" Style="text-align: right" BackColor="Transparent" Width="90px" onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
                    <td style="width: 80px; text-align: right; display: none;" id="TDAddVisaData1">原簽單號</td>
                    <td style="width: 100px; text-align: left; display: none;" id="TDAddVisaData2">
                        <asp:TextBox ID="TBAcmTopWordNum" runat="server" Width="90px" Enabled="False"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right">請示日期</td>
                    <td>
                        <asp:TextBox ID="TBAcmMarkDate" runat="server" MyName="TBAcmMarkDate" Style="text-align: center; background-color: #FFFFE0" Width="90px" ondblclick="JavaScript: UCMDate.Show();" Enabled="False"></asp:TextBox></td>
                    <td style="text-align: right">承辦單位</td>
                    <td>
                        <asp:DropDownList ID="DDLWorkDep" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False" AutoPostBack="True"></asp:DropDownList></td>
                    <td style="text-align: right">承辦人員</td>
                    <td>
                        <asp:TextBox ID="TBEmpName" runat="server" Style="background-color: #FFFFE0" Width="90px" Enabled="False"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">群組編號</td>
                    <td>
                        <asp:TextBox ID="TBAcpGroupNo" runat="server" MaxLength="10" Width="90px" Enabled="False"></asp:TextBox></td>
                    <td style="text-align: right" style="<%= strShowETCFlag %>">電支付號</td>
                    <td style="<%= strShowETCFlag %>" colspan="2">
                        <asp:TextBox ID="TBAcpEtcPayWordNum" runat="server" MaxLength="20" Width="180px" Enabled="False"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="TBAcmCateGrpFlag" runat="server" Width="90px" Visible="false"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="<%= strShowPayNameFlag %>">
                    <td style="text-align: right">受款人</td>
                    <td colspan="5">
                        <asp:TextBox ID="TBPayName" Style="background-color: #ffffe0" runat="server" onfocus="blur()" Width="440px" MaxLength="100" Enabled="False"></asp:TextBox><input id="BtnPayee" runat="server" style="height: 22px; width: 18px" type="button" value="..." disabled="disabled" />
                        <asp:TextBox ID="TBPayeeNo" runat="server" onfocus="blur()" Style="display: none;"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">核銷事由</td>
                    <td colspan="5">
                        <asp:TextBox ID="TBAcmSubMemo" Style="background-color: #ffffe0" runat="server"
                            Width="440px" Enabled="False" MyName="TBAcmSubMemo" Rows="2"
                            TextMode="MultiLine"></asp:TextBox><input id="BtnSubPhrase" runat="server" style="height: 22px; width: 18px" type="button" value="..." disabled="disabled" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right;">控帳事由</td>
                    <td colspan="5">
                        <asp:TextBox ID="TBAcmMemo" runat="server" MyName="TBAcmMemo" Width="440px"
                            MaxLength="250" Enabled="False" Rows="2" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="height: 22px; width: 18px" value="..." disabled="disabled" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="display: none">
                    <td style="text-align: right">匯出批號</td>
                    <td>
                        <asp:TextBox ID="TBGroupNo" runat="server" Width="90px" MaxLength="10" Enabled="False"></asp:TextBox></td>
                    <td style="text-align: right">附單據</td>
                    <td>
                        <asp:TextBox ID="TBPayCnt" runat="server" Style="text-align: right" Width="90px" onkeypress="return check_Num()" Enabled="False"></asp:TextBox></td>
                    <td style="text-align: right"></td>
                    <td>
                        <asp:TextBox ID="TBAcmNoPrv" runat="server" Width="90px"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr id="TRTmpPayData">
                    <td style="text-align: right" style="display: none">支付日期</td>
                    <td style="display: none">
                        <asp:TextBox ID="TBAcpPrePayDate" MyName="TBAcpPrePayDate" runat="server" Width="90px" ondblclick="JavaScript: UCPrePayDate.Show();" Enabled="False"></asp:TextBox></td>
                    <td style="text-align: right" style="display: none">支付時間</td>
                    <td style="display: none">
                        <asp:TextBox ID="TBAcpPayHour" MyName="TBAcpPayHour" runat="server" Width="50px" onkeypress="return check_Num()" Enabled="False"></asp:TextBox>(小時)</td>
                    <%--<td style="text-align: right" style="<%= strShowETCFlag %>" >轉正日期</td>
                    <td style="<%= strShowETCFlag %>" >--%>
                    <td style="display: none">
                        <asp:TextBox ID="TBAcpReturnDate" MyName="TBAcpReturnDate" runat="server" Width="90px" ondblclick="JavaScript: UCReturnDate.Show();" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript">
<!--

    function fnCallPayeeDialog() {

        var w_width = 1000;                               // 設定開啟視窗的寬度
        var w_height = 700;                               // 設定開啟視窗的高度
        var x = (screen.width - w_width) / 2;             // 計算螢幕與開啟視窗的寬度
        var y = (screen.height - w_height) / 2 - 50;      // 計算螢幕與開啟視窗的高度
        var config = 'scrollbars=yes,width=' + w_width + ',height=' + w_height + ',top=' + y + ',left=' + x;  // 將新獲取的設定用字串方式先串起來

        // 將設定值放入函數中
        window.open('../UI.TsbPayee.Web/Payee.aspx', 'PayeeWindow', config);
    }


    function fnCallPhraseDialog(thisName) {
        var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        if (strReturnVal != "Cancel") {
            document.all(thisName).value = document.all(thisName).value + strReturnVal;
        }
    }


    function UCMDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        var tmpYear;
        tmpYear = "0" + (vDay.getYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcmMarkDate") {

                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;

            }
        }
    }

    function UCPassDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        var tmpYear;
        tmpYear = "0" + (vDay.getYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcmPassDate") {
                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;
            }
        }
    }

    function setEmpName(parObj) {
        document.all("TBEmpName").value = parObj.options[parObj.selectedIndex].innerText;
    }
    function UCReturnDate_Change(calendar) {

        var vDay = new Date(calendar.GetSelectedDate());
        var tmpYear;
        tmpYear = "0" + (vDay.getYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcpReturnDate") {
                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;
            }
        }
    }

    function UCPrePayDate_Change(calendar) {
        var vDay = new Date(calendar.GetSelectedDate());
        //document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
        var tmpYear;
        tmpYear = "0" + (vDay.getYear() - 1911);
        tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

        var tmpMonth = "0" + (vDay.getMonth() + 1);
        tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

        var tmpDay = "0" + vDay.getDate();
        tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcpPrePayDate") {
                e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                break;
            }
        }
    }


    //-->
</script>


<ComponentArt:Calendar ID="UCMDate" runat="server" ClientSideOnSelectionChanged="UCMDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCPassDate" runat="server" ClientSideOnSelectionChanged="UCPassDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCReturnDate" runat="server" ClientSideOnSelectionChanged="UCReturnDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
<ComponentArt:Calendar ID="UCPrePayDate" runat="server" ClientSideOnSelectionChanged="UCPrePayDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:Calendar>
