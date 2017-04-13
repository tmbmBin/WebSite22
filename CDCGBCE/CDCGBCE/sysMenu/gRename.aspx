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
				queStr= "SELECT ([PK_mnuNo] + ' - '+ [mnuName]) FROM [sysMenuBase] WHERE ([PK_mnuNo]='" & dataReader("PK_mnuNo") & "')"
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
		End If
	End Sub

	Sub BindList()
		list_groups.DataSource = get_Groups()
		list_groups.DataBind()
		'sort_ListBox(list_groups)
	End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)
		If list_groups.SelectedIndex = -1 Then
			gNum = ""	'list_group.Items.Count
			Exit Sub
		End If

		queStr = "SELECT COUNT(*) FROM [sysGroupName] WHERE ([grpName]='" & text_grpName.Text & "' AND [grpEditName]='" & loginUser & "')"
		If CInt(MySqlDbReader(queStr)) <> 0 Then
			text_grpName.Text = ""
			list_groups.SelectedIndex = -1
			list_group.Items.Clear

			Response.Write("<script" & ">self.alert('該群組名稱已經存在')</" & "script>")
			Exit Sub
		End If

		queStr = "UPDATE [sysGroupName] SET [grpName]='" & text_grpName.Text & "' WHERE ([PK_grpNo]=" & list_groups.SelectedItem.Value & ")"
		Call MySqlDbWriter(queStr)

		text_grpName.Text = ""
		list_groups.SelectedIndex = -1

		BindList()
		'sort_ListBox(list_groups)

		gNum = list_group.Items.Count
	End Sub

	Sub list_groups_SelectedIndexChanged(sender As Object, e As EventArgs)
		text_grpName.Text = list_groups.SelectedItem.Text

		list_group.Items.Clear
		Call get_Group(list_groups.SelectedItem.Value)

		gNum = list_group.Items.Count
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
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">重新命名群組</font></td>
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
							<td><img border="0" src="images/icon_ngmember.gif" width="16" height="16"></td>
							<td nowrap><p style="margin-top: 2px"><font size="2" color="#000080">新群組名稱</font></td>
						</tr>
					</table>
				</td>
				<td align="middle" width="43">
				</td>
				<td width="100">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img border="0" src="images/icon_member.gif" width="16" height="16"></td>
							<td style="padding-left: 1px" nowrap><p style="margin-top: 2px"><font size="2" color="#000080">群組項目<font face="Verdana" size="1"> (<%=gNum %>)</font></font></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100" valign="top">
					<asp:ListBox id="list_groups" runat="server" Width="175px" Rows="20"  DataTextField="grpName" DataValueField="PK_grpNo" AutoPostBack="True" OnSelectedIndexChanged="list_groups_SelectedIndexChanged"></asp:ListBox>
				</td>
				<td align="middle" width="35" valign="top">
				</td>
				<td width="100" valign="top">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><asp:TextBox onfocus="this.select();" id="text_grpName" runat="server" Width="175px" MaxLength="20"></asp:TextBox></td>
						</tr>
						<tr>
							<td><asp:Button id="btn_update" onclick="btn_update_Click" runat="server" Width="175px" Text="儲存" Height="22px"></asp:Button></td>
						</tr>
					</table>
				</td>
				<td align="middle" width="43" valign="top">
				</td>
				<td width="100" valign="top">
					<asp:ListBox id="list_group" runat="server" Width="200px" Rows="20" SelectionMode="Multiple"></asp:ListBox>
				</td>
			</tr>
			<tr>
				<td width="100" style="padding-top: 5px" valign="top">
				</td>
				<td align="middle" width="35" style="padding-top: 5px" valign="top">
				</td>
				<td width="100" style="padding-top: 5px" valign="top">
				</td>
				<td align="middle" width="43" style="padding-top: 5px" valign="top">
				</td>
				<td width="100" style="padding-top: 5px" valign="top">
				</td>
			</tr>
			<tr>
				<td width="100">
				</td>
				<td align="middle" width="35">
				</td>
				<td width="100">
				</td>
				<td align="middle" width="43">
				</td>
				<td width="100">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>