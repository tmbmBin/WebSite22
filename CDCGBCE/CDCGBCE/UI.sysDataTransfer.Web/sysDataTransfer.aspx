<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysDataTransfer.aspx.cs" Inherits="sysDataTransfer.sysDataTransfer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style1">來源年度</td>
                    <td>
                        <asp:TextBox ID="txt_syear" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">目的年度</td>
                    <td>
                        <asp:TextBox ID="txt_dyear" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="90%"
                            DataKeyNames="tsfTableID" CellPadding="4"
                            ForeColor="#333333" GridLines="Both" BackColor="#3399FF" OnRowCreated="GridView1_RowCreated">
                            <Columns>
                                <asp:TemplateField HeaderText="選取">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="40" />
                                    <ItemStyle HorizontalAlign="Center" Width="40" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="是否覆蓋">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkOver" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="70" />
                                    <ItemStyle HorizontalAlign="Center" Width="70" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="資料表名稱">
                                    <ItemTemplate>
                                        <asp:Label ID="lb_tsfTableName" runat="server" Text='<%# Eval("tsfTableName") %>'></asp:Label>
                                        (<asp:Label ID="tsfTableID" runat="server" Text='<%# Eval("tsfTableID") %>'></asp:Label>)
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="訊息">
                                    <ItemTemplate>
                                        <asp:Label ID="lab_msg" runat="server" Text="" ForeColor="#FF3300"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="300" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="Button1" runat="server" Text="產生資料" OnClick="Button1_Click" />
                    </td>
                </tr>

            </table>
            <asp:Label ID="ShowMsg" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
