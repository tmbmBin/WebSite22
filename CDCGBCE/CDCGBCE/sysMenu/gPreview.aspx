<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Configuration" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<script runat="server">


	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")
	Function MySqlDbReader(queryString As String)
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
		Dim dbCommand As New System.Data.SqlClient.SqlCommand(queryString, dbConnection)
		dbCommand.Connection.Open()
		MySqlDbReader = dbCommand.ExecuteScalar()
		dbConnection.Close()
	End Function

'====================================================================================================

	Sub get_Tree(grpNo As String)
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [PK_mnuNo], [mnuName], [mnuUrl], [mnuHelp] FROM [sysMenuBase] WHERE [PK_mnuNo] IN (SELECT [PK_mnuNo] FROM [sysGroupData] WHERE ([PK_grpNo]=" & grpNo & ")) ORDER BY  [PK_mnuNo]"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		dbConnection.Open
		Dim myReader As System.Data.SqlClient.SqlDataReader = dbCommand.ExecuteReader()
		Try
			While myReader.Read()
				Dim tmpNode As Microsoft.Web.UI.WebControls.TreeNode = New Microsoft.Web.UI.WebControls.TreeNode
				tmpNode.ID = myReader.GetValue(0)
				tmpNode.CheckBox = True
				tmpNode.Text = myReader.GetValue(0) & " " & myReader.GetValue(1)
				If Not IsDBNull(myReader.GetValue(2)) Then
					tmpNode.NavigateUrl = myReader.GetValue(2)
				End If

				add_Node(tmpNode)

				If Len(tmpNode.ID) > maxLen Then maxLen = Len(tmpNode.ID)
				maxNum += 1
			End While
		Catch ex as Exception

		Finally
			myReader.Close()
			dbConnection.Close()
		End Try
	End Sub

	Dim rootID As Integer = 0
	Sub add_Node(ByVal newNode As TreeNode)
		'Response.Write(newNode.ID & "," & Len(newNode.ID) & ", ")
		If Len(newNode.ID) = 1 Then
			'Response.Write("TreeView1.Nodes.Add(newNode)<br>")
			TreeView1.Nodes.Add(newNode)
			'有樹根時
			'TreeView1.Nodes(0).Nodes.Add(newNode)

			rootID += 1
		Else
			'Response.Write("add_Node1(TreeView1.Nodes(rootID-1), newNode, " & Len(TreeView1.Nodes(rootID-1).ID) & " + 1), ")
			add_Node1(TreeView1.Nodes(rootID-1), newNode, Len(TreeView1.Nodes(rootID-1).ID) + 1)
			'有樹根時
			'add_Node1(TreeView1.Nodes(0).Nodes(rootID-1), newNode, Len(TreeView1.Nodes(0).Nodes(rootID-1).ID) + 1)
		End If
	End Sub

	Sub add_Node1(ByVal lstNode As TreeNode, ByVal newNode As TreeNode, ByVal i As Integer)
		If Len(newNode.ID) <> i Then
			'Response.Write("add_Node1(lstNode.Nodes(lstNode.Nodes.Count-1), newNode, " & i & " + 1), ")
			add_Node1(lstNode.Nodes(lstNode.Nodes.Count-1), newNode, i + 1)
		Else
			'Response.Write("lstNode.Nodes.Add(newNode)<br>")
			lstNode.Nodes.Add(newNode)
		End If
	End Sub

'====================================================================================================

	Dim queStr As String
	Dim maxLen As Integer = 0
	Dim maxNum As Integer
	Dim totalTime As Integer
	Sub Page_Load(sender As Object, e As EventArgs)	     
		If Request.QueryString("gNo") = Nothing Then Exit Sub
        DB.sysMenu.DAT.sysMenuBZ.CheckMenuID() '檢查是否已登入且本單元是否有使用權,無時用權時顯示"您沒有權限進入此單元"並終止工作,而未登入時重導至Login畫面
		If Not Page.IsPostBack Then

		'Dim rootNode As TreeNode = New TreeNode
		'rootNode.Text = "樹根"
		'TreeView1.Nodes.Add(rootNode)

		'效能測試
		Dim startTime, endTime As DateTime
		Dim span As TimeSpan
		startTime = DateTime.Now()
			get_Tree(Request.QueryString("gNo"))
		endTime = DateTime.Now()

		span = New TimeSpan(endTime.Ticks - startTime.Ticks)
		totalTime = span.TotalMilliseconds.ToString()

			TreeView1.ExpandLevel = maxLen - 1
		End If
	End Sub

</script>
<html>
<head>
<title>清單群組預覽</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<script language="javascript">
<!--
resizeTo(250,screen.availHeight);
moveTo((screen.width-250)/2,0);

function go_right_bottom(){
gift.style.top=document.body.clientHeight-20+document.body.scrollTop;
gift.style.width=document.body.clientWidth+8;
}

//-->
</script>
</head>
<body style="overflow: hidden" onload='gift.style.posLeft=document.body.clientWidth-250+document.body.scrollLeft; gift.style.posTop=document.body.clientHeight-20+document.body.scrollTop' onscroll="go_right_bottom()" onresize="go_right_bottom()" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="AliceBlue" onkeydown="if (event.keyCode==116){reload.click()}">
	<base target="_self">
	<form runat="server">
		<div align="center">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
					<iewc:TreeView id="TreeView1" runat="server" BackColor="AliceBlue"></iewc:TreeView><br>
					<font face="Verdana" size="1">&raquo; <% =totalTime %> Milliseconds to run.</font>
				</td>
			</tr>
		</table>
		</div>
		<a id="reload" href="gPreview.aspx?gNo=<%= Request.QueryString("gNo") %>" style="display:none">重新整理(F5)</a>
		<div id="gift" style="position: absolute; width: auto; height: auto; z-index: 1; background-color: #D4D0C8"><p align="center"><input type="button" value="關閉" onclick="window.close()" style="height: 22px; width: 252px; border-style: solid; border-width: 0"></div>
		<!-- Insert content here -->
	</form>
</body>
</html>
