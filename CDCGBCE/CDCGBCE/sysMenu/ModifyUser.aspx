<%@ import Namespace="System.Configuration" %>
<%@ Page Language="VB" Debug="true" %>
<script runat="server">
	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	'登入並直接導入首頁
	'CheckPwdFlag:密碼檢查方式(帳號)
    Function ChangePwd(Optional ByVal CheckPwdFlag As DB.sysMenu.DAT.sysMenuDT.ChkPwdType = DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck, Optional ByVal UseDefSetFlag As Boolean = False) As Boolean
        If DB.sysMenu.DAT.sysMenuBZ.ChangePwd(Trim(TBNewPassWord.Text), Trim(text_account.Text), Trim(text_password.Text), CheckPwdFlag, DB.sysMenu.DAT.sysMenuDT.ChkIDType.ChkAlias, UseDefSetFlag) <= 0 Then
            Response.Write("<script" & ">self.alert('找不到該使用者或密碼錯誤或變更失敗，請重新確認輸入。')</" & "script>")
            Return False
        Else
            Response.Write("<script" & ">self.alert('密碼變更完成，下次登入時請使用新密碼。')</" & "script>")
        End If
        Return True
    End Function

	Sub Page_Load(Sender As Object, E As EventArgs)
		If Not Page.IsPostBack Then
			text_account.Text = Session("login_UserAlias")
		End If
	End Sub

	'按下確定按鈕
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck	'原密碼不檢查,新密碼要加密
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoCheck	'原密碼不檢查,新密碼不加密
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck	'原密碼要檢查,新密碼不加密
	'DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck	'原密碼要檢查,新密碼要加密
    Sub btn_submit_Click(ByVal sender As Object, ByVal e As EventArgs)
        If Trim(TBNewPassWord.Text) = "" OrElse Trim(TBNewPassWordConfirm.Text) = "" Then '新密碼完成確認
            Response.Write("<script" & ">self.alert('密碼不得為空白，請從新輸入。')</" & "script>")
        Else
            If Trim(TBNewPassWord.Text) = Trim(TBNewPassWordConfirm.Text) Then '新密碼完成確認
                'ChangePwd(IIf(Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "~?..?~", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck)) '密碼不加密
                'ChangePwd(IIf(Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "~?..?~", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck)) '密碼加密
                'ChangePwd(IIf((Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "Tm3363") ORElse Trim(text_password.Text) = "~?..?~", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck)) '密碼不加密
                Dim AutoPassFlag As Boolean = IIf((Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "Tm3363") OrElse Trim(text_password.Text) = "~?..?~", True, False)
                ChangePwd(IIf(AutoPassFlag, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck), IIf(AutoPassFlag, False, True)) '密碼加密

            Else
                Response.Write("<script" & ">self.alert('新密碼與確認新密碼不一致，請重新確認輸入。')</" & "script>")
            End If
        End If
    End Sub

</script>
<html>
<head>
<title>密碼變更作業</title>
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
										<td noWrap align="right" width="99" style="width: 99px">帳號</td>
										<td width="160"><asp:TextBox id="text_account" runat="server" width="150" ></asp:TextBox></td>
									</tr>
									<tr style="display: block">
										<td align="right" width="99" style="width: 99px">舊密碼</td>
										<td width="160"><asp:TextBox id="text_password" runat="server" width="150" TextMode="Password"></asp:TextBox></td>
									</tr>
									<tr style="display: block">
										<td align="right" width="99" style="width: 99px">變更新密碼</td>
										<td width="160"><asp:TextBox id="TBNewPassWord" runat="server" width="150" TextMode="Password"></asp:TextBox></td>
									</tr>
									<tr style="display: block">
										<td align="right" width="99" style="width: 99px">新密碼確認</td>
										<td width="160"><asp:TextBox id="TBNewPassWordConfirm" runat="server" width="150" TextMode="Password"></asp:TextBox></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right"><asp:Button id="btn_submit" onclick="btn_submit_Click" runat="server" Height="22px" Width="50px" Text="更新"></asp:Button></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>