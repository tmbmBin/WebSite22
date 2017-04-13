<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmBackUpDB.aspx.vb" Inherits="UI.SystemData.Web.FrmBackUpDB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    	<META http-equiv="Pragma" content="No-cache">
</head>
<body>
    <form id="form1" runat="server">
<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				bgcolor="#dadee9" width="600">
			
					<tr>
						<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
							<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
								width="100%">
								<tr>
									<td>
										<table border="0" width="100%" cellpadding="1" style="TABLE-LAYOUT: fixed">
											<tr>
												<td vAlign="bottom" align="left">&nbsp;</td>
												<td vAlign="bottom" align="left">&nbsp;</td>
												<td vAlign="bottom" align="left">&nbsp;</td>
												<td vAlign="bottom" align="left">&nbsp;</td>
												<td vAlign="bottom" align="left">&nbsp;</td>
												<td vAlign="bottom" align="right">&nbsp;</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><table border="0" width="100%" id="table1">
											<tr>
												<td width="73" align="right">
													<asp:Label id="LBTitle" runat="server">備份檔名</asp:Label></td>
												<td colspan="2">
													<asp:TextBox id="TBName" runat="server" Width="100%"></asp:TextBox>
												</td>
												<td width="96">
                                                    </td>
												<td width="70" align="right">
												</td>
												<td width="88">
												</td>
											</tr>
											<tr>
												<td width="73" align="right">
												</td>
												<td width="134">
													<asp:Button id="BtnBackUp" runat="server" Text="備份資料庫"></asp:Button>
												</td>
                                                <td colspan="4">
                                                    &nbsp;<asp:HyperLink ID="HLDBPath" runat="server"></asp:HyperLink></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>	
							
							</td></tr></table>    </form>
</body>
</html>
