<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActBgtCopy.aspx.vb" Inherits="UI.CDCFun2.Web.FrmActBgtCopy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />

</head>
<body>
    <form id="form1" runat="server">
<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellPadding="5" width="600" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="2" width="100%" border="0">
										<tr>
											<td align="center" colSpan="2">　</td>
										</tr>
										<TR>
											<TD align="right" width="30"></TD>
											<TD><FONT face="新細明體">從
													<asp:dropdownlist id="DDLSourceYear" runat="server" Width="72px" AutoPostBack="True"></asp:dropdownlist>年度拷貝至
													<asp:dropdownlist id="DDLTargetYear" runat="server" Width="72px" AutoPostBack="True"></asp:dropdownlist>年度</FONT></TD>
										</TR>
										<tr>
											<td align="right" width="30">　</td>
											<td><asp:CheckBox id="ctl_bgtBudget" runat="server" Text="預算資料" Checked="True"></asp:CheckBox></td>
										</tr>
										<tr>
											<td align="right" width="30"></td>
											<td><asp:CheckBox id="ctl_codPlanCode" runat="server" Text="會計科目代碼" Visible="False"></asp:CheckBox></td>
										</tr>
										<tr>
											<td align="right" width="30"></td>
											<td><asp:CheckBox id="ctl_codOutlayCode" runat="server" Text="用途別科目代碼" 
                                                    Visible="False"></asp:CheckBox></td>
										</tr>
										<tr>
											<td align="right" width="30"></td>
											<td><asp:button id="BtnCopy" runat="server" Width="75px" Text="拷貝" Height="22px"></asp:button></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>    </form>
</body>
</html>
