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
				thisItem.Text = dataReader("mnuName") &""
				thisItem.Value = dataReader("PK_mnuNo") &""

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
				queStr= "SELECT [mnuName] FROM [sysMenuBase] WHERE ([PK_mnuNo]='" & dataReader("PK_mnuNo") & "')"
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
		    try '97.12.16add
		     ToolsFun.MsDbFun.GetDbVal("select TOP 1 grpMode FROM sysGroupName")
		    catch
		      tr_Mode.Visible=false
		    end try
		    try '97.12.16add
		     ToolsFun.MsDbFun.GetDbVal("select TOP 1 grpLevel FROM sysGroupName")
		    catch
		      tr_Level.Visible=false
		    end try
			Call get_MenuBase()
			Call sort_ListBox(list_members)

			Call BindList()
			'Call sort_ListBox(list_groups)
		End If
	End Sub

	Sub BindList()
		list_groups.DataSource = get_Groups()
		list_groups.DataBind()

		mNum = list_members.Items.Count
	End Sub

	Sub btn_new_Click(sender As Object, e As EventArgs)
		If IsEditing = True Then
			gNum = list_group.Items.Count
			mNum = list_members.Items.Count
			Exit Sub
		End If

		text_grpName.ReadOnly = False
		text_grpName.Text = "新增群組"

		list_group.Items.Clear

		IsEditing = True

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

	Sub btn_add_Click(sender As Object, e As EventArgs)
		If IsEditing <> True Then
			mNum = list_members.Items.Count

			Response.Write("<script" & ">self.alert('請先按一下[新增]，切換至新增模式。')</" & "script>")
			Exit Sub
		End If

		Dim i, j As Integer
		Dim a As New ArrayList
		For i = 0 To list_members.Items.Count-1
			If list_members.Items(i).Selected Then
				If Len(list_members.Items(i).Value) > 1 Then
					'選子項帶父項(往前找)
					For j = Len(list_members.Items(i).Value) To 1 STEP -1
						If list_group.Items.IndexOf(list_group.Items.FindByValue(Left(list_members.Items(i).Value, j))) = -1 Then
						   try
							Dim newItem As New ListItem()
								newItem.Text = list_members.Items(list_members.Items.IndexOf(list_members.Items.FindByValue(Left(list_members.Items(i).Value, j)))).Text
								newItem.Value = Left(list_members.Items(i).Value, j)
							list_group.Items.Add(newItem)

							a.Add(i)
							Catch
							End Try
						End If
					Next j
				End If

				'選父項帶子項(往後找)
				Dim jCount As Integer = 0
				For j = i+1 To list_members.Items.Count-1
					If Left(list_members.Items(j).Value, Len(list_members.Items(i).Value)) = list_members.Items(i).Value Then
						If list_members.Items(j).Selected Then jCount += 1
					End If
				Next j
				If jCount = 0 Then
					For j = i To list_members.Items.Count-1
						If Left(list_members.Items(j).Value, Len(list_members.Items(i).Value)) = list_members.Items(i).Value Then
							If list_group.Items.IndexOf(list_group.Items.FindByText(list_members.Items(j).Text)) = -1 Then
								Dim newItem As New ListItem()
									newItem.Text = list_members.Items(j).Text
									newItem.Value = list_members.Items(j).Value
								list_group.Items.Add(newItem)

								a.Add(j)
							End If
						End If
					Next j
				End If
			End If
		Next i

		For i = (a.Count-1) To 0 STEP -1
			'list_members.Items.RemoveAt(a(i))
		Next

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count

		sort_ListBox(list_group)
	End Sub

	Dim a As New ArrayList
	Sub btn_remove_Click(sender As Object, e As EventArgs)
		If IsEditing <> True Then
			mNum = list_members.Items.Count

			Response.Write("<script" & ">self.alert('請先按一下[新增]，切換至新增模式。')</" & "script>")
			Exit Sub
		End If

		Dim i, j, k As Integer
		a.Clear
		For i = 0 To list_group.Items.Count-1
			If list_group.Items(i).Selected Then
				Dim newItem As New ListItem()
					newItem.Text = list_group.Items(i).Text
					newItem.Value = list_group.Items(i).Value
				'list_members.Items.Add(newItem)

				'a.Add(i)
				to_Array(i)


				'選子項帶父項
				Dim jCount, jSelect As Integer
				'If Len(list_group.Items(i).Value) > 1 Then
					'先掃同層的是不是只有自己
					jCount = 0: jSelect = 0
					For j = 0 To list_group.Items.Count-1
						If Len(list_group.Items(j).Value) = Len(list_group.Items(i).Value) AND Left(list_group.Items(j).Value, Len(list_group.Items(i).Value)-1) = Left(list_group.Items(i).Value, Len(list_group.Items(i).Value)-1) Then
							jCount += 1
							If list_group.Items(j).Selected Then
								jSelect += 1
							End If
						End If
					Next j
				'End If
				If jCount = jSelect Then
					For j = 0 To list_group.Items.Count-1
						If Len(list_group.Items(j).Value) = Len(list_group.Items(i).Value)-1 AND list_group.Items(j).Value = Left(list_group.Items(i).Value, Len(list_group.Items(i).Value)-1) AND list_group.Items(j).Selected = False Then
							Dim newItem1 As New ListItem()
								newItem1.Text = list_group.Items(j).Text
								newItem1.Value = list_group.Items(j).Value
							'list_members.Items.Add(newItem1)

							'a.Add(j)
							to_Array(j): list_group.Items(j).Selected = True
						End If
					Next j
				End If
				'再掃上層
				For k = 0 To list_group.Items.Count-1
					If list_group.Items(k).Selected Then
						'先掃同層的是不是只有自己
						jCount = 0: jSelect = 0
						For j = 0 To list_group.Items.Count-1
							If Len(list_group.Items(j).Value) = Len(list_group.Items(k).Value) AND Left(list_group.Items(j).Value, Len(list_group.Items(k).Value)-1) = Left(list_group.Items(k).Value, Len(list_group.Items(k).Value)-1) Then
								jCount += 1
								If list_group.Items(j).Selected Then
									jSelect += 1
								End If
							End If
						Next j
						If jCount = jSelect Then
							For j = 0 To list_group.Items.Count-1
								If Len(list_group.Items(j).Value) = Len(list_group.Items(k).Value)-1 AND list_group.Items(j).Value = Left(list_group.Items(i).Value, Len(list_group.Items(k).Value)-1) AND list_group.Items(j).Selected = False Then
									Dim newItem1 As New ListItem()
										newItem1.Text = list_group.Items(j).Text
										newItem1.Value = list_group.Items(j).Value
									'list_members.Items.Add(newItem1)

									'a.Add(j)
									to_Array(j): list_group.Items(j).Selected = True
								End If
							Next j
						End If
					End If
				Next k

				'選父項帶子項(往後找)
				For j = i+1 To list_group.Items.Count-1
					If Left(list_group.Items(j).Value, Len(list_group.Items(i).Value)) = list_group.Items(i).Value AND list_group.Items(j).Selected = False Then
						Dim newItem1 As New ListItem()
							newItem1.Text = list_group.Items(j).Text
							newItem1.Value = list_group.Items(j).Value
						'list_members.Items.Add(newItem1)

						'a.Add(j)
						to_Array(j): list_group.Items(j).Selected = True
					End If
				Next j

				For k = 0 To list_group.Items.Count-1
					If list_group.Items(k).Selected Then
						For j = i+1 To list_group.Items.Count-1
							If Len(list_group.Items(j).Value) = Len(list_group.Items(k).Value)+1 AND Left(list_group.Items(j).Value, Len(list_group.Items(k).Value)) = list_group.Items(k).Value AND list_group.Items(j).Selected = False Then
								Dim newItem1 As New ListItem()
									newItem1.Text = list_group.Items(j).Text
									newItem1.Value = list_group.Items(j).Value
								'list_members.Items.Add(newItem1)

								'a.Add(j)
								to_Array(j): list_group.Items(j).Selected = True
							End If
						Next j
					End If
				Next k
			End If
		Next i

		a.Sort
		For i = (a.Count-1) To 0 STEP -1
			'Response.Write(a(i) &",")
			list_group.Items.RemoveAt(a(i))
		Next

		gNum = list_group.Items.Count
		mNum = list_members.Items.Count
	End Sub

Sub to_Array(thisValue As Integer)
	Dim i As Integer
	For i = (a.Count-1) To 0 STEP -1
		If a(i)	 = thisValue Then
			Exit Sub
		End If
	Next
	a.Add(thisValue)
End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)
		If IsEditing = False Then
			mNum = list_members.Items.Count
			Exit Sub
		End If

		Dim PK_grpNo As Integer

		queStr = "SELECT COUNT(*) FROM [sysGroupName] WHERE ([grpName]='" & text_grpName.Text & "' AND [grpEditName]='" & loginUser & "')"
		If CInt(MySqlDbReader(queStr)) <> 0 Then
			text_grpName.Text = "新增群組"

			gNum = list_group.Items.Count
			mNum = list_members.Items.Count

			Response.Write("<script" & ">self.alert('該群組名稱已經存在')</" & "script>")
			Exit Sub
		End If
      try
		queStr = "INSERT INTO [sysGroupName] ([grpName], [grpEditName]) VALUES ('" & text_grpName.Text & "', '" & loginUser & "')"
		Call MySqlDbWriter(queStr)

		queStr = "SELECT TOP 1 [PK_grpNo] FROM [sysGroupName] WHERE ([grpName]='" & text_grpName.Text & "' AND [grpEditName]='" & loginUser & "') ORDER BY [grpEditDTime] DESC"
            PK_grpNo = MySqlDbReader(queStr) & ""
       Catch 'sysGroupName Table 的PK_grpNo欄位未設定自動加1,改為自動取號 '97.12.16add
           PK_grpNo=ToolsFun.MsDbFun.GetDbVal("select ISNULL(max(PK_grpNo),0)+1 FROM sysGroupName")
           queStr = "INSERT INTO [sysGroupName] ([PK_grpNo], [grpName], [grpEditName]) VALUES (" & PK_grpNo & ",'" & text_grpName.Text & "', '" & loginUser & "')"
           Call MySqlDbWriter(queStr)
       End Try

		queStr = ""
		Dim i As Integer
		For i = 0 To list_group.Items.Count-1 '寫入權限
			queStr &= "INSERT INTO [sysGroupData] ([PK_grpNo], [PK_mnuNo]) VALUES (" & PK_grpNo & ", '" & list_group.Items(i).Value & "');"
		Next i

		If queStr <> "" Then Call MySqlDbWriter(queStr)

		'---------------------------------------------------
		if text_grpLevel.Text<>"" AndAlso text_grpMode.Text<>"" Then '支援群組之等階 97.12.16add
		   'if text_grpMode.Text.indexOf("=")<0 Then '格式不符
		   '   text_grpMode.Text=""
		   'End if
		   queStr="UPDATE sysGroupName SET grpMode='" & text_grpMode.Text & "'"
		   if text_grpLevel.Text<>"" Then
		     queStr= queStr & ",grpLevel=" & ToolsFun.StrFun.atoi(text_grpLevel.Text)
		   End if
		  Try
		    ToolsFun.MsDbFun.GetDbExec(queStr & " WHERE PK_grpNo=" & PK_grpNo)
		  Catch
		  End Try
		  text_grpLevel.Text=""
		  text_grpMode.Text=""
		end if
		'---------------------------------------------------



		BindList()
		'sort_ListBox(list_groups)

		text_grpName.Text = ""
		text_grpName.ReadOnly = True

		list_group.Items.Clear

		IsEditing = False

		gNum = ""
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
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">建立新群組</font></td>
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
							<td><img border="0" src="images/icon_ngmember.gif" width="16" height="16"></td>
							<td nowrap><p style="margin-top: 2px"><font size="2" color="#000080">新群組項目<font face="Verdana" size="1"> (<%=gNum %>)</font></font></td>
						</tr>
					</table>
				</td>
				<td align="center" width="50">
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
					<asp:ListBox id="list_groups" runat="server" Width="175px" Rows="20"  DataTextField="grpName" DataValueField="PK_grpNo"></asp:ListBox>
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100" valign="top">
					<asp:ListBox id="list_group" runat="server" Width="200px" Rows="20" SelectionMode="Multiple"></asp:ListBox>
				</td>
				<td align="center" width="50">
					<asp:Button id="btn_add" onclick="btn_add_Click" runat="server" Width="25px" Text="&laquo;" Height="22px" ToolTip="加入指定的項目"></asp:Button>
					<asp:Button id="btn_remove" onclick="btn_remove_Click" runat="server" Width="25px" Text="&raquo;" Height="22px" ToolTip="移除指定的項目"></asp:Button>
				</td>
				<td width="100" valign="top">
					<asp:ListBox id="list_members" runat="server" Width="200px" Rows="20" SelectionMode="Multiple"></asp:ListBox>
				</td>
			</tr>
			<tr>
				<td width="100" valign="top" style="padding-top: 2px">
					<asp:Button id="btn_new" onclick="btn_new_Click" runat="server" Width="50px" Text="新增" Height="22px"></asp:Button>
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
								<td style="padding-right: 1px"><p style="margin-top: 2px"><font size="2" color="#000080">新群組名稱</font></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td><asp:TextBox onfocus="this.select();" id="text_grpName" runat="server" Width="200px" ReadOnly="True" MaxLength="20"></asp:TextBox></td>

					</tr>
					<tr runat=server id=tr_Level>
					    <td><font size="2" color="#000080">等級:</font><asp:TextBox onfocus="this.select();" id="text_grpLevel" runat="server" Width="170px" MaxLength="4" EnableViewState="false"></asp:TextBox></td>
					</tr>
					<tr runat=server id=tr_Mode>
					    <td><font size="2" color="#000080">參數:</font><asp:TextBox onfocus="this.select();" id="text_grpMode" runat="server" Width="170px"  EnableViewState="false"></asp:TextBox></td>
					</tr>
						<td><asp:Button id="btn_update" onclick="btn_update_Click" runat="server" Width="200px" Text="儲存" Height="22px"></asp:Button></td>
					</tr>
				</table>
				</td>
				<td align="center" width="50" valign="top">
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
				<td align="center" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>