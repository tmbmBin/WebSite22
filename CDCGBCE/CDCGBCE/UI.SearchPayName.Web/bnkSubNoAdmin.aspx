<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<script runat="server">

	' TODO: update the ConnectionString and Command values for your application

	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	'Dim SelectCommand As String = "SELECT * FROM [codBankSubName] ORDER BY [bnksBankSubNo] DESC"
	Dim SelectStr As String = "SELECT * FROM [codBankSubName]"
	Dim WhereStr As String = ""
	Dim OrderByStr  As String = " ORDER BY [bnksBankSubNo] DESC"
	Dim SelectCommand As String

	Dim isEditing As Boolean = False

	Property AddingNew() As Boolean
		Get
			Dim o As Object = ViewState("AddingNew")
			If o Is Nothing Then
				Return False
			End If
			Return CBool(o)
		End Get

		Set(ByVal Value As Boolean)
			ViewState("AddingNew") = Value
		End Set
	End Property

	Dim queStr, loginUser, totalNum As String
	Sub Page_Load(Sender As Object, E As EventArgs)

	'==================================================
'		If Session("UserLogin") Is Nothing Then
'			Response.Redirect("../")
'		End If
'		loginUser = Session("UserName")
	'==================================================

		'loginUser = "Admin"

		If Not Page.IsPostBack Then

			' Databind the data grid on the first request only
			' (on postback, bind only in editing, paging and sorting commands)
			BindGrid()
		End If
	End Sub

	Sub DataGrid_ItemCreated(Sender As Object, e As DataGridItemEventArgs)
		Select Case e.Item.ItemType
			Case ListItemType.Item, ListItemType.AlternatingItem, ListItemType.EditItem
				Dim myTableCell As TableCell
				myTableCell = e.Item.Cells(1)
				Dim myDeleteButton As LinkButton
				myDeleteButton = myTableCell.Controls(0)
				myDeleteButton.Attributes.Add("onclick","return confirm('按一下[確定]，永遠刪除這一列。您無法復原這項變更。');")
			Case ListItemType.Header
				'標頭合併
				Dim tcl As TableCellCollection =  e.Item.Cells
				tcl.RemoveAt(4)
				tcl(3).ColumnSpan = 2
				tcl(3).Text = "分行代號∕名稱"
				'tcl.RemoveAt(1)
				'tcl(0).ColumnSpan = 2
		End Select
	End Sub

	Sub Item_DataBound(sender As Object, e As DataGridItemEventArgs)
		Select Case e.Item.ItemType
			Case ListItemType.EditItem

		End Select
	End Sub

	Sub DataGrid_ItemCommand(Sender As Object, E As DataGridCommandEventArgs)

		' this event fires prior to all of the other commands
		' use it to provide a more graceful transition out of edit mode
		CheckIsEditing(e.CommandName)
	End Sub

	Sub CheckIsEditing(commandName As String)

		If DataGrid1.EditItemIndex <> -1 Then

			' we are currently editing a row
			If commandName <> "Cancel" And commandName <> "Update" Then

				' user's edit changes (If any) will not be committed
				Message.Text = "Your changes have not been saved yet.  Please press update to save your changes, or cancel to discard your changes, before selecting another item."
				isEditing = True
			End If
		End If
	End Sub

	Sub DataGrid_Edit(Sender As Object, E As DataGridCommandEventArgs)

		' turn on editing for the selected row
		If Not isEditing Then

			DataGrid1.EditItemIndex = e.Item.ItemIndex
			BindGrid()

			Me.ViewState("EditItemValue") = CType(sender.Items(DataGrid1.EditItemIndex).Cells(2).FindControl("list_mBnkNo"), DropDownList).SelectedItem.Value & "|" & CType(sender.Items(DataGrid1.EditItemIndex).Cells(3).Controls(0), TextBox).Text
		End If
	End Sub

	Sub DataGrid_Update(Sender As Object, E As DataGridCommandEventArgs)

		' update the database with the new values

		' get the edit text boxes
		'Dim bnksBankSubNo As String = DataGrid1.DataKeys(e.Item.ItemIndex)
		Dim bnkBankNo As String = CType(e.Item.Cells(2).FindControl("list_mBnkNo"), DropDownList).SelectedItem.Value
		Dim bnksBankSubNo As String = Trim(CType(e.Item.Cells(3).Controls(0), TextBox).Text)
		Dim bnksBankSubName As String = Trim(CType(e.Item.Cells(4).Controls(0), TextBox).Text)
		Dim bnksStopFlag As Boolean = CType(e.Item.Cells(5).FindControl("check_blocked"), CheckBox).Checked

		If bnksBankSubNo = "" OR bnksBankSubName = "" Then
			Response.Write("<script" & ">self.alert('該分行∕支局代號或名稱空不得空白')</" & "script>")
			Exit Sub
		End If

		If AddingNew = True Then
			queStr = "SELECT COUNT(*) FROM [codBankSubName] WHERE ([bnksBankSubName]='" & bnksBankSubName  & "') OR ([bnksBankSubNo]='" & bnksBankSubNo & "')"
			If CInt(MySqlDbReader(queStr)) > 0 Then
				Response.Write("<script" & ">self.alert('該分行∕支局代號或名稱已經存在')</" & "script>")
				Exit Sub
			End If
		Else
			'queStr = "SELECT COUNT(*) FROM [codBankSubName] WHERE ([bnkBankNo]='" & bnkBankNo  & "')" AND ([bnksBankSubNo]='" & bnksBankSubNo & "')"
			'If CInt(MySqlDbReader(queStr)) > 0 Then
			'	queStr = "SELECT [bnksBankSubNo] FROM [codBankSubName] WHERE [bnksBankSubName]='" & bnksBankSubName  & "'"
			'	If CStr(MySqlDbReader(queStr)) <> bnksBankSubNo
			'		Response.Write("<script" & ">self.alert('該分行∕支局名稱已經存在')</" & "script>")	'分行代號不得修改
			'		Exit Sub
			'	End If
			'End If
		End If

		' TODO: update the Command value for your application
		Dim myConnection As New SqlConnection(ConnectionString)
		Dim UpdateCommand As SqlCommand = new SqlCommand()
		UpdateCommand.Connection = myConnection

		If AddingNew = True Then
			UpdateCommand.CommandText = "INSERT INTO [codBankSubName] ([bnkBankNo], [bnksBankSubNo], [bnksBankSubName], [bnksStopFlag]) VALUES (@bnkBankNo, @bnksBankSubNo, @bnksBankSubName, @bnksStopFlag)"
			UpdateCommand.Parameters.Add("@bnkBankNo", System.Data.DbType.String).Value = bnkBankNo
			UpdateCommand.Parameters.Add("@bnksBankSubNo", System.Data.DbType.String).Value = bnksBankSubNo
		Else
			'UpdateCommand.CommandText = "UPDATE [codBankSubName] SET [bnksBankSubName]=@bnksBankSubName, [bnksStopFlag]=@bnksStopFlag WHERE ([bnkBankNo]='" & bnkBankNo & "') AND ([bnksBankSubNo]='" & bnksBankSubNo & "')"

			Dim oldValue() As String = Split(Me.ViewState("EditItemValue"), "|")
			UpdateCommand.CommandText = "UPDATE [codBankSubName] SET [bnkBankNo]=@bnkBankNo, [bnksBankSubNo]=@bnksBankSubNo, [bnksBankSubName]=@bnksBankSubName, [bnksStopFlag]=@bnksStopFlag WHERE ([bnkBankNo]='" & oldValue(0) & "') AND ([bnksBankSubNo]='" & oldValue(1) & "')"

			UpdateCommand.Parameters.Add("@bnkBankNo", System.Data.DbType.String).Value = bnkBankNo
			UpdateCommand.Parameters.Add("@bnksBankSubNo", System.Data.DbType.String).Value = bnksBankSubNo
		End If

		UpdateCommand.Parameters.Add("@bnksBankSubName", System.Data.DbType.String).Value = bnksBankSubName
		UpdateCommand.Parameters.Add("@bnksStopFlag", System.Data.DbType.String).Value = Bool2Str(bnksStopFlag)

		' execute the command
		Try
			myConnection.Open()
			UpdateCommand.ExecuteNonQuery()
		Catch ex as Exception
			Message.Text = ex.ToString()
		Finally
			myConnection.Close()
		End Try

		' Resort the grid for new records
		If AddingNew = True Then
			DataGrid1.CurrentPageIndex = 0
			AddingNew = false
		End If

		' rebind the grid
		DataGrid1.EditItemIndex = -1
		BindGrid()
	End Sub

	Sub DataGrid_Cancel(Sender As Object, E As DataGridCommandEventArgs)

		' cancel editing
		DataGrid1.EditItemIndex = -1
		BindGrid()

		AddingNew = False
	End Sub

	Sub DataGrid_Delete(Sender As Object, E As DataGridCommandEventArgs)

		' delete the selected row
		If Not isEditing Then

			' the key value for this row is in the DataKeys collection
			Dim keyValue As String = CStr(DataGrid1.DataKeys(e.Item.ItemIndex))

			'檢查該代號是否已被使用
			'queStr = "SELECT COUNT(*) FROM [payMember] WHERE ([mBnkSubNo]='" & keyValue & "')"
			'If CInt(mySqlDbReader(queStr)) > 0 Then
			'	Response.Write("<script" & ">self.alert('該分行∕支局代號已被使用中，不得刪除'); </" & "script>")
			'	Exit Sub
			'End If

			' TODO: update the Command value for your application
			Dim myConnection As New SqlConnection(ConnectionString)
			Dim DeleteCommand As New SqlCommand("DELETE FROM [codBankSubName] WHERE ([bnkBankNo]='" & CType(e.Item.Cells(2).FindControl("lab_mBnkNo"), Label).Text & "') AND ([bnksBankSubNo]='" & keyValue & "')", myConnection)

			' execute the command
			myConnection.Open()
			DeleteCommand.ExecuteNonQuery()
			myConnection.Close()

			' rebind the grid
			DataGrid1.CurrentPageIndex = 0
			DataGrid1.EditItemIndex = -1
			BindGrid()

			Response.Write("<script" & ">self.alert('資料刪除成功'); </" & "script>")
		End If
	End Sub

	Sub AddNew_Click(Sender As Object, E As EventArgs)

		' add a new row to the end of the data, and set editing mode 'on'

		CheckIsEditing("")

		If Not isEditing = True Then

			SelectCommand = SelectStr + WhereStr + OrderByStr

			' set the flag so we know to do an insert at Update time
			AddingNew = True

			' add new row to the end of the dataset after binding

			' first get the data
			Dim myConnection As New SqlConnection(ConnectionString)
			Dim myCommand As New SqlDataAdapter(SelectCommand, myConnection)

			Dim ds As New DataSet()
			myCommand.Fill(ds)

			' add a new blank row to the end of the data
			'queStr = "SELECT TOP 1 [bnksBankSubNo] FROM [codBankSubName] ORDER BY [bnksBankSubNo] DESC"

			Dim NR = ds.Tables(0).NewRow()

			'NR("PK_bankID") = CInt(MySqlDbReader(queStr))+1
			NR("bnkBankNo") = "001"
			NR("bnksStopFlag") = "0"

			ds.Tables(0).Rows.Add(NR)

			' figure out the EditItemIndex, last record on last page
			Dim recordCount As Integer = ds.Tables(0).Rows.Count

			If recordCount > 1 Then
				recordCount -= 1
				DataGrid1.CurrentPageIndex = recordCount \ DataGrid1.PageSize
				DataGrid1.EditItemIndex = recordCount Mod DataGrid1.PageSize
			Else
				recordCount = 0
				DataGrid1.CurrentPageIndex = 0
				DataGrid1.EditItemIndex = 0
			End If

			' databind
			DataGrid1.DataSource = ds
			DataGrid1.DataBind()
		End If
	End Sub

	Sub lbtn_search_Click(sender As Object, e As EventArgs)
		If Trim(text_searchFor.Text) = "" Then
			list_searchBy.SelectedIndex = 0
		End If

		DataGrid1.CurrentPageIndex = 0
		DataGrid1.EditItemIndex = -1
		BindGrid()
	End Sub

	Sub DataGrid_Page(Sender As Object, E As DataGridPageChangedEventArgs)

		' display a new page of data
		If Not isEditing Then

			DataGrid1.EditItemIndex = -1
			DataGrid1.CurrentPageIndex = e.NewPageIndex
			BindGrid()
		End If
	End Sub

	Sub BindGrid()

		If  list_searchBy.SelectedIndex <> 0 Then
			WhereStr = " WHERE " & list_searchBy.SelectedItem.Value & " LIKE '%" & Trim(text_searchFor.Text) & "%'"
		Else
			WhereStr = ""
			text_searchFor.Text = ""
		End If

		SelectCommand = SelectStr + WhereStr + OrderByStr

		Dim myConnection As New SqlConnection(ConnectionString)
		Dim myCommand As New SqlDataAdapter(SelectCommand, myConnection)

		Dim ds As New DataSet()
		myCommand.Fill(ds)

		Try
			DataGrid1.DataSource = ds
			DataGrid1.DataBind()
		Catch
			DataGrid1.CurrentPageIndex = 0
			DataGrid1.DataBind()
		End Try

		queStr = "SELECT COUNT(*) FROM [codBankSubName]" + WhereStr
		totalNum = MySqlDbReader(queStr)
	End Sub

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

	Function get_BankNo() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [bnkBankNo], [bnkBankNo] + ' ' + [bnkBankName] As [bankNoName] FROM [codBankName] WHERE (ISNULL([bnkStopFlag],'0') = '0') AND (LEN([bnkBankNo])=3) ORDER BY [bnkBankNo]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_BnkName(thisBankNo As String) As String
		queStr = "SELECT [bnkBankName] FROM [codBankName] WHERE ([bnkBankNo]='" & thisBankNo & "')"
		Return MySqlDbReader(queStr)
	End Function

	Function Str2Bool(thisStr As Object) As Boolean
		thisStr &= ""
		Try
			Select Case thisStr
				Case "1"
					Return True
				Case Else
					Return False
			End Select
		Catch ex As Exception
			Return False
		End Try
	End Function

	Function Bool2Str(thisBool As Object) As String
		Try
			If thisBool = True Then
				Return "1"
			Else
				Return "0"
			End If
		Catch ex As Exception
			Return ""
		End Try
	End Function

</script>
<html>
<head>
	<title>管理分行代號</title>
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />

<script language="javascript">
<!--
function show_item(item){
myitem = document.all[item].style;
if (myitem.display == 'none')
myitem.display = "block";
else myitem.display = "none";}

//-->
</script>
</head>
<body bgcolor="#D4DEF4" style="background-image: url('../images/bg_FFFFFF_D4DEF4.gif'); background-repeat: repeat-x; background-position-y: top; background-attachment: fixed" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<form runat="server">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" style="display: none; background-image: url('../images/header_bg.gif'); background-repeat: repeat-x; background-position: left top" height="45">
			<tr>
				<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="45">
					<tr>
						<td style="background-image: url('../images/header_right.gif'); background-repeat: no-repeat; background-position: right bottom">
						<table border="0" cellpadding="0" cellspacing="0" height="45">
							<tr>
								<td valign="bottom" width="58" rowspan="2"><img border="0" src="../images/header_left.gif" width="58" height="33"></td>
								<td height="24" valign="bottom" nowrap>　</td>
							</tr>
							<tr>
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">管理分行代號</font></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table width="513" border="1" cellspacing="0" bgcolor="#FFFFFF" bordercolor="#C1D1A1" style="border-collapse: collapse; margin-left: 21; margin-top: 15">
			<tr>
				<td>
				<asp:datagrid id="DataGrid1" runat="server" DataKeyField="bnksBankSubNo" OnItemCreated="DataGrid_ItemCreated" width="100%" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="#C1D1A1" ForeColor="Black" OnPageIndexChanged="DataGrid_Page" PageSize="10" AllowPaging="True" OnDeleteCommand="DataGrid_Delete" OnCancelCommand="DataGrid_Cancel" OnUpdateCommand="DataGrid_Update" OnEditCommand="DataGrid_Edit" OnItemCommand="DataGrid_ItemCommand" AutoGenerateColumns="False" OnItemDataBound="Item_DataBound">
					<FooterStyle backcolor="#C1D1A1"></FooterStyle>
					<EditItemStyle verticalalign="Top"></EditItemStyle>
					<ItemStyle backcolor="#FFFCEC"></ItemStyle>
					<HeaderStyle font-size="X-Small" wrap="False" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>
					<Columns>
					<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="儲存" CancelText="取消" EditText="編輯">
						<ItemStyle font-size="Smaller" horizontalalign="Center" width="10%" wrap="False"></ItemStyle>
						<HeaderStyle width="50px"></HeaderStyle>
					</asp:EditCommandColumn>
					<asp:ButtonColumn Text="刪除" CommandName="Delete">
						<HeaderStyle width="50px"></HeaderStyle>
						<ItemStyle font-size="Smaller" horizontalalign="Center" width="10%" wrap="False"></ItemStyle>
					</asp:ButtonColumn>
					<asp:TemplateColumn HeaderText="總行名稱∕代號">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center" verticalalign="Top"></ItemStyle>
						<ItemTemplate>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td><font size="2"><asp:Label id="lab_mBnkNo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.bnkBankNo") %>'></asp:Label> <%# get_BnkName(DataBinder.Eval(Container, "DataItem.bnkBankNo")) %></font></td>
								</tr>
							</table>
						</ItemTemplate>
						<EditItemTemplate>
							<table border="0" cellpadding="3" cellspacing="0">
								<tr>
									<td><asp:DropDownList id="list_mBnkNo" runat="server" DataSource="<%# get_BankNo() %>" DataTextField="bankNoName" DataValueField="bnkBankNo" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.bnkBankNo") %>'></asp:DropDownList></td>
								</tr>
							</table>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="bnksBankSubNo" HeaderText="分行代號">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="bnksBankSubName" HeaderText="分行名稱">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="是否停用">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<asp:CheckBox id="check_blocked" runat="server" Checked='<%# Str2Bool(DataBinder.Eval(Container, "DataItem.bnksStopFlag") & "") %>' Enabled="False"></asp:CheckBox>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:CheckBox id="check_blocked" runat="server" Checked='<%# Str2Bool(DataBinder.Eval(Container, "DataItem.bnksStopFlag") & "") %>'></asp:CheckBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					</Columns>
					<PagerStyle horizontalalign="Center" backcolor="#C1D1A1" mode="NumericPages"></PagerStyle>
				</asp:datagrid>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="35">
					<tr>
						<td><p style="margin-left:24px">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<asp:DropDownList id="list_searchBy" runat="server">
											<asp:ListItem Value="">顯示全部</asp:ListItem>
											<asp:ListItem Value="[bnksBankSubNo]">顯示 [分行代號] 中有</asp:ListItem>
											<asp:ListItem Value="[bnksBankSubName]">顯示 [分行名稱] 中有</asp:ListItem>
											<asp:ListItem Value="[bnkBankNo]">顯示 [總行代號] 中有</asp:ListItem>
										</asp:DropDownList>
									</td>
									<td><asp:TextBox id="text_searchFor" runat="server" Width="100px" Height="22px" MaxLength="20"></asp:TextBox></td>
									<td width="75" align="center" nowrap><asp:LinkButton id="lbtn_search" onclick="lbtn_search_Click" runat="server" Text="搜尋" Font-Size="X-Small" ForeColor="#000000"></asp:LinkButton>｜<asp:LinkButton id="lbtn_AddNew" Text="新增" OnClick="AddNew_Click" Font-Size="X-Small" ForeColor="#000000" runat="server" visible="true"></asp:LinkButton></td>
								</tr>
							</table>
						</td>
						<td align="right"><p style="margin-right:12px"><font size="2" color="#3F3D3D">共有 <%=totalNum %> 筆資料</font></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<asp:Label id="Message" runat="server" width="80%" forecolor="red" enableviewstate="false"></asp:Label>
	</form>
</body>
</html>