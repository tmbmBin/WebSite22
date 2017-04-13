<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Configuration" %>
<script runat="server">

	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Function get_MenuBase() As System.Data.IDataReader
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		'Dim queryString As String = "SELECT [PK_mnuNo], [mnuName] FROM [sysMenuBase]"
		Dim queryString As String = "SELECT [PK_mnuNo], ([PK_mnuNo] + ' - ' + [mnuName] + ' ' + ISNULL(mnuHint, '')) As [mnuName] FROM [sysMenuBase]"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		dbConnection.Open
		Dim dataReader As System.Data.IDataReader

		dataReader = dbCommand.ExecuteReader

		Do While dataReader.Read

			Dim thisItem As New ListItem()
				thisItem.Text = dataReader("mnuName")
				thisItem.Value = dataReader("PK_mnuNo")

			list_members.Items.Add(thisItem)
		Loop

		dataReader.Close
		dbConnection.Close
	End Function

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
				queStr= "SELECT ([PK_mnuNo] + ' - '+ [mnuName]) FROM [sysMenuBase] WHERE ([PK_mnuNo]='" & dataReader("PK_mnuNo") & "')"
            thisItem.Text = MySqlDbReader(queStr) & ""
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

	Property IsEditing() As Boolean
		Get
			Dim o As Object = ViewState("IsEditing")
			If o Is Nothing Then
				Return False
			End If
			Return CBool(o)
		End Get

		Set(ByVal Value As Boolean)
			ViewState("IsEditing") = Value
		End Set
	End Property

	Dim gNum, mNum As String
	Dim queStr, loginUser As String
	Sub Page_Load(Sender As Object, E As EventArgs)
        DB.sysMenu.DAT.sysMenuBZ.CheckMenuID() '檢查是否已登入且本單元是否有使用權,無時用權時顯示"您沒有權限進入此單元"並終止工作,而未登入時重導至Login畫面
		loginUser = HttpContext.Current.Session("login_UserName")
		If loginUser = "" Then loginUser = "Admin"

		If Not Page.IsPostBack Then
			Call get_MenuBase()
			Call sort_ListBox(list_members)

			Call BindList()
			'Call sort_ListBox(list_groups)

			Dim myDeleteButton As Button
			myDeleteButton = CType(FindControl("btn_delete"), Button)
			If Not myDeleteButton Is Nothing Then
				myDeleteButton.Attributes.Add("onclick","return confirm('按一下[確定]，永遠刪除該群組。您無法復原這項變更。');")
			End If
		End If

		gNum = ""
	End Sub

	Sub BindList()
		list_groups.DataSource = get_Groups()
		list_groups.DataBind()
		'sort_ListBox(list_groups)

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

	Sub btn_edit_Click(sender As Object, e As EventArgs)
		'text_grpName.ReadOnly = False

		IsEditing = True

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

	Sub btn_delete_Click(sender As Object, e As EventArgs)
		If list_groups.SelectedIndex = -1 Then
			mNum = list_members.Items.Count
			Exit Sub
		End If

		Dim OgID As String = list_groups.SelectedItem.Value

		queStr = "DELETE FROM [sysGroupData] WHERE ([PK_grpNo]='" & OgID & "')"
		Call MySqlDbWriter(queStr)

		queStr = "DELETE FROM [sysGroupName] WHERE ([PK_grpNo]=" & OgID & ")"
		Call MySqlDbWriter(queStr)

		text_grpName.ReadOnly = False
		text_grpName.Text = ""

		list_group.Items.Clear

		BindList()

		IsEditing = False
	End Sub

	Sub btn_add_Click(sender As Object, e As EventArgs)
		If IsEditing <> True Then
			gNum = list_group.Items.Count
			mNum = list_members.Items.Count

			Response.Write("<script" & ">self.alert('請先按一下[編輯]，切換至編輯模式。')</" & "script>")
			Exit Sub
		End If

		Dim i As Integer
		Dim a As New ArrayList
		For i = 0 To list_members.Items.Count-1
			If list_members.Items(i).Selected Then
				If list_group.Items.IndexOf(list_group.Items.FindByText(list_members.Items(i).Text)) = -1 Then
					Dim newItem As New ListItem()
						newItem.Text = list_members.Items(i).Text
						newItem.Value = list_members.Items(i).Value
					list_group.Items.Add(newItem)

					a.Add(i)
				End If
			End If
		Next i

		For i = (a.Count-1) To 0 STEP -1
			'list_members.RemoveAt(a(i))
		Next

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

	Sub btn_remove_Click(sender As Object, e As EventArgs)
		If IsEditing <> True Then
			gNum = list_group.Items.Count
			mNum = list_members.Items.Count

			Response.Write("<script" & ">self.alert('請先按一下[編輯]，切換至編輯模式。')</" & "script>")
			Exit Sub
		End If

		Dim i As Integer
		Dim a As New ArrayList
		For i = 0 To list_group.Items.Count-1
			If list_group.Items(i).Selected Then
				Dim newItem As New ListItem()
					newItem.Text = list_group.Items(i).Text
					newItem.Value = list_group.Items(i).Value
				'list_members.Items.Add(newItem)

				a.Add(i)
			End If
		Next i

		For i = (a.Count-1) To 0 STEP -1
			list_group.Items.RemoveAt(a(i))
		Next

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)
		If IsEditing = False Then
			gNum = list_group.Items.Count
			mNum = list_members.Items.Count
			Exit Sub
		End If

		Dim NgID As String

		queStr = "SELECT TOP 1 [PK_grpNo] FROM [sysGroupName] WHERE ([grpName]='" & text_grpName.Text & "' AND [grpEditName]='" & loginUser & "') ORDER BY [grpEditDTime] DESC"
        NgID = MySqlDbReader(queStr) & ""

		queStr = "DELETE FROM [sysGroupData] WHERE ([PK_grpNo]='" & NgID & "')"
		Call MySqlDbWriter(queStr)

		Dim i As Integer
		For i = 0 To list_group.Items.Count-1
			queStr = "INSERT INTO [sysGroupData] ([PK_grpNo], [PK_mnuNo]) VALUES (" & NgID & ", '" & list_group.Items(i).Value & "')"
			Call MySqlDbWriter(queStr)
		Next i

		BindList()
		'sort_ListBox(list_groups)

		IsEditing = False
	End Sub

	Sub list_groups_SelectedIndexChanged(sender As Object, e As EventArgs)
		text_grpName.Text = list_groups.SelectedItem.Text
		text_grpName.ReadOnly = True

		list_group.Items.Clear
		Call get_Group(list_groups.SelectedItem.Value)

		IsEditing = False

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

</script>
<html>
<head>
</head>
<body style="background-image: url('images/bg_FFFFFF_D4DEF4.gif'); background-repeat: repeat-x; background-position-y: top; background-attachment: fixed" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<form runat="server">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-image: url('images/header_bg.gif'); background-repeat: repeat-x; background-position: left top" height="45">
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
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">管理群組</font></td>
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
				<td align="middle" width="50">
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
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img border="0" src="images/icon_member.gif" width="16" height="16"></td>
							<td style="padding-left: 1px" nowrap><p style="margin-top: 2px"><font size="2" color="#000080">現有項目<font face="Verdana" size="1"> (<%=mNum %>)</font></font></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100" valign="top">
					<asp:ListBox id="list_groups" runat="server" Width="100px" Rows="20"  DataTextField="grpName" DataValueField="PK_grpNo" AutoPostBack="True" OnSelectedIndexChanged="list_groups_SelectedIndexChanged"></asp:ListBox>
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100" valign="top">
					<asp:ListBox id="list_group" runat="server" Width="175px" Rows="20" SelectionMode="Multiple"></asp:ListBox>
				</td>
				<td align="middle" width="50">
					<asp:Button id="btn_add" onclick="btn_add_Click" runat="server" Width="25px" Text="&laquo;" Height="22px" ToolTip="加入指定的項目"></asp:Button>
					<asp:Button id="btn_remove" onclick="btn_remove_Click" runat="server" Width="25px" Text="&raquo;" Height="22px" ToolTip="移除指定的項目"></asp:Button>
				</td>
				<td width="100" valign="top">
					<asp:ListBox id="list_members" runat="server" Width="175px" Rows="20" SelectionMode="Multiple"></asp:ListBox>
				</td>
			</tr>
			<tr>
				<td width="100" valign="top" style="padding-top: 2px">
					<asp:Button id="btn_edit" onclick="btn_edit_Click" runat="server" Width="50px" Text="編輯" Height="22px"></asp:Button><asp:Button id="btn_delete" onclick="btn_delete_Click" runat="server" Width="50px" Text="刪除" Height="22px"></asp:Button>
				</td>
				<td align="middle" width="50" valign="top">
				</td>
				<td width="100" valign="top" style="padding-top: 5px">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td></td>
								<td style="padding-right: 1px"><p style="margin-top: 2px"><font size="2" color="#000080">群組名稱</font></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td><asp:TextBox onfocus="this.select();" id="text_grpName" runat="server" Width="175px" ReadOnly="True"></asp:TextBox></td>
					</tr>
					<tr>
						<td><asp:Button id="btn_update" onclick="btn_update_Click" runat="server" Width="175px" Text="儲存" Height="22px"></asp:Button></td>
					</tr>
				</table>
				</td>
				<td align="middle" width="50" valign="top">
				</td>
				<td width="100" valign="top">
				</td>
			</tr>
			<tr>
				<td width="100">
				</td>
				<td align="middle" width="50">
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