<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmMediaFileLoader.aspx.vb" Inherits="UI.Remit.Web.FrmMediaFileLoader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="600">
			<tr>
				<td bordercolor="#666668" style=" border-right:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
					<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
						<tr>
							<td>
								<table border="0" width="100%" cellpadding="1" style=" border-collapse: collapse">
									<tr>
										<td align="right" width="90px">檔案格式：</td>
										<td align="left"  width="200px">
                                            <asp:DropDownList ID="DDLRmfNo" runat="server">
                                            </asp:DropDownList>
                                        </td>
										<td align="right" width="90px">&nbsp;</td>
										<td align="left">&nbsp;</td>
									</tr>
									<tr>
										<td align="right" width="90px">上傳檔案：</td>
										<td align="left" colspan="3">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Button ID="btnUpload" runat="server" Text="上傳" Width="45px" />
                                            <asp:Label id="lbFilePath" runat="server" forecolor="Red" font-size="8pt" 
                                                Visible="False"></asp:Label>
                                        </td>
									</tr>
									</table>
							</td>
						</tr>
						<tr>
							<td>
                                <table style="table-layout:fixed; border-collapse:collapse" width="100%">
                                    <tr>
                                        <td><asp:Button ID="BtnMediaFile" runat="server" Text="媒體檔" /></td>
                                        <td><asp:Button ID="BtnMediaTotal" runat="server" Text="匯款總表" /></td>
                                        <td><asp:Button ID="BtnMediaFileList" runat="server" Text="匯款清冊" /></td>
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
