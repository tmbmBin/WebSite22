<%@ Page Language="VB" %>
<script runat="server">
'author:nickey
'version:v2.0
'date:96.5.18
Sub Page_Load(Sender As Object, E As EventArgs)
  ShowSession()
End Sub

Sub ShowSession()
        'Session(¦Cªí)
        Dim i As Integer
        Dim Str As String
        For i = 0 To Session.Count - 1
            Try
                Str &= "<br>" & Session.Keys(i) & " = " & Session.Item(Session.Keys(i))
            Catch ex As Exception
                Str &= "<br>" & Session.Keys(i) & " = [Object]"
            End Try
        Next
    'try
    '   If Not DB.sysMenu.DAT.sysMenuBZ.GetKeepSession() Is Nothing Then
    '        Str &= "<br>{KeepSession:" & DB.sysMenu.DAT.sysMenuBZ.GetKeepSession().Count & "}"
    '    End If
    'catch
    'end try
        'response.write(Str)
        DIV1.InnerHtml = Str
End Sub

Sub Button1_Click(sender As Object, e As EventArgs)
 if TextBox1.Text<>""
  session(TextBox1.Text)=TextBox2.Text
  ShowSession()
 end if
End Sub


</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body>
  <form runat="server">
    <asp:Button id="btn_submit"  runat="server" Height="22px" Width="50px" Text="§ó·s"></asp:Button>
    <DIV id="DIV1" style="Z-INDEX: 105; LEFT: 40px; WIDTH: 832px; POSITION: absolute; TOP: 50px; HEIGHT: 100px"
					runat="server" ms_positioning="FlowLayout"></DIV>

        <asp:TextBox id="TextBox1" runat="server" size=16></asp:TextBox>
        <asp:TextBox id="TextBox2" runat="server" size=16></asp:TextBox>
        <asp:Button id="Button1" onclick="Button1_Click" runat="server" Text="Set Session"></asp:Button>
  </form>
</body>
</html>
