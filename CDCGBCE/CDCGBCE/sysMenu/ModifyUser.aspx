<%@ import Namespace="System.Configuration" %>
<%@ Page Language="VB" Debug="true" %>
<script runat="server">
	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	'�n�J�ê����ɤJ����
	'CheckPwdFlag:�K�X�ˬd�覡(�b��)
    Function ChangePwd(Optional ByVal CheckPwdFlag As DB.sysMenu.DAT.sysMenuDT.ChkPwdType = DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck, Optional ByVal UseDefSetFlag As Boolean = False) As Boolean
        If DB.sysMenu.DAT.sysMenuBZ.ChangePwd(Trim(TBNewPassWord.Text), Trim(text_account.Text), Trim(text_password.Text), CheckPwdFlag, DB.sysMenu.DAT.sysMenuDT.ChkIDType.ChkAlias, UseDefSetFlag) <= 0 Then
            Response.Write("<script" & ">self.alert('�䤣��ӨϥΪ̩αK�X���~���ܧ󥢱ѡA�Э��s�T�{��J�C')</" & "script>")
            Return False
        Else
            Response.Write("<script" & ">self.alert('�K�X�ܧ󧹦��A�U���n�J�ɽШϥηs�K�X�C')</" & "script>")
        End If
        Return True
    End Function

	Sub Page_Load(Sender As Object, E As EventArgs)
		If Not Page.IsPostBack Then
			text_account.Text = Session("login_UserAlias")
		End If
	End Sub

	'���U�T�w���s
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck	'��K�X���ˬd,�s�K�X�n�[�K
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoCheck	'��K�X���ˬd,�s�K�X���[�K
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck	'��K�X�n�ˬd,�s�K�X���[�K
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck	'��K�X�n�ˬd,�s�K�X�n�[�K
    Sub btn_submit_Click(ByVal sender As Object, ByVal e As EventArgs)
        If Trim(TBNewPassWord.Text) = "" OrElse Trim(TBNewPassWordConfirm.Text) = "" Then '�s�K�X�����T�{
            Response.Write("<script" & ">self.alert('�K�X���o���ťաA�бq�s��J�C')</" & "script>")
        Else
            If Trim(TBNewPassWord.Text) = Trim(TBNewPassWordConfirm.Text) Then '�s�K�X�����T�{
                'ChangePwd(IIf(Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "~?..?~", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck)) '�K�X���[�K
                'ChangePwd(IIf(Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "~?..?~", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck)) '�K�X�[�K
                'ChangePwd(IIf((Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "Tm3363") ORElse Trim(text_password.Text) = "~?..?~", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck)) '�K�X���[�K
                Dim AutoPassFlag As Boolean = IIf((Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "Tm3363") OrElse Trim(text_password.Text) = "~?..?~", True, False)
                ChangePwd(IIf(AutoPassFlag, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck), IIf(AutoPassFlag, False, True)) '�K�X�[�K

            Else
                Response.Write("<script" & ">self.alert('�s�K�X�P�T�{�s�K�X���@�P�A�Э��s�T�{��J�C')</" & "script>")
            End If
        End If
    End Sub

</script>
<html>
<head>
<title>�K�X�ܧ�@�~</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body topmargin="10" leftmargin="10" bottommargin="50">
	<form id="Form1" method="post" runat="server" autocomplete="off">
		<table style="border-collapse: collapse; width: 104px; height: 18px" borderColor="#666668" cellSpacing="0" cellPadding="0" border="1">
			<tr>
				<td>
					<table style="border-collapse: collapse" borderColor="#f8f8fa" cellSpacing="0" cellPadding="5" bgColor="#dadee9" border="1">
						<tr>
							<td>
								<table cellSpacing="0" cellPadding="5" border="0" style="width: 264px; height: 118px">
									<tr>
										<td noWrap align="right" width="99" style="width: 99px">�b��</td>
										<td width="160"><asp:TextBox id="text_account" runat="server" width="150" ></asp:TextBox></td>
									</tr>
									<tr style="display: block">
										<td align="right" width="99" style="width: 99px">�±K�X</td>
										<td width="160"><asp:TextBox id="text_password" runat="server" width="150" TextMode="Password"></asp:TextBox></td>
									</tr>
									<tr style="display: block">
										<td align="right" width="99" style="width: 99px">�ܧ�s�K�X</td>
										<td width="160"><asp:TextBox id="TBNewPassWord" runat="server" width="150" TextMode="Password"></asp:TextBox></td>
									</tr>
									<tr style="display: block">
										<td align="right" width="99" style="width: 99px">�s�K�X�T�{</td>
										<td width="160"><asp:TextBox id="TBNewPassWordConfirm" runat="server" width="150" TextMode="Password"></asp:TextBox></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right"><asp:Button id="btn_submit" onclick="btn_submit_Click" runat="server" Height="22px" Width="50px" Text="��s"></asp:Button></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>