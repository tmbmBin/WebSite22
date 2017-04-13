<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmFindData.aspx.vb" Inherits="UI.Voucher.Web.FrmFindData" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        <meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		 		
			function UCBDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}
		function UCEDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}

		
		
		</script>
</head>
<body>
    <form id="form1" runat="server">
   	    <table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668" cellPadding="5" width="730" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td align="right" width="90" colSpan="1" rowSpan="1">日期區間</td>
											<td colspan="3">
												<asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
												<asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>
											</td>
											<td align="right" style="DISPLAY:none">
												帳別名稱案號名稱
											</td>
											<td align="left" width="120" style="DISPLAY:none"><asp:dropdownlist id="DDLTeamName" runat="server" Width="144px"></asp:dropdownlist><asp:textbox id="TBCaseNo" runat="server" Width="120px"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90"></td>
											<td width="150"></td>
											<td align="right" width="80">年 度</td>
											<td align="left" width="150"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="80">經資門別</td>
											<td align="left" width="120"><asp:dropdownlist id="DDLAccKind" runat="server" Width="120px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90">執行單位</td>
											<td width="150"><font face="新細明體"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></font></td>
											<td align="right" width="80">承辦人員</td>
											<td align="left" width="150"><asp:textbox id="TBStaffName" runat="server" Width="144px"></asp:textbox></td>
											<td align="right" width="80">預算來源</td>
											<td align="left" width="120"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="120px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90">經費單位</td>
											<td width="150"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="right" width="80">承辦業務</td>
											<td align="left" width="150"><font face="新細明體"><asp:dropdownlist id="DDLBiz" runat="server" Width="144px"></asp:dropdownlist></font></td>
											<td align="right" width="80">動支編號</td>
											<td align="left" width="120"><asp:textbox id="TBacmWordNum" runat="server" Width="120px"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90">摘要</td>
											<td width="150"><asp:textbox id="TBMemo" runat="server" Width="144px"></asp:textbox></td>
											<td align="right" width="80">廠商名稱</td>
											<td align="left" width="150"><asp:textbox id="TBPayName" runat="server" Width="144px"></asp:textbox></td>
											<td align="right" width="80"><FONT face="新細明體">金額</FONT></td>
											<td align="left" width="120">
												<asp:TextBox id="TBPayMoney" runat="server" Width="120px"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="90"><FONT face="新細明體">計畫科目</FONT></td>
											<td class=" " colspan="3"><FONT face="新細明體"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></FONT></td>
											<td align="right" width="80">傳票號碼</td>
											<td align="left" width="120"><asp:textbox id="TBExchNo" runat="server" Width="120px"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90">用途別科目</td>
											<td colspan="3"><asp:dropdownlist id="DDLOul" runat="server" Width="400px"></asp:dropdownlist></td>
											<td align="right" width="80">匯出批號</td>
											<td align="left" width="120"><asp:textbox id="TBGroupNo" runat="server" Width="120px"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90"><asp:button id="BtnPrint" runat="server" Width="75px" Text="確認" Height="22px"></asp:button></td>
											<td></td>
											<td align="right"></td>
											<td align="left">
											</td>
											<td align="right"><FONT face="新細明體">傳票狀態</FONT>
											</td>
											<td align="left">
												<asp:DropDownList id="DDLExchNoState" runat="server">
													<asp:ListItem Value="0">全部</asp:ListItem>
													<asp:ListItem Value="1" Selected="True">未開傳票</asp:ListItem>
													<asp:ListItem Value="2">已開傳票</asp:ListItem>
												</asp:DropDownList></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<!--<div id="ROCCalendar" style="BEHAVIOR: url(../Behavior/Calendar.htc)" separator="/" rocdate counter></div>-->
			<COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR> 
            <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>

    </form>
</body>
</html>
