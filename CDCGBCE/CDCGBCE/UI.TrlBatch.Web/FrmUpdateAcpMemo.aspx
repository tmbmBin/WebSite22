<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmUpdateAcpMemo.aspx.vb" Inherits="UI.TrlBatch.Web.FrmUpdateAcpMemo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="600">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
										<tr>
											<td align="right" width="120">批號：</td>
											<td align="left"><asp:Label ID="lbCsmBatchNo" runat="server" Font-Bold="True" ForeColor="#000099"></asp:Label></td>
										</tr>
										<tr>
											<td align="right" width="120">附加核銷事由：</td>
											<td align="left"><asp:TextBox ID="TBBatchAcpMemo" runat="server" Width="440px"></asp:TextBox></td>
										
										</tr>
										</table>
								</td>
							</tr>
							<tr>
								<td><asp:Button ID="BtnSave" runat="server" Text="存檔" onclick="BtnSave_Click" 
                                        style="width: 40px" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </form>
</body>
</html>
