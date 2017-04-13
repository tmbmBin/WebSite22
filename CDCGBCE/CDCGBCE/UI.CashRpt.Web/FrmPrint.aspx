<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPrint.aspx.vb" Inherits="UI.CashRpt.Web.FrmPrint" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
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
    &nbsp;<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse; width: 600px;" borderColor="#666668" cellPadding="5" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
							<tr>
								<td>
									<table cellSpacing="1" cellPadding="1" width="100%" border="0">
										<tr style="<%=ShowFlag(1)%>">
											<td align="right" width="90">日期區間</td>
											<td colSpan="3"><asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
												<asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label></td>
												<td></td>
										</tr>
										<tr style="<%=ShowFlag(2)%>">
											<TD align="right" width="90">年度</TD>
											<TD width="160"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="130px"></asp:dropdownlist></TD>
											<td align="right">帳別</td>
											<td>
                                                <asp:DropDownList ID="ddl_Sort" runat="server" Width="130px">
                                                </asp:DropDownList>
                                            </td>
											<td></td>
										</tr>
										<tr style="<%=ShowFlag(3)%>">
											<td align="right" width="90">經費單位</td>
											<td width="160"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="130px" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="right">執行單位</td>
											<td align="left"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="130px"></asp:dropdownlist></td>
											<td></td>
										</tr>
										<tr style="<%=ShowFlag(4)%>">
											<td align="right" width="90">計畫科目</td>
											<td colspan="3" valign="top"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="403px"></asp:dropdownlist></td>
											<td></td>
										</tr>
										<tr style="<%=ShowFlag(5)%>">
											<td align="right" width="90">用途別科目</td>
											<td colspan="3" valign="top"><asp:dropdownlist id="DDLOul" runat="server" 
                                                    Width="403px"></asp:dropdownlist></td>
											<td></td>
										</tr>
										<tr style="<%=ShowFlag(8)%>">
										    <td align="right" width="90">廠商</td>
										    <td><asp:TextBox ID="txt_PayName" runat="server"></asp:TextBox></td>
										    <td align="right">經手人</td>
										    <td><asp:TextBox ID="txt_acmWorkUserNo" runat="server" Width="130px"></asp:TextBox>
                                            </td>
										    <td></td>
										</tr>
										<tr style="<%=ShowFlag(9)%>">
										    <td align="right" width="90">摘要</td>
										    <td colspan="3"><asp:TextBox ID="txt_acpSubMemo" runat="server" Width="400px"></asp:TextBox></td>
										    <td></td>
										</tr>
										<tr style="<%=ShowFlag(6)%>">
											<td align="right" width="90">清單批號</td>
											<td width="160"><asp:dropdownlist id="DDLBatNo" runat="server">
                                                </asp:dropdownlist></td>
											<td align="right" style="display:none" >撥入狀況</td>
											<td align="left" style="display:none">
											    <asp:dropdownlist id="DDLCashInStatus" runat="server" AutoPostBack="True" 
                                                    Width="130px">
											                    <asp:ListItem Value="0">未撥入</asp:ListItem>
															    <asp:ListItem Value="1">已撥入</asp:ListItem>
											    </asp:dropdownlist>
											</td>
											<td></td>
										</tr>
										<tr style="<%=ShowFlag(7)%>">
											<td align="right" width="90" >報表種類</td>
											<td>
											    <asp:dropdownlist id="DDLRptName" runat="server" AutoPostBack="True">
											    </asp:dropdownlist>
											</td>
											<td align="right">登記狀況</td>
											<td  >
                                                <asp:DropDownList ID="ddl_Status" runat="server" Width="130px">
                                                </asp:DropDownList>
                                            </td>
											<td></td>
										</tr>										
									</table>
								</td>
							</tr>
							<tr>
							    <td>
							        <table cellSpacing="1" cellPadding="1" width="100%" border="0">
							           <tr>
											<td align="right" width="90"><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px" Visible =false ></asp:button></td>
											<td align="right">
                                                <asp:button id="BtnPrintList" runat="server" Width="120px" 
                                                    Text="零用金清單" style="height: 21px"></asp:button>
                                            </td>
											<td align="left">
                                                <asp:Button ID="BtnPrintTotal" runat="server" Text="零用金清單總表" Width="120px" 
                                                    Visible="False" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPrintPayList" runat="server" Text="經費支出憑證清單" Width="120px" />
                                            </td>
											<td><asp:checkbox id="CBDownLoad" runat="server" Text="轉製成EXCEL" Checked="True" Visible="True"></asp:checkbox></td>
										</tr>
							        </table>
							    </td>
							    </tr>
						</table>
					</td>
				</tr>
			</table>
			<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse; width: 900px;" cellPadding="5">
				<tr>
					<td style="width:102px"><asp:Button ID="btn_Show" runat="server" Text="畫面顯示" /></td>
					<td>
                        <asp:Label ID="lab_Msg" runat="server" Text=""></asp:Label>
                    </td>					
				</tr>
				<tr>
				    <td colspan="2"><asp:DataGrid runat="server" ID="DataGrid1">
                            <HeaderStyle Height="30px" Font-Size="Small" Font-Bold="True" Wrap="False" VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#ffcccc"></HeaderStyle>
                        </asp:DataGrid></td>
				</tr>
			</table>   
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
    </form>
</body>
</html>
