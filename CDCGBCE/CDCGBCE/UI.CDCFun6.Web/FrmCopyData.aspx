<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCopyData.aspx.vb" Inherits="UI.CDCFun6.Web.FrmCopyData" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  	<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<script language="javascript">
		    function UCBDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBBDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }
		    function UCEDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBEDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }

		</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       	<table style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="600" bgcolor="#dadee9" border="1">
				<tr>
					<td>
						<table style=" border-collapse: collapse; border-color:#ffffff; table-layout:fixed; width:100%"  cellpadding="1"  border="1">
							<tr>
								<td>
									<table cellspacing="0" cellpadding="1" width="100%" border="0">
										<tr>
										    <td>
										        <table cellspacing="0" cellpadding="1" width="100%" border="0">
										             <tr>
                                                        <td align="right" width="90">年度：</td>
                                                        <td>
                                                            <asp:Label ID="lbAcmYear" runat="server" Text=""></asp:Label>
                                                         </td>
                                                    </tr>                                                  

										            <tr style="display:none">
										                <td align="right" width="90">列印報表：</td>
										                <td>
										                    <asp:DropDownList ID="DDLRptName" runat="server">
										                        <asp:ListItem Value="Report07.xls">補、捐(獎)助其他政府機關或團體私人經費報告表</asp:ListItem>
										                        <asp:ListItem Value="Report06.xls">委託辦理計畫(事項)經費報告表</asp:ListItem>
										                   </asp:DropDownList>
                                                        </td>
										            </tr>
										        </table>
										    </td>
										</tr>
									</table>
								</td>
							</tr>							
							<tr>
							    <td align="right">
							        <asp:button id="BtnPrint" runat="server" Text="轉至業務單位作業區" style="margin-left: 0px"></asp:button>
							    </td> 										
                            </tr>
						</table>
					</td>
				</tr>
			</table>
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
    <asp:DataGrid ID="DataGrid1" runat="server"></asp:DataGrid>
    <asp:DataGrid ID="DataGrid2" runat="server">
    </asp:DataGrid>

    </div>
    </form>
</body>
</html>
