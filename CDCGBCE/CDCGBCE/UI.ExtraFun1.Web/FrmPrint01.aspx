<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrint01.aspx.cs" Inherits="UI.ExtraFun1.Web.FrmPrint01" %>
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
       	<table style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="650" bgcolor="#dadee9" border="1">
				<tr>
					<td>
						<table style=" border-collapse: collapse; border-color:#ffffff; table-layout:fixed; width:100%"  cellpadding="1"  border="1">
							<tr>
								<td>
									<table style="table-layout:fixed; border-collapse:collapse; padding:1px; width:100%; border:0px">
										<tr>
										    <td>
										        <table style="table-layout:fixed; border-collapse:collapse; padding:1px; width:100%; border:0px" cellspacing="0">
                                                    <tr style="height:0px">
                                                        <td style="text-align:right; width:100px"></td>
                                                        <td style="text-align:right; width:200px"></td>
                                                        <td style="text-align:right; width:100px"></td>
                                                        <td style="text-align:right; width:200px"></td>
                                                        <td style="text-align:right; "></td>
                                                    </tr>
										            <tr >
										                <td style="text-align:right; width:100px">日期區間：</td>
										                <td colspan="3">
										                    <asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
										                    <asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>
										                </td>
										                <td>
										                    &nbsp;</td>
										            </tr>
										            <tr>
										                <td style="text-align:right; width:100px">經費單位：</td>
										                <td style="width:200px">
                                                            <asp:DropDownList ID="DDLBgtDepName" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align:right; width:100px">動支編號：</td>
										                <td  style="width:200px">
                                                            <asp:TextBox ID="TBAcmWordNum" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
										                <td >
                                                            &nbsp;</td>
										            </tr>

										            <tr>
										                <td style="text-align:right; " >執行單位：</td>
										                <td style="text-align:left; " >
                                                            <asp:DropDownList ID="DDLWorkDepName" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td  style="text-align:right; " >承辦人名：</td>
                                                        <td >
                                                            <asp:TextBox ID="TBAcmWorkUserName" runat="server" Width="120px"></asp:TextBox>
                                                        </td>

                                                        <td >
                                                            </td>

										            </tr>
                                                     <tr>
                                                        <td style="text-align:right">審核狀態：</td>
                                                        <td><asp:DropDownList ID="DDLPassFlag" runat="server" Width="120px">
                                                            <asp:ListItem Value="">......</asp:ListItem>
                                                            <asp:ListItem Value="1">已審</asp:ListItem>
                                                            <asp:ListItem Value="0">未審</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                         <td style="text-align:right">傳票狀態：</td>
                                                         <td>
                                                             <asp:DropDownList ID="DDLAcvExchNoFlag" runat="server">
                                                                 <asp:ListItem Value="1">已開傳票</asp:ListItem>
                                                                 <asp:ListItem Value="0">未開傳票</asp:ListItem>
                                                                 <asp:ListItem Value="">不區分</asp:ListItem>
                                                             </asp:DropDownList>
                                                         </td>
                                                         <td>&nbsp;</td>
                                                    </tr>   
										            <tr>
										                <td style="text-align:right">計畫名稱：</td>
										                <td colspan=3>
                                                            <asp:DropDownList ID="DDLPlanName" runat="server" Width="480px"></asp:DropDownList>
                                                        </td>
										                <td>
                                                            &nbsp;</td>
										            </tr>
										            <tr>
                                                        <td style="text-align:right">用途別：</td>
                                                        <td colspan="3"><asp:DropDownList ID="DDLOul" runat="server" Width="480px"></asp:DropDownList>　　</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                               

										            <tr>
                                                        <td style="text-align:right">廠商名稱：</td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="TBPayName" runat="server" Width="471px"></asp:TextBox>
                                                         </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                               

										            <tr style="display:none">
										                <td style="text-align:right">列印報表：</td>
										                <td colspan=3>
										                    <asp:DropDownList ID="DDLRptName" runat="server">
										                        <asp:ListItem Value="7">補、捐(獎)助其他政府機關或團體私人經費報告表</asp:ListItem>
										                        <asp:ListItem Value="6">委託辦理計畫(事項)經費報告表</asp:ListItem>
										                   </asp:DropDownList>
                                                        </td>
										                <td>
										                    &nbsp;</td>
										            </tr>
										        </table>
										    </td>
										</tr>
									</table>
								</td>
							</tr>							
							<tr>
							    <td align="right">
							        <asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px" OnClick="BtnPrint_Click"></asp:button>
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
