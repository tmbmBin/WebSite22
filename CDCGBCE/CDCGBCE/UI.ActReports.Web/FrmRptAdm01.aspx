<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptAdm01.aspx.vb" Inherits="UI.ActReports.Web.FrmRptAdm01" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
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
    <table cellpadding="5" bordercolor="#666668" bgcolor="#dadee9" border="1" width="700"
        style="margin-top: 10px; margin-left: 10px; border-collapse: collapse">
        <tr>
            <td>
                <table border="0" style="border-collapse: collapse" bordercolor="#ffffff" width="100%">
                    <tr>
                        <td>
                            <table border="0" cellpadding="1" style="border-collapse: collapse" width="100%">
                                <tr style="display:none">
                                    <td align="right" style="width:100px" >&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td align="right" style="width:100px" >&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">日期：</td>
                                    <td colspan=3>
                                        <asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>
                                        至
                                        <asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
												<asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td align="right" >門別：</td>
                                    <td><asp:DropDownList ID="DDLAccKind" runat="server"></asp:DropDownList></td>
                                    <td align="right" >預算來源：</td>
                                    <td><asp:DropDownList ID="DDLBgtSource" runat="server"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right" >經費單位：</td>
                                    <td><asp:DropDownList ID="DDLBgtDep" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                    <td align="right" >執行單位：</td>
                                    <td><asp:DropDownList ID="DDLWorkDep" runat="server"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right">計畫：</td>
                                    <td colspan="3"><asp:DropDownList ID="DDLPlan" runat="server" AutoPostBack="True" Width="480px"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right" >用途別：</td>
                                    <td colspan="3"><asp:DropDownList ID="DDLOul" runat="server" Width="480px"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right" >付款方式：</td>
                                    <td>
                                        <asp:DropDownList ID="DDLPayKind" runat="server">
                                            <asp:ListItem Value="">......</asp:ListItem>
                                            <asp:ListItem Value="0">實付款</asp:ListItem>
                                            <asp:ListItem Value="1">暫付款</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" >承辦人員：</td>
                                    <td><asp:TextBox ID="TBStaff" runat="server" Width="116px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td align="right" >動支編號：</td>
                                    <td><asp:TextBox ID="TBAcmWordNum" runat="server" Width="150px"></asp:TextBox></td>
                                    <td align="right" ></td>
                                    <td></td>
                                </tr>
                                <tr style="display: none">
                                    <td align="right" >主檔事由：</td>
                                    <td><asp:TextBox ID="TBMemo" runat="server" Width="150px"></asp:TextBox></td>
                                    <td align="right" >主檔金額：</td>
                                    <td><asp:TextBox ID="TBMoney" runat="server" Width="116px"></asp:TextBox></td>
                                </tr>
                                <tr style="display: none">
                                    <td align="right"  >用途說明：</td>
                                        <td><asp:TextBox ID="TBAcvMemo" runat="server"  ></asp:TextBox></td>
                                        <td align="right">動支金額：</td>
                                        <td><asp:TextBox ID="TBacvMoney" runat="server" Width="116px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td align="right">結案狀態：</td>
                                    <td>
                                        <asp:DropDownList ID="DDLFinalStatus" runat="server">
                                            <asp:ListItem Value="">不區分</asp:ListItem>
                                            <asp:ListItem Value="1">已結案</asp:ListItem>
                                            <asp:ListItem Value="0">未結案</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right"></td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="BtnList" runat="server" Text="列出資料"></asp:Button>&nbsp;
                            <asp:Button ID="BtnPrint" runat="server" Text="列印資料" />
                            <asp:CheckBox ID="CBExcel" runat="server" Text="轉製成Excel" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table style="margin-left: 10px; border-collapse: collapse" border="0">
        <tr>
            <td>
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False">
                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                    <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center"
                        ForeColor="White" BackColor="#003366"></HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="簽證編號" HeaderText="簽證編號"></asp:BoundColumn>
                        <asp:BoundColumn DataField="預算單位" HeaderText="預算單位"></asp:BoundColumn>
                        <asp:BoundColumn DataField="執行單位" HeaderText="執行單位"></asp:BoundColumn>
                        <asp:BoundColumn DataField="承辦人員" HeaderText="承辦人員"></asp:BoundColumn>
                        <asp:BoundColumn DataField="摘要" HeaderText="摘要"></asp:BoundColumn>
                        <asp:BoundColumn DataField="單位審核日" HeaderText="單位審核日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="估價審核日" HeaderText="估價審核日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="會計審核日" HeaderText="會計審核日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="金額" HeaderText="金額" DataFormatString="{0:#,0}">
                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="黏存日期" HeaderText="黏存日期" DataFormatString="{0:yyyy/MM/dd}">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="會計核支日" HeaderText="會計核支日" DataFormatString="{0:yyyy/MM/dd}">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="零用金" HeaderText="零用金"></asp:BoundColumn>
                        <asp:BoundColumn DataField="會計付款日" HeaderText="會計付款日" DataFormatString="{0:yyyy/MM/dd}">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="憑單編號" HeaderText="憑單編號"></asp:BoundColumn>
                        <asp:BoundColumn DataField="廠商" HeaderText="廠商"></asp:BoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages">
                    </PagerStyle>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    
    
    
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
    </form>
</body>
</html>
