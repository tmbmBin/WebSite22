<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<script runat="server">

	' TODO: update the ConnectionString and Command values for your application

	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	'Dim SelectCommand As String = "SELECT * FROM [sysBaseUser] ORDER BY [PK_usrNo]"
	Dim SelectStr As String = "SELECT * FROM [sysBaseUser]"
	Dim WhereStr As String = ""
	Dim OrderByStr  As String = " ORDER BY [PK_usrNo]"
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

	Dim myPOS As Integer
	Sub restorePOS()
		If Not Request("__SCROLLPOS") Is Nothing Then
			If Request("__SCROLLPOS") <> String.Empty Then
				myPOS = CType(Request("__SCROLLPOS"), Integer)
			End If
		End If	
	End Sub

	Dim queStr, totalNum As String
	Sub Page_Load(Sender As Object, E As EventArgs)

		'回復捲軸位置
		restorePOS()

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
		End If
	End Sub

	Sub DataGrid_Update(Sender As Object, E As DataGridCommandEventArgs)

		' update the database with the new values

		' get the edit text boxes
		'Dim PK_usrNo As Integer
		Dim PK_usrNo As String = CType(e.Item.FindControl("lab_PK_usrNo"), Label).Text
		Dim usrAlias As String = Trim(CType(e.Item.FindControl("text_usrAlias"), TextBox).Text)
		Dim usrName As String = Trim(CType(e.Item.FindControl("text_usrName"), TextBox).Text)
		Dim usrUserID As String = Trim(CType(e.Item.FindControl("text_usrUserID"), TextBox).Text)
		Dim usrTeamCode As String = Trim(CType(e.Item.FindControl("text_usrTeamCode"), TextBox).Text)
		Dim usrPwdOld As String = Trim(CType(e.Item.FindControl("text_usrPwd"), TextBox).CssClass)
		Dim usrPwd As String = Trim(CType(e.Item.FindControl("text_usrPwd"), TextBox).Text)


		' TODO: update the Command value for your application
		Dim myConnection As New SqlConnection(ConnectionString)
		Dim UpdateCommand As SqlCommand = new SqlCommand()
		UpdateCommand.Connection = myConnection

		If AddingNew = True Then
			'檢查人員帳號是否已經存在
			queStr = "SELECT COUNT(*) FROM [sysBaseUser] WHERE ([usrAlias]='" & usrAlias  & "')"
			If CInt(MySqlDbReader(queStr)) > 0 Then
				Response.Write("<script" & ">self.alert('此人員帳號已經存在'); </" & "script>")
				Exit Sub
			End If

			If Len(usrPwd) = 0 Then
				Response.Write("<script" & ">self.alert('新增使用者時，密碼不得為空白'); </" & "script>")
				Exit Sub
			Else
				UpdateCommand.CommandText = "INSERT INTO [sysBaseUser] ([usrAlias], [usrPwd], [usrName], [usrUserID], [usrTeamCode], [CreateDTime], [CreateUser]) VALUES (@usrAlias, @usrPwd, @usrName, @usrUserID, @usrTeamCode, GETDATE(), '系統管理員')"
				UpdateCommand.Parameters.Add("@usrPwd", System.Data.DbType.String).Value = usrPwd
			End If
		Else
			PK_usrNo = DataGrid1.DataKeys(e.Item.ItemIndex)

			'檢查人員帳號是否已經存在
			queStr = "SELECT COUNT(*) FROM [sysBaseUser] WHERE ([usrAlias]='" & usrAlias  & "') AND ([PK_usrNo] <> '" & PK_usrNo & "')"
			If CInt(MySqlDbReader(queStr)) > 0 Then
				Response.Write("<script" & ">self.alert('此人員帳號已經存在'); </" & "script>")
				Exit Sub
			End If

			If Len(usrPwd) = 0 Then
				usrPwd = usrPwdOld

				UpdateCommand.CommandText = "UPDATE [sysBaseUser] SET [usrAlias]=@usrAlias, [usrPwd]=@usrPwd, [usrName]=@usrName, [usrUserID]=@usrUserID, [usrTeamCode]=@usrTeamCode, [ModifyDTime]=GETDATE(), [ModifyUser]='異動人員' WHERE ([PK_usrNo]='" & PK_usrNo & "')"
				UpdateCommand.Parameters.Add("@usrPwd", System.Data.DbType.String).Value = usrPwd
			Else
				If usrPwd = usrPwdOld Then
					UpdateCommand.CommandText = "UPDATE [sysBaseUser] SET [usrAlias]=@usrAlias, [usrName]=@usrName, [usrUserID]=@usrUserID, [usrTeamCode]=@usrTeamCode, [ModifyDTime]=GETDATE(), [ModifyUser]='異動人員' WHERE ([PK_usrNo]='" & PK_usrNo & "')"
				Else
					UpdateCommand.CommandText = "UPDATE [sysBaseUser] SET [usrAlias]=@usrAlias, [usrPwd]=@usrPwd, [usrName]=@usrName, [usrUserID]=@usrUserID, [usrTeamCode]=@usrTeamCode, [ModifyDTime]=GETDATE(), [ModifyUser]='異動人員' WHERE ([PK_usrNo]='" & PK_usrNo & "')"
					UpdateCommand.Parameters.Add("@usrPwd", System.Data.DbType.String).Value = usrPwd
				End If
			End If
		End If

		UpdateCommand.Parameters.Add("@usrAlias", System.Data.DbType.String).Value = usrAlias
		UpdateCommand.Parameters.Add("@usrName", System.Data.DbType.String).Value = IIf(usrName = "", DBNull.Value, usrName)
		UpdateCommand.Parameters.Add("@usrUserID", System.Data.DbType.String).Value = IIf(usrUserID = "", DBNull.Value, UCase(usrUserID))
		UpdateCommand.Parameters.Add("@usrTeamCode", System.Data.DbType.String).Value = IIf(usrTeamCode = "", DBNull.Value, usrTeamCode)

		' execute the command
		Try
			myConnection.Open()
			UpdateCommand.ExecuteNonQuery()
		Catch ex as Exception
			Message.Text = ex.Message.ToString()
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
			Dim keyValue As String = DataGrid1.DataKeys(e.Item.ItemIndex)

			' TODO: update the Command value for your application
			Dim myConnection As New SqlConnection(ConnectionString)
			Dim DeleteCommand As New SqlCommand("DELETE FROM [sysBaseUser] WHERE ([PK_usrNo]='" & keyValue & "')", myConnection)

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
			queStr = "SELECT TOP 1 [PK_usrNo] FROM [sysBaseUser] ORDER BY [PK_usrNo]"

			Dim NR As DataRow
			NR = ds.Tables(0).NewRow()
				NR("PK_usrNo") = 0
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

	Sub DataGrid_Page(Sender As Object, E As DataGridPageChangedEventArgs)

		' display a new page of data
		If Not isEditing Then

			DataGrid1.EditItemIndex = -1
			DataGrid1.CurrentPageIndex = e.NewPageIndex
			BindGrid()
		End If
	End Sub

	Sub BindGrid()

		'If  list_by.SelectedIndex <> 0 Then
		'	WhereStr = list_by.SelectedItem.Value
		'Else
		'	WhereStr = ""
		'End If

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

		queStr = "SELECT COUNT(*) FROM [sysBaseUser]"
        totalNum = MySqlDbReader(queStr) & ""
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

	Function AddSpace(thisNum As Integer) As String
		If thisNum = 0 Then Exit Function
		Dim outSpace As String
		Dim i As Integer
		For i = 0 To thisNum-1
			outSpace &= "&nbsp;"
		Next i
		Return outSpace
	End Function

</script>
<html>
<head>
<title></title>
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
<body style="background-image: url('images/bg_FFFFFF_D4DEF4.gif'); background-repeat: repeat-x; background-position-y: top; background-attachment: fixed" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" link="#FF9900" vlink="#FF9900" alink="#FF9900" id="thisBody" onscroll='javascript:document.forms[0].__SCROLLPOS.value=thisBody.scrollTop;' onload='javascript:thisBody.scrollTop=<% =myPOS %>;'>
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
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">管理人員</font></td>
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
				<asp:datagrid id="DataGrid1" runat="server" DataKeyField="PK_usrNo" OnItemCreated="DataGrid_ItemCreated" width="100%" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="#C1D1A1" ForeColor="Black" OnPageIndexChanged="DataGrid_Page" PageSize="20" AllowPaging="True" OnDeleteCommand="DataGrid_Delete" OnCancelCommand="DataGrid_Cancel" OnUpdateCommand="DataGrid_Update" OnEditCommand="DataGrid_Edit" OnItemCommand="DataGrid_ItemCommand" AutoGenerateColumns="False">
					<HeaderStyle font-size="X-Small" wrap="False" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>
					<ItemStyle backcolor="#FFFCEC"></ItemStyle>
					<EditItemStyle verticalalign="Top"></EditItemStyle>
					<FooterStyle backcolor="#C1D1A1"></FooterStyle>
					<Columns>
					<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="儲存" CancelText="取消" EditText="編輯">
						<ItemStyle font-size="Smaller" horizontalalign="Center" wrap="False"></ItemStyle>
						<HeaderStyle width="50px"></HeaderStyle>
					</asp:EditCommandColumn>
					<asp:ButtonColumn Text="刪除" CommandName="Delete">
						<HeaderStyle width="50px"></HeaderStyle>
						<ItemStyle font-size="Smaller" horizontalalign="Center" wrap="False"></ItemStyle>
					</asp:ButtonColumn>
					<asp:TemplateColumn HeaderText="編號">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle horizontalalign="Left"></ItemStyle>
						<ItemTemplate>
							&nbsp;<asp:Label id="lab_PK_usrNo" text='<%# DataBinder.Eval(Container, "DataItem.PK_usrNo") %>' runat="server" font-size="X-Small"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							&nbsp;<asp:Label id="lab_PK_usrNo" text='<%# DataBinder.Eval(Container, "DataItem.PK_usrNo") %>' runat="server" font-size="X-Small"></asp:Label>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="&nbsp;人員帳號∕姓名">
						<HeaderStyle wrap="False" horizontalalign="Left"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="lab_usrAlias" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.usrAlias") %>' font-size="X-Small" forecolor="#FF9900" font-bold="True"></asp:Label>
							<asp:Label id="lab_usrName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.usrName") %>' font-size="X-Small"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<font size="2">人員帳號：</font><br>
							<asp:TextBox id="text_usrAlias" Text='<%# DataBinder.Eval(Container, "DataItem.usrAlias") %>' runat="server" MaxLength="30" width="100px"></asp:TextBox><asp:RequiredFieldValidator id="rfv_text_usrAlias" runat="server" ErrorMessage="*" ControlToValidate="text_usrAlias" Display="Dynamic"></asp:RequiredFieldValidator><hr noshade color="#C1D1A1" size="0">
							<font size="2">姓名：</font><br>
							<asp:TextBox id="text_usrName" Text='<%# DataBinder.Eval(Container, "DataItem.usrName") %>' runat="server" MaxLength="20" width="100px"></asp:TextBox><br>
							<font size="2">身分證字號：</font><br>
							<asp:TextBox id="text_usrUserID" Text='<%# DataBinder.Eval(Container, "DataItem.usrUserID") %>' runat="server" MaxLength="10" width="100px"></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="&nbsp;部門">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="lab_usrTeamCode" text='<%# DataBinder.Eval(Container, "DataItem.usrTeamCode") %>' runat="server" font-size="X-Small"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<font size="2">部門代號：</font><br>
							<asp:TextBox id="text_usrTeamCode" Text='<%# DataBinder.Eval(Container, "DataItem.usrTeamCode") %>' runat="server" MaxLength="6" width="50px"></asp:TextBox><hr noshade color="#C1D1A1" size="0">
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="&nbsp;登入密碼">
						<HeaderStyle wrap="False" horizontalalign="Left"></HeaderStyle>
						<ItemStyle horizontalalign="Left"></ItemStyle>
						<ItemTemplate>
							<font size="2">不顯示</font><asp:Label id="lab_usrPwd" text='<%# DataBinder.Eval(Container, "DataItem.usrPwd") %>' runat="server" font-size="X-Small" Visible="false"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<font size="2">密碼：</font><br>
							<asp:TextBox id="text_usrPwd" Text='<%# DataBinder.Eval(Container, "DataItem.usrPwd") %>' CssClass='<%# DataBinder.Eval(Container, "DataItem.usrPwd") %>' runat="server" TextMode="Password" MaxLength="16" width="100px"></asp:TextBox><hr noshade color="#C1D1A1" size="0">
						</EditItemTemplate>
					</asp:TemplateColumn>
					</Columns>
					<PagerStyle horizontalalign="Center" backcolor="#C1D1A1" mode="NumericPages"></PagerStyle>
				</asp:datagrid>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="35">
					<tr>
						<td>
							<p style="margin-left:24px"><asp:LinkButton id="lbtn_AddNew" Text="新增" OnClick="AddNew_Click" Font-Size="X-Small" ForeColor="#000000" runat="server"></asp:LinkButton>
						</td>
						<td align="right"><p style="margin-right:12px"><font size="2" color="#3F3D3D">現有 <%=totalNum %> 個使用者</font></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<font style="margin-left: 21px" face="Verdana" size="1"><%=Environment.Version.ToString %></font><br>
		<asp:Label id="Message" runat="server" width="80%" forecolor="red" enableviewstate="false"></asp:Label>
		<input id="__SCROLLPOS" type="hidden" runat="server" name="__SCROLLPOS">
	</form>
</body>
</html>