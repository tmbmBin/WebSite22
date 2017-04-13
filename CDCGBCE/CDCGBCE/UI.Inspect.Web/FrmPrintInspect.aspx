<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPrintInspect.aspx.vb" Inherits="UI.Inspect.Web.FrmPrintInspect" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
        <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache" />
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
    <style type="text/css">
        .style1
        {
            width: 93px;
        }
    </style>
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
											<td colSpan="3"><asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
												<asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label></td>
										</tr>
										<tr>
											<TD style="DISPLAY: none" align="right" width="90"><FONT face="新細明體"><asp:label id="Label1" runat="server" Width="72px" Visible="False">帳別名稱</asp:label></FONT></TD>
											<TD style="DISPLAY: none" class="style1"><asp:dropdownlist id="DDLTeamName" runat="server" Visible="False" width="144px"></asp:dropdownlist></TD>
											<td align="right" width="90">年 度</td>
											<td style="WIDTH: 150px" align="left"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90">執行單位&nbsp;</td>
											<td class="style1"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90">動支編號</td>
											<td style="WIDTH: 150px" align="left">
                                                <asp:TextBox ID="TBAcmWordNum" runat="server" Width="120px"></asp:TextBox>
                                            </td>
										</tr>
										<tr>
											<td vAlign="top" align="right" width="90">計畫科目</td>
											<td vAlign="top" colSpan="2"><asp:dropdownlist id="DDLPlan" runat="server" Width="400px"></asp:dropdownlist></td>
											<td vAlign="top" align="left" width="150"></td>
										</tr>
										<tr>
											<td vAlign="top" align="right" width="90">用途別科目</td>
											<td vAlign="top" colSpan="2">
											    <asp:dropdownlist id="DDLOul" runat="server">
											        <asp:ListItem value="">......</asp:ListItem>
											        <asp:ListItem value="02">其他(02業務費、03設備費及投資)</asp:ListItem>
											        <asp:ListItem value="04">04 獎補助費</asp:ListItem>
											    </asp:dropdownlist>
											</td>
											<td vAlign="top" align="left" width="150"></td>
										</tr>
										<tr>
											<td align="right" width="90">&nbsp;</td>
											<td align="right" class="style1"><FONT face="新細明體"></FONT><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:button></td>
											<td align="left" width="90"></td>
											<td width="150"><FONT face="新細明體"><asp:checkbox id="CBDownLoad" runat="server" Text="轉製成EXCEL" Checked="True"></asp:checkbox></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
			<COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    </form>
</body>
</html>
