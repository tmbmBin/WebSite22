<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmEMailCreate.aspx.vb" Inherits="UI.EMail.Web.FrmEMailCreate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="700" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff"
                        cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style=" table-layout:fixed; border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td style="text-align: right; width:90px">合併資料：</td>
                                        <td style="text-align: left">
                                                                    <asp:CheckBox ID="CBGouping" runat="server" />
                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" 
                                                                        ForeColor="#009900" Text="將同部門同員工編號(員工姓名)合併寄送"></asp:Label>
                                                                </td>
                                    </tr>
                                    <tr style="display:none">
                                        <td style="text-align: right; width:90px">重新產生：</td>
                                        <td style="text-align: left">
                                                                    <asp:CheckBox ID="CBReGenMail" runat="server" Checked="True" />
                                                                </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="btnGenMail" runat="server" Text="產生EMail信件" /></td>
                        </tr>
     
                        <tr>
                            <td><asp:Label ID="LBStatus" runat="server" Text=""></asp:Label></td>
                        </tr>
     
                    </table>
                </td>
            </tr>             
        </table> 

    </form>
</body>
</html>
