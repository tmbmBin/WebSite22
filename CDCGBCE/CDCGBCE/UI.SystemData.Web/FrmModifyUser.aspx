<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmModifyUser.aspx.vb" Inherits="UI.SystemData.Web.FrmModifyUser"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmModifyUser</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META http-equiv="Pragma" content="No-cache">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 48px; WIDTH: 104px; POSITION: absolute; TOP: 80px; BORDER-COLLAPSE: collapse; HEIGHT: 18px"
				borderColor="#666668" cellSpacing="0" cellPadding="0" border="1">
				<TR>
					<TD><FONT face="新細明體">
							<TABLE id="Table4" style="BORDER-COLLAPSE: collapse" borderColor="#f8f8fa" cellSpacing="0"
								cellPadding="5" bgColor="#dadee9" border="1">
								<TR>
									<TD>
										<TABLE id="Table5" cellSpacing="0" cellPadding="5" border="0" style="WIDTH: 264px; HEIGHT: 118px">
											<TR>
												<TD noWrap align="right" width="99" style="WIDTH: 99px">帳號</TD>
												<TD width="160">
													<asp:TextBox id="TBUserName" runat="server" width="150" onfocus="this.blur()"></asp:TextBox></TD>
											</TR>
											<TR style="DISPLAY: block">
												<TD align="right" width="99" style="WIDTH: 99px">舊密碼</TD>
												<TD width="160">
													<asp:TextBox id="TBOldPassWord" runat="server" width="150" TextMode="Password"></asp:TextBox></TD>
											</TR>
											<TR style="DISPLAY: block">
												<TD align="right" width="99" style="WIDTH: 99px">新密碼</TD>
												<TD width="160">
													<asp:TextBox id="TBNewPassWord" runat="server" width="150" TextMode="Password"></asp:TextBox></TD>
											</TR>
											<TR style="DISPLAY: block">
												<TD align="right" width="99" style="WIDTH: 99px">新密碼確認</TD>
												<TD width="160">
													<asp:TextBox id="TBNewPassWordConfirm" runat="server" width="150" TextMode="Password"></asp:TextBox></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD align="right">
										<asp:Button id="btn_submit" runat="server" Height="22px" Width="50px" Text="更新"></asp:Button></TD>
								</TR>
							</TABLE>
						</FONT>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
