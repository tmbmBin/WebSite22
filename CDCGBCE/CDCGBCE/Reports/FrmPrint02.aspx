<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmPrint02.aspx.vb" Inherits="Reports.FrmPrint02"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmPrint02</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
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
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellPadding="5" width="750" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="5" width="100%" border="0">
										<tr>
											<td align="right" width="90">日期區間</td>
											<td colSpan="2"><asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
												<asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label></td>
											<td></td>
										</tr>
										<tr>
											<TD align="right" width="90">年度</TD>
											<TD width="300"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></TD>
											<td width="90"></td>
											<td></td>
										</tr>
										<tr>
											<td align="right" width="90">經費單位</td>
											<td width="300"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td style="<%=strShowFlag(0) %>" align="right" width="90">經資門別</td>
											<td style="<%=strShowFlag(0) %>" align="left"><asp:dropdownlist id="DDLAccKind" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90">執行單位</td>
											<td width="300"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90">控帳業務</td>
											<td align="left"><font face="新細明體"><asp:dropdownlist id="DDLBiz" runat="server" Width="144px"></asp:dropdownlist></font></td>
										</tr>
										<tr style="<%=strShowFlag(0) %>">
											<td align="right" width="90">計畫科目</td>
											<td colspan="3" valign="top"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></td>
										</tr>
										<tr style="<%=strShowFlag(0) %>">
											<td align="right" width="90">用途別科目</td>
											<td colspan="2" valign="top"><asp:dropdownlist id="DDLOul" runat="server"></asp:dropdownlist></td>
											<td align="left" valign="top"></td>
										</tr>
										<tr style="<%=strShowFlag(0) %>">
											<td align="right" width="90">
												<P>摘要</P>
											</td>
											<td colspan="3" valign="top">
												<asp:TextBox id="TBMemo" runat="server" Width="465px"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="90"><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:button></td>
											<td align="right" width="150">
											</td>
											<td align="left" width="90"></td>
											<td style="<%=strShowFlag(0) %>"><asp:checkbox id="CBDownLoad" runat="server" Text="轉製成EXCEL" Checked="True" Visible="False"></asp:checkbox></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day"
													DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
												<COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day"
													DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif"
													CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
		</form>
	</body>
</HTML>
