<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPrint01.aspx.vb" Inherits="Reports.FrmPrint01" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    	<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
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
</head>
<body>
    <form id="form1" runat="server">
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
											<td><asp:checkbox id="CBMonthly" runat="server" Text="月結" Visible="False"></asp:checkbox></td>
										</tr>
										<tr>
											<TD align="right" width="90" style="DISPLAY:none"><FONT face="新細明體">
													<asp:Label id="Label1" runat="server" Width="72px" Visible="False">帳別名稱</asp:Label></FONT></TD>
											<TD width="150" style="DISPLAY:none">
												<asp:dropdownlist width="144px" Visible="False" id="DDLTeamName" runat="server"></asp:dropdownlist></TD>
											<td align="right" width="90" style="<%=ShowFlag(1)%>">年 度</td>
											<td style="WIDTH: 150px;<%=ShowFlag(1)%>" align="left"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90"style="<%=ShowFlag(2)%>" >預算來源</td>
											<td width="150" style="<%=ShowFlag(2)%>"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" style="<%=ShowFlag(3)%>">經資門別</td>
											<td style="WIDTH: 150px;<%=ShowFlag(3)%>" align="left"  ><asp:dropdownlist id="DDLAccKind" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90" style="<%=ShowFlag(4)%>">經費單位</td>
											<td width="150" style="<%=ShowFlag(4)%>"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="right" width="90" style="<%=ShowFlag(5)%>">執行單位</td>
											<td style="WIDTH: 150px;<%=ShowFlag(5)%>" align="left"  ><font face="新細明體"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></font></td>
										</tr>
										<tr>
											<td align="right" width="90" style="<%=ShowFlag(6)%>">控帳業務</td>
											<td width="150" style="<%=ShowFlag(6)%>"><asp:dropdownlist id="DDLBiz" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" style="<%=ShowFlag(7)%>">承辦人員</td>
											<td style="WIDTH: 150px;<%=ShowFlag(7)%>" align="left"  ><asp:textbox id="TBStaffName" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr style="<%=ShowFlag(11)%>">
											<td align="right" width="90"></td>
											<td class=" " width="150"><FONT face="新細明體">&nbsp;</FONT><asp:checkbox id="CBShowLevel" runat="server" Text="層級式列表"></asp:checkbox></td>
											<td align="right" width="90"></td>
											<td align="left" width="150"></td>
										</tr>
										<tr style="<%=ShowFlag(8)%>">
											<td align="right" width="90" valign="top">計畫科目</td>
											<td colspan="2" valign="top"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></td>
											<td align="left" width="150" valign="top"><asp:checkboxlist id="CBLPlanLevel" runat="server" Width="208px" Height="16px" RepeatColumns="2">
													<asp:ListItem Value="2">業務計畫</asp:ListItem>
													<asp:ListItem Value="3">工作計畫</asp:ListItem>
													<asp:ListItem Value="4">分支計畫</asp:ListItem>
													<asp:ListItem Value="5">分項計畫</asp:ListItem>
												</asp:checkboxlist></td>
										</tr>
										<tr style="<%=ShowFlag(9)%>">
											<td align="right" width="90" valign="top">用途別科目</td>
											<td colspan="2" valign="top"><asp:dropdownlist id="DDLOul" runat="server"></asp:dropdownlist></td>
											<td align="left" width="150" valign="top"><asp:checkboxlist id="CBLOulLevel" runat="server" Width="217px" Height="16px" RepeatColumns="2">
													<asp:ListItem Value="1">一級用途別</asp:ListItem>
													<asp:ListItem Value="2">二級用途別</asp:ListItem>
													<asp:ListItem Value="3">三級用途別</asp:ListItem>
													<asp:ListItem Value="4">四級用途別</asp:ListItem>
												</asp:checkboxlist></td>
										</tr>
										<tr>
											<td align="right" width="90"><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:button></td>
											<td align="right" width="150" style="<%=ShowFlag(10)%>">最大列印帳務數</td>
											<td align="left" width="90" style="<%=ShowFlag(10)%>"><asp:textbox id="TBMaxRec" runat="server" Width="56px">90</asp:textbox></td>
											<td width="150"><asp:checkbox id="CBDownLoad" runat="server" Text="轉製成EXCEL" Checked="True"></asp:checkbox></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>

    </form>
</body>
</html>
