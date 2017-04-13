<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Data" %>
<%@ Page Language="VB" Debug="true" %>

<HTML>
  <HEAD>
<title></title>
<script runat="server">

	' TODO: update the ConnectionString and Command values for your application

	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	'Dim SelectCommand As String = "SELECT * FROM [sysMenuBase] ORDER BY [PK_mnuNo]"
	Dim SelectStr As String = "SELECT * FROM [sysMenuBase]"
	Dim WhereStr As String = ""
	Dim OrderByStr  As String = " ORDER BY [PK_mnuNo]"
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
		DB.sysMenu.DAT.sysMenuBZ.CheckMenuID() '檢查是否已登入且本單元是否有使用權,無時用權時顯示"您沒有權限進入此單元"並終止工作,而未登入時重導至Login畫面

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
		'Dim PK_mnuNo As Integer
		Dim PK_mnuNo As String = CType(e.Item.Cells(2).FindControl("text_PK_mnuNo"), TextBox).Text
		Dim mnuName As String = CType(e.Item.Cells(3).FindControl("text_mnuName"), TextBox).Text
		Dim mnuUrl As String = CType(e.Item.Cells(3).FindControl("text_mnuUrl"), TextBox).Text
		Dim mnuTarget As String = CType(e.Item.Cells(3).FindControl("text_mnuTarget"), TextBox).Text
		Dim mnuHint As String = CType(e.Item.Cells(4).FindControl("text_mnuHint"), TextBox).Text
		Dim mnuHelp As String = CType(e.Item.Cells(4).FindControl("text_mnuHelp"), TextBox).Text
		Dim mnuGroup As String = CType(e.Item.Cells(5).FindControl("text_mnuGroup"), TextBox).Text
		Dim mnuLevel As Integer = Val(CType(e.Item.Cells(5).FindControl("text_mnuLevel"), TextBox).Text)


		' TODO: update the Command value for your application
		Dim myConnection As New SqlConnection(ConnectionString)
		Dim UpdateCommand As SqlCommand = new SqlCommand()
		UpdateCommand.Connection = myConnection

		If AddingNew = True Then
			'檢查項目代號是否已經存在
			queStr = "SELECT COUNT(*) FROM [sysMenuBase] WHERE ([PK_mnuNo]='" & PK_mnuNo  & "')"
			If CInt(MySqlDbReader(queStr)) > 0 Then
				Response.Write("<script" & ">self.alert('此選單項目代號已經存在'); </" & "script>")
				Exit Sub
			End If

			If mnuLevel = 0 Then
				UpdateCommand.CommandText = "INSERT INTO [sysMenuBase] ([PK_mnuNo], [mnuName], [mnuUrl], [mnuTarget], [mnuHint], [mnuHelp], [mnuGroup]) VALUES (@PK_mnuNo, @mnuName, @mnuUrl, @mnuTarget, @mnuHint, @mnuHelp, @mnuGroup)"
			Else
				UpdateCommand.CommandText = "INSERT INTO [sysMenuBase] ([PK_mnuNo], [mnuName], [mnuUrl], [mnuTarget], [mnuHint], [mnuHelp], [mnuGroup], [mnuLevel]) VALUES (@PK_mnuNo, @mnuName, @mnuUrl, @mnuTarget, @mnuHint, @mnuHelp, @mnuGroup, @mnuLevel)"
			End If
			UpdateCommand.Parameters.Add("@PK_mnuNo", System.Data.DbType.String).Value = PK_mnuNo
		Else
			PK_mnuNo = DataGrid1.DataKeys(e.Item.ItemIndex)

			If mnuLevel = 0 Then
				UpdateCommand.CommandText = "UPDATE [sysMenuBase] SET [mnuName]=@mnuName, [mnuUrl]=@mnuUrl, [mnuTarget]=@mnuTarget, [mnuHint]=@mnuHint, [mnuHelp]=@mnuHelp, [mnuGroup]=@mnuGroup, [mnuLevel]=NULL WHERE ([PK_mnuNo]='" & PK_mnuNo & "')"
			Else
				UpdateCommand.CommandText = "UPDATE [sysMenuBase] SET [mnuName]=@mnuName, [mnuUrl]=@mnuUrl, [mnuTarget]=@mnuTarget, [mnuHint]=@mnuHint, [mnuHelp]=@mnuHelp, [mnuGroup]=@mnuGroup, [mnuLevel]=@mnuLevel WHERE ([PK_mnuNo]='" & PK_mnuNo & "')"
			End If
		End If

		UpdateCommand.Parameters.Add("@mnuName", System.Data.DbType.String).Value = mnuName
		UpdateCommand.Parameters.Add("@mnuUrl", System.Data.DbType.String).Value = mnuUrl
		UpdateCommand.Parameters.Add("@mnuTarget", System.Data.DbType.String).Value = mnuTarget
		UpdateCommand.Parameters.Add("@mnuHint", System.Data.DbType.String).Value = mnuHint
		UpdateCommand.Parameters.Add("@mnuHelp", System.Data.DbType.String).Value = mnuHelp
		UpdateCommand.Parameters.Add("@mnuGroup", System.Data.DbType.String).Value = mnuGroup
		UpdateCommand.Parameters.Add("@mnuLevel", System.Data.DbType.Int16).Value = mnuLevel


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
			Dim DeleteCommand As New SqlCommand("DELETE FROM [sysMenuBase] WHERE ([PK_mnuNo]='" & keyValue & "')", myConnection)

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
			queStr = "SELECT TOP 1 [PK_mnuNo] FROM [sysMenuBase] ORDER BY [PK_mnuNo]"

			Dim NR As DataRow
			NR = ds.Tables(0).NewRow()
				NR("PK_mnuNo") = ""
				'NR("mnuName") = ""
				NR("mnuHelp") = ""
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

		queStr = "SELECT COUNT(*) FROM [sysMenuBase]"
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

	Function AddSpace(thisNum As Integer) As String
		If thisNum = 0 Then Exit Function
		Dim outSpace As String
		Dim i As Integer
		For i = 0 To thisNum-1
			outSpace &= "&nbsp;"
		Next i
		Return outSpace
	End Function

	Sub lbtn_Excel_Click(Sender As Object, E As EventArgs)
		Response.Clear()
		Response.Buffer = True

		Response.Charset = "utf-8"

		Response.AppendHeader("Content-Disposition", "attachment;filename=MsExcel.xls")
		'Response.AppendHeader("Content-Disposition", "attachment;filename=MsWord.doc")

		Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8")

		Response.ContentType = "application/ms-excel"
		'Response.ContentType = "application/ms-word"

		Me.EnableViewState = False

		Dim oStringWriter As System.IO.StringWriter = New System.IO.StringWriter()
		Dim oHtmlTextWriter As System.Web.UI.HtmlTextWriter = New System.Web.UI.HtmlTextWriter(oStringWriter)

		Me.RenderControl(oHtmlTextWriter)
		Response.Write(oStringWriter.ToString())

		Response.End()
	End Sub

</script>
<meta http-equiv="Pragma" content="no-cache" >
<meta http-equiv="Cache-Control" content="no-cache" >

<script language="javascript">
<!--
function show_item(item){
myitem = document.all[item].style;
if (myitem.display == 'none')
myitem.display = "block";
else myitem.display = "none";}

//-->
</script>
</HEAD>
<body style="BACKGROUND-ATTACHMENT: fixed; BACKGROUND-POSITION-Y: top; BACKGROUND-IMAGE: url(images/bg_FFFFFF_D4DEF4.gif); BACKGROUND-REPEAT: repeat-x" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" link="#ff9900" vlink="#ff9900" alink="#ff9900" id="thisBody" onscroll='javascript:document.forms[0].__SCROLLPOS.value=thisBody.scrollTop;' onload='javascript:thisBody.scrollTop=<% =myPOS %>;'>
	<form runat="server">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" style="BACKGROUND-POSITION: left top; MARGIN-TOP: -5px; BACKGROUND-IMAGE: url(images/header_bg.gif); BACKGROUND-REPEAT: repeat-x" height="45">
			<tr>
				<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="45">
					<tr>
						<td >
						<table border="0" cellpadding="0" cellspacing="0" height="45">
							<tr>
								<td valign="bottom" width="58" rowspan="2"><img border="0" src="images/header_left.gif" width="58" height="33"></td>
								<td height="24" valign="bottom" nowrap>　</td>
							</tr>
							<tr>
								<td height="21" valign="top" nowrap><p style="MARGIN-TOP: 0px"><font size="2">管理清單項目</font></p></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table width="513" border="1" cellspacing="0" bgcolor="#ffffff" bordercolor="#c1d1a1" style="MARGIN-TOP: 15px; MARGIN-LEFT: 21px; BORDER-COLLAPSE: collapse">
			<tr>
				<td>
				<asp:datagrid id="DataGrid1" runat="server" DataKeyField="PK_mnuNo" OnItemCreated="DataGrid_ItemCreated" width="100%" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="#C1D1A1" ForeColor="Black" OnPageIndexChanged="DataGrid_Page" PageSize="50" AllowPaging="True" OnDeleteCommand="DataGrid_Delete" OnCancelCommand="DataGrid_Cancel" OnUpdateCommand="DataGrid_Update" OnEditCommand="DataGrid_Edit" OnItemCommand="DataGrid_ItemCommand" AutoGenerateColumns="False">
					<FooterStyle backcolor="#C1D1A1"></FooterStyle>
					<EditItemStyle verticalalign="Top"></EditItemStyle>
					<ItemStyle backcolor="#FFFCEC"></ItemStyle>
					<HeaderStyle font-size="X-Small" wrap="False" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>
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
							&nbsp;
<asp:Label id="lab_PK_mnuNo" text='<%# DataBinder.Eval(Container, "DataItem.PK_mnuNo") %>' runat="server"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox id="text_PK_mnuNo" Text='<%# DataBinder.Eval(Container, "DataItem.PK_mnuNo") %>' runat="server" MaxLength="12" width="75px"></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="&nbsp;項目名稱∕連結">
						<HeaderStyle wrap="False" horizontalalign="Left"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
						<ItemTemplate>
							<%# AddSpace(Len(Container.DataItem("PK_mnuNo"))-1) %>
<asp:HyperLink id="hlink_mnuUrl" runat="server" NavigateUrl='' Text='<%# DataBinder.Eval(Container, "DataItem.mnuName") %>' Target='<%# DataBinder.Eval(Container, "DataItem.mnuTarget") %>' font-size="X-Small"></asp:HyperLink>
						</ItemTemplate>
						<EditItemTemplate>
							<font size="2">項目名稱：</font><br>
							<asp:TextBox id="text_mnuName" Text='<%# DataBinder.Eval(Container, "DataItem.mnuName") %>' runat="server" MaxLength="50"></asp:TextBox>
<asp:RequiredFieldValidator id="rfv_text_mnuName" runat="server" ErrorMessage="*" ControlToValidate="text_mnuName" Display="Dynamic"></asp:RequiredFieldValidator><hr noshade color="#C1D1A1" size="0">
							<font size="2">超連結：</font><br>
							<asp:TextBox id="text_mnuUrl" Text='<%# DataBinder.Eval(Container, "DataItem.mnuUrl") %>' runat="server" MaxLength="255" width="200px"></asp:TextBox><br>
							<font size="2">目標框架：</font><br>
							<asp:TextBox id="text_mnuTarget" Text='<%# DataBinder.Eval(Container, "DataItem.mnuTarget") %>' runat="server" MaxLength="10" width="75px"></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="&nbsp;項目描述∕說明">
						<HeaderStyle wrap="False" horizontalalign="Left"></HeaderStyle>
						<ItemStyle horizontalalign="Left"></ItemStyle>
						<ItemTemplate>
							<b>
<asp:Label id="lab_mnuHint" text='<%# DataBinder.Eval(Container, "DataItem.mnuHint") %>' runat="server" font-size="X-Small"></asp:Label></b>
							<asp:Label id="lab_mnuHelp" text='<%# DataBinder.Eval(Container, "DataItem.mnuHelp") %>' runat="server" font-size="X-Small"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<font size="2">簡述：</font><br>
							<asp:TextBox id="text_mnuHint" Text='<%# DataBinder.Eval(Container, "DataItem.mnuHint") %>' runat="server" TextMode="MultiLine" Rows="5" MaxLength="50"></asp:TextBox><hr noshade color="#C1D1A1" size="0">
							<font size="2">說明：</font><br>
							<asp:TextBox id="text_mnuHelp" Text='<%# DataBinder.Eval(Container, "DataItem.mnuHelp") %>' runat="server" TextMode="MultiLine" Rows="5" MaxLength="255"></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="&nbsp;限定群組∕等級">
						<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
						<ItemStyle horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="lab_mnuGroup" text='<%# DataBinder.Eval(Container, "DataItem.mnuGroup") %>' runat="server" font-size="X-Small"></asp:Label><font size="1">∕</font>
<asp:Label id="lab_mnuLevel" text='<%# DataBinder.Eval(Container, "DataItem.mnuLevel") %>' runat="server" font-size="X-Small"></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<font size="2">限定群組：</font><br>
							<asp:TextBox id="text_mnuGroup" Text='<%# DataBinder.Eval(Container, "DataItem.mnuGroup") %>' runat="server" MaxLength="20" width="100px"></asp:TextBox><hr noshade color="#C1D1A1" size="0">
							<font size="2">限定等級：</font><br>
							<asp:TextBox id="text_mnuLevel" Text='<%# DataBinder.Eval(Container, "DataItem.mnuLevel") %>' runat="server" MaxLength="4" width="50px" style="TEXT-ALIGN: center"></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					</Columns>
					<PagerStyle horizontalalign="Center" backcolor="#C1D1A1" mode="NumericPages"></PagerStyle>
				</asp:datagrid>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="35">
					<tr>
						<td>
							<p style="MARGIN-LEFT:24px"><asp:LinkButton id="lbtn_AddNew" Text="新增" OnClick="AddNew_Click" Font-Size="X-Small" ForeColor="#000000" runat="server"></asp:LinkButton>
							<asp:LinkButton id="lbtn_Excel" Text="Excel" OnClick="lbtn_Excel_Click" Font-Size="X-Small" ForeColor="#000000" runat="server" visible="False"></asp:LinkButton></p>
						</td>
						<td align="right"><p style="MARGIN-RIGHT:12px"><font size="2" color="#3f3d3d">現有 <%=totalNum %> 個項目</font></p></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<font style="MARGIN-LEFT: 21px" face="Verdana" size="1"><%=Environment.Version.ToString %></font><br>
		<asp:Label id="Message" runat="server" width="80%" forecolor="red" enableviewstate="false"></asp:Label>
		<input id="__SCROLLPOS" type="hidden" runat="server" name="__SCROLLPOS">
	</form>
</body>
</HTML>
