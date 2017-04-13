<%@ Page Language="VB" Debug="false" %>
<HTML>
	<HEAD>
		<title>SysMgr</title>
		<script runat="server">
	'nickey:98.05.08
   Sub Page_Load(Sender As Object, E As EventArgs)
     'DB.sysMenu.DAT.sysMenuBZ.CheckLogin() '檢查是否登入,如未登入時將自動導入Login
     'If DB.sysMenu.DAT.sysMenuBZ.CheckMenuID("YY", , DB.sysMenu.DAT.sysMenuBZ.AutoExitType.None) = False Then
     '       Response.Write("您沒有權限使用本功能。")
     '       Response.End()
     'End If
   End Sub
   Public Function GetStr(ByRef Obj As Object) As String
        'Session(列表)
        Dim i As Integer
        Dim Str As String = ""
        'Obj = Session
        Try
            For i = 0 To Obj.Count - 1
                Try
                    Str &= "<br>" & Obj.Keys(i) & " = " & Obj.Item(Obj.Keys(i))
                Catch ex As Exception
                    Str &= "<br>" & Obj.Keys(i) & " = [Object]"
                End Try
            Next
        Catch ex As Exception

        End Try

        'try
        '   If Not DB.sysMenu.DAT.sysMenuBZ.GetKeepSession() Is Nothing Then
        '        Str &= "<br>{KeepSession:" & DB.sysMenu.DAT.sysMenuBZ.GetKeepSession().Count & "}"
        '    End If
        'catch
        'end try
        'response.write(Str)
        Return Str
    End Function

    Private Sub btnDown_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles btnDown.Click
        Dim Sec As Integer = Val(TextBox1.Text)
        If Sec >= 1 Then
            Sec -= 1
        End If
        TextBox1.Text = Sec & " Sec"
    End Sub

    Private Sub btnUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles btnUp.Click
        Dim Sec As Integer = Val(TextBox1.Text) + 1
        TextBox1.Text = Sec & " Sec"
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles btnClose.Click
        HttpContext.Current.Application("login_OpenLevel") = Val(tbLevel.Text)
    End Sub

    Private Sub btnOpen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles btnOpen.Click
        HttpContext.Current.Application.Remove("login_OpenLevel")
    End Sub
     Private Sub btnStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 
        HttpContext.Current.Application("WebWorkRecFlag") = "1"
    End Sub

    Private Sub btnStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        HttpContext.Current.Application.Remove("WebWorkRecFlag")
        
        HttpContext.Current.Application.Remove("WebWorkDate")
        HttpContext.Current.Application.Remove("WebWorkIP")
        HttpContext.Current.Application.Remove("WebWorkUser")
        HttpContext.Current.Application.Remove("WebWorkLastDate")
        HttpContext.Current.Application.Remove("WebWorkLastIP")
        HttpContext.Current.Application.Remove("WebWorkLastUser")
        HttpContext.Current.Application.Remove("WebWorkCurDate")
        HttpContext.Current.Application.Remove("WebWorkCurIP")
        HttpContext.Current.Application.Remove("WebWorkCurUser")
        HttpContext.Current.Application.Remove("WebWorkCurUrl")
    End Sub

    Private Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles MyBase.PreRender
        If Request.QueryString("_Info") Is Nothing then
           Me.RegisterHiddenField("_Info", "1")
        End If 
        If HttpContext.Current.Application("login_OpenLevel") Is Nothing Then 'Open
            btnClose.Enabled = True
            btnOpen.Enabled = False
        Else
            tbLevel.Text = HttpContext.Current.Application("login_OpenLevel")
            btnClose.Enabled = False
            btnOpen.Enabled = True
        End If
        If HttpContext.Current.Application("WebWorkRecFlag") Is Nothing Then 'Stop
            btnStart.Enabled = True
            btnStop.Enabled = False
        Else            
            btnStart.Enabled = False
            btnStop.Enabled = True
        End If
        '在這裡放置使用者程式碼以初始化網頁
        Div2.InnerHtml = "<hr> 線上人數:" & HttpContext.Current.Application("WebLineCnt") & "-" & HttpContext.Current.Application("WebLineDate") & "-" & HttpContext.Current.Application("WebLineIP") & "<br>" & _
                      " 登入人數:" & HttpContext.Current.Application("WebLoginCnt") & "-" & HttpContext.Current.Application("WebLoginDate") & "-" & HttpContext.Current.Application("WebLoginIP") & "-" & HttpContext.Current.Application("WebLoginUser") & "<br>" & _
                      " 前次工作:" & HttpContext.Current.Application("WebWorkDate") & "-" & HttpContext.Current.Application("WebWorkIP") & "-" & HttpContext.Current.Application("WebWorkUser") & "<br>" & _
                      " 上次工作:" & HttpContext.Current.Application("WebWorkLastDate") & "-" & HttpContext.Current.Application("WebWorkLastIP") & "-" & HttpContext.Current.Application("WebWorkLastUser") & "<br>" & _
                      " 目前工作:" & HttpContext.Current.Application("WebWorkCurDate") & "-" & HttpContext.Current.Application("WebWorkCurIP") & "-" & HttpContext.Current.Application("WebWorkCurUser") & "<br>" & _
                      " 工作網址:" & HttpContext.Current.Application("WebWorkCurUrl")
        Label1.Text = Now()
        if Val(Request("_Info")&"")>=2 Then
           pnlSet.Visible=True
           Div1.InnerHtml = "<hr>[Session]" & GetStr(Session) & "<hr>[Applation]" & GetStr(HttpContext.Current.Application) & "<hr>"
        Else
           pnlSet.Visible=False
        end if
        
    End Sub

    Private Sub btnSet_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles btnSet.Click
        If tbSetStr.Text <> "" Then
            Dim Str As String = tbSetStr.Text
            Dim idx As Integer = Str.IndexOf("=")
            If idx > 0 Then
                If ddlKind.SelectedValue = "A" Then
                    HttpContext.Current.Application(Str.Substring(0, idx)) = Str.Substring(idx + 1)
                Else
                    Session(Str.Substring(0, idx)) = Str.Substring(idx + 1)
                End If
            Else
                If ddlKind.SelectedValue = "A" Then
                    tbSetStr.Text = Str & "=" & HttpContext.Current.Application(Str)
                    HttpContext.Current.Application.Remove(Str)
                Else
                    tbSetStr.Text = Str & "=" & Session(Str)
                    Session.Remove(Str)
                End If
            End If
        End If
    End Sub
		</script>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=big5">
		<META http-equiv="Pragma" content="No-cache">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<DIV id="Div2" style="Z-INDEX: 101; LEFT: 8px; WIDTH: 664px; POSITION: absolute; TOP: 72px; HEIGHT: 184px"
				runat="server" ms_positioning="FlowLayout"></DIV>
			<asp:button id="btnDown" style="Z-INDEX: 103; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				Text="<" onclick="btnDown_Click"></asp:button>
			<asp:button id="btnReFlash" style="Z-INDEX: 105; LEFT: 24px; POSITION: absolute; TOP: 8px" runat="server"
				Text="#" Width="16px"></asp:button>
			<asp:button id="btnUp" style="Z-INDEX: 102; LEFT: 40px; POSITION: absolute; TOP: 8px" runat="server"
				Text=">" onclick="btnUp_Click"></asp:button><asp:textbox id="TextBox1" style="Z-INDEX: 104; LEFT: 56px; POSITION: absolute; TOP: 8px" runat="server"
				Width="56px">30 Sec</asp:textbox>
			<asp:Label id="Label1" style="Z-INDEX: 106; LEFT: 120px; POSITION: absolute; TOP: 8px" runat="server"
				Width="168px" EnableViewState="False"></asp:Label>
			<asp:TextBox id="tbLevel" style="Z-INDEX: 107; LEFT: 152px; POSITION: absolute; TOP: 40px" runat="server"
				Width="32px">2</asp:TextBox>
			<DIV style="DISPLAY: inline; Z-INDEX: 108; LEFT: 184px; WIDTH: 48px; POSITION: absolute; TOP: 40px; HEIGHT: 19px"
				ms_positioning="FlowLayout">Level</DIV>
			<asp:Button id="btnClose" style="Z-INDEX: 109; LEFT: 56px; POSITION: absolute; TOP: 40px" runat="server"
				Text="Close" ForeColor="Blue" onclick="btnClose_Click"></asp:Button>
			<asp:Button id="btnOpen" style="Z-INDEX: 110; LEFT: 104px; POSITION: absolute; TOP: 40px" runat="server"
				Text="Open" Enabled="False" ForeColor="Red" onclick="btnOpen_Click"></asp:Button>
			<DIV style="DISPLAY: inline; Z-INDEX: 111; LEFT: 8px; WIDTH: 40px; POSITION: absolute; TOP: 40px; HEIGHT: 19px"
				ms_positioning="FlowLayout">Login:</DIV>
			<asp:Button id="BtnStart" style="Z-INDEX: 112; LEFT: 304px; POSITION: absolute; TOP: 8px" runat="server"
				Text="Start" ForeColor="Blue" OnClick="btnStart_Click"></asp:Button>
			<asp:Button id="btnStop" style="Z-INDEX: 113; LEFT: 344px; POSITION: absolute; TOP: 8px" runat="server"
				Text="Stop" ForeColor="Red" Enabled="False" OnClick="btnStop_Click"></asp:Button>
			<asp:Panel id="pnlSet" style="Z-INDEX: 114; LEFT: 8px; POSITION: absolute; TOP: 264px" runat="server"
				Width="664px" Height="456px" Visible="False">
				<P>
					<asp:Button id="btnSet" runat="server" Text="Set" EnableViewState="False"></asp:Button>
					<asp:TextBox id="tbSetStr" runat="server" Width="136px"></asp:TextBox>
					<asp:DropDownList id="ddlKind" runat="server">
						<asp:ListItem Value="S">Session</asp:ListItem>
						<asp:ListItem Value="A">Applicaion</asp:ListItem>
					</asp:DropDownList></P>
				<DIV id="Div1" style="WIDTH: 656px; HEIGHT: 392px" runat="server" ms_positioning="FlowLayout"></DIV>
			</asp:Panel>
			<script>
		var TimeID = 0;
		var TimeOutMin = 0;
		TimeOutMin = <%=Val(TextBox1.Text)%>;
		var DefTime = TimeOutMin*1000;	//19*60sec*1000=1140000;
		function ReSetTime(){
			//alert("timeout");			
			//window.location.reload();
			Form1.submit();
		}
		function SetTime(Sec){
			if(TimeID) {clearTimeout(TimeID);TimeID=0;}
			if(Sec==null) Sec=DefTime;
			if(Sec) TimeID=setTimeout("ReSetTime()",Sec);
			//alert("setTime:" + Sec);
		}
		//SetTime();
		if(DefTime>0) SetTime();	//設定自動更新		
			</script>
		</form>
	</body>
</HTML>
