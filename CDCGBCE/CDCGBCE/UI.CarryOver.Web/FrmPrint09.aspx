
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPrint09.aspx.vb" Inherits="UI.CarryOver.Web.FrmPrint09" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
  	<table style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; border-color:#666668" cellpadding="5" width="750" bgcolor="#dadee9" border="1">
				<tr>
					<td>
						<table style="border-collapse: collapse;"  bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
									 <table style="table-layout:fixed; width:100%" border="0" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td style="width:90px; text-align:right">資料年度：</td>
                                            <td>
                                                <asp:Label ID="LBAcmYear" runat="server" Text="Label"></asp:Label>
													</td>
                                        </tr>
                                        <tr style="display:none">
                                            <td style="width:90px; text-align:right">日期區間：</td>
                                            <td>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
													<asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>
													</td>
                                        </tr>
                                     </table>
								</td>
							</tr>
                            <tr>
                                <td><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:button></td>
                            </tr>
						</table>
					</td>
				</tr>
			</table>
    </form>
</body>
</html>
