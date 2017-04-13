<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPayMethod.aspx.vb" Inherits="AppCtrlCustom.FrmPayMethod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Pragma" content="No-cache" />
    <base target="_self" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="5" style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" bgcolor="#dadee9" width="550">
            <tr>
                <td bordercolor="#666668" style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid">
                    <table border="1" cellpadding="1" style="border-collapse: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>款項撥至...</td>
                        </tr>
                        <tr>
                            <td>
                                <table style="table-layout: fixed; border-collapse: collapse">
                                    <tr style="display: none">
                                        <td width="100px">&nbsp;</td>
                                        <td width="170px">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdo1" runat="server" GroupName="WhoPay" Text="廠商名稱" /></td>
                                        <td>
                                            <asp:TextBox ID="txtFactory" runat="server" ToolTip="請填寫廠商公司名稱..." Width="150px"></asp:TextBox></td>
                                        <td>。</td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="廠商名稱{@Option1}。" Font-Size="XX-Small" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdo2" runat="server" GroupName="WhoPay" Text="款項已由" /></td>
                                        <td>
                                            <asp:TextBox ID="txtPerson" runat="server" ToolTip="請填寫代付款人員姓名..." Width="150px"></asp:TextBox></td>
                                        <td>人員代墊。</td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="款項已由 {@Option2} 人員代墊。" Font-Size="XX-Small" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:RadioButton ID="rdo3" runat="server" GroupName="WhoPay" Text="款項已暫借零用金支付。" /></td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="款項已暫借零用金支付。" Font-Size="XX-Small" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="table-layout: fixed; border-collapse: collapse">
                                    <tr>
                                        <td width="90px">
                                            <asp:Button ID="BtnSave" runat="server" Text="儲存" /></td>
                                        <td width="50px">
                                            <asp:Button ID="BtnDel" runat="server" Text="刪除" /></td>
                                        <td>
                                            <asp:Label ID="LBMsg" runat="server" Text="" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
