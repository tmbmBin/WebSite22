﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmReport41.aspx.vb" Inherits="UI.CDCFun3.Web.FrmReport41" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
    <script language="javascript" type="text/javascript">
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
         	<table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; background-color:#dadee9; border:1; width:600px " bordercolor="#666668" cellpadding="5" border="1">
				<tr>
					<td>
						<table style=" border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
									<table cellspacing="0" cellpadding="1" width="100%" border="0">
										<tr>
										    <td>
										        <table cellspacing="0" cellpadding="1" width="100%" border="0">
										            <tr style="display:none">
										                <td width="90px" >&nbsp;</td>
										                <td width="120px" >&nbsp;</td>
                                                        <td width="90px" >&nbsp;</td>
                                                        <td >&nbsp;</td>
										            </tr>
										            <tr>
										                <td align="right" >截止日期：</td>
										                <td colspan=3>
										                    至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
										                    <asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>
										                </td>
										            </tr>
										            <tr>
										                <td align="right" >經費單位：</td>
										                <td>
                                                            <asp:DropDownList ID="DDLBgtDepName" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" >動支編號：</td>
										                <td >
                                                            <asp:TextBox ID="TBAcmWordNum" runat="server"></asp:TextBox>
                                                        </td>
										            </tr>

										            <tr>
										                <td align="right" >計畫名稱：</td>
										                <td colspan=3>
                                                            <asp:DropDownList ID="DDLPlanName" runat="server" Width="480px"></asp:DropDownList>
                                                        </td>
										            </tr>
										            <tr>
                                                        <td align="right" >用途別：</td>
                                                        <td colspan="3"><asp:DropDownList ID="DDLOul" runat="server" Width="480px"></asp:DropDownList>　　</td>
                                                    </tr>
                                                     <tr>
                                                        <td align="right" >廠商名稱：</td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="TBPayName" runat="server" Width="478px"></asp:TextBox>
                                                         </td>
                                                    </tr>                                                  

                                                     <tr>
                                                        <td align="right" >審核狀態：</td>
                                                        <td colspan="3">
                                                            <table>
                                                                <tr>
                                                                    <td>簽證</td>
                                                                    <td>
										                                <asp:dropdownlist id="DDLVisa" style="FONT-SIZE: 12px" runat="server" Width="120">
                                                                            <asp:ListItem Value="1">會計已審核</asp:ListItem>
                                                                            <asp:ListItem Value="">已登記數</asp:ListItem>                            
                                                                            <asp:ListItem Value="0">會計未審核</asp:ListItem>
                                                                        </asp:dropdownlist>
                                                                    </td>
                                                                    <td>核銷</td>
                                                                    <td>
                                                                        <asp:dropdownlist id="DDLPay" style="FONT-SIZE: 12px" runat="server" Width="120">						
						                                                    <asp:ListItem Value="1">會計已審核</asp:ListItem>
						                                                    <asp:ListItem Value="">全部</asp:ListItem>                            
                                                                            <asp:ListItem Value="0">會計未審核</asp:ListItem>
                                                                        </asp:dropdownlist>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="display:none">
										                <td align="right" >&nbsp;</td>
										                <td colspan=3>
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
							        <asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:button>
							    </td> 										
                            </tr>
						</table>
					</td>
				</tr>
			</table>
    <componentart:calendar id="UCEDate" runat="server" CultureId="1028" 
        CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" 
        DayHoverCssClass="dayhover" MonthCssClass="month" 
        OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" 
        PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" 
        PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" 
        PopUpExpandControlId="TBEDate" PopUp="Custom" 
        ClientSideOnSelectionChanged="UCEDate_Change"></componentart:calendar>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </form>
</body>
</html>
