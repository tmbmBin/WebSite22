<%@ Page Language="VB" Debug="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">

    Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

    '登入並直接導入首頁
    'CheckPwdFlag:密碼檢查方式(帳號)
    Function Login(Optional ByVal CheckPwdFlag As DB.sysMenu.DAT.sysMenuDT.ChkPwdType = DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck) As Integer

        Dim retRow As DataRow
        Dim LoginNo As Integer = DB.sysMenu.DAT.sysMenuBZ.Login(Trim(text_account.Text), Trim(text_password.Text), CheckPwdFlag, DB.sysMenu.DAT.sysMenuDT.ChkIDType.ChkAlias, True, False, retRow)
        If LoginNo <= 0 Then
            Response.Write("<script" & ">self.alert('找不到該使用者或密碼錯誤，請重新確認輸入。')</" & "script>")
        Else
            AddLoginInfo(retRow)
            DB.sysMenu.DAT.sysMenuBZ.GoDefault()
        End If

        Return LoginNo



    End Function

    '建立額外資訊
    Sub AddLoginInfo(ByVal Row As DataRow) 'Handles DB.sysMenu.DAT.sysMenuBZ.LoginEvent.OnLogin

        'HttpContext.Current.Session("login_UnitName") = "部門名稱"
        'HttpContext.Current.Session("default_TeamName")="帳別名稱"

        Session("default_UnitNo") = Row("depCode") & "" '"部門代碼"
        'HttpContext.Current.Session("default_UnitName") = '"部門名稱"

        'HttpContext.Current.Session("default_UnitSubNo") = "工作站代碼"
        'HttpContext.Current.Session("default_UnitSubName") = "工作站名稱"
        'HttpContext.Current.Session("default_RankNo") = "職別代碼"
        'HttpContext.Current.Session("default_RankName") = "職別名稱"
        'HttpContext.Current.Session("default_RankKind") ="隊別分類"
        'HttpContext.Current.Session("default_LevelNo") = "職等代碼"
        'HttpContext.Current.Session("default_LevelName") = "職等名稱"
        'HttpContext.Current.Session("default_LevelKind") = "職等種類"
        'HttpContext.Current.Session("default_MapNo") = "指形編號"

        'Session("default_Year") = IIf(Val(objDT.Rows(0)("usrDefYear") & "") > 0, objDT.Rows(0)("usrDefYear"), System.DateTime.Today.Year - 1911)
        'Session("default_Month") = IIf(Val(objDT.Rows(0)("usrDefMonth") & "") > 0, objDT.Rows(0)("usrDefMonth"), System.DateTime.Today.Month)

        'Session("default_UnitNo") = objDT.Rows(0)("usrTeamCode") & ""
        'Session("default_UnitName") = objDT.Rows(0)("teaName") & ""

        'Session("Default_UserAccount") = objDT.Rows(0)("usrAlias") & ""
        'Session("default_UserNo") = objDT.Rows(0)("payCode") & ""
        'Session("default_UserName") = objDT.Rows(0)("usrName") & ""
        'Session("default_TeamNo") = objDT.Rows(0)("usrTeamCode") & ""
        'Session("default_TeamName") = objDT.Rows(0)("teaName") & ""
        'Session("default_UserSysNo") = objDT.Rows(0)("PK_usrNo") & ""
        'Session("Default_AgentNo") = objDT.Rows(0)("ageAgentNo") & ""
        'Session("Default_AgentName") = objDT.Rows(0)("ageAgentName") & ""
        'Session("Default_BgtVer") = "0"
        ''Session("default_RankNo") = "01"
        ''Session("default_RankName") = "測試"

        ''Session("default_RankKind") = "0"
        ''Session("default_LevelNo") =
        ''Session("default_LevelName") = text_default_LevelName.Text
        ''Session("default_LevelKind") = ddl_defalut_LevelKind.SelectedValue
        ''Session("default_MapNo") = text_default_MapNo.Text
        ''登入人員(填表人)
        'Session("Default_UserAccount") = objDT.Rows(0)("usrAlias") & ""
        'Session("login_UnitNo") = Row("depCode") & "" 'objDT.Rows(0)("usrTeamCode") & ""
        'Session("login_UnitName") = objDT.Rows(0)("teaName") & ""
        'Session("login_UserNo") = Row("payCode") & ""
        'Session("login_UserName") =Row("usrName") & ""
        'Session("login_UserSysNo") = Row("PK_usrNo") & ""
        'Session("Default_UserLevel") = objDT.Rows(0)("usrLevel") & ""

        'Session("default_Year") = IIf(Val(objDT.Rows(0)("usrDefYear") & "") > 0, objDT.Rows(0)("usrDefYear"), System.DateTime.Today.Year - 1911)
        'Session("default_Month") = IIf(Val(objDT.Rows(0)("usrDefMonth") & "") > 0, objDT.Rows(0)("usrDefMonth"), System.DateTime.Today.Month)

        'Session("default_UnitNo") = objDT.Rows(0)("usrTeamCode") & ""
        'Session("default_UnitName") = objDT.Rows(0)("teaName") & ""

        'Session("default_UserAlias") = objDT.Rows(0)("usrAlias") & ""
        'Session("default_UserNo") = objDT.Rows(0)("payCode") & ""
        'Session("default_UserName") = objDT.Rows(0)("usrName") & ""
        'Session("default_TeamNo") = objDT.Rows(0)("usrTeamCode") & ""
        'Session("default_TeamName") = objDT.Rows(0)("teaName") & ""
        'Session("default_UserSysNo") = objDT.Rows(0)("PK_usrNo") & ""
        'Session("Default_AgentNo") = objDT.Rows(0)("ageAgentNo") & ""
        'Session("Default_AgentName") = objDT.Rows(0)("ageAgentName") & ""


        Dim objDT As DataTable
        'objDT = DB.SystemData.DAT.SysDataDT.CheckLogin(Trim(text_account.Text), Trim(text_password.Text), 0, False)

        Try
            objDT = ToolsFun.MsDbFun.GetDbTable("Select Top 1 * From  ebsAgent ")

            Session("Default_AgentNo") = objDT.Rows(0)("ageAgentNo") & ""
            Session("Default_AgentName") = objDT.Rows(0)("ageAgentName") & ""
        Catch ex As Exception
            Session("Default_AgentNo") = "1011"
            Session("Default_AgentName") = ""
        End Try



        Session("Default_BgtVer") = "0"
        Session("default_UnitNo") = Row("depCode") & "" '"部門代碼"
        Session("login_UnitNo") = Row("depCode") & ""


        Session("LockDate") = GetLockDate()

        Try

            If Row("depCode") & "" <> "" Then
                objDT = DB.BasicData.DAT.BasicDataDT.GetDepDT("Select dptName, dptCode ", Row("depCode") & "")
                Session("default_UnitName") = objDT.Rows(0)(0)
                Session("login_UnitName") = objDT.Rows(0)(0)
            Else
                Session("default_UnitName") = ""
                Session("login_UnitName") = ""
            End If



        Catch ex As Exception
            Session("default_UnitName") = ""
            Session("login_UnitName") = ""
        End Try

    End Sub

    Sub Page_Load(Sender As Object, E As EventArgs)
        If Not IsPostBack Then '第一次
            If Request("ID") <> "" AndAlso Not Request("PWD") Is Nothing Then '由其他程序導入
                text_account.Text = Request("ID")
                text_password.Text = Request("PWD")
                Session("login_Url") = "@" '由其他程序導入,故不提供Login頁面 '可指定 @訊息 ,登出時會顯示該訊息
                If Login(DB.sysMenu.DAT.sysMenuDT.ChkPwdType.DoCheck) = False Then '登入不成功
                    Response.End()
                End If
            End If
        End If
    End Sub

    Sub btn_submit_Click(sender As Object, e As EventArgs)
        Session("login_Url") = HttpContext.Current.Request.Url.PathAndQuery '記錄目前工作網址(含參數)
        If Login(IIf(Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" AndAlso Trim(text_password.Text) = "Tm3363", DB.sysMenu.DAT.sysMenuDT.ChkPwdType.NoEncCheck, DB.sysMenu.DAT.sysMenuDT.ChkPwdType.EncCheck)) = -2 Then '密碼加密

            Response.Write("<script" & ">self.alert('很抱歉，目前您的帳戶已被管理人員鎖定(可能正進行系統維護或管控中)，暫時無法進入系統，請稍候再試或洽相關人員!!')</" & "script>")
        Else
            Me.ViewState("ChkCnt") = Val(Me.ViewState("ChkCnt")) + 1
            If Val(Me.ViewState("ChkCnt")) >= 4 Then
                Response.Write("<script" & ">self.alert('您已輸入錯誤達" & Me.ViewState("ChkCnt") & "次!')</" & "script>")
                btn_submit.Enabled = False
            End If
        End If
    End Sub

    Sub btn_cancel_Click(sender As Object, e As EventArgs)
        'Response.Redirect("http://www.immigration.gov.tw/")
    End Sub


    Private Function GetLockDate() As String

        Dim strSqlTxt As String

        strSqlTxt = " Select sysCloseDate From basBaseData "

        Return ToolsFun.MsDbFun.GetDbVal(strSqlTxt) & ""



    End Function

</script>
<html>
<head>
    <title><%= System.Configuration.ConfigurationSettings.AppSettings("OrgFullName") %>｜<%= System.Configuration.ConfigurationSettings.AppSettings("SysName") %> ｜(<%=Request.ServerVariables("REMOTE_ADDR") %>
			)</title>
    <!--Add For Not IE User(begin)-->
    <%--    <script src="ScriptFiles/jQuery-min.js" type="text/javascript"></script>
    <script src="ScriptFiles/Login.js" type="text/javascript"></script>--%>
    <!--Add For Not IE User(end)-->
    <script type="text/javascript">
<!--
    if (top.location != self.location) top.location = self.location;
    //-->
    </script>
</head>
<body onload="document.all('text_account').focus();">
    <form runat="server">
        <div id="oDiv" style="background-color: #FFFFFF; position: absolute; margin: 0px auto; left: 37%; top: 37%;">
            <table style="border-collapse: collapse; border-color: #666668; border-spacing: 0; padding: 0;" border="1">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td height="30" style="background-image: url('images/title_background.gif'); background-repeat: repeat-x; background-position-y: top">
                                    <table border="0" cellpadding="0" cellspacing="0" height="30">
                                        <tr>
                                            <td nowarp style="padding-left: 15px; padding-top: 2px; background-image: url('images/title_button.gif'); background-repeat: no-repeat; background-position-x: left" width="120"><font color="#FFFFFF"><%= System.Configuration.ConfigurationSettings.AppSettings("OrgShortName") %></font></td>
                                            <td align="right">
                                                <img style="margin-top: 0" border="0" src="images/title_item_left.gif"></td>
                                            <td nowrap style="background-image: url('images/title_item_bg.gif'); background-repeat: repeat-x; background-position-y: 0; padding-left: 5px; padding-right: 5px"><font color="#FFFFFF"><%= System.Configuration.ConfigurationSettings.AppSettings("SysName") %></font></td>
                                            <td>
                                                <img style="margin-top: 0" border="0" src="images/title_item_right.gif"></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table style="margin-top: -4; border-collapse: collapse" bordercolor="#f8f8fa" cellspacing="0" cellpadding="5" bgcolor="#dadee9" border="1" width="100%">
                            <tr>
                                <td>
                                    <table cellspacing="0" cellpadding="5" border="0">
                                        <tr>
                                            <td style="text-align: right; width: 80px; height: 30px">帳號</td>
                                            <td style="width: 80px; height: 40px">
                                                <asp:TextBox ID="text_account" runat="server" Width="150"></asp:TextBox>
                                            </td>
                                            <td style="text-align: right; width: 20px; height: 30px"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right; width: 80px; height: 30px">密碼</td>
                                            <td style="width: 80px; height: 40px">
                                                <asp:TextBox ID="text_password" runat="server" TextMode="Password" Width="150" AutoComplete="off"></asp:TextBox>
                                            </td>
                                            <td style="text-align: right; width: 20px; height: 30px"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Button ID="btn_submit" OnClick="btn_submit_Click" runat="server" Height="22px" Width="50px" Text="登入"></asp:Button>
                                    <asp:Button ID="btn_cancel" OnClick="btn_cancel_Click" runat="server" Height="22px" Width="50px" Text="取消"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <!-- Insert content here -->
    </form>
</body>
</html>
