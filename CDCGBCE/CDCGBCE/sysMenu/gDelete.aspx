<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Configuration" %>
<script runat="server">

	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Function get_Groups() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [PK_grpNo], [grpName] FROM [sysGroupName]"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_Group(ByVal PK_grpNo As Integer) As System.Data.IDataReader
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [PK_mnuNo] FROM [sysGroupData] WHERE ([PK_grpNo] = @PK_grpNo)"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dbParam_PK_grpNo As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_PK_grpNo.ParameterName = "@PK_grpNo"
		dbParam_PK_grpNo.Value = PK_grpNo
		dbParam_PK_grpNo.DbType = System.Data.DbType.Int32
		dbCommand.Parameters.Add(dbParam_PK_grpNo)

		dbConnection.Open
		Dim dataReader As System.Data.IDataReader

		dataReader = dbCommand.ExecuteReader

		Do While dataReader.Read

			Dim thisItem As New ListItem()
				queStr= "SELECT ([PK_mnuNo] + ' - '+ [mnuName]) AS [mnuName] FROM [sysMenuBase] WHERE ([PK_mnuNo]='" & dataReader("PK_mnuNo") & "')"
				thisItem.Text = MySqlDbReader(queStr) &""
				thisItem.Value = dataReader("PK_mnuNo")

			list_group.Items.Add(thisItem)
		Loop

		dataReader.Close
		dbConnection.Close
	End Function

	Function MySqlDbReader(queryString As String)
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
		Dim dbCommand As New System.Data.SqlClient.SqlCommand(queryString, dbConnection)
		dbCommand.Connection.Open()
		MySqlDbReader = dbCommand.ExecuteScalar()
		dbConnection.Close()
	End Function

	Function MySqlDbWriter(queryString As String)
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
		Dim dbCommand As New System.Data.SqlClient.SqlCommand(queryString, dbConnection)
		dbCommand.Connection.Open()
		dbCommand.ExecuteNonQuery()
		dbConnection.Close()
	End Function

	Sub sort_ListBox(ByRef thisListBox As ListBox)
		Dim dt As System.Data.DataTable =  New System.Data.DataTable()
			dt.Columns.Add("text")
			dt.Columns.Add("value")
		Dim dr As System.Data.DataRow

		Dim i As Integer
		For  i = 0 To  thisListBox.Items.Count-1  STEP  i+1
			dr = dt.NewRow()
			dr("text") = thisListBox.Items(i).Text
			dr("value") = thisListBox.Items(i).Value
			dt.Rows.Add(dr)
		Next

		Dim dv As System.Data.DataView =  dt.DefaultView
			dv.Sort = "text"

		thisListBox.DataSource = dv
		thisListBox.DataTextField = "text"
		thisListBox.DataValueField = "value"
		thisListBox.DataBind()

		dt.Clear()
	End Sub

	Dim gNum, mNum As String
	Dim queStr, loginUser As String
	Sub Page_Load(Sender As Object, E As EventArgs)
        DB.sysMenu.DAT.sysMenuBZ.CheckMenuID() '檢查是否已登入且本單元是否有使用權,無時用權時顯示"您沒有權限進入此單元"並終止工作,而未登入時重導至Login畫面
		loginUser = HttpContext.Current.Session("login_UserName")
		If loginUser = "" Then loginUser = "Admin"

		If Not Page.IsPostBack Then
			Call BindList()
			'Call sort_ListBox(list_groups)

			Dim myDeleteButton As Button
			myDeleteButton = CType(FindControl("btn_delete"), Button)
			If Not myDeleteButton Is Nothing Then
				myDeleteButton.Attributes.Add("onclick","return confirm('按一下[確定]，永遠刪除該群組。您無法復原這項變更。');")
			End If
		End If
	End Sub

	Sub BindList()
		list_groups.DataSource = get_Groups()
		list_groups.DataBind()
		'sort_ListBox(list_groups)
	End Sub

	Sub btn_delete_Click(sender As Object, e As EventArgs)
		If list_groups.SelectedIndex = -1 Then Exit Sub

		Dim OgID As String = list_groups.SelectedItem.Value

		queStr = "DELETE FROM [sysGroupData] WHERE ([PK_grpNo]='" & OgID & "')"
		Call MySqlDbWriter(queStr)

		queStr = "DELETE FROM [sysGroupName] WHERE ([PK_grpNo]=" & OgID & ")"
		Call MySqlDbWriter(queStr)

		text_gName.ReadOnly = False
		text_gName.Text = ""

		list_group.Items.Clear

		BindList()
	End Sub

	Sub list_groups_SelectedIndexChanged(sender As Object, e As EventArgs)
		text_gName.Text = list_groups.SelectedItem.Text
		text_gName.ReadOnly = True

		list_group.Items.Clear
		Call get_Group(list_groups.SelectedItem.Value)

		gNum = list_group.Items.Count
	End Sub

	Sub btn_preview_Click(sender As Object, e As EventArgs)
		If list_groups.SelectedIndex = -1 Then Exit Sub

		Dim OgID As String = list_groups.SelectedItem.Value

		'Dim urlStr As String = "<script" & ">window.open('gPreview.aspx?gNo=" & OgID & "', 'preview');</" & "script>"
		Dim urlStr As String = "<script" & ">window.showModelessDialog('gPreview.aspx?gNo=" & OgID & "','Dialog Box Arguments # 1','dialogHeight: screen.availHeight; dialogWidth: 250px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: No;');</" & "script>"
		Response.Write(urlStr)
	End Sub

</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body style="background-image: url('images/bg_FFFFFF_D4DEF4.gif'); background-repeat: repeat-x; background-position-y: top; background-attachment: fixed" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<form runat="server">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top: -5; background-image: url('images/header_bg.gif'); background-repeat: repeat-x; background-position: left top" height="45">
			<tr>
				<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="45">
					<tr>
						<td style="background-image: url('images/header_right.gif'); background-repeat: no-repeat; background-position: right bottom">
						<table border="0" cellpadding="0" cellspacing="0" height="45">
							<tr>
								<td valign="bottom" width="58" rowspan="2"><img border="0" src="images/header_left.gif" width="58" height="33"></td>
								<td height="24" valign="bottom" nowrap>　</td>
							</tr>
							<tr>
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">刪除群組</font></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table style="margin-left: 15; margin-top: 15" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="100">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img border="0" src="images/icon_group.gif" width="16" height="16"></td>
							<td style="padding-left: 1px"><p style="margin-top: 2px"><font size="2" color="#000080">現有群組</font></td>
						</tr>
					</table>
				</td>
				<td align="middle" width="35">
				</td>
				<td width="100">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img border="0" src="images/icon_gmember.gif" width="16" height="16"></td>
							<td style="padding-left: 1px" nowrap><p style="margin-top: 2px"><font size="2" color="#000080">群組項目<font face="Verdana" size="1"> (<%=gNum %>)</font></font></td>
						</tr>
					</table>
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
			<tr>
				<td width="100">
					<asp:ListBox id="list_groups" runat="server" Width="175px" Rows="20"  DataTextField="grpName" DataValueField="PK_grpNo" AutoPostBack="True" OnSelectedIndexChanged="list_groups_SelectedIndexChanged"></asp:ListBox>
				</td>
				<td align="middle" width="35">
				</td>
				<td width="100">
					<asp:ListBox id="list_group" runat="server" Width="175px" Rows="20" SelectionMode="Multiple"></asp:ListBox>
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
			<tr>
				<td width="100" style="padding-top: 2px" valign="top">
					<asp:Button id="btn_delete" onclick="btn_delete_Click" runat="server" Width="50px" Text="刪除" Height="22px"></asp:Button>
				</td>
				<td align="middle" width="35" style="padding-top: 5px" valign="top">
				</td>
				<td width="100" style="padding-top: 2px" valign="top" style="display:none">
					<asp:Button id="btn_preview" onclick="btn_preview_Click" runat="server" Width="175px" Text="預覽" Height="22px"></asp:Button><asp:TextBox onfocus="this.select();" id="text_gName" runat="server" Width="175px" ReadOnly="True" Visible="False"></asp:TextBox>
				</td>
				<td align="middle" width="50" style="padding-top: 5px" valign="top">
				</td>
				<td width="100" valign="top">
				</td>
			</tr>
			<tr>
				<td width="100">
				</td>
				<td align="middle" width="35">
				</td>
				<td width="100">
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>