<%@ Page Language="VB" %>

<script runat="server">
    'author:nickey
    'version:v2.0
    'date:96.5.18
    Dim Url As String

    Public strVer As String

    Sub Page_Load(Sender As Object, E As EventArgs)
        'If Session("login_UserSysNo") Is Nothing Then '���n�J(�ˬd�n�J�v���s��)
        '	Dim loginUrl As String = ConfigurationSettings.AppSettings("loginUrl")
        '	If loginUrl = Nothing Then
        '		loginUrl = "~\sysMenu\Login.aspx"
        '	End If
        '	Response.Redirect(loginUrl & "?RETURNURL=" & Server.UrlEncode(Request.Url.PathAndQuery))  '   "RETURNURL=/default.aspx"
        'End If
        strVer = DB.Base.BIZ.BaseBiz.GetSysVer(Server.MapPath("") & "\Ver.txt", "")

        DB.sysMenu.DAT.sysMenuBZ.CheckLogin() '�ˬd�O�_�n�J,�p���n�J�ɱN�۰ʾɤJLogin
        If Request.QueryString("returnUrl") Is Nothing Then
            'Url = "blank.aspx"
            'Url = "Toggle.aspx"
            'Url = "intro.html"
            Url = "intro.aspx"
        Else
            Url = Request.QueryString("returnUrl")
        End If

    End Sub

</script>
<html>
<head>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <title><%= System.Configuration.ConfigurationSettings.AppSettings("OrgFullName")%>�U<%= System.Configuration.ConfigurationSettings.AppSettings("SysName") %>�U<%=strVer%></title>
    <script language="javascript">
<!--
    if (top.location != self.location) top.location = self.location;
    //-->
    </script>
</head>
<frameset framespacing="0" rows="30,*">
		<frame name="topFrame" scrolling="no" noresize target="menuFrame" src="Header.aspx">
		<frameset name="menuFrame" framespacing="2" bordercolor="#FFFFFF" cols="210,*">
			<frame name="menu" target="main" scrolling="auto" target="main" src="Menu.aspx">
			<frame name="main" src="<%=Url %>">
		</frameset>
		<noframes>
		<body>

		<p>�������ϥήج[�A���O�z���s�������䴩�ج[�C</p>

		</body>
		</noframes>
	</frameset>
</html>
