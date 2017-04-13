<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmLockData.aspx.vb" Inherits="UI.CDCFun1.Web.FrmLockData" %>
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
				document.getElementById("TBLockDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
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
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5" width="500" bgColor="#e0e0eb">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="2" width="100%" border="0">
										<tr>
											<td align="right" width="90">鎖帳日期</td>
											<td colspan=2 >
                                                <asp:TextBox ID="TBLockDate" runat="server" Width="100px" ondblclick="JavaScript: UCBDate.Show();" ></asp:TextBox>(日期範例:095/09/28)
                                            </td>
										</tr>
										<tr>
											<td  align="right" width="90">&nbsp;</td>
											<td  >
                                                <asp:Button ID="BtnSave" runat="server" Text="存檔" />
                                            </td>
                                            <td> 
                                                <asp:Button ID="BtnClear" runat="server" Text="清除鎖帳日期" />
                                            </td>
										</tr>
										
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<componentart:calendar id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"  OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday"  PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBLockDate" PopUp="Custom"  ClientSideOnSelectionChanged="UCBDate_Change"></componentart:calendar>

	    </form>
</body>
</html>
