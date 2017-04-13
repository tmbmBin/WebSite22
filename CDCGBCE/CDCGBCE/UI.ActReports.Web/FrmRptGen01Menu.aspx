<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptGen01Menu.aspx.vb" Inherits="UI.ActReports.Web.FrmRptGen01Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        <meta http-equiv="Pragma" content="No-cache" />
	<base target="_self" />  

</head>
<body>
    <form id="form1" runat="server">
     <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>事由</td>
                        <td><asp:TextBox ID="TBAcmMemo" runat="server"></asp:TextBox></td>
                        <td>
                            <input id="TBOrderTxt" runat="server" name="TBOrderTxt" style="width: 59px;
                                height: 9px" type="hidden" /></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            審核狀態</td>
                        <td>
                            <asp:DropDownList ID="DDLAcpPassFlag" runat="server">
                                <asp:ListItem Value="0">未核支</asp:ListItem>                                
                                <asp:ListItem Value="1">已核支</asp:ListItem>
                               <asp:ListItem Value="">不區分</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="Label1" runat="server" Text="請注意：如不勾選(過濾)任何資料，則會印前一畫面所選的該筆資料。" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnList" runat="server" Text="列出資料" />
                        </td>
                        <td>
                            <asp:Button ID="BtnPrint" runat="server" Text="列印報表" />
                        </td>
                        <td >
                            <asp:CheckBox ID="CBFormat" runat="server" Text="Excel格式" Checked="True"  />
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines=Horizontal AutoGenerateColumns="False" AllowSorting="True"    >
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Font-Size="Small" />
                        <Columns>
                            <asp:TemplateField HeaderText="選取">
                                <HeaderStyle Font-Size="Small" Width="30px" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="CBdgSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="動支編號" DataField="acmWordNum" SortExpression="X.acmWordNum">
                                <HeaderStyle Font-Size="Small" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="再簽號" DataField="acmNo1" SortExpression="acmNo1" Visible="false">
                                <HeaderStyle Font-Size="Small" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="報支號" DataField="acpPayNo" SortExpression="acpPayNo">
                                <HeaderStyle Font-Size="Small" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="預算單位" DataField="BgtDepName" SortExpression="BgtDepName">
                                <HeaderStyle Font-Size="Small" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="簽証金額" DataField="acpMoney" SortExpression="acpMoney" DataFormatString="{0:#,0}">
                                <HeaderStyle Font-Size="Small" Width="100px" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="事由" DataField="acpMemo" SortExpression="acpMemo">
                                <HeaderStyle Font-Size="Small" />
                            </asp:BoundField>
                        </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>

    </table>
    </form>
</body>
</html>
