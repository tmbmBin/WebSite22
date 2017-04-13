<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPay.ascx.vb" Inherits="AppCtrls.UCActPay" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script language="javascript">
<!--
	function fnCallPhraseFun(thisName) {

		var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel") {
			//document.all(thisName).value = document.all(thisName).value + strReturnVal;
			for (var i = 0; i < document.forms[0].elements.length; i++) {
				var e = document.forms[0].elements[i];
				if (e.getAttribute("MyName") == thisName) {

					e.value += strReturnVal;
					break;
				}
			}
		}
	}

	function UCPayDate_Change(calendar)
		{
			var vDay = new Date(calendar.GetSelectedDate());
			//document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			 var tmpYear;
			 tmpYear= "0"+ (vDay.getYear()-1911);
			 tmpYear = tmpYear.substring(tmpYear.length-3, tmpYear.Length);

			 var tmpMonth= "0"+ (vDay.getMonth()+1);
			 tmpMonth=tmpMonth.substring(tmpMonth.length-2, tmpMonth.Length);

			  var tmpDay= "0"+  vDay.getDate();
			 tmpDay=tmpDay.substring(tmpDay.length-2, tmpDay.Length);

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];
				if ( e.getAttribute("MyName") == "TBAcpMarkDate")
				{
					e.value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
					break;
				}
			}
			 //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
		}


		 function UCPassDate_Change(calendar)
		{
			var vDay = new Date(calendar.GetSelectedDate());
			//document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			 var tmpYear;
			 tmpYear= "0"+ (vDay.getYear()-1911);
			 tmpYear = tmpYear.substring(tmpYear.length-3, tmpYear.Length);

			 var tmpMonth= "0"+ (vDay.getMonth()+1);
			 tmpMonth=tmpMonth.substring(tmpMonth.length-2, tmpMonth.Length);

			  var tmpDay= "0"+  vDay.getDate();
			 tmpDay=tmpDay.substring(tmpDay.length-2, tmpDay.Length);

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];
				if ( e.getAttribute("MyName") == "TBAcpPassDate")
				{

					e.value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
					break;

				}
			}
			 //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;

}

function UCReturnDate_Change(calendar) {
    //		    var vDay = new Date(calendar.GetSelectedDate());
    //		    document.getElementById("TBAcpReturnDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();

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
        if (e.getAttribute("MyName") == "TBAcpReturnDate") {
            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
            break;
        }
    }
    //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;


}

function UCPrePayDate_Change(calendar) {
    //		    var vDay = new Date(calendar.GetSelectedDate());
    //		    document.getElementById("TBAcpPrePayDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();

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
    //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;



}
		
//-->
</script>

<table _ondblclick="alert('13:UCActPay.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width:100%" border="1" bordercolor="#FFFFFF">
	<tr>
		<td style="padding: 0px">
		<table cellpadding="2" cellspacing="0"  style="TABLE-LAYOUT: fixed" border="0">
			<tr style="display:none">
				<td width="80" align="right">&nbsp;</td>
				<td width="100">&nbsp;</td>
				<td width="80" align="right">&nbsp;</td>
				<td width="130"><asp:TextBox ID="TBPayYear" runat="server" Width="39px"></asp:TextBox></td>
				<td width="80" align="right">&nbsp;</td>
				<td width="120">&nbsp;</td>
			</tr>
			<tr>
				<td align="right"><asp:Label id="LBDate" runat="server" Text="報支日期"></asp:Label></td>
				<td ><asp:TextBox id="TBAcpMarkDate" runat="server" MyName="TBAcpMarkDate" style="background-color: #FFFFE0; text-align: center" Width="90px" ondblclick="JavaScript: UCPDate.Show();" Enabled="False"></asp:TextBox></td>
				<td  align="right">報支金額</td>
				<td ><asp:TextBox id="TBPayMoney" runat="server" MyName="TBPayMoney" style="text-align:right" BackColor="Transparent" Width="90px" onfocus="this.blur();" onkeypress="return check_Num()"></asp:TextBox></td>
				<td  align="right"><asp:Label id="LBPayNo" runat="server" Text="報支次數"></asp:Label></td>
				<td ><asp:DropDownList id="DDLPayNo" runat="server" Width="90px" AutoPostBack="True" MyName="DDLPayNo"></asp:DropDownList></td>
			</tr>
			<tr>
				<td  align="right">群組編號</td>
				<td >
                    <asp:TextBox ID="TBAcpGroupNo" runat="server" MaxLength="10" Width="90px" 
                        Enabled="False"></asp:TextBox>
                </td>
				<td  align="right">電支付號</td>
				<td >
                    <asp:TextBox ID="TBAcpEtcPayWordNum" runat="server" MaxLength="20" 
                        Width="130px" Enabled="False"></asp:TextBox>
                </td>
				<td  align="right">&nbsp;</td>
				<td >&nbsp;</td>
			</tr>

			<tr>
				<td  align="right">廠商名稱</td>
				<td width="500" colspan="5"><asp:TextBox id="TBPayName" runat="server" Width="490px" Enabled="False"  MyName="TBPayName" ondblclick="fnCallPhraseFun('TBPayName');" ></asp:TextBox></td>
			</tr>
			<tr>
				<td  align="right">核銷事由</td>
				<td width="500" colspan="5" nowrap><asp:TextBox id="TBAcpSubMemo" 
                        MyName="TBAcpSubMemo" runat="server" style="background-color: #ffffe0" 
                        Width="472px" Rows="2" Enabled="False" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnSubPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..." onclick="fnCallPhraseFun('TBAcpSubMemo');" disabled="disabled" /></td>
			</tr>
			<tr>
				<td  align="right">控帳事由</td>
				<td width="500" colspan="5" nowrap><asp:TextBox id="TBAcpMemo" MyName="TBAcpMemo" runat="server" Width="472px" Rows="2" Enabled="False" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..." onclick="fnCallPhraseFun('TBAcpMemo');" disabled="disabled" /></td>
			</tr>
			<tr id="TRTmpPayData"  >
			    <td width="100" align="right" style="display:none">支付日期</td>
			    <td width="100"  style="display:none"><asp:TextBox id="TBAcpPrePayDate" runat="server" Width="90px" MyName="TBAcpPrePayDate" ondblclick="JavaScript: UCPrePayDate.Show();"></asp:TextBox></td>
			    <td width="100" align="right"  style="display:none">支付時間</td>
			    <td width="100"  style="display:none"><asp:TextBox id="TBAcpPayHour" runat="server" Width="50px" 
                        onkeypress="return check_Num()"></asp:TextBox>(小時)</td>
			    <td width="100" align="right">轉正日期</td>
			    <td width="100"> <asp:TextBox id="TBAcpReturnDate" runat="server" Width="90px" MyName="TBAcpReturnDate" ondblclick="JavaScript: UCReturnDate.Show();" Enabled="false"></asp:TextBox> </td>
			</tr>

		</table>
		</td>
	</tr>
</table>
<COMPONENTART:CALENDAR id="UCPDate" runat="server" ClientSideOnSelectionChanged="UCPayDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCPassDate" runat="server" ClientSideOnSelectionChanged="UCPassDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<ComponentArt:CALENDAR id="UCReturnDate"    runat="server" ClientSideOnSelectionChanged="UCReturnDate_Change"   PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>
<ComponentArt:CALENDAR id="UCPrePayDate"    runat="server" ClientSideOnSelectionChanged="UCPrePayDate_Change"   PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>