<%@ Page Language="VB" Debug="True" validateRequest="False" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="System.Data" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<!-- #include file="../Default.bas" -->
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

'====================================================================================================

	'撥還主檔(讀取)
	Function get_cashMain(ByVal csmYear As Integer) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [csmYear], [csmNo], [csmSDate], [csmEDate], [csmCnt], [csmMoney], [csmMemo], [ModifyDTime], [ModifyUser] FROM [cashMain1] WHERE ([csmYear] = " & csmYear & ") ORDER BY [csmNo] DESC"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	'撥還主檔(新增)
	Function add_cashMain1( _
		ByVal csmYear As Integer, _
		ByVal csmNo As Integer, _
		ByVal csmSDate As Date, _
		ByVal csmEDate As Date, _
		ByVal csmMemo As String, _
		ByVal csmCnt As Integer, _
		ByVal csmMoney As Decimal, _
		ByVal createUser As String, _
		ByVal modifyUser As String, _
		myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [cashMain1] ([csmYear], [csmNo], [csmSDate], [csmEDate], [csmMemo], [csmCnt], [csmMoney], [CreateUser], [ModifyUser]) " & _
								"VALUES (" & csmYear & ", " & csmNo & ", @csmSDate, @csmEDate, @csmMemo, " & csmCnt & ", " & csmMoney & ", N'" & CreateUser & "', N'" & ModifyUser & "')"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection
		dbCommand.Transaction = myTransaction

		Dim dbParam_csmSDate As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_csmSDate.ParameterName = "@csmSDate"
		dbParam_csmSDate.Value = csmSDate
		dbParam_csmSDate.DbType = System.Data.DbType.DateTime
		dbCommand.Parameters.Add(dbParam_csmSDate)
		Dim dbParam_csmEDate As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_csmEDate.ParameterName = "@csmEDate"
		dbParam_csmEDate.Value = csmEDate
		dbParam_csmEDate.DbType = System.Data.DbType.DateTime
		dbCommand.Parameters.Add(dbParam_csmEDate)
		Dim dbParam_csmMemo As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_csmMemo.ParameterName = "@csmMemo"
		dbParam_csmMemo.Value = csmMemo
		dbParam_csmMemo.DbType = System.Data.DbType.String
		dbCommand.Parameters.Add(dbParam_csmMemo)

		Dim rowsAffected As Integer = 0
		rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'撥還主檔(修改)
	Function upd_cashMain1( _
		ByVal csmYear As Integer, _
		ByVal csmNo As Integer, _
		ByVal csmSDate As Date, _
		ByVal csmEDate As Date, _
		ByVal csmMemo As String, _
		ByVal csmCnt As Integer, _
		ByVal csmMoney As Decimal, _
		ByVal modifyUser As String, _
		myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "UPDATE [cashMain1] SET [csmSDate]=@csmSDate, [csmEDate]=@csmEDate, [csmMemo]=@csmMemo, [csmCnt]=" & csmCnt & ", [csmMoney]=" & csmMoney & ", [ModifyDTime]=GETDATE(), [ModifyUser]=N'" & ModifyUser &"' " & _
							"WHERE (([csmYear] = " & csmYear & ") AND ([csmNo] = " & csmNo & "))"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection
		dbCommand.Transaction = myTransaction

		Dim dbParam_csmSDate As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_csmSDate.ParameterName = "@csmSDate"
		dbParam_csmSDate.Value = csmSDate
		dbParam_csmSDate.DbType = System.Data.DbType.DateTime
		dbCommand.Parameters.Add(dbParam_csmSDate)
		Dim dbParam_csmEDate As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_csmEDate.ParameterName = "@csmEDate"
		dbParam_csmEDate.Value = csmEDate
		dbParam_csmEDate.DbType = System.Data.DbType.DateTime
		dbCommand.Parameters.Add(dbParam_csmEDate)
		Dim dbParam_csmMemo As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_csmMemo.ParameterName = "@csmMemo"
		dbParam_csmMemo.Value = csmMemo
		dbParam_csmMemo.DbType = System.Data.DbType.String
		dbCommand.Parameters.Add(dbParam_csmMemo)

		Dim rowsAffected As Integer = 0
		rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'撥還明細檔計畫科目(讀取)
	Function get_cashDtlPlan1(ByVal csmYear As Integer, Optional csmNo As Integer = 0, Optional editFlg As Boolean = False) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT DISTINCT CAST(actPayVisa.acvOutlayYear AS varchar) + ':' + CAST(actPayVisa.acvPlanCode AS varchar) AS 計畫代碼, 計畫科目.計畫名稱 " & _
							"FROM cashDtl INNER JOIN actPayVisa INNER JOIN actMain ON " & _
								"actPayVisa.acmYear = actMain.acmYear AND actPayVisa.acmNo = actMain.acmNo INNER JOIN 員工基本資料 ON " & _
								"actMain.acmWorkUserNo = 員工基本資料.員工代碼 ON cashDtl.acmYear = actPayVisa.acmYear AND " & _
								"cashDtl.acmNo = actPayVisa.acmNo AND cashDtl.acpPayYear = actPayVisa.acpPayYear AND " & _
								"cashDtl.acpPayNo = actPayVisa.acpPayNo AND cashDtl.acvNo = actPayVisa.acvNo AND " & _
								"cashDtl.acvSubNo = actPayVisa.acvSubNo LEFT OUTER JOIN cashDtl1 ON cashDtl.acvSubNo = cashDtl1.acvSubNo AND " & _
								"cashDtl.acvNo = cashDtl1.acvNo AND cashDtl.acpPayNo = cashDtl1.acpPayNo AND " & _
								"cashDtl.acpPayYear = cashDtl1.acpPayYear AND cashDtl.acmNo = cashDtl1.acmNo AND cashDtl.acmYear = cashDtl1.acmYear " & _
								"INNER JOIN 計畫科目 ON actPayVisa.acvOutlayYear = 計畫科目.科目年度別 AND actPayVisa.acvPlanCode = 計畫科目.計畫代碼 " & _
								"INNER JOIN 用途別科目 ON actPayVisa.acvOutlayYear = 用途別科目.科目年度別 AND actPayVisa.acvOutlayCode = 用途別科目.用途別代碼 " & _
							"WHERE (cashDtl.csmYear = " & csmYear & ") AND (cashDtl1.csmNo " & IIf(csmNo = 0, "IS NULL", "=" & csmNo) & ") " & IIf(editFlg = True, "OR cashDtl1.csmNo IS NULL ", "") & _
							"ORDER BY 計畫代碼"
'Response.Write(queryString & "<hr>")
'Response.End
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	'撥還明細檔(讀取)(新增讀取)(修改讀取)
	Function get_cashDtl1(ByVal csmYear As Integer, Optional csmNo As Integer = 0, Optional editFlg As Boolean = False) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT ISNULL(cashDtl1.acmYear, cashDtl.acmYear) AS acmYear, ISNULL(cashDtl1.acmNo, cashDtl.acmNo) AS acmNo, " & _
								"ISNULL(cashDtl1.acpPayYear, cashDtl.acpPayYear) AS acpPayYear, " & _
								"ISNULL(cashDtl1.acpPayNo, cashDtl.acpPayNo) AS acpPayNo, " & _
								"ISNULL(cashDtl1.acvNo, cashDtl.acvNo) AS acvNo, " & _
								"ISNULL(cashDtl1.acvSubNo, cashDtl.acvSubNo) AS acvSubNo, " & _
								"actMain.acmWordNum, ISNULL(NULLIF (actPayVisa.acvMemo, ''), actMain.acmMemo) AS acvMemo, " & _
								"ISNULL(actPayVisa.acvPassMoney, actPayVisa.acvMoney) AS acvPassMoney, " & _
								"員工基本資料.員工姓名 AS acmWorkUser, " & _
								"cashDtl1.csmYear, cashDtl1.csmNo, cashDtl.csmNo AS ReceiveNo, " & _
								"actPayVisa.acvOutlayYear, actPayVisa.acvPlanCode, 計畫科目.計畫名稱, actPayVisa.acvOutlayCode, 用途別科目.用途別名稱 " & _
							"FROM cashDtl INNER JOIN actPayVisa INNER JOIN actMain ON " & _
								"actPayVisa.acmYear = actMain.acmYear AND actPayVisa.acmNo = actMain.acmNo INNER JOIN 員工基本資料 ON " & _
								"actMain.acmWorkUserNo = 員工基本資料.員工代碼 ON cashDtl.acmYear = actPayVisa.acmYear AND " & _
								"cashDtl.acmNo = actPayVisa.acmNo AND cashDtl.acpPayYear = actPayVisa.acpPayYear AND " & _
								"cashDtl.acpPayNo = actPayVisa.acpPayNo AND cashDtl.acvNo = actPayVisa.acvNo AND " & _
								"cashDtl.acvSubNo = actPayVisa.acvSubNo LEFT OUTER JOIN cashDtl1 ON cashDtl.acvSubNo = cashDtl1.acvSubNo AND " & _
								"cashDtl.acvNo = cashDtl1.acvNo AND cashDtl.acpPayNo = cashDtl1.acpPayNo AND " & _
								"cashDtl.acpPayYear = cashDtl1.acpPayYear AND cashDtl.acmNo = cashDtl1.acmNo AND cashDtl.acmYear = cashDtl1.acmYear " & _
								"INNER JOIN 計畫科目 ON actPayVisa.acvOutlayYear = 計畫科目.科目年度別 AND actPayVisa.acvPlanCode = 計畫科目.計畫代碼 " & _
								"INNER JOIN 用途別科目 ON actPayVisa.acvOutlayYear = 用途別科目.科目年度別 AND actPayVisa.acvOutlayCode = 用途別科目.用途別代碼 " & _
							"WHERE (cashDtl.csmYear = " & csmYear & ") AND (cashDtl1.csmNo " & IIf(csmNo = 0, "IS NULL", "=" & csmNo) & ") " & IIf(editFlg = True, "OR cashDtl1.csmNo IS NULL ", "") & _
							"ORDER BY actPayVisa.acvPlanCode, actPayVisa.acvOutlayCode, actMain.acmWordNum"

							'950304
							'"ORDER BY actMain.acmWordNum, cashDtl1.csmYear, cashDtl1.csmNo"
'Response.Write(queryString & "<hr>")
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	'撥還明細檔(刪除)
	Function del_cashDtl1(ByVal csmYear As Integer, ByVal csmNo As Integer, myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer
		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "DELETE FROM [cashDtl1] WHERE (([csmYear] = " & csmYear & ") AND ([csmNo] = " & csmNo & "))"
'Response.Write(queryString)
'Response.End
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection
		dbCommand.Transaction = myTransaction

		Dim rowsAffected As Integer = 0
		rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'撥還明細檔(新增)
	Function add_cashDtl1( _
		ByVal csmYear As Integer, _
		ByVal csmNo As Integer, _
		ByVal acmYear As Integer, _
		ByVal acmNo As Integer, _
		ByVal acpPayYear As Integer, _
		ByVal acpPayNo As Integer, _
		ByVal acvNo As Integer, _
		ByVal acvSubNo As Integer, _
		myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [cashDtl1] ([csmYear], [csmNo], [acmYear], [acmNo], [acpPayYear], [acpPayNo], [acvNo], [acvSubNo]) " & _
									"VALUES (" & csmYear & ", " & csmNo & ", " & acmYear & ", " & acmNo & ", " & acpPayYear & ", " & acpPayNo & ", " & acvNo & ", " & acvSubNo & ")"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection
		dbCommand.Transaction = myTransaction

		Dim rowsAffected As Integer = 0
		rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

'====================================================================================================

	Sub Initialize()

		text_csmYear.Text = ""
		text_csmCnt.Text = ""
		text_csmMoney.Text = ""

		text_csmSDate.Text = "　/　/　"
		text_csmEDate.Text = "　/　/　"

		text_csmNo.Text = ""
		text_csmMemo.Text = ""

		grid_cashDtl.DataSource = Nothing
		grid_cashDtl.DataBind()

		ddl_filter.Items.Clear()
		ddl_filter.Items.Add("全部")
	End Sub

	Sub get_Selected()
		If grid_Main.SelectedIndex <> -1 Then

			text_csmYear.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmYear"), Label).Text
			text_csmNo.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmNo"), Label).Text
			text_csmCnt.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmCnt"), Label).Text
			text_csmMoney.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmMoney"), Label).Text

			text_csmNo.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmNo"), Label).Text
			text_csmSDate.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmSDate"), Label).Text
			text_csmEDate.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmEDate"), Label).Text
			text_csmMemo.Text = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_csmMemo"), Label).Text

			ddl_filter.DataSource = get_cashDtlPlan1(Val(text_csmYear.Text), Val(text_csmNo.Text))
			ddl_filter.DataBind()
			ddl_filter.Items.Insert(0, "全部")

			'grid_cashDtl.DataSource = get_cashDtl1(Val(text_csmYear.Text), Val(text_csmNo.Text))
			'grid_cashDtl.DataBind()

			BindGrid()

			'檢查是否可新增
			check_new()

			'檢查是否可刪除
			'If text_csmNo.Text = Val(MySqlDbReader("SELECT ISNULL(MAX(csmNo), 0) FROM [cashMain1]")) Then
			'970409 當年度最後一筆方可刪除
			If text_csmNo.Text = Val(MySqlDbReader("SELECT ISNULL(MAX(csmNo), 0) FROM [cashMain1] WHERE (csmYear = " & Val(text_csmYear.Text) & ")")) Then
				btn_delete.Enabled = True
			Else
				btn_delete.Enabled = False
			End If

		End If
	End Sub

'====================================================================================================

	'檢查是否可新增
	Sub check_new()
		Dim userDS As New System.Data.DataSet
		userDS = get_cashDtl1(Val(Session("default_Year")))
		If userDS.Tables(0).Rows.Count >= 1 Then
			btn_new.Enabled = True
		Else
			btn_new.Enabled = False
		End If
	End Sub

'====================================================================================================

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

'====================================================================================================

	Sub Page_Load(Sender As Object, E As EventArgs)

		If Session("default_UserName") Is Nothing Then
			Response.Redirect("../Default.aspx")
		End If

		If Not Page.IsPostBack Then

			lit_Title.Text = "零用金撥還作業"

			Initialize()

			Session("update") = Server.URLEncode(System.DateTime.Now.ToString())

			btn_delete.Attributes.Add("onclick","return confirm('按一下[確定]，永遠刪除這一列。您無法復原這項變更。');")

			grid_Main.DataSource = get_cashMain(Session("default_Year"))
			grid_Main.DataBind()

'			If set_Selected(0) = True Then
				'設定按鈕狀態
'				set_Butten(grid_Main, "SEL")

'				get_Selected()
'			Else
				'設定按鈕狀態
				set_Butten(grid_Main, "DEF")
'			End If

			AddingNew = False
		End If

		'檢查是否可新增
		check_new()
	End Sub

	Sub Page_PreRender (sender As Object, e As EventArgs)
		ViewState("update") = Session("update")
	End Sub

'====================================================================================================

	Sub BindGrid()

		Dim dt As DataTable
		dt = get_cashDtl1(Val(text_csmYear.Text), Val(text_csmNo.Text)).Tables(0)

		Dim _dv As DataView
		_dv = dt.DefaultView
		'_dv.Sort=ViewState("SortField")  &""

		If ddl_filter.SelectedIndex <> 0 Then
			_dv.RowFilter = "計畫名稱='" & ddl_filter.SelectedItem.Text & "'"
		End If

		grid_cashDtl.DataSource = _dv
		Try
			grid_cashDtl.DataBind()
		Catch

		End Try
	End Sub

'====================================================================================================

	Sub grid_cashDtl_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Or e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			'e.Item.Cells(0).CssClass = "FreezingCol0"
			'e.Item.Cells(1).CssClass = "FreezingCol1"
		End If
	End Sub

	Sub grid_actPayVisa_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Or e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			'e.Item.Cells(0).CssClass = "FreezingCol2"
		End If
	End Sub

	Sub grid_actPayVisa_DataBound(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			CType(e.Item.FindControl("ddl_acvPlanCode"), DropDownList).SelectedValue = CType(e.Item.FindControl("ddl_acvPlanCode"), DropDownList).CssClass
		End If
	End Sub

'====================================================================================================

	Sub grid_Main_Page(Sender As Object, e As DataGridPageChangedEventArgs)

		If btn_update.Enabled = True Then Exit Sub	'編輯中不得換頁

		grid_Main.CurrentPageIndex = e.NewPageIndex

		grid_Main.DataSource = get_cashMain(Session("default_Year"))
		'grid_Main.DataSource = get_actMain(Session("default_Year"), Session("default_Month"), Session("default_UserNo"))
		grid_Main.DataBind()

		If set_Selected(0) = True Then get_Selected()
	End Sub

'====================================================================================================

	Sub CheckBox_CheckedChanged(sender As Object, e As EventArgs)

		If sender.Checked = True Then

		'設定按鈕狀態
		set_Butten(grid_Main, "SEL")


			Dim i As Integer
			For i = 0 To grid_Main.Items.Count-1
				If CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).CssClass <> sender.CssClass
					CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).Checked = False
				Else
					grid_Main.SelectedIndex = CInt(sender.CssClass)

					'取得選取位置資料
					get_Selected()
				End If
			Next i
		End If

		CType(grid_Main.Items(grid_Main.SelectedIndex).Controls(0).Controls(1), CheckBox).Checked = True
	End Sub

	'移動到指定選取位置
	Function set_Selected(thisIndex As Integer) As Boolean
		Try
			grid_Main.SelectedIndex = thisIndex

			Dim i As Integer
			For i = 0 To grid_Main.Items.Count-1
				If CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).CssClass <> grid_Main.SelectedIndex
					CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).Checked = False
				Else
					CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).Checked = True
				End If
			Next i

			Return True
		Catch ex as Exception
			grid_Main.SelectedIndex = -1
			Return False
		End Try
	End Function

'====================================================================================================

	'設定編輯狀態
	Sub set_Editable(thisStatus As Boolean)

		text_csmSDate.Enabled = thisStatus
		text_csmEDate.Enabled = thisStatus
		text_csmNo.Enabled = thisStatus
		text_csmMemo.Enabled = thisStatus


		Dim i As Integer

		'國內旅費
		For i = 0 To grid_cashDtl.Items.Count - 1
			'CType(grid_cashDtl.Items(i).FindControl("text_acdTrlAddrS"), TextBox).Enabled = thisStatus
			'CType(grid_cashDtl.Items(i).FindControl("text_acdTrlAddrE"), TextBox).Enabled = thisStatus
			'CType(grid_cashDtl.Items(i).FindControl("text_acdTrlAddrS"), TextBox).Enabled = thisStatus
			'CType(grid_cashDtl.Items(i).FindControl("text_acdTrlOrgName"), TextBox).Enabled = thisStatus
			'CType(grid_cashDtl.Items(i).FindControl("text_acdMemo"), TextBox).Enabled = thisStatus
			CType(grid_cashDtl.Items(i).FindControl("CheckBox1"), CheckBox).Enabled = thisStatus
		Next i
	End Sub

	'設定按鈕狀態
	Sub set_Butten(ByRef thisGrid As DataGrid, thisMode As String)

		Select Case thisMode

			'未選(預設) -1; '已選(按刪除後) -1; '新增(按取消後) -1
			Case "DEF", "S2D", "N2C"
				btn_new.Enabled = False
				btn_edit.Enabled = False
				btn_delete.Enabled = False
				btn_update.Enabled = False
				btn_cancel.Enabled = False
				btn_print.Enabled = False

				Try
					CType(thisGrid.Items(thisGrid.SelectedIndex).FindControl("CheckBox1"), CheckBox).Checked = False
					'thisGrid.SelectedIndex = -1
					thisGrid.SelectedIndex = thisGrid.SelectedIndex
				Catch ex as Exception
				End Try

			'未選(按新增後) -1; '已選(按新增後) -1; '已選(按修改後) n
			Case "NEW", "S2E"
				btn_new.Enabled = False
				btn_edit.Enabled = False
				btn_delete.Enabled = False
				btn_update.Enabled = True
				btn_cancel.Enabled = True
				btn_print.Enabled = False

				Try
					Select Case thisMode
						Case "NEW"
							CType(thisGrid.Items(thisGrid.SelectedIndex).FindControl("CheckBox1"), CheckBox).Checked = False
							thisGrid.SelectedIndex = -1
						Case "S2E"
							thisGrid.SelectedIndex = thisGrid.SelectedIndex
					End Select
				Catch ex as Exception
					thisGrid.SelectedIndex = -1
				End Try

			'已選 n; '新增(按儲存後) n; '修改(按儲存後) n; '修改(按取消後) n
			Case "SEL", "N2S", "E2S", "E2C"
				btn_new.Enabled = False
				btn_edit.Enabled = True
				btn_delete.Enabled = False
				btn_update.Enabled = False
				btn_cancel.Enabled = False
				btn_print.Enabled = True

				Try
					thisGrid.SelectedIndex = thisGrid.SelectedIndex
				Catch ex as Exception
				End Try
		End Select
	End Sub

	'設定表格狀態
	Sub set_Selectable(ByRef thisGrid As DataGrid, thisStatus As Boolean)
		Dim i As Integer
		For i = 0 To thisGrid.Items.Count - 1
			CType(thisGrid.Items(i).FindControl("CheckBox1"), CheckBox).Enabled = thisStatus
		Next i
	End Sub

'====================================================================================================

	Sub btn_new_Click(sender As Object, e As EventArgs)

		'撥還年度
		text_csmYear.Text = Session("default_Year")
		text_csmCnt.Text = "0"
		text_csmMoney.Text = "0"

		text_csmSDate.Text = ChtDate(System.DateTime.Now.ToString("yyyy/MM/dd"))
		text_csmEDate.Text = ChtDate(System.DateTime.Now.ToString("yyyy/MM/dd"))

		'撥還批次
		'text_csmNo.Text = Val(MySqlDbReader("SELECT ISNULL(MAX(csmNo), 0) FROM [cashMain1]")) + 1
		'960327 加入年度過濾(新年度時批次才會歸零)
		text_csmNo.Text = Val(MySqlDbReader("SELECT ISNULL(MAX(csmNo), 0) FROM [cashMain1] WHERE ([csmYear]=" & Session("default_Year") & ")")) + 1
		'備註
		text_csmMemo.Text = ""

		grid_cashDtl.DataSource = get_cashDtl1(Session("default_Year"))
		grid_cashDtl.DataBind()

		Dim tmp_csmMoney As Double = 0
		For i As Integer = 0 To grid_cashDtl.Items.Count - 1
			Dim CheckBox1 As CheckBox = grid_cashDtl.Items(i).FindControl("CheckBox1")
			Dim lab_acvPassMoney As Label = grid_cashDtl.Items(i).FindControl("lab_acvPassMoney")

			CheckBox1.Checked = True
			tmp_csmMoney += Val(lab_acvPassMoney.Text.Replace(",", ""))
		Next i
		text_csmCnt.Text = grid_cashDtl.Items.Count
		text_csmMoney.Text = tmp_csmMoney.ToString("#,#")

		'設定按鈕狀態
		set_Butten(grid_Main, "NEW")
		'set_Butten(grid_Main, "S2E")

		'設定編輯狀態
		set_Editable(True)

		'設定表格狀態
		set_Selectable(grid_Main, False)

		AddingNew = True

		ddl_filter.Items.Clear()
		ddl_filter.Items.Add("全部")
	End Sub

	Sub btn_edit_Click(sender As Object, e As EventArgs)

		text_csmEDate.Text = ChtDate(System.DateTime.Now.ToString("yyyy/MM/dd"))

		grid_cashDtl.DataSource = get_cashDtl1(Val(text_csmYear.Text), Val(text_csmNo.Text), True)
		grid_cashDtl.DataBind()

		'設定編輯狀態
		set_Editable(True)

		'設定按鈕狀態
		set_Butten(grid_Main, "S2E")

		'設定表格狀態
		set_Selectable(grid_Main, False)

		AddingNew = False

		ddl_filter.Items.Clear()
		ddl_filter.Items.Add("全部")
	End Sub

'====================================================================================================

	Sub btn_update_Click(sender As Object, e As EventArgs)

		If Val(text_csmCnt.Text) <= 0 Then
			Response.Write("<script" & ">self.alert('未勾選任何領用項目')</" & "script>")
			Exit Sub
		End If

		If Session("update").ToString() = ViewState("update").ToString() Then

			Dim i, j As Integer
			Dim queStr As String
			Dim tmp_acmYear, tmp_acpMarkDate As String
			Dim tmp_acpPayNo As Integer



			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact


				Dim csmSDate As String = EngDate(text_csmSDate.Text, System.DateTime.Now.ToString("yyyy/MM/dd"))
				Dim csmEDate As String = EngDate(text_csmEDate.Text, System.DateTime.Now.ToString("yyyy/MM/dd"))

				If AddingNew = True Then
					'主檔cashMain新增
					If add_cashMain1( _
						Val(text_csmYear.Text), _
						Val(text_csmNo.Text), _
						csmSDate, _
						csmEDate, _
						Trim(text_csmMemo.Text), _
						Val(text_csmCnt.Text), _
						Val(text_csmMoney.Text.Replace(",", "")), _
						Session("default_UserName"), _
						Session("login_UserName"), _
						_Connection, _Transact) < 0 Then

						Response.Write("<script" & ">self.alert('儲存失敗：新增領用主檔')</" & "script>")
						Exit Sub
					End If
				Else
					'主檔cashMain修改
					If upd_cashMain1( _
						Val(text_csmYear.Text), _
						Val(text_csmNo.Text), _
						csmSDate, _
						csmEDate, _
						Trim(text_csmMemo.Text), _
						Val(text_csmCnt.Text), _
						Val(text_csmMoney.Text.Replace(",", "")), _
						Session("login_UserName"), _
						_Connection, _Transact) < 0 Then

						Response.Write("<script" & ">self.alert('儲存失敗：更新領用主檔')</" & "script>")
						Exit Sub
					End If
				End If

				If NOT AddingNew = True Then
					'明細cashDtl刪除
					del_cashDtl1(Val(text_csmYear.Text), Val(text_csmNo.Text), _Connection, _Transact)
				End If

			Dim acmYear, acmNo, acpPayYear, acpPayNo, acvNo, acvSubNo As Integer

			For i = 0 To grid_cashDtl.Items.Count - 1

				Dim CheckBox1 As CheckBox = grid_cashDtl.Items(i).FindControl("CheckBox1")

				If CheckBox1.Checked = True Then

					Dim lab_acmWordNum As Label = grid_cashDtl.Items(i).FindControl("lab_acmWordNum")

					acmYear = Val(Split(lab_acmWordNum.ToolTip, ",")(0))
					acmNo = Val(Split(lab_acmWordNum.ToolTip, ",")(1))
					acpPayYear = Val(Split(lab_acmWordNum.ToolTip, ",")(2))
					acpPayNo = Val(Split(lab_acmWordNum.ToolTip, ",")(3))
					acvNo = Val(Split(lab_acmWordNum.ToolTip, ",")(4))
					acvSubNo = Val(Split(lab_acmWordNum.ToolTip, ",")(5))

					'明細cashDtl新增
					If add_cashDtl1( _
						Val(text_csmYear.Text), _
						Val(text_csmNo.Text), _
						acmYear, _
						acmNo, _
						acpPayYear, _
						acpPayNo, _
						acvNo, _
						acvSubNo, _
						_Connection, _Transact) < 0 Then

						Response.Write("<script" & ">self.alert('儲存失敗：更新領用明細檔')</" & "script>")
						Exit Sub
					End If

				End If
			Next i




			_Transact.Commit()

			Response.Write("<script" & ">self.alert('儲存成功')</" & "script>")

			Session("update") = Server.URLEncode(System.DateTime.Now.ToString())


			Catch ex As Exception
				If Not _Transact Is Nothing Then

					Response.Write("<script" & ">self.alert('儲存失敗：" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")

					_Transact.Rollback()
				Else
					Response.Write("<script" & ">self.alert('SQL Server 不存在或拒絕存取。')</" & "script>")
				End If
			Finally
				_Connection.Close()
			End Try


			Initialize()

			grid_Main.DataSource = get_cashMain(Session("default_Year"))
			grid_Main.DataBind()

			If AddingNew = True Then

				'設定按鈕狀態
				set_Butten(grid_Main, "N2S")

				If set_Selected(0) = True Then get_Selected()
			Else
				'設定按鈕狀態
				set_Butten(grid_Main, "E2S")

				If set_Selected(grid_Main.SelectedIndex) = True Then get_Selected()
			End If

			'設定編輯狀態
			set_Editable(False)

			'設定表格狀態
			set_Selectable(grid_Main, True)


			AddingNew = False
		Else
			'重複送出
		End If
	End Sub

'====================================================================================================

	Sub btn_delete_Click(sender As Object, e As EventArgs)

		Dim queStr As String

		If Session("update").ToString() = ViewState("update").ToString() Then

			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact


				'領用明細檔
				queStr = "DELETE FROM [cashDtl1] WHERE (([csmYear] = " & text_csmYear.Text & ") AND ([csmNo] = " & grid_Main.DataKeys(grid_Main.SelectedIndex) & "))"
				MySqlDbWriter(queStr, _Connection, _Command)

				'領用主檔
				queStr = "DELETE FROM [cashMain1] WHERE (([csmYear] = " & text_csmYear.Text & ") AND ([csmNo] = " & grid_Main.DataKeys(grid_Main.SelectedIndex) & "))"
				MySqlDbWriter(queStr, _Connection, _Command)

				_Transact.Commit()


				Response.Write("<script" & ">self.alert('刪除成功')</" & "script>")


				Session("update") = Server.URLEncode(System.DateTime.Now.ToString())

				'設定按鈕狀態
				set_Butten(grid_Main, "S2D")

				Initialize()

				grid_Main.DataSource = get_cashMain(Session("default_Year"))
				grid_Main.DataBind()

				set_Selected(-1)

				'檢查是否可新增
				check_new()

			Catch ex As Exception

				If Not _Transact Is Nothing Then

					Response.Write("<script" & ">self.alert('刪除失敗：" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")

					_Transact.Rollback()
				Else
					Response.Write("<script" & ">self.alert('SQL Server 不存在或拒絕存取。')</" & "script>")
				End If
			Finally
				_Connection.Close()
			End Try
		End If
	End Sub

	Sub btn_cancel_Click(sender As Object, e As EventArgs)

		Initialize()

		If AddingNew = True Then

			'設定按鈕狀態
			set_Butten(grid_Main, "N2C")
		Else
			'設定按鈕狀態
			set_Butten(grid_Main, "E2C")
		End If

		'設定編輯狀態
		set_Editable(False)

		'設定表格狀態
		set_Selectable(grid_Main, True)

		If set_Selected(grid_Main.SelectedIndex) = True Then get_Selected()

		AddingNew = False

		'檢查是否可新增
		check_new()
	End Sub

	Sub btn_print_Click(sender As Object, e As EventArgs)
		'Response.Write(grid_Main.SelectedIndex)
		Response.Write(WindowOpen("../Reports/Tab_10_P.aspx?Year=" & text_csmYear.Text & "&batNo=" & text_csmNo.Text, "Print"))
	End Sub

	Sub btn_search_Click(sender As Object, e As EventArgs)

	End Sub

	Sub text_goto_TextChanged(sender As Object, e As EventArgs)
		Dim s As String = Trim(text_goto.Text)
		If IsNumeric(s) = False Then Exit Sub

		Dim dt As New System.Data.DataTable
		dt = DB.DbSum.DAT.BudgetDT.GetKindAutoActMainDT(DB.DbSum.DAT.BudgetDT.WorkKindType.PayUserAuto, Session("default_UserNo"), "TRAVEL", Session("default_Month"), Session("default_Year"), 0, 0, Nothing, Nothing, Nothing, "1")
		dt.DefaultView.Sort = "acmWordNum DESC"		', acmWordNumSubNo DESC"

		Dim intRow = dt.DefaultView.Find(s)
		Dim p, r As Integer
			p = intRow \ grid_Main.PageSize
			r = intRow Mod grid_Main.PageSize

		If r = -1 Then
			Response.Write("<script" & ">self.alert('" & DB.DbSum.DAT.BudgetDT.FindWordNum(Trim(text_goto.Text)) & "')</" & "script>")
			text_goto.Text = "尋找動支編號"
			set_Selected(r)
		Else
			grid_Main.CurrentPageIndex = p
			grid_Main.DataSource = dt.DefaultView
			grid_Main.DataBind()

			text_goto.Text = "尋找動支編號"

			If set_Selected(r) = True Then get_Selected()
		End If
	End Sub

'====================================================================================================

	Function get_UnitName(thisNo As String) As String
		Dim queStr As String = "SELECT [部門名稱] FROM [部門名稱] WHERE (部門代碼='" & thisNo & "')"
		Try
			Return MySqlDbReader(queStr) & ""
		Catch ex as Exception
			Return ""
		End Try
	End Function

	Function get_UserName(thisNo As String) As String
		Dim queStr As String = "SELECT [員工姓名] FROM [員工基本資料] WHERE (員工代碼='" & thisNo & "')"
		Try
			Return MySqlDbReader(queStr) & ""
		Catch ex as Exception
			Return ""
		End Try
	End Function

	'取得"隊別代碼"
	Function get_teamNo(unitNo As String) As String
		Try
			Return MySqlDbReader("SELECT ISNULL([隊別代碼], '') FROM [部門名稱] WHERE ([部門代碼] = '" & unitNo & "')")
		Catch
			Return ""
		End Try
	End Function

	Function get_acpModify(acmYear As Integer, acmNo As Integer, UserOrTime As String) As String
		Dim queStr As String = "SELECT TOP 1 " & UserOrTime & " FROM actPay WHERE (acmYear = " & acmYear & ") AND (acmNo = " & acmNo & ") ORDER BY  acpModifyDTime DESC"
		Try
			Return MySqlDbReader(queStr) & ""
		Catch ex as Exception
			Return ""
		End Try
	End Function

	'過濾
	Sub ddl_filter_SelectedIndexChanged(sender As Object, e As EventArgs)

		BindGrid()
		'set_Editable(True)
		'970409 編輯時方可勾選撥還項目
		set_Editable(btn_update.Enabled)

	End Sub

</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="../calendarStyle.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.Freezing{
	position:relative;
	top:expression(this.offsetParent.scrollTop+0);
	z-index: 10;
	height: 24px;
}
.FreezingCol0{
	LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 0px solid;
}
.FreezingCol1{
	LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 1px solid;
}
.FreezingCol2{
	LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1);
	/*freezingDiv2 is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 1px solid;
}
.BL{
	border-left: 1px solid #808080;
}
</style>
<script language="javascript" type="text/javascript">
<!--
function go_left_top(){
gift.style.left=document.body.scrollLeft;
gift.style.top=document.body.scrollTop;}

function check_Num(){
if(event.keyCode>=48&&event.keyCode<=57){
return true;}
else{event.keyCode=0;false;}
}

function fnCallPhraseDialog(thisName){
var strReturnVal=showModalDialog("../FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
if (strReturnVal != "Cancel" ){
document.all(thisName).value=document.all(thisName).value+strReturnVal;}
}

function onCalendar_csmSDate_Change(calendar){
var lbl_csmSDate = document.getElementById("text_csmSDate");
var vDay = new Date(calendar.GetSelectedDate());
lbl_csmSDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
}

function onCalendar_csmEDate_Change(calendar){
var lbl_csmEDate = document.getElementById("text_csmEDate");
var vDay = new Date(calendar.GetSelectedDate());
lbl_csmEDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
}
//-->
</script>
<script language="vbscript">
<!--
Function Val(thisValue)
	On Error Resume next
	Val = CDbl(thisValue)
	If Err.Number <> 0 then
		Val = 0
		Err.Clear
	End If
End Function

Function set_csmCnt()
	'grid_cashDtl__ctl?_CheckBox1
	'grid_cashDtl__ctl?_lab_acvPassMoney

	Dim i, csmCnt, csmMoney
	For i = 2 To document.all.Length
		If document.all("grid_cashDtl__ctl" & i & "_CheckBox1") Is Nothing Then
			Exit For
		Else
			If document.all("grid_cashDtl__ctl" & i & "_CheckBox1").Checked = True Then
				csmCnt = csmCnt + 1
				csmMoney = csmMoney + Val(document.all("grid_cashDtl__ctl" & i & "_lab_acvPassMoney").innerText)
			End If
		End If
	Next

	document.all("text_csmCnt").Value = csmCnt
	document.all("text_csmMoney").Value = csmMoney
End Function

-->
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="50">
	<form runat="server">
	<!-- #include file="../header.html" -->
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
			<table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 10" bgcolor="#DADEE9" bordercolor="#666668">
				<tr>
					<td>
					<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
						<tr>
							<td>
							<table border="0" cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed">
								<tr>
									<td width="100" align="right">撥還年度</td>
									<td width="100"><asp:TextBox id="text_csmYear" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></td>
									<td width="100" align="right">撥還數量</td>
									<td width="100"><asp:TextBox id="text_csmCnt" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></td>
									<td width="100" align="right">撥還金額</td>
									<td width="100"><asp:TextBox id="text_csmMoney" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" ReadOnly="True"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">撥還期間</td>
									<td width="300" colspan="3">
									<table border="0" cellpadding="0" style="border-collapse: collapse">
										<tr>
											<td><asp:TextBox id="text_csmSDate" style="TEXT-ALIGN: center; background-color: #FFFFE0" runat="server" Width="60px" ReadOnly="True" Enabled="False" ondblclick="JavaScript: Calendar_csmSDate.Show();">　/　/　</asp:TextBox><COMPONENTART:CALENDAR id="Calendar_csmSDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="text_csmSDate" PopUp="Custom" ClientSideOnSelectionChanged="onCalendar_csmSDate_Change"></COMPONENTART:CALENDAR></td>
											<td>&nbsp;<font size="1">～</font>&nbsp;</td>
											<td><asp:TextBox id="text_csmEDate" style="TEXT-ALIGN: center; background-color: #FFFFE0" runat="server" Width="60px" ReadOnly="True" Enabled="False" ondblclick="JavaScript: Calendar_csmEDate.Show();">　/　/　</asp:TextBox><COMPONENTART:CALENDAR id="Calendar_csmEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="text_csmEDate" PopUp="Custom" ClientSideOnSelectionChanged="onCalendar_csmEDate_Change"></COMPONENTART:CALENDAR></td>
										</tr>
									</table>
									</td>
									<td width="100" align="right">撥還批次</td>
									<td width="100"><asp:TextBox id="text_csmNo" style="TEXT-ALIGN: center; background-color: #FFFFE0" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">備註</td>
									<td width="500" colspan="5" nowrap><asp:TextBox id="text_csmMemo" MaxLength="255" style="TEXT-ALIGN: left; background-color: #FFFFE0" runat="server" Width="490px" Enabled="False"></asp:TextBox></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed">
								<tr>
									<td width="600">
									<div id="freezingDiv" style="width: 600px; height: 220px; overflow: auto; border-style: groove; border-width: 1px">
										<asp:DataGrid id="grid_cashDtl" runat="server" width="100%" BorderStyle="None" BackColor="White" CellSpacing="1" CellPadding="3" GridLines="None" AutoGenerateColumns="False" style="margin-left: -1" OnItemCreated="grid_cashDtl_ItemCreated">
											<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle backcolor="WhiteSmoke"></ItemStyle>
											<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366" CssClass="Freezing"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="撥還">
													<HeaderStyle wrap="False" horizontalalign="Center" forecolor="DarkOrange"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
													<ItemTemplate>
														<asp:CheckBox id="CheckBox1" runat="server" Checked='<%# IIf(IsDbNull(DataBinder.Eval(Container, "DataItem.csmNo")), False, True) %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>' Enabled="False" onclick="vbscript:set_csmCnt()"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="動支編號">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
													<ItemTemplate>
														<asp:Label id="lab_acmWordNum" font-size="X-Small" font-names="Verdana" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.acmNo") & "," & DataBinder.Eval(Container, "DataItem.acpPayYear") & "," & DataBinder.Eval(Container, "DataItem.acpPayNo") & "," & DataBinder.Eval(Container, "DataItem.acvNo") & "," & DataBinder.Eval(Container, "DataItem.acvSubNo") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="計畫科目">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
													<ItemTemplate>
														<font size="2"><asp:Label id="text_acvPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.計畫名稱") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvPlanCode") %>'></asp:Label></font>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="用途別科目">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
													<ItemTemplate>
														<font size="2"><asp:Label id="text_acvOutlayName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.用途別名稱") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>'></asp:Label></font>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="事由∕用途說明">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemTemplate>
														<font size="2"><asp:Label id="lab_acvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label></font>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="金額">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Right"></ItemStyle>
													<ItemTemplate>
														<asp:Label id="lab_acvPassMoney" font-size="X-Small" font-names="Verdana" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPassMoney", "{0:#,#0}") %>' ToolTip='<%# Sender.ClientID %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="申請人">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
													<ItemTemplate>
														<font size="2"><asp:Label id="text_acmWorkUser" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWorkUser") %>'></asp:Label></font>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="編號">
													<HeaderStyle wrap="False" CssClass="BL"></HeaderStyle>
													<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
													<ItemTemplate>
														<asp:Label id="text_ReceiveNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ReceiveNo") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:DataGrid>
									</div>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
			<td valign="top" style="padding-left: 5px"><!-- include file="xxxx.aspx" --></td>
		</tr>
	</table>
	<table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 5" bgcolor="#DADEE9" bordercolor="#666668">
		<tr>
			<td>
			<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
				<tr>
					<td>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><asp:Button id="btn_new" runat="server" Text="新增" Width="50px" Height="22px" onclick="btn_new_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_edit" runat="server" Text="修改" Width="50px" Height="22px" onclick="btn_edit_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_delete" runat="server" Text="刪除" Width="50px" Height="22px" onclick="btn_delete_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_update" runat="server" Text="儲存" Width="50px" Height="22px" onclick="btn_update_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_cancel" runat="server" Text="取消" Width="50px" Height="22px" onclick="btn_cancel_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_search" runat="server" Text="查詢" Width="50px" Height="22px" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_print" runat="server" Text="列印" Width="50px" Height="22px" onclick="btn_print_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:TextBox id="text_goto" style="TEXT-ALIGN: center; IME-MODE: disabled" runat="server" Width="100px" AutoPostBack="True" OnTextChanged="text_goto_TextChanged" onkeypress="return check_Num()" onFocus="this.select()" onclick='this.value=""'>尋找動支編號</asp:TextBox><input type="button" value="s" name="btn_goto" style="font-family: Webdings; width: 16; height: 22; font-size:8pt"></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<div id="_freezingDiv" style="width: 600px; height: auto; overflow: auto; border-style: groove; border-width: 1px">
						<asp:DataGrid id="grid_Main" DataKeyField="csmNo" runat="server" BorderStyle="None" BackColor="White" CellSpacing="1" CellPadding="3" GridLines="None" AutoGenerateColumns="False" Width="100%" AllowPaging="true" PageSize="5"  OnPageIndexChanged="grid_Main_Page">
							<SelectedItemStyle font-bold="True" backcolor="DarkOrange"></SelectedItemStyle>
							<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
							<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
							<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="選取">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle horizontalalign="Center"></ItemStyle>
									<HeaderTemplate>
										<input disabled="disabled" type="checkbox" value="ON" name="C1" />
									</HeaderTemplate>
									<ItemTemplate>
										<asp:CheckBox id="CheckBox1" OnCheckedChanged="CheckBox_CheckedChanged" AutoPostBack="True" runat="server" CssClass='<%# Container.ItemIndex %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:CheckBox>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="年度">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle font-size="XX-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_csmYear" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="批次">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle font-size="XX-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_csmNo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="撥　　還　　期　　間">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle font-size="XX-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_csmSDate" runat="server" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.csmSDate")) %>'></asp:Label> <font size="1">～</font> <asp:Label id="lab_csmEDate" runat="server" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.csmEDate")) %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="數量">
									<ItemStyle font-size="XX-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_csmCnt" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.csmCnt") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="金額">
									<ItemStyle font-size="XX-Small" font-names="Verdana" wrap="False" horizontalalign="Right"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_csmMoney" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.csmMoney", "{0:#,#0}") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="備　　註">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemTemplate>
										<asp:Label id="lab_csmMemo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.csmMemo") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="最後異動">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_ModifyUser" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.ModifyUser") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.ModifyDTime") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle horizontalalign="Center" forecolor="DarkOrange" backcolor="#666668" mode="NumericPages"></PagerStyle>
						</asp:DataGrid>
					</div>
					</td>
				</tr>
				<tr>
					<td align="right">
					<table border="0" cellpadding="0" style="border-collapse: collapse">
						<tr>
							<td><font size="2">只列出｜</font></td>
							<td>
							<asp:DropDownList id="ddl_filter" runat="server" OnSelectedIndexChanged="ddl_filter_SelectedIndexChanged" AutoPostBack="True" DataTextField="計畫名稱" DataValueField="計畫代碼">
								<asp:ListItem Value="">全部</asp:ListItem>
							</asp:DropDownList>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	<!-- Insert content here -->
	</form>
</body>
</html>