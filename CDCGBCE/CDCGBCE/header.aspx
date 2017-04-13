<%@ Page Language="VB" ValidateRequest="false" %>

<%@ Import Namespace="System.Configuration" %>
<%@ OutputCache Location="None" VaryByParam="None" %>
<script runat="server">

    Dim timeOut As Integer

    Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs)
        'timeOut = Server.ScriptTimeout
        'Server.ScriptTimeout = 3600
    End Sub

    Sub Page_Load(Sender As Object, E As EventArgs)
        lab_IsNew.Text = System.Configuration.ConfigurationSettings.AppSettings("tmVersion")

        If Request("name") <> "" Then
            lit_Title.Text = Request("name")
        Else
            lit_Title.Text = System.Configuration.ConfigurationSettings.AppSettings("SysName")
        End If

        'Dim strTmpMenuAlias As String = Server.UrlEncode("{作業年月設定}")
        lit_info.Text = "" &
         "<a href='UI.SystemData.Web/FrmSysEnv.aspx?MenuAlias=" & Server.UrlEncode("{作業年月設定}") & "' target='main' style='text-decoration:none' onFocus='if(this.blur)this.blur();'>" &
         "<font color='white' style='font-size: 8pt'>作業年度 <u><font style='font-size: 14pt' color='DarkOrange'>" & Session("default_Year") & "</font></u>" &
         "∕月份 <u><font style='font-size: 14pt' color='DarkOrange'>" & Session("default_Month") & "</font></u>" &
         "∕操作身分 <u><span title='" & Session("default_UnitNo") & "'>" & Session("default_UnitName") & "</span></u>" &
         "：<u><span title='" & Session("default_UserNo") & "'>" & Session("default_UserName") & "</span></u>" &
         " <sup><font color='DarkOrange'><span title='" & Session("default_TeamNo") & "'>" & Session("default_TeamName") & "</span></font></sup></a>"
    End Sub

    Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs)
        'Server.ScriptTimeout = timeOut
    End Sub

</script>

<html>
<head>
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript">
<!--

    sType = "Left";
    iTime = 1;
    iMove = 1;
    gMove = 1;
    mPoint = 0;
    timerID = 0;
    cols1 = 210;
    cols2 = 0;
    cols3 = "*";

    function movePanel() {
        //if(top.menuFrame.cols=='0,*'){ sType="Right"; } else { sType="Left"; }
        mPoint = iMove;
        if (sType == "Right") {
            sType = "Left";
            document.panel_btn.src = "images/title_logo.gif";
            document.panel_btn.alt = "« 隱藏選單";
        }
        else {
            sType = "Right";
            document.panel_btn.src = "images/title_logo.gif";
            document.panel_btn.alt = "展開選單 »";
        }
        timerID = setInterval("startMove()", iTime);
        try { document.all("menuTop").style.display = "block"; } catch (e) {; }
    }

    function startMove() {
        spStr = top.menuFrame.cols.split(",", 1);
        colLen = parseInt(spStr);
        if (sType == "Right") {
            if (colLen > 0) {
                top.menuFrame.cols = (colLen - mPoint) + "," + cols3;
                try { document.all("menuTop").style.width = (colLen - mPoint); } catch (e) {; }
            }
            else {
                top.menuFrame.cols = cols2 + "," + cols3;
                try { document.all("menuTop").style.width = 0; document.all("menuTop").style.display = "none"; } catch (e) {; }
                clearInterval(timerID);
            }
        }
        else {
            if (colLen < cols1 - mPoint) {
                top.menuFrame.cols = (colLen + mPoint) + "," + cols3;
                try { document.all("menuTop").style.width = (colLen + mPoint); } catch (e) {; }
            }
            else {
                top.menuFrame.cols = cols1 + "," + cols3;
                try { document.all("menuTop").style.width = cols1; document.all("menuTop").style.borderRight = "1px solid #000000"; } catch (e) {; }
                clearInterval(timerID);
            }
        }
        mPoint = mPoint + gMove;
    }

    //-->
    </script>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form runat="server">
        <div id="toolbar" style="position: absolute; top=0; left=0; width: 100%; height: 35px; z-index: 4; background-image: url('images/title_background.gif'); background-repeat: repeat-x; background-position-y: top">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td nowrap>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top"><a onclick="movePanel();" style="cursor: hand">
                                    <img name="panel_btn" border="0" src="images/title_logo.gif" alt="« 隱藏選單" width="60" height="34"></a></td>
                                <td valign="top" nowrap>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <img border="0" src="images/title_split.gif" width="16" height="34"></td>
                                            <td>
                                                <img border="0" src="images/title_item_left.gif" width="8" height="34"></td>
                                            <td align="center" valign="top" style="background-image: url('images/title_item_bg.gif'); background-repeat: repeat-x; background-position-y: top; padding-top: 4px; padding-left: 7px; padding-right: 7px" nowrap>
                                                <asp:Label ID="lit_Title" runat="server" ForeColor="White" Style="font-size: 12pt">系統</asp:Label>
                                                <asp:Label ID="lab_IsNew" runat="server" ForeColor="DarkOrange" Style="font-size: 12pt"></asp:Label>
                                            </td>
                                            <td>
                                                <img border="0" src="images/title_item_right.gif" width="8" height="34">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" align="right" nowrap>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <img border="0" src="images/title_split.gif" width="16" height="34"></td>
                                <td align="right" valign="top" style="padding-top: 3px; padding-left: 5px; padding-right: 10px" nowrap>
                                    <asp:Literal ID="lit_info" runat="server"></asp:Literal></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <table id="menuTop" border="0" width="210" height="100%" cellpadding="0" cellspacing="0" bgcolor="#808080" style="border-right: 1px solid #000000; padding-right: 1px">
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" style="border-right: 1px solid #D4D0C8">
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <!-- Insert content here -->
    </form>
    <script>
        var TimeID = 0;
        var TimeOutMin = 0;
		<%        Response.Write("TimeOutMin = " & Session.Timeout - IIf(Session.Timeout > 1, 1, 0) & ";")    '依Session所設定的時間做更新 %>
        var DefTime = TimeOutMin * 60000;	//19*60sec*1000=1140000;
        function ReSetTime() {
            //alert("timeout");
            window.location.href = "header.aspx?name=" + escape(document.all("lit_Title").innerHTML);
            //window.location.reload();
        }
        function SetTime(Sec) {
            if (TimeID) { clearTimeout(TimeID); TimeID = 0; }
            if (Sec == null) Sec = DefTime;
            if (Sec) TimeID = setTimeout("ReSetTime()", Sec);
            //alert("setTime:" + Sec);
        }
        //SetTime();
        if (DefTime > 0) SetTime();	//設定自動更新

        if (top.menuFrame.cols == '0,*') {
            sType = "Right";
            document.panel_btn.alt = "展開選單 »";
            try { document.all("menuTop").style.display = "none"; } catch (e) {; }
        }
    </script>
</body>
</html>
