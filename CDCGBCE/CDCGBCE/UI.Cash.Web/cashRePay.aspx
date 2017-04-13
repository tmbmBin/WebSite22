<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<script runat="server">

	' TODO: update the ConnectionString and Command values for your application
    Dim strDefUserName As String

	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	'Dim SelectCommand As String = "SELECT *, (ISNULL([crpMoney], 0) - ISNULL([crpRpMoney], 0)) AS [revert] FROM [cashRePay] ORDER BY [crpNo]"
    Dim SelectStr As String = "SELECT *, (ISNULL([crpMoney], 0) - ISNULL([crpRpMoney], 0)) AS [revert] FROM [cashRePay] WHERE 1=1"
	Dim WhereStr As String = ""
	Dim OrderByStr  As String = " ORDER BY [crpNo]"
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

    Dim queStr, totalNum As String
	Sub Page_Load(Sender As Object, E As EventArgs)

        If Session("default_UserName") Is Nothing Then
            strDefUserName = Session("default_UserName")
            Response.Redirect("../Default.aspx")
        End If

		If Session("default_Year") <> Nothing Then
			lab_crpYear.Text = Session("default_Year")
		Else
			lab_crpYear.Text = System.DateTime.Now.Year - 1911
		End If

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

			'Dim text_crpRpDate As TextBox = DataGrid1.Items(e.Item.ItemIndex).FindControl("text_crpRpDate")
			'text_crpRpDate.Text = ChtDate(System.DateTime.Now.ToString("yyyy/MM/dd"))
		End If
	End Sub

	Sub DataGrid_Update(Sender As Object, E As DataGridCommandEventArgs)

		' update the database with the new values

		' get the edit text boxes
		Dim crpYear As String = lab_crpYear.Text
		Dim crpNo As Integer	' = Val(CType(e.Item.Cells(2).FindControl("text_crpNo"), TextBox).Text)
		'990330：原未寫入crpNo
		'Dim NewcrpNo = CType(e.Item.Cells(2).FindControl("lab_crpNo"),Label).Text
		Dim crpUserNo As String = CType(e.Item.Cells(3).FindControl("text_crpUserNo"), TextBox).Text

		Dim crpDate As String = EngDate(CType(e.Item.Cells(4).FindControl("text_crpDate"), TextBox).Text)
		Dim crpMoney As String = CType(e.Item.Cells(4).FindControl("text_crpMoney"), TextBox).Text.Replace(",", "")
		Dim crpMemo As String = CType(e.Item.Cells(4).FindControl("text_crpMemo"), TextBox).Text

		Dim crpRpDate As String = EngDate(CType(e.Item.Cells(5).FindControl("text_crpRpDate"), TextBox).Text)
		Dim crpRpMoney As String = CType(e.Item.Cells(5).FindControl("text_crpRpMoney"), TextBox).Text.Replace(",", "")
		Dim crpRpMemo As String = CType(e.Item.Cells(5).FindControl("text_crpRpMemo"), TextBox).Text

		Dim CreateUser As String = Session("default_UserName")
		Dim ModifyUser As String = Session("default_UserName")

        '990420
        Dim crpExpectReturnDate As String = EngDate(CType(e.Item.Cells(4).FindControl("text_crpExpectReturnDate"), TextBox).Text)

		' TODO: update the Command value for your application
		Dim myConnection As New SqlConnection(ConnectionString)
		Dim UpdateCommand As SqlCommand = new SqlCommand()
		UpdateCommand.Connection = myConnection

		If AddingNew = True Then
			'990330：原未寫入crpNo
			'UpdateCommand.CommandText = "INSERT INTO [cashRePay] ([crpYear],[crpNo], [crpUserNo], [crpDate], [crpMoney], [crpMemo], " & IIf(IsDate(crpRpDate), "[crpRpDate], ", "") & "[crpRpMoney], [crpRpMemo], [CreateUser], [ModifyUser]) VALUES (@crpYear,@crpNo, @crpUserNo, @crpDate, @crpMoney, @crpMemo, " & IIf(IsDate(crpRpDate), "@crpRpDate, ", "") & "@crpRpMoney, @crpRpMemo, @createUser, @modifyUser)"
			'990330：改為由系統自動加1
			'UpdateCommand.CommandText = "INSERT INTO [cashRePay] ([crpYear], [crpUserNo], [crpDate], [crpMoney], [crpMemo], " & IIf(IsDate(crpRpDate), "[crpRpDate], ", "") & "[crpRpMoney], [crpRpMemo], [CreateUser], [ModifyUser]) VALUES (@crpYear, @crpUserNo, @crpDate, @crpMoney, @crpMemo, " & IIf(IsDate(crpRpDate), "@crpRpDate, ", "") & "@crpRpMoney, @crpRpMemo, @createUser, @modifyUser)"
			'990420
			UpdateCommand.CommandText = "INSERT INTO [cashRePay] ([crpYear], [crpUserNo], [crpDate], [crpMoney], [crpMemo], " & IIf(IsDate(crpRpDate), "[crpRpDate], ", "") & "[crpRpMoney], [crpRpMemo], [CreateUser], [CreateDTime],[crpExpectReturnDate],[ModifyUser],[ModifyDTime]) VALUES (@crpYear, @crpUserNo, @crpDate, @crpMoney, @crpMemo, " & IIf(IsDate(crpRpDate), "@crpRpDate, ", "") & "@crpRpMoney, @crpRpMemo, @createUser, @createDTime,@crpExpectReturnDate,@modifyUser,@modifyDTime)"
		Else
			crpNo = DataGrid1.DataKeys(e.Item.ItemIndex)

			'UpdateCommand.CommandText = "UPDATE [cashRePay] SET [crpUserNo]=@crpUserNo, [crpDate]=@crpDate, [crpMoney]=@crpMoney, [crpMemo]=@crpMemo, " & IIf(IsDate(crpRpDate), "[crpRpDate]=@crpRpDate, ", "") & "[crpRpMoney]=@crpRpMoney, [crpRpMemo]=@crpRpMemo, [ModifyUser]=@modifyUser WHERE ([crpYear]=@crpYear) AND ([crpNo]='" & crpNo & "')"
			UpdateCommand.CommandText = "UPDATE [cashRePay] SET [crpUserNo]=@crpUserNo, [crpDate]=@crpDate, [crpMoney]=@crpMoney, [crpMemo]=@crpMemo, " & IIf(IsDate(crpRpDate), "[crpRpDate]=@crpRpDate, ", "") & "[crpRpMoney]=@crpRpMoney, [crpRpMemo]=@crpRpMemo, [ModifyUser]=@modifyUser, [ModifyDTime]=@modifyDTime WHERE ([crpYear]=@crpYear) AND ([crpNo]='" & crpNo & "')"
		End If

		UpdateCommand.Parameters.Add("@crpYear", System.Data.DbType.Int32).Value = Val(crpYear)
		UpdateCommand.Parameters.Add("@crpUserNo", System.Data.DbType.String).Value = Trim(crpUserNo)
		UpdateCommand.Parameters.Add("@crpDate", System.Data.DbType.DateTime).Value = crpDate
		UpdateCommand.Parameters.Add("@crpMoney", System.Data.DbType.Currency).Value = Val(crpMoney)
		UpdateCommand.Parameters.Add("@crpMemo", System.Data.DbType.String).Value = Trim(crpMemo)
		If IsDate(crpRpDate) Then UpdateCommand.Parameters.Add("@crpRpDate", System.Data.DbType.DateTime).Value = crpRpDate
		UpdateCommand.Parameters.Add("@crpRpMoney", System.Data.DbType.Currency).Value = Val(crpRpMoney)
		UpdateCommand.Parameters.Add("@crpRpMemo", System.Data.DbType.String).Value = Trim(crpRpMemo)
		UpdateCommand.Parameters.Add("@createUser", System.Data.DbType.String).Value = CreateUser
		UpdateCommand.Parameters.Add("@modifyUser", System.Data.DbType.String).Value = ModifyUser

		'990330：原未寫入crpNo
		'UpdateCommand.Parameters.Add("@crpNo", System.Data.DbType.Int32).Value = Val(NewcrpNo)

        '990420
        UpdateCommand.Parameters.Add("@createDTime", System.Data.DbType.DateTime).Value = Date.Now()
        UpdateCommand.Parameters.Add("@modifyDTime", System.Data.DbType.DateTime).Value = Date.Now()
        If IsDate(crpExpectReturnDate) Then UpdateCommand.Parameters.Add("@crpExpectReturnDate", System.Data.DbType.DateTime).Value = crpExpectReturnDate

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
			Dim DeleteCommand As New SqlCommand("DELETE FROM [cashRePay] WHERE ([crpNo]='" & keyValue & "')", myConnection)

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

            SelectCommand = SelectStr + " AND CreateUser='" & Session("default_UserName") & "'" + WhereStr + OrderByStr

			' set the flag so we know to do an insert at Update time
			AddingNew = True

			' add new row to the end of the dataset after binding

			' first get the data
			Dim myConnection As New SqlConnection(ConnectionString)
			Dim myCommand As New SqlDataAdapter(SelectCommand, myConnection)

			Dim ds As New DataSet()
			myCommand.Fill(ds)

			' add a new blank row to the end of the data
			queStr = "SELECT ISNULL(MAX([crpNo]), 0) FROM [cashRePay]"

			Dim NR as DataRow
			NR= ds.Tables(0).NewRow()

			NR("crpNo") = CInt(MySqlDbReader(queStr))+1
			NR("crpYear") = Session("default_Year")
			NR("crpUserNo") = ""
			NR("crpDate") = System.DateTime.Now()
			NR("crpMoney") = 0
			NR("crpMemo") = ""
			'NR("crpRpDate") = ""
			NR("crpRpMoney") = 0
			NR("crpRpMemo") = ""
			NR("revert") = 0



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

		If  ddl_listby.SelectedIndex <> 0 Then
            WhereStr = " AND " & ddl_listby.SelectedItem.Value
		Else
			WhereStr = ""
		End If

        SelectCommand = SelectStr + " AND CreateUser='" & Session("default_UserName") & "'" + WhereStr + OrderByStr

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

		'queStr = "SELECT COUNT(*) FROM [cashRePay]"
		'totalNum = MySqlDbReader(queStr)

		Dim userDS As New System.Data.DataSet
		'userDS = get_cashRePay_Info(Val(lab_crpYear.Text))
		'960201 不區分年度
		userDS = get_cashRePay_Info(-1)

		If userDS.Tables(0).Rows.Count = 1 Then
			totalNum = userDS.Tables(0).Rows(0).Item(0)
			lab_cashRePay_Info.Text = "（總預借金額 <font color='DarkOrange'>" & Format(userDS.Tables(0).Rows(0).Item(1), "#,#0") & "</font>，總還款金額 <font color='DarkOrange'>" & Format(userDS.Tables(0).Rows(0).Item(2), "#,#0") & "</font>）"
		Else
			'找不到符合的資料
			lab_cashRePay_Info.Text = ""
		End If

	End Sub

	Sub ddl_listby_SelectedIndexChanged(sender As Object, e As EventArgs)
		If Not isEditing Then

			DataGrid1.EditItemIndex = -1
			DataGrid1.CurrentPageIndex = 0
			BindGrid()
		End If
	End Sub

	Function MySqlDbReader(queryString As String, Optional myConnection As System.Data.SqlClient.SqlConnection = Nothing, Optional myCommand As System.Data.SqlClient.SqlCommand = Nothing)
		Dim dbConnection As System.Data.IDbConnection = IIf(myConnection Is Nothing, New System.Data.SqlClient.SqlConnection(connectionString), myConnection)
		Dim dbCommand As System.Data.SqlClient.SqlCommand = IIf(myCommand Is Nothing, New System.Data.SqlClient.SqlCommand(queryString, dbConnection), myCommand)

		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		If myConnection Is Nothing Then
			Try
				dbCommand.Connection.Open()
				MySqlDbReader = dbCommand.ExecuteScalar()
				dbConnection.Close()
			Catch ex As Exception
				Response.Write("<script" & ">self.alert('" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")
			End Try
		Else
			MySqlDbReader = dbCommand.ExecuteScalar()
		End If
	End Function

	Function MySqlDbWriter(queryString As String, Optional myConnection As System.Data.SqlClient.SqlConnection = Nothing, Optional myCommand As System.Data.SqlClient.SqlCommand = Nothing)
		Dim dbConnection As System.Data.IDbConnection = IIf(myConnection Is Nothing, New System.Data.SqlClient.SqlConnection(connectionString), myConnection)
		Dim dbCommand As System.Data.SqlClient.SqlCommand = IIf(myCommand Is Nothing, New System.Data.SqlClient.SqlCommand(queryString, dbConnection), myCommand)

		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		If myConnection Is Nothing Then
			Try
				dbCommand.Connection.Open()
				dbCommand.ExecuteNonQuery()
				dbConnection.Close()
			Catch ex As Exception
				Response.Write("<script" & ">self.alert('" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")
			End Try
		Else
			dbCommand.ExecuteNonQuery()
		End If
	End Function

	Function ChtDate(thisDate As Object, Optional OnNull As String = "") As String
		Try
			thisDate = Format(CDate(thisDate), "yyyy/MM/dd")
			Return CInt(Left(thisDate, 4))-1911 & Right(thisDate, Len(thisDate)-4)
		Catch ex as Exception
			Return OnNull
		End Try
	End Function

	Function EngDate(thisDate As String, Optional OnNull As String = "") As String
		Try
			Return CInt(Left(thisDate, 2))+1911 & Right(thisDate, Len(thisDate)-2)
		Catch ex as Exception
			Return OnNull
		End Try
	End Function

	Function get_cashRePay_Info(ByVal crpYear As Integer) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT ISNULL(COUNT(*), 0) AS [cnt_cashRePay], ISNULL(SUM(crpMoney), 0) AS [sum_crpMoney], ISNULL(SUM(crpRpMoney), 0) AS [sum_crpRpMoney] FROM [cashRePay] "

		If crpYear <> -1 Then
			queryString &= "WHERE ([crpYear] = " & crpYear & ")"
		End If
'Response.Write(queryString)
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
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

function check_Num(){
if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==46)){
return true;}
else{event.keyCode=0;false;}
}
//-->
</script>
</head>
<body style="background-image: url('images/bg_FFFFFF_D4DEF4.gif'); background-repeat: repeat-x; background-position-y: top; background-attachment: fixed" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" link="#FF9900" vlink="#FF9900" alink="#FF9900">
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
								<td height="23" valign="bottom" nowrap>　</td>
							</tr>
							<tr>
								<td height="22" valign="top" nowrap><p style="margin-top: -2px"><font size="2">零用金預借管理作業</font> <sup><asp:Label id="lab_crpYear" runat="server" forecolor="DarkOrange"></asp:Label></sup></td>
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
				<asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid_ItemCommand" OnEditCommand="DataGrid_Edit" OnUpdateCommand="DataGrid_Update" OnCancelCommand="DataGrid_Cancel" OnDeleteCommand="DataGrid_Delete" AllowPaging="True" PageSize="50" OnPageIndexChanged="DataGrid_Page" ForeColor="Black" BackColor="#C1D1A1" CellPadding="3" GridLines="None" CellSpacing="1" width="100%" OnItemCreated="DataGrid_ItemCreated" DataKeyField="crpNo">
					<FooterStyle backcolor="#C1D1A1"></FooterStyle>
					<EditItemStyle verticalalign="Top"></EditItemStyle>
					<ItemStyle backcolor="#FFFCEC"></ItemStyle>
					<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>
					<Columns>
						<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="儲存" CancelText="取消" EditText="編輯">
							<HeaderStyle width="50px"></HeaderStyle>
							<ItemStyle font-size="Smaller" wrap="False" horizontalalign="Center"></ItemStyle>
						</asp:EditCommandColumn>
						<asp:ButtonColumn Text="刪除" CommandName="Delete">
							<HeaderStyle width="50px"></HeaderStyle>
							<ItemStyle font-size="Smaller" wrap="False" horizontalalign="Center"></ItemStyle>
						</asp:ButtonColumn>
						<asp:TemplateColumn HeaderText="編號">
							<HeaderStyle wrap="False" horizontalalign="Center"></HeaderStyle>
							<ItemStyle horizontalalign="Center"></ItemStyle>
							<ItemTemplate>
								<asp:Label id="lab_crpNo" font-names="Verdana" font-size="X-Small" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.crpNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.crpYear") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="借款人">
							<HeaderStyle wrap="False"></HeaderStyle>
							<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
							<ItemTemplate>
								<asp:Label id="lab_crpUserNo" text='<%# DataBinder.Eval(Container, "DataItem.crpUserNo") %>' runat="server" font-size="X-Small"></asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox id="text_crpUserNo" style="TEXT-ALIGN: center" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.crpUserNo") %>' Width="75px"></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="預　　借">
							<HeaderStyle wrap="False"></HeaderStyle>
							<ItemStyle wrap="False" verticalalign="Top"></ItemStyle>
							<ItemTemplate>
								<table border="0" cellpadding="0" style="border-collapse: collapse" width="150px">
									<a onclick="show_item('<%# "A_" & Container.ItemIndex %>');show_item('<%# "B_" & Container.ItemIndex %>')"><tr>
										<td style="CURSOR: hand" nowrap><font size="2">於 <asp:Label id="lab_crpDate" runat="server" font-names="Verdana" font-size="X-Small" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.crpDate")) %>'></asp:Label><br>借款 <asp:Label id="lab_crpMoney" runat="server" font-names="Verdana" forecolor="DarkOrange" text='<%# DataBinder.Eval(Container, "DataItem.crpMoney", "NT.{0:#,#0}") %>'></asp:Label></font><br><font size="2">預計還款日<asp:Label id="lab_crpExpectReturnDate" runat="server" font-names="Verdana" font-size="X-Small" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.crpExpectReturnDate")) %>'></asp:Label></font></td>
									</tr></a>
									<tr>
										<td id='<%# "A_" & Container.ItemIndex %>' style="display: block"><hr noshade color="#C1D1A1" size="0"><asp:Label id="lab_crpMemo" runat="server" font-size="X-Small" text='<%# DataBinder.Eval(Container, "DataItem.crpMemo") %>'></asp:Label></td>
									</tr>
								</table>
							</ItemTemplate>
							<EditItemTemplate>
								<table border="0" cellpadding="3" style="border-collapse: collapse" width="100%">
									<tr>
										<td>
										<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
											<tr>
												<td nowrap><font size="2">日期｜</font></td>
												<td><asp:TextBox id="text_crpDate" style="TEXT-ALIGN: center; IME-MODE: disabled" Width="60px" runat="server" Text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.crpDate")) %>' onFocus="this.select()"></asp:TextBox>&nbsp;</td>
												<td nowrap><font size="2">金額｜</font></td>
												<td><asp:TextBox id="text_crpMoney" style="TEXT-ALIGN: right; IME-MODE: disabled" Width="75px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.crpMoney", "{0:#,#0}") %>' onFocus="this.select()" onkeypress="return check_Num()"></asp:TextBox></td>
											</tr>
											<tr>
												<td nowrap><font size="2">預計還款日｜</font></td>
												<td><asp:TextBox id="text_crpExpectReturnDate" style="TEXT-ALIGN: center" Width="60px" runat="server" Text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.crpExpectReturnDate")) %>' onFocus="this.select()"></asp:TextBox></td>
											</tr>
										</table>
										</td>
									</tr>
									<tr>
										<td>
										<table border="0" cellpadding="0" style="border-collapse: collapse">
											<tr>
												<td nowrap><font size="2">備註｜</font></td>
												<td><asp:TextBox id="text_crpMemo" Width="178px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.crpMemo") %>'></asp:TextBox></td>
											</tr>
										</table>
										</td>
									</tr>
								</table>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="還　　款">
							<HeaderStyle wrap="False"></HeaderStyle>
							<ItemStyle wrap="False" verticalalign="Top"></ItemStyle>
							<ItemTemplate>
								<table border="0" cellpadding="0" style="border-collapse: collapse" width="150px">
									<a onclick="show_item('<%# "B_" & Container.ItemIndex %>');show_item('<%# "A_" & Container.ItemIndex %>')"><tr>
										<td style="CURSOR: hand" nowrap><font size="2">截至 <asp:Label id="lab_crpRpDate" runat="server" font-names="Verdana" font-size="X-Small" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.crpRpDate")) %>'></asp:Label><br>還款 <asp:Label id="lab_crpRpMoney" runat="server" font-names="Verdana" font-size="X-Small" forecolor="DarkOrange" text='<%# DataBinder.Eval(Container, "DataItem.crpRpMoney", "NT.{0:#,#0}") %>'></asp:Label></font></td>
									</tr></a>
									<tr>
										<td id='<%# "B_" & Container.ItemIndex %>' style="display: block"><hr noshade color="#C1D1A1" size="0"><asp:Label id="lab_crpRpMemo" runat="server" font-size="X-Small" text='<%# DataBinder.Eval(Container, "DataItem.crpRpMemo") %>'></asp:Label></td>
									</tr>
								</table>
							</ItemTemplate>
							<EditItemTemplate>
								<table border="0" cellpadding="3" style="border-collapse: collapse" width="100%">
									<tr>
										<td>
										<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
											<tr>
												<td nowrap><font size="2">日期｜</font></td>
												<td><asp:TextBox id="text_crpRpDate" style="TEXT-ALIGN: center; IME-MODE: disabled" Width="60px" runat="server" Text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.crpRpDate")) %>' onFocus="this.select()"></asp:TextBox>&nbsp;</td>
												<td nowrap><font size="2">金額｜</font></td>
												<td><asp:TextBox id="text_crpRpMoney" style="TEXT-ALIGN: right; IME-MODE: disabled" Width="75px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.crpRpMoney", "{0:#,#0}") %>' onFocus="this.select()" onkeypress="return check_Num()"></asp:TextBox></td>
											</tr>
										</table>
										</td>
									</tr>
									<tr>
										<td>
										<table border="0" cellpadding="0" style="border-collapse: collapse">
											<tr>
												<td nowrap><font size="2">備註｜</font></td>
												<td><asp:TextBox id="text_crpRpMemo" Width="178px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.crpRpMemo") %>'></asp:TextBox></td>
											</tr>
										</table>
										</td>
									</tr>
								</table>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="最後異動">
							<HeaderStyle wrap="False"></HeaderStyle>
							<ItemStyle wrap="True" horizontalalign="Center"></ItemStyle>
							<ItemTemplate>
								<span title='<%# DataBinder.Eval(Container, "DataItem.ModifyDTime") %>'><asp:Label id="lab_ModifyUser" runat="server" font-names="Verdana" font-size="X-Small" text='<%# DataBinder.Eval(Container, "DataItem.ModifyUser") %>'></asp:Label><br><asp:Label id="lab_ModifyDTime" runat="server" font-names="Verdana" font-size="XX-Small" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.ModifyDTime", "{0:yyyy/MM/dd hh:mm:ss}")) %>'></asp:Label></span>
							</ItemTemplate>
							<EditItemTemplate>
								<span title='<%# DataBinder.Eval(Container, "DataItem.ModifyDTime") %>'><asp:Label id="lab_ModifyUser" runat="server" font-names="Verdana" font-size="X-Small" text='<%# DataBinder.Eval(Container, "DataItem.ModifyUser") %>'></asp:Label><br><asp:Label id="lab_ModifyDTime" runat="server" font-names="Verdana" font-size="XX-Small" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.ModifyDTime", "{0:yyyy/MM/dd hh:mm:ss}")) %>'></asp:Label></span>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="已歸還">
							<HeaderStyle wrap="False"></HeaderStyle>
							<ItemStyle wrap="True" horizontalalign="Center"></ItemStyle>
							<ItemTemplate>
								<font face="Webdings" size="4"><asp:Literal runat="server" text='<%# IIf(DataBinder.Eval(Container, "DataItem.revert") = 0 And AddingNew = False, "a", "") %>'></asp:Literal></font>
							</ItemTemplate>
							<EditItemTemplate>
								<font face="Webdings" size="4"><asp:Literal runat="server" text='<%# IIf(DataBinder.Eval(Container, "DataItem.revert") = 0 And AddingNew = False, "a", "") %>'></asp:Literal></font>
							</EditItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle horizontalalign="Center" backcolor="#C1D1A1" mode="NumericPages"></PagerStyle>
				</asp:datagrid>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="35">
					<tr>
						<td style="padding-left: 24px">
							<table border="0" cellpadding="0" style="border-collapse: collapse">
								<tr>
									<td>
									<asp:DropDownList id="ddl_listby" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_listby_SelectedIndexChanged">
										<asp:ListItem>顯示全部項目</asp:ListItem>
										<asp:ListItem Value="((ISNULL([crpMoney], 0) - ISNULL([crpRpMoney], 0)) &gt; 0)">顯示未歸還項目</asp:ListItem>
										<asp:ListItem Value="((ISNULL([crpMoney], 0) - ISNULL([crpRpMoney], 0)) = 0)">顯示已歸還項目</asp:ListItem>
									</asp:DropDownList>
									</td>
									<td style="padding-left: 5px"><asp:LinkButton id="lbtn_AddNew" Text="新增" OnClick="AddNew_Click" Font-Size="X-Small" ForeColor="#000000" runat="server"></asp:LinkButton></td>
								</tr>
							</table>
						</td>
						<td align="right" style="padding-right: 12px"><font size="2" color="#3F3D3D">現有 <font color="DarkOrange"><%=totalNum %></font> 個項目<asp:Label id="lab_cashRePay_Info" runat="server"></asp:Label></font></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<asp:Label id="Message" runat="server" width="80%" forecolor="red" enableviewstate="false"></asp:Label>
	</form>
</body>
</html>