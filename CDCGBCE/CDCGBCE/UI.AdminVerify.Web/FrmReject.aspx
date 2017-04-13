<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmReject.aspx.vb" Inherits="UI.AdminVerify.Web.FrmReject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5" width="100%" bgColor="#dadee9">
	    <tr>
		    <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" borderColor="#666668">
		        <table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="0" width="100%" border="1">
		            <tr>
		                <td style="width:70px">
                            <asp:Label ID="Label1" runat="server" Text="退件原因"></asp:Label> 
		                </td>
		                <td style="width:350px">
                            <asp:TextBox ID="txt_actRejectMemo" runat="server" Width="350px" 
                                BackColor="#ffffe0"></asp:TextBox>
		                </td>
		                <td>
		                    <asp:Button ID="btnSave" runat="server" Text="儲存" Visible="False" />
		                    &nbsp;<asp:TextBox ID="txt_ActRejNo" runat="server" Visible="False" Width="50px"></asp:TextBox>
		                </td>
		            </tr>
		        </table>
		    </td>
		</tr>
    </table>
    </form>
</body>
</html>
