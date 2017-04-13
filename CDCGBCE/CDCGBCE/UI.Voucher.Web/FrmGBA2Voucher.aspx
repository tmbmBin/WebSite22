<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmGBA2Voucher.aspx.vb" Inherits="UI.Voucher.Web.FrmGBA2Voucher" %>

<%@ Import Namespace="Microsoft.Security.Application" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="No-cache" />
    <style type="text/css">
        .Freezing {
            Z-INDEX: 10;
            POSITION: relative;
            TOP: expression(this.offsetParent.scrollTop+0);
            HEIGHT: 24px;
        }

        .FreezingCol0 {
            BORDER-RIGHT: 0px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol1 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol2 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5"
            width="97%" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td>
                                <table cellpadding="1" border="0">
                                    <tr>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSave" runat="server" Height="22" Text="傳票號碼登錄存檔"></asp:Button></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red">請存檔後再換頁。</asp:Label></td>
                                        <td valign="bottom" align="center">報支總和：</td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="LBPayTotal" runat="server" Width="120px"></asp:Label></td>
                                        <td valign="bottom" align="center">轉正總和：</td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="LBOffsetTotal" runat="server" Width="120px"></asp:Label></td>
                                        <td valign="bottom" align="center">繳回總和：</td>
                                        <td valign="bottom" align="center">
                                            <asp:Label ID="LBPayBackTotal" runat="server" Width="120px"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" CellSpacing="1" BorderStyle="None" BackColor="White"
                                    CellPadding="3" GridLines="None" AutoGenerateColumns="False" AllowPaging="True">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                    <Columns>
                                        <asp:TemplateColumn Visible="False" HeaderText="選取">
                                            <HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="CBSelectAll1" onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" runat="server"
                                                    ToolTip="打勾全選"></asp:CheckBox>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CBdgSelect" runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="acpPassDate" SortExpression="acpPassDate" HeaderText="報支日期">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
                                            <HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
                                            <HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PlanName" SortExpression="PlanName" HeaderText="計畫名稱">
                                            <HeaderStyle Wrap="False" Width="150px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別名稱">
                                            <HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
                                            <HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
                                            <HeaderStyle Wrap="False" Width="55px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="報支金額" SortExpression="報支金額" HeaderText="報支金額" DataFormatString="{0:#,0}">
                                            <HeaderStyle Wrap="False" Width="75px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="轉正金額" SortExpression="轉正金額" HeaderText="轉正金額" DataFormatString="{0:#,0}">
                                            <HeaderStyle Wrap="False" Width="75px"></HeaderStyle>
                                            <ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvMemo" SortExpression="acvMemo" HeaderText="事由">
                                            <HeaderStyle Wrap="False" Width="150px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="繳回款" SortExpression="繳回款" HeaderText="繳回款" DataFormatString="{0:#,0}">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acpGroupNo" SortExpression="acpGroupNo" HeaderText="匯出批號">
                                            <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="傳票號碼">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TBdgAccNo" runat="server" Width="70px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvWExchNo").ToString()) %>'>
                                                </asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-14"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-15"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acmNo2" SortExpression="acmNo2" HeaderText="acmNo2-16"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acvNo" SortExpression="acvNo" HeaderText="acvNo-17"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acvNo1" SortExpression="acvNo1" HeaderText="acvNo1-18"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acvNo2" SortExpression="acvNo2" HeaderText="acvNo2-19"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acpPayYear" SortExpression="acpPayYear" HeaderText="acpPayYear-20"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="True" DataField="acpPayNo" SortExpression="acpPayNo" HeaderText="報支號"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acvSubNo" SortExpression="acvSubNo" HeaderText="acvSubNo-22"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acpPayNo1" SortExpression="acpPayNo1" HeaderText="acpPayNo1-23"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="acvSubNo1" SortExpression="acvSubNo1" HeaderText="acvSubNo1-24"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="繳回款傳票號碼">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TBdgOffSetAccNo" runat="server" Width="70px" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo1") %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvWExchNo1").ToString()) %>'>
                                                </asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
