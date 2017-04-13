<%@ Page Language="VB" Debug="true" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<!-- #include file="Default.bas" -->
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

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

	'主檔(讀取)
	Function get_actMain(ByVal acmYear As Integer, _
						Optional acmMonth As Integer = -1, _
						Optional acmWorkUnitNo As String = Nothing, _
						Optional acmWorkUserNo As String = Nothing, _
						Optional acmKidNum As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "" & _
				"SELECT DISTINCT " & _
					"(SELECT COUNT(*) FROM [actMainAss] WHERE (acmYear = M.acmYear) AND (acmNo = M.acmNo)) AS assNoCount, " & _
					"M.acmYear, M.acmNo, M.acmKidNum, M.acmMonth, M.acmDay, " & _
					"ISNULL(ISNULL(M.acmTopWordNum, M.acmSourWordNum), M.acmWordNum) AS acmWordNum, " & _
					"M.acmMarkDate, " & _
					"ISNULL(DN.dptName, M.acmWorkUnitNo) AS acmWorkUnitName, M.acmWorkUnitNo, M.acmWorkUserNo, " & _
					"M.acmMoney, " & _
					"M.acmMemo, " & _
					"ISNULL(M.acmModifyUser, M.acmCreateUser) AS acmModifyUser, " & _
					"ISNULL(M.acmModifyDTime, M.acmCreateDTime) AS acmModifyDTime " & _
				"FROM actMain M " & _
					"INNER JOIN actVisa V ON M.acmYear = V.acmYear AND M.acmNo = V.acmNo " & _
					"LEFT OUTER JOIN codDepartName AS DN ON M.acmWorkUnitNo = DN.dptCode " & _
				"WHERE (M.acmYear = @acmYear) " & _
					"AND (" & _
							"(SELECT COUNT(*) FROM actMain1 M1 WHERE M1.acmYear = M.acmYear AND M1.acmNo = M.acmNo) + " & _
							"(SELECT COUNT(*) FROM actMain2 M2 WHERE M2.acmYear = M.acmYear AND M2.acmNo = M.acmNo) + " & _
							"(SELECT COUNT(*) FROM actPay P WHERE P.acmYear = M.acmYear AND P.acmNo = M.acmNo) = 0" & _
						") "

		If acmMonth <> -1 Then
			queryString & = "AND (M.acmMonth = @acmMonth) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (M.acmKidNum = @acmKidNum) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (M.acmWorkUnitNo = @acmWorkUnitNo) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (M.acmWorkUserNo = @acmWorkUserNo) "
		End If

			queryString &= "ORDER BY M.acmYear, M.acmNo DESC"
'Response.Write(queryString.Replace("@acmYear", acmYear))
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmMonth", acmMonth))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmKidNum", acmKidNum))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmWorkUnitNo", acmWorkUnitNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmWorkUserNo", acmWorkUserNo))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	'明細(讀取)
	Function get_actMainAss(ByVal acmYear As Integer, ByVal acmNo As Integer) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [acmYear], [acmNo], [assNo], " & _
											"[acmMoney], [assMoney], " & _
											"[assWorkUnitNo], [assMemo] " & _
									"FROM [actMainAss] MA " & _
									"WHERE (MA.[acmYear] = @acmYear) AND (MA.[acmNo] = @acmNo)"
'Response.Write(queryString)
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	'明細(讀取)(空白)
	Function get_actMainAss_blank() As System.Data.DataSet
		Return get_actMainAss(-1, -1)
	End Function

	'明細(新增)
	Function add_actMainAss( _
					ByVal acmYear As Integer, _
					ByVal acmNo As Integer, _
					ByVal assNo As Integer, _
				ByVal acmMoney As Object, _
				ByVal assMoney As Object, _
					ByVal assWorkUnitNo As String, _
					ByVal assMemo As String, _
				ByVal assModifyDTime As Object, _
				ByVal assModifyUser As String, _
		myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actMainAss] " & _
										"(" & _
											"[acmYear], [acmNo], [assNo], " & _
											"[acmMoney], [assMoney], " & _
											"[assWorkUnitNo], " & _
											"[assMemo], " & _
											"[assModifyDTime], [assModifyUser]" & _
										") " & _
										"VALUES " & _
										"(" & _
											"@acmYear, @acmNo, @assNo, " & _
											"@acmMoney, @assMoney, " & _
											"@assWorkUnitNo, " & _
											"@assMemo, " & _
											"@assModifyDTime, @assModifyUser" & _
										")"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@assNo", assNo, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@acmMoney", acmMoney, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@assMoney", assMoney, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@assWorkUnitNo", assWorkUnitNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@assMemo", assMemo))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@assModifyDTime", assModifyDTime))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@assModifyUser", assModifyUser))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'明細(刪除)
	Function del_actMainAss(ByVal acmYear As Integer, ByVal acmNo As Integer, _
		myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "DELETE FROM [actMainAss] " & _
									"WHERE ([acmYear] = @acmYear) AND ([acmNo] = @acmNo)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

'====================================================================================================

	'部門
	Function get_codDepartName() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [dptCode], (dptCode + ' ' + dptName) AS [dptName], 1 AS [ODBY] " & _
									"FROM [codDepartName] WHERE (ISNULL([dptStopFlag],'0') = '0') " & _
									"UNION " & _
									"SELECT '' AS [dptCode], '…' AS [dptName], 0 AS [ODBY] " & _
									"ORDER BY [ODBY], [dptCode]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

'====================================================================================================

	Sub Initialize()

		text_acmYear.Text = ""					'Session("default_Year")
		text_acmNo.Text = ""
		text_acmMonth.Text = ""

		text_acmWordNum.Text = ""
		text_acmMoney.Text = ""

		text_acmWorkUnitNo.Text = ""			'Session("default_UnitName")
			text_acmWorkUnitNo.ToolTip = ""		'Session("default_UnitNo")
		text_acmWorkUserNo.Text = ""			'Session("default_UserName")
			text_acmWorkUserNo.ToolTip = ""		'Session("default_UserNo")
		text_acmMarkDate.Text = "　/　/　"

		text_acmMemo.Text = ""

		grid_actMainAss.DataSource = Nothing
		grid_actMainAss.DataBind()
	End Sub

'====================================================================================================

	Sub Page_Load(Sender As Object, E As EventArgs)

		DB.sysMenu.DAT.sysMenuBZ.CheckMenuID()

		DisableAfterSubmit("ctl00")

		If Not Page.IsPostBack Then

			'過濾用部門
			ddl_filter.DataBind()

			Initialize()

			'↓刪除前確認寫法
			btn_delete.Attributes.Add("onclick","if (window.confirm('按一下[確定]，永遠刪除這一列。您無法復原這項變更。') == false) return false; DisableAfterSubmit();" & Me.GetPostBackEventReference(Me.btn_delete) & ";")
			'↓新增時展開摺疊項目
			btn_new.Attributes.Add("onclick","SetFold('block', 'FoldTitle_10', 'img_FoldTitle_10'); DisableAfterSubmit();" & Me.GetPostBackEventReference(Me.btn_new) & ";")

			grid_Main.Attributes.Add("BorderColor", "#D4D0C8")	'修正 Framework v2+ 框線問題

			BindGrid()

			'設定按鈕狀態
			set_Butten(grid_Main, "DEF")

			AddingNew = False
		End If
	End Sub

'====================================================================================================

	Sub BindGrid(Optional acpExtNo As String = Nothing)

		Dim acmWorkUnitNo, acmWorkUserNo As String
			acmWorkUnitNo = Nothing: acmWorkUserNo = Nothing
		Dim _mod As String = DB.sysMenu.DAT.sysMenuBZ.Request("mod")
		Select Case _mod
			Case "2"	'全部

			Case "4"	'單位
				acmWorkUnitNo = Session("default_UnitNo")
			Case Else	'個人
				acmWorkUserNo = Session("default_UserName")
		End Select

		Dim dt As DataTable
		If ddl_default_month.SelectedIndex > 0 Then
			dt = get_actMain(Session("default_Year"), ddl_default_month.SelectedValue, acmWorkUnitNo, acmWorkUserNo).Tables(0)
		Else
			dt = get_actMain(Session("default_Year"),, acmWorkUnitNo, acmWorkUserNo).Tables(0)
		End If

		Dim _dv As DataView
			_dv = dt.DefaultView
			_dv.Sort = ViewState("SortField") & ""

'Response.Write(ddl_filter.SelectedValue)
		If ddl_filter.Items.Count > 0 AndAlso ddl_filter.SelectedIndex <> 0 Then

			_dv.RowFilter = "acmWorkUnitNo='" & ddl_filter.SelectedValue & "'"
		Else
			_dv.RowFilter = Nothing
		End If

		grid_Main.DataSource = _dv

		If grid_Main.CurrentPageIndex <> 0 And grid_Main.Items.Count = 1 Then
			grid_Main.CurrentPageIndex -= 1
		End If

		Try
			grid_Main.DataBind()
		Catch ex As Exception
			Response.Write("<script" & ">self.alert('" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")
		End Try
	End Sub

'====================================================================================================

	Sub grid_actMainAss_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Or e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			e.Item.Cells(0).CssClass = "DIV1_FreezingCol"
			e.Item.Cells(1).CssClass = "DIV1_FreezingCol2"
		End If
	End Sub

	Sub grid_actMainAss_DataBound(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			Dim ddl_assWorkUnitNo As DropDownList = e.Item.FindControl("ddl_assWorkUnitNo")
			ForceSelect(ddl_assWorkUnitNo, ddl_assWorkUnitNo.CssClass)
		End If
	End Sub

'====================================================================================================

	Sub grid_Main_Page(Sender As Object, e As DataGridPageChangedEventArgs)

		If btn_update.Enabled = True Then Exit Sub	'編輯中不得換頁

		Sender.CurrentPageIndex = e.NewPageIndex

		BindGrid()

		Try
			'設定按鈕狀態
			set_Butten(grid_Main, "N2S")	'換頁後自動勾選第1筆 + 讀取: set_CheckBox(grid_Main, "CheckBox1", 0, True)
		Catch
			'設定按鈕狀態
			set_Butten(grid_Main, "DEF")
		End Try
	End Sub

	Sub grid_Main_SortCommand(source As Object, e As DataGridSortCommandEventArgs)
		If btn_update.Enabled = True Then Exit Sub	'編輯中不得排序

		If ViewState("SortField") & "" = Nothing OrElse ViewState("SortField") <> e.SortExpression Then
			ViewState("SortField") = e.SortExpression
		Else
			ViewState("SortField") = e.SortExpression & " DESC"
		End If

		BindGrid()

		set_CheckBox(grid_Main, "CheckBox1", -1)
	End Sub

	'未使用
	Sub grid_Main_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.SelectedItem Then

		End If

		If e.Item.ItemType = ListItemType.Pager Then
			Dim tc As TableCell = e.Item.Controls(0)
				tc.Attributes.Add("colspan", 9)	'v2.0時須加上此段來修正Bug
		End If

		If ViewState("SortField") & "" <> Nothing Then
			Dim lbl As New Label
				lbl.Font.Name = "webdings"
			Dim SortFields As String() = (ViewState("SortField") & " ").Split(" ")
			If e.Item.ItemType = ListItemType.Header Then
				For i As Integer = 0 To sender.Columns.Count - 1	'不適用於AutoGenerateColumns
					If sender.Columns(i).SortExpression = SortFields(0) Then
						Try
							If SortFields(1) = "DESC" Then
								lbl.Text = "6"
							Else
								lbl.Text = "5"
							End If
						Catch
							lbl.Text = ""
						End Try
						e.Item.Cells(i).Controls.Add(lbl)
						Exit For
					End If
				Next i
			End If
		End If
	End Sub

	'未使用
	Sub grid_Main_DataBound(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

		End If
	End Sub

	'必要
	Sub grid_Main_SelectedIndexChanged(sender As Object, e As EventArgs)
		For Each item As DataGridItem In sender.Items
			Dim CheckBox1 As CheckBox = item.Cells(0).FindControl("CheckBox1")
				CheckBox1.Checked = IIf(item.ItemIndex = sender.SelectedIndex, True, False)
		Next item
	End Sub

	'必要
	Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs)
		Try
			grid_Main.SelectedIndex = sender.NamingContainer.ItemIndex
		Catch
			grid_Main.SelectedIndex = Val(sender.CssClass)
		End Try

		Dim e_grid_Main As System.EventArgs
		Try
			grid_Main_SelectedIndexChanged(sender.NamingContainer.NamingContainer, e_grid_Main)
		Catch
			grid_Main_SelectedIndexChanged(grid_Main, e_grid_Main)
		End Try


		'設定按鈕狀態
		set_Butten(grid_Main, "SEL")

		'讀取該列資料
		get_Selected()	'由資料判斷是否改變預設按鈕狀態

		AddingNew = False
	End Sub

'====================================================================================================

	'指定勾選項目(-1:取消)
	Sub set_CheckBox(DG As DataGrid, cbName As String, cbIndex As Integer, Optional autoRead As Boolean = False)
		DG.SelectedIndex = -1: DG.SelectedIndex = cbIndex

		For Each item As DataGridItem In DG.Items
			Dim CheckBox1 As CheckBox = item.Cells(0).FindControl(cbName)
				CheckBox1.Checked = IIf(item.ItemIndex = DG.SelectedIndex, True, False)
		Next item

		If autoRead = True Then
			get_Selected()
		End If
	End Sub

	'讀取該列資料
	Sub get_Selected()
'		Try
			Dim gdi As DataGridItem = grid_Main.Items(grid_Main.SelectedIndex)

			text_acmYear.Text = get_tccVAL(gdi.FindControl("lab_acmYear"))
			text_acmNo.Text = get_tccVAL(gdi.FindControl("lab_acmYear"), True)
			text_acmMonth.Text = get_tccVAL(gdi.FindControl("lab_acmMonth"))

			text_acmWordNum.Text = get_tccVAL(gdi.FindControl("lab_acmWordNum"))
			text_acmMoney.Text = get_tccVAL(gdi.FindControl("lab_acmMoney"))

			text_acmWorkUnitNo.Text = get_tccVAL(gdi.FindControl("lab_acmWorkUnitNo"))
				text_acmWorkUnitNo.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWorkUnitNo"), True)
			text_acmWorkUserNo.Text = get_tccVAL(gdi.FindControl("lab_acmWorkUserNo"))
				text_acmWorkUserNo.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWorkUserNo"), True)
			text_acmMarkDate.Text = get_tccVAL(gdi.FindControl("lab_acmMarkDate"))

			text_acmMemo.Text = get_tccVAL(gdi.FindControl("lab_acmMemo"))

			grid_actMainAss.DataSource = get_actMainAss(Val(text_acmYear.Text), grid_Main.DataKeys(grid_Main.SelectedIndex))
			grid_actMainAss.DataBind()

			'由資料判斷是否改變預設按鈕狀態
			If grid_actMainAss.Items.Count = 0 Then
				btn_delete.Enabled = False
				btn_edit.Text = "新增"
			Else
				btn_edit.Text = "編輯"
			End If
'		Catch
			'設定按鈕狀態
'			set_Butten(grid_Main, "DEF")
'			Response.Write("<b><font color=red>Sorry, couldn't find</font></b>")
'		End Try
	End Sub

'====================================================================================================

	'設定表格狀態
	Sub set_Selectable(ByRef thisGrid As DataGrid, thisStatus As Boolean)
		For i As Integer = 0 To thisGrid.Items.Count - 1
			CType(thisGrid.Items(i).FindControl("CheckBox1"), CheckBox).Enabled = thisStatus
		Next i

		set_Headable(thisGrid, thisStatus)

		set_Pageable(thisGrid, thisStatus)
	End Sub

	'設定 Header 狀態
	Sub set_Headable(ByRef thisGrid As DataGrid, thisStatus As Boolean)
'Response.Write(                 thisGrid.Controls(0).Controls(1).Controls.Count & "<hr>")
		For i As Integer = 0 To thisGrid.Controls(0).Controls(1).Controls.Count-1
			Try
'Response.Write(thisGrid.Controls(0).Controls(1).Controls(i).Controls(0).ToString() & "<br>")
				Dim tcc As Control = thisGrid.Controls(0).Controls(1).Controls(i).Controls(0)
				Select Case tcc.GetType.Name
					Case "Label"
						CType(tcc, Label).Enabled = thisStatus
					Case "LinkButton", "DataGridLinkButton"
						CType(tcc, LinkButton).Enabled = thisStatus
				End Select
			Catch
			End Try
		Next i
	End Sub

	'設定 Pager 狀態
	Sub set_Pageable(ByRef thisGrid As DataGrid, thisStatus As Boolean)
		Dim PagerIndex As Integer = thisGrid.Controls(0).Controls.Count-1
'		Dim TR AS TableRow = thisGrid.Controls(0).Controls(PagerIndex)
'			TR.Style.Add("display", IIf(thisStatus = False, "none", "block"))
		For i As Integer = 0 To thisGrid.Controls(0).Controls(PagerIndex).Controls(0).Controls.Count-1
'Response.Write(thisGrid.Controls(0).Controls(PagerIndex).Controls(0).Controls(i).ToString() & "<br>")
			Try
				Dim tcc As Control = thisGrid.Controls(0).Controls(PagerIndex).Controls(0).Controls(i)
				Select Case tcc.GetType.Name
					Case "Label"
						CType(tcc, Label).Enabled = thisStatus
					Case "LinkButton", "DataGridLinkButton"
						CType(tcc, LinkButton).Enabled = thisStatus
				End Select
			Catch
			End Try
		Next i
	End Sub


	'設定按鈕狀態
	Sub set_Butten(ByRef thisGrid As DataGrid, thisMode As String)
		Select Case thisMode
			'未選(預設) -1; '已選(按刪除後) -1; '新增(按取消後) -1
			Case "DEF", "S2D", "N2C"
				btn_addRow.Enabled = False
				btn_new.Enabled = True
				btn_edit.Enabled = False
				btn_delete.Enabled = False
				btn_update.Enabled = False
				btn_cancel.Enabled = False
				btn_print.Enabled = False

'				chk_acpExtPassFlag.Enabled = False

				Try
					'指定勾選項目
					set_CheckBox(thisGrid, "CheckBox1", -1)
				Catch ex As Exception
				End Try

			'未選(按新增後) -1; '已選(按新增後) -1; '已選(按修改後) n
			Case "NEW", "S2E"
				btn_addRow.Enabled = True
				btn_new.Enabled = False
				btn_edit.Enabled = False
				btn_delete.Enabled = False
				btn_update.Enabled = True
				btn_cancel.Enabled = True
				btn_print.Enabled = False

'				chk_acpExtPassFlag.Enabled = True

				Try
					Select Case thisMode
						Case "NEW"
							'指定勾選項目
							set_CheckBox(thisGrid, "CheckBox1", -1)
						Case "S2E"
							thisGrid.SelectedIndex = thisGrid.SelectedIndex
					End Select
				Catch ex As Exception
					'指定勾選項目
					set_CheckBox(thisGrid, "CheckBox1", -1)
				End Try

			'已選 n; '新增(按儲存後) n+1; '修改(按儲存後) n; '修改(按取消後) n
			Case "SEL", "N2S", "E2S", "E2C"
				btn_addRow.Enabled = False
				btn_new.Enabled = True
				btn_edit.Enabled = True
				btn_delete.Enabled = True
				btn_update.Enabled = False
				btn_cancel.Enabled = False
				btn_print.Enabled = True

'				chk_acpExtPassFlag.Enabled = True

				Try
					Select Case thisMode
						Case "SEL", "E2S", "E2C"
							thisGrid.SelectedIndex = thisGrid.SelectedIndex
						Case "N2S"
							'指定勾選項目
							set_CheckBox(thisGrid, "CheckBox1", 0)
					End Select

					If thisMode <> "SEL" Then set_CheckBox(thisGrid, "CheckBox1", thisGrid.SelectedIndex, True)	'981015 get_Selected()	'讀取該列資料
				Catch ex As Exception
					'指定勾選項目
					set_CheckBox(thisGrid, "CheckBox1", -1)
				End Try
		End Select

	End Sub
'====================================================================================================

	'設定編輯狀態
	Sub set_Editable(thisStatus As Boolean)

		If grid_actMainAss.Items.Count > 0 Then
			For i As Integer = 0 To grid_actMainAss.Items.Count-1
				Dim dgi As DataGridItem = grid_actMainAss.Items(i)

				Dim thisStatus1 As Boolean
'				If Val(get_tccVAL(dgi.FindControl("lab_cmtCount"))) > 0 Then
'					thisStatus1 = False
'				Else
					thisStatus1 = thisStatus
'				End If

				get_tccOBJ(dgi.FindControl("ddl_assWorkUnitNo")).Enabled = thisStatus1
				get_tccOBJ(dgi.FindControl("text_assMoney")).Enabled = thisStatus1
				get_tccOBJ(dgi.FindControl("text_assMemo")).Enabled = thisStatus1

				get_tccOBJ(dgi.FindControl("CheckBox1")).Enabled = thisStatus1
			Next i
		End If

		ddl_filter.Enabled = Not(thisStatus)
		ddl_default_month.Enabled = Not(thisStatus)
	End Sub

'====================================================================================================

	Sub btn_addRow_Click(sender As Object, e As EventArgs)

		Dim i As Integer
		Dim last_assNo As Integer = 0
		Dim last_assMemo As String = text_acmMemo.Text
		Dim total_assMoney As Double = 0

		Dim dt As System.Data.DataTable
		Dim dr As System.Data.DataRow

		Dim ds As New System.Data.DataSet
			ds = get_actMainAss_blank()
			dt = ds.Tables(0)

		Dim dgi As DataGridItem
		'先附加
'		If grid_actMainAss.Items.Count > 0 Then
			For i = 0 To grid_actMainAss.Items.Count - 1
				dgi = grid_actMainAss.Items(i)
				If CType(dgi.FindControl("CheckBox1"), CheckBox).Checked = False Then
					dr = dt.NewRow()

'					dr("cmtCount") = get_tccVAL(dgi.FindControl("lab_cmtCount"))

					dr("acmYear") = Val(text_acmYear.Text)
					dr("acmNo") = Val(text_acmNo.Text)
					dr("assNo") = Val(Split(get_tccVAL(dgi.FindControl("lab_assNo"), True), ",")(2))

					If dr("assNo") = 0 Then
						dr("assNo") = last_assNo + 1
					Else
'						If dr("cmtCount") = 0 Then
							dr("assNo") = last_assNo + 1
'						End If
					End If
						last_assNo = dr("assNo")

					dr("assWorkUnitNo") = get_tccVAL(dgi.FindControl("ddl_assWorkUnitNo"))

					dr("assMoney") = Val( Replace(get_tccVAL(dgi.FindControl("text_assMoney")), ",","") )
						total_assMoney += dr("assMoney")

					dr("assMemo") = Trim(get_tccVAL(dgi.FindControl("text_assMemo")))
						last_assMemo = dr("assMemo")

					dt.Rows.Add(dr)
				End If
			Next i
'		Else

'		End If

	If Val( Replace(text_acmMoney.Text, ",","") ) - total_assMoney > 0 Then
		'再新增
		dr = dt.NewRow()
			dr("acmYear") = Val(text_acmYear.Text)
			dr("acmNo") = Val(text_acmNo.Text)
			dr("assNo") = last_assNo + 1

			dr("assMoney") = Val( Replace(text_acmMoney.Text, ",","") ) - total_assMoney

			dr("assMemo") = last_assMemo

		dt.Rows.Add(dr)
	End If

		grid_actMainAss.DataSource = dt
		grid_actMainAss.DataBind()

		set_Editable(True)
	End Sub

'====================================================================================================

	Sub btn_new_Click(sender As Object, e As EventArgs)

		Initialize()

		Try
			ddl_default_month.SelectedValue = Session("default_Month")
		Catch
			ddl_default_month.SelectedIndex = 0
		End Try
		Try
			ddl_filter.SelectedValue = Session("default_UnitNo")
		Catch
			ddl_filter.SelectedIndex = 0
		End Try


		Dim e_btn_addRow As System.EventArgs
		btn_addRow_Click(btn_addRow, e_btn_addRow)

		'設定按鈕狀態
		set_Butten(grid_Main, "NEW")

		'設定編輯狀態
		set_Editable(True)

		'設定表格狀態
		set_Selectable(grid_Main, False)

		AddingNew = True
	End Sub

	Sub btn_edit_Click(sender As Object, e As EventArgs)

		If grid_actMainAss.Items.Count = 0 Then
			Dim e_btn_addRow As System.EventArgs
			btn_addRow_Click(btn_addRow, e_btn_addRow)
		End If

		'設定按鈕狀態
		set_Butten(grid_Main, "S2E")

		'設定編輯狀態
		set_Editable(True)

		'設定表格狀態
		set_Selectable(grid_Main, False)

		AddingNew = False
	End Sub

	Sub btn_delete_Click(sender As Object, e As EventArgs)

		Dim acmYear As Integer = Val(text_acmYear.Text)
		Dim acmNo As Integer = grid_Main.DataKeys(grid_Main.SelectedIndex)

			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact

				del_actMainAss(acmYear, acmNo, _Connection, _Transact)


				_Transact.Commit()


				Response.Write("<script" & ">self.alert('刪除成功')</" & "script>")

				Initialize()
				BindGrid()

				'設定按鈕狀態
				set_Butten(grid_Main, "S2D")

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
	End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)

		Dim updDateTime As DateTime = Now()

		Dim acmYear, acmNo As Integer
			acmYear = Val(text_acmYear.Text)
			acmNo = Val(text_acmNo.Text)

		Dim acmMemo As String
			acmMemo = text_acmMemo.Text

		Dim acmMoney As Double = Val(Replace(text_acmMoney.Text, ",", ""))

		'輸入檢查
		Dim assMoneyTmps As Double = 0
		Dim ErrorStr As String = ""
		For i As Integer = 0 To grid_actMainAss.Items.Count - 1
			Dim CheckBox1 As CheckBox = grid_actMainAss.Items(i).FindControl("CheckBox1")
			Dim text_assMoney As TextBox = grid_actMainAss.Items(i).FindControl("text_assMoney")

			If CheckBox1.Checked = False AndAlso Val(Replace(text_assMoney.Text, ",", "")) > 0 Then
				assMoneyTmps += Val(Replace(text_assMoney.Text, ",", ""))
			End If

			Dim ddl_assWorkUnitNo As DropDownList = grid_actMainAss.Items(i).FindControl("ddl_assWorkUnitNo")
			If CheckBox1.Checked = False AndAlso ddl_assWorkUnitNo.SelectedIndex <= 0 Then
				ErrorStr &= "項目(" & i + 1 & ") 之 [預算單位] 尚未選取，請修正。" & vbCrLf
			End If
		Next i
		If assMoneyTmps <> acmMoney Then
			Response.Write("<script" & ">self.alert('分配預算金額合計（" & assMoneyTmps & "）與 原預算金額（" & acmMoney & "）不符')</" & "script>")
			Exit Sub
		End If
		If ErrorStr <> "" Then
			Response.Write("<script" & ">self.alert('" & ErrorStr.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")
			Exit Sub
		End If

			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact

				'修改時先刪除
				del_actMainAss(acmYear, acmNo, _Connection, _Transact)

				'明細
				Dim assNo As Integer = 0
				Dim assWorkUnitNo As String = ""
				Dim assMemo As String = ""
				Dim assMoney As Double = 0


			Dim _dgi As DataGridItem = grid_Main.Items(grid_Main.SelectedIndex)
				Dim uniKey As String = get_tccOBJ(_dgi.FindControl("CheckBox1")).Attributes("myKey")

				Dim acmWordNum As String = get_tccVal(_dgi.FindControl("lab_acmWordNum"))

				Dim assMoneyTmp As Double = 0


				Dim j As Integer = 1
				Dim dgi As DataGridItem
				For i As Integer = 0 To grid_actMainAss.Items.Count - 1
					dgi = grid_actMainAss.Items(i)
					If CType(dgi.FindControl("CheckBox1"), CheckBox).Checked = False AndAlso Val( Replace(get_tccVAL(dgi.FindControl("text_assMoney")), ",","") ) > 0 Then

						assWorkUnitNo = get_tccVAL(dgi.FindControl("ddl_assWorkUnitNo"))

						assMemo = Trim(get_tccVAL(dgi.FindControl("text_assMemo")))
						If assMemo = "" Then assMemo = acmMemo

						assMoney = Val( Replace(get_tccVAL(dgi.FindControl("text_assMoney")), ",","") )
						assMoneyTmp += assMoney
					Try
						assNo = Val( Split(get_tccVAL(dgi.FindControl("lab_assNo"), True), ",")(2) )
						'Val(get_tccVAL(dgi.FindControl("lab_assNo")))	'j
					Catch
						assNo = 100 + j
					End Try

						If add_actMainAss( _
								acmYear, _
								acmNo, _
								assNo, _
								acmMoney, _
								assMoney, _
								assWorkUnitNo, _
								assMemo, _
								updDateTime, _
								Session("login_UserName"), _
							_Connection, _Transact) < 0 Then

							Response.Write("<script" & ">self.alert('儲存失敗：[add_actMainAss]')</" & "script>")

							Exit Sub
						Else
							j += 1
						End If

					End If
				Next i


				_Transact.Commit()

				Response.Write("<script" & ">self.alert('儲存成功')</" & "script>")

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



		BindGrid()

		'設定按鈕狀態
		set_Butten(grid_Main, "E2S")

		'修改後重載明細
		grid_actMainAss.DataSource = get_actMainAss(acmYear, acmNo)
		grid_actMainAss.DataBind()

		'設定編輯狀態
		set_Editable(False)

		'設定表格狀態
		set_Selectable(grid_Main, True)

	End Sub

	Sub btn_cancel_Click(sender As Object, e As EventArgs)

		'設定按鈕狀態
		set_Butten(grid_Main, "E2C")

		set_CheckBox(grid_Main, "CheckBox1", grid_Main.SelectedIndex, True)

		'設定編輯狀態
		set_Editable(False)

		'設定表格狀態
		set_Selectable(grid_Main, True)

		AddingNew = False
	End Sub

	Sub btn_print_Click(sender As Object, e As EventArgs)

	End Sub

'====================================================================================================

	Sub text_goto_TextChanged(sender As Object, e As EventArgs)

		If btn_update.Enabled = True Then text_goto.Text = "尋找動支編號": Exit Sub	'編輯中不得尋找

		Dim acmWorkUnitNo, acmWorkUserNo As String
			acmWorkUnitNo = Nothing: acmWorkUserNo = Nothing
		Dim _mod As String = DB.sysMenu.DAT.sysMenuBZ.Request("mod")
		Select Case _mod
			Case "2"	'全部

			Case "4"	'單位
				acmWorkUnitNo = Session("default_UnitNo")
			Case Else	'個人
				acmWorkUserNo = Session("default_UserName")
		End Select

		Dim s As String = Trim(text_goto.Text)
		If IsNumeric(s) = False Then Exit Sub

		Dim dt As New System.Data.DataTable
			dt = get_actMain(Session("default_Year"),, acmWorkUnitNo, acmWorkUserNo).Tables(0)
			dt.DefaultView.Sort = "acmWordNum DESC"

			ViewState("SortField") = "acmWordNum DESC"

		Dim intRow = dt.DefaultView.Find(s)
		Dim p, r As Integer
			p = intRow \ grid_Main.PageSize
			r = intRow Mod grid_Main.PageSize

		If r = -1 Then
			'未尋獲時...
			Response.Write("<script" & ">self.alert('未能找到該筆資料')</" & "script>")

			text_goto.Text = "尋找動支編號"
			set_CheckBox(grid_Main, "CheckBox1", r)
		Else
			grid_Main.CurrentPageIndex = p
			grid_Main.DataSource = dt.DefaultView
			grid_Main.DataBind()

			text_goto.Text = "尋找動支編號"
			set_CheckBox(grid_Main, "CheckBox1", r, True)	'找到後自動讀取
		End If

	End Sub

	'下方過濾
	Sub ddl_filter_SelectedIndexChanged(sender As Object, e As EventArgs)
		'If sender.ID = "ddl_filter" Or (sender.ID = "ddl_default_month" AndAlso (ddl_default_Month.SelectedIndex <> 0 AndAlso Session("default_Month") <> ddl_default_Month.SelectedValue)) Then
		If sender.ID = "ddl_filter" Or (sender.ID = "ddl_default_month" AndAlso (ddl_default_Month.SelectedIndex <> -1)) Then
'Response.Write(sender.ID)
			Initialize()
			grid_Main.CurrentPageIndex = 0
			BindGrid()

			Try
				'設定按鈕狀態
				set_Butten(grid_Main, "N2S")
			Catch
				'設定按鈕狀態
				set_Butten(grid_Main, "DEF")
			End Try

		End If
	End Sub

'====================================================================================================

	'細分科目
	Sub btn_Split_Click(sender As Object, e As EventArgs)

	End Sub

'====================================================================================================

	Function set_assStatus(assNoCount As Integer) As String
		Select Case assNoCount
			Case 0

			Case > 0
				Return "已分配"
		End Select
	End Function

'.HR1_width { width: expression((700 + 78) + "px"); }
'.HR1_noWidth { width: expression((document.body.clientWidth - 22) + "px"); }
'.S1_width { width: 790px; }
'.S1_noWidth { width: auto; }
'.S2_width { border-collapse: collapse; TABLE-LAYOUT: fixed; width: 790px; }
'.S2_noWidth { border-collapse: collapse; TABLE-LAYOUT: fixed; width: auto; }

</script>
<html>
<head>
<title>動支金額分配作業</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="calendarStyle.css" type="text/css" rel="stylesheet" />
<style>

/* 可摺疊標題 */
.sFoldTitle { background-color: #6699FF; CURSOR: hand; }
.sFoldTitleFont { font-size:10pt; color:#FFFFFF; padding-top:4px; padding-left:4px; }
/* DataGrid寬高 */
.DIV1_width { width: 590px; height: 181px; overflow: auto; border-style: groove; border-width: 1px; }
.DIV1_noWidth { width: auto; height: auto; overflow-x: scroll; border-style: groove; border-width: 1px; }
.DIV2_width { width: 590px; height: auto; overflow: auto; border-style: groove; border-width: 1px; }

.DIV1_FreezingCol{
	LEFT: expression(document.getElementById("div_grid_actMainAss").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 0px solid #FFFFFF;
}
.DIV1_FreezingCol2{
	LEFT: expression(document.getElementById("div_grid_actMainAss").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 1px solid #FFFFFF;
}

</style>

<script language="javascript">
<!--

function DisableAfterSubmit(){
	var obj = event.srcElement;
	var objs = document.getElementsByTagName('INPUT');
	for(var i=0; i<objs.length; i++){
		if(objs[i].type.toLowerCase() == 'submit'){
			objs[i].disabled = true;
		}
	}
}

function show_item(item, sender){
	var item_style = document.all[item].style;

	if(typeof sender != "undefined"){
		if(document.getElementById(sender).src.slice(-8) == 'plus.gif'){
			item_style.display = "block";
		}
		else{
			item_style.display = "none";
		}
	}
	else{

		if(item_style.display == 'none'){
			item_style.display = "block";
		}
		else{
			item_style.display = "none";
		}
	}
}

function sync_title_img(sender){
	if(sender.style.display=='block'){
		document.getElementById("img_" + sender.id).src = "images/minus.gif";
	}
	else {
		document.getElementById("img_" + sender.id).src = "images/plus.gif";
	}
}


function scale_item(sender){
	var pORm;
	if(document.getElementById(sender).src.slice(-8) == 'plus.gif')
		pORm = "+";
	else
		pORm = "-";

//	scale_item_by(pORm, "table");
//	scale_item_by(pORm, "td");
	scale_item_by(pORm, "div");
//	scale_item_by(pORm, "hr");

	if(pORm == "+")
		document.getElementById(sender).src = "images/minus.gif";
	else
		document.getElementById(sender).src = "images/plus.gif";
}

function scale_item_by(pORm, tagName){
	var obj = document.getElementsByTagName(tagName);
	for(var i = 0; i < obj.length; i++)
		try{
			if(obj[i].alt != undefined)
//alert(obj[i].alt);
				if(pORm == "+"){
					obj[i].className = obj[i].alt + "_noWidth";
				}
				else{
					obj[i].className = obj[i].alt + "_width";
				}
		} catch(e){;}
}

function GetIEVer(){
	var x;
	for(i=0; i<10; i++){
		for(z=0; z<10; z++){
			if(navigator.appVersion.match("MSIE " + i + "." + z) != null)
				x = i + "." + z;
		}
	}
	return x;
}

//只允許輸入數字(48~57)、負號(-)、小數點(46)
function check_Num(){
	if((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)){
		return true;}
	else {event.keyCode = 0; false;}
}

//-->
</script>
<script language="vbscript">
<!--

'給javascript用的replace
Function vbReplace(A, B, C)
	vbReplace = Replace(A, B, C)
End Function

Function Val(thisValue)
	On Error Resume next
	Val = CDbl(thisValue)
	If Err.Number <> 0 then
		Val = 0
		Err.Clear
	End If
End Function

-->
</script>

<script language="javascript">
<!--

function SetCookie(sName, sValue){
	keepDay = 7;
	setDay = new Date();
	setDay.setTime(setDay.getTime()+(keepDay*1000*60*60*24));
	expDay = setDay.toGMTString();

	document.cookie = sName + "=" + escape(sValue) + "; expires=" + expDay;
}

function GetCookie(sName){
	var aCookie = document.cookie.split("; ");
	for(var i = 0; i < aCookie.length; i++){
		var aCrumb = aCookie[i].split("=");
		if(sName == aCrumb[0])
		return unescape(aCrumb[1]);
	}
	return null;
}

function GetPageName(){
	var strHref = window.location.href;
	var pageName = strHref.slice(strHref.lastIndexOf("/") + 1);
		pageName = (pageName + "?").split("?")[0];
	return pageName;
//	return (window.location.href).slice((window.location.href).lastIndexOf("/") + 1);
}

function jRight(text, numb){
	var str = text;
		str = str.substring(str.length-numb, str.length);
	return str;
}

function set_cookies(){
	SetCookie(GetPageName() + ":FoldTitle_10", FoldTitle_10.style.display);	//折疊項目
	SetCookie(GetPageName() + ":div_grid_actMainAss", div_grid_actMainAss.className);	//縮放表格
}

function get_cookies(){
	SetFold(GetCookie(GetPageName() + ":FoldTitle_10"), "FoldTitle_10", "img_FoldTitle_10");	//折疊項目
	SetDiv(GetCookie(GetPageName() + ":div_grid_actMainAss"), "div_grid_actMainAss", "img1");	//縮放表格
}

function SetFold(sValue, item, sender){
	if(sValue == "none"){
		document.getElementById(item).style.display = "none";
		document.getElementById(sender).src = "images/plus.gif";
	}
	else{
		document.getElementById(item).style.display = "block";
		document.getElementById(sender).src = "images/minus.gif";
	}
}

function SetDiv(sValue, item, sender){
	document.getElementById(item).className = sValue;
	if(jRight(sValue,7) == "noWidth"){
		document.getElementById(sender).src = "images/minus.gif";
	}
	else{
		document.getElementById(sender).src = "images/plus.gif";
	}
}


function Point(_x, _y){
	this.x = _x;
	this.y = _y;
}
function realPosition(_obj){
	var currPos = new Point(_obj.offsetLeft,_obj.offsetTop);
	var workPos = new Point(0,0);
	if (_obj.offsetParent.tagName.toUpperCase() != "BODY") {
		workPos = realPosition(_obj.offsetParent);
		currPos.x += workPos.x;
		currPos.y += workPos.y;
	}
	return currPos;
}

var ControlToAssign
function setControlAssigned(ctrl){
	ControlToAssign = ctrl;
}
function showCalendar(button,calendar){
	//calendar.clearSelectedDate();
	calendar.Show();
}
function onCalendar_Control_Change(calendar){
	var vDay = new Date(calendar.GetSelectedDate());
	ControlToAssign.value = (vDay.getYear()-1911) + '/' + jRight('0' + (vDay.getMonth()+1),2) + '/' + jRight('0' + vDay.getDate(), 2);
	ControlToAssign.fireEvent('onchange');
}

//-->
</script>


</head>
<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies()' onunload='set_cookies()'>
	<form runat="server">
		<!-- Multi-Calendar Start -->
		<div id="oDiv" style="position: absolute; width: 1px; height: 1px; overflow:hidden"><asp:TextBox id="txt_oDiv" runat="server"></asp:TextBox></div>
		<COMPONENTART:CALENDAR id="Calendar1" runat="server" CultureId="1028" CalendarTitleCssClass="ctitle" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="images/cal_nextMonth.gif" PrevImageUrl="images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUp="Custom" ClientSideOnSelectionChanged="onCalendar_Control_Change" PopUpExpandControlId="txt_oDiv"></COMPONENTART:CALENDAR>
		<!-- Multi-Calendar End -->
	<table cellpadding="0" style="border-collapse: collapse; MARGIN-LEFT: 5px" border="0">
		<tr>
			<td valign="top">
			<table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668" bgcolor="#DADEE9">
				<tr>
					<td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
<!-- ↓區塊(1) -->
					<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
						<tr>
							<td style="padding: 0px">

							<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
								<tr>
									<td width="100" align="right">動支年度</td>
									<td width="100">
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td>
													<asp:TextBox id="text_acmYear" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="35px" onfocus="this.blur()"></asp:TextBox>
													<asp:TextBox id="text_acmNo" style="display: none; TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="50px" onfocus="this.blur()"></asp:TextBox>
												</td>
												<td style="display: none"><font size="2">年</font></td>
												<td style="display: none"><asp:TextBox id="text_acmMonth" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="30px" onfocus="this.blur()"></asp:TextBox></td>
												<td style="display: none"><font size="2">月</font></td>
											</tr>
										</table>
									</td>
									<td width="100" align="right">動支編號</td>
									<td width="100"><asp:TextBox id="text_acmWordNum" runat="server" style="TEXT-ALIGN: center" BackColor="Transparent" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">動支金額</td>
									<td width="100"><asp:TextBox id="text_acmMoney" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">執行單位</td>
									<td width="100"><asp:TextBox id="text_acmWorkUnitNo" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">承辦人員</td>
									<td width="100"><asp:TextBox id="text_acmWorkUserNo" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">請示日期</td>
									<td width="100"><asp:TextBox id="text_acmMarkDate" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="75px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">事由</td>
									<td width="500" colspan="5"><asp:TextBox id="text_acmMemo" style="TEXT-ALIGN: left; background-color: #DADEE9; OVERFLOW-X: visible" runat="server" Width="472px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
							</table>

							</td>
						</tr>
					</table>
<!-- 區塊(1)↑ -->
<!-- ↓區塊(2) -->
					<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
						<tr>
							<td>
							<!-- ↓折疊項目(1) -->
							<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
								<tr>
									<td height="20" class="sFoldTitle">
									<table cellpadding="0" style="border-collapse: collapse" border="0">
										<tr>
											<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_10')">分配明細</td>
											<td width="1%" align="right"><img id="img_FoldTitle_10" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_10', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr id="FoldTitle_10" style="display: block" onpropertychange="sync_title_img(this)">
									<td style="padding: 5px">

									<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr>
											<td width="100" align="right"><img id="img1" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img1.fireEvent("onclick")'>分配明細</span></td>
											<td width="490" align="right">
											<table style="display: none; border-collapse: collapse" cellpadding="0" border="0">
												<tr>
													<td><font size="2">分配合計｜</font></td>
													<td><asp:TextBox id="text_assMoneyTotal" runat="server" style="TEXT-ALIGN: right; background-color: #DADEE9" Width="90px" onFocus="this.blur()"></asp:TextBox></td>
												</tr>
											</table>
											</td>
										</tr>
									</table>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
											<div id="div_grid_actMainAss" class="DIV1_width" alt="DIV1">
											<asp:DataGrid id="grid_actMainAss" runat="server" style="MARGIN-LEFT: -1px"
													CellPadding="3" CellSpacing="1" GridLines="None"
													Borderstyle="None" BackColor="White"
													AutoGenerateColumns="False"
													OnItemCreated="grid_actMainAss_ItemCreated"
													OnItemDataBound="grid_actMainAss_DataBound"
													Width="100%">
												<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
												<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
												<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
												<Columns>
													<asp:TemplateColumn>
														<ItemTemplate>
															<asp:Label id="lab_assNo" runat="server" style="TEXT-ALIGN: center" Text='<%# Container.ItemIndex+1 %>' Tooltip='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.acmNo") & "," & DataBinder.Eval(Container, "DataItem.assNo") %>' Width="15px"></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False">
														<ItemTemplate>
															<asp:Label id="lab_acmYear" runat="server" style="TEXT-ALIGN: center" Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>' Width="15px"></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="使用單位">
														<ItemTemplate>
															<asp:DropDownList id="ddl_assWorkUnitNo" runat="server" DataSource="<%# get_codDepartName() %>" DataTextField="dptName" DataValueField="dptCode" CssClass='<%# DataBinder.Eval(Container, "DataItem.assWorkUnitNo") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="分配金額">
														<ItemTemplate>
															<asp:TextBox id="text_assMoney" runat="server" style="TEXT-ALIGN: right; IME-MODE: disabled; background-color: #FFFFE0" Text='<%# DataBinder.Eval(Container, "DataItem.assMoney", "{0:#0}") %>' MaxLength="9" Width="90px" Enabled="False" onFocus="this.select()" onkeypress="return check_Num()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="備註">
														<ItemTemplate>
															<asp:TextBox id="text_assMemo" runat="server" style="background-color: #FFFFE0" Text='<%# DataBinder.Eval(Container, "DataItem.assMemo") %>' MaxLength="255" Width="265px" Enabled="False"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="移除">
														<HeaderStyle wrap="False" horizontalalign="Center" forecolor="DarkOrange"></HeaderStyle>
														<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
														<ItemTemplate>
															<asp:CheckBox id="CheckBox1" runat="server" ToolTip="移除勾選的資料列" Enabled="False"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>

												</Columns>
											</asp:DataGrid>
											</div>
											</td>
										</tr>
									</table>
									<table cellpadding="3" style="border-collapse: collapse; margin-bottom: -2px; width: 100%" border="0">
										<tr>
											<td nowrap>
												<asp:Button id="btn_addRow" runat="server" Width="75px" Height="22px" Text="增加列數" onclick="btn_addRow_Click" CausesValidation="False"></asp:Button>
												<asp:Button id="btn_Split" runat="server" style="display: none; margin-bottom: 2" Width="16px" Height="22px" Text="±" onclick="btn_Split_Click" CausesValidation="False" Enabled="True"></asp:Button>
												&nbsp;<font color="#FF0000" size="2">※請先調整 [預算金額] 後再按 [增加列數] 鈕</font>
											</td>
											<td align="right">　</td>
										</tr>
									</table>
									<!-- Insert 項目內容 here -->
									</td>
								</tr>
							</table>
							<!-- 折疊項目(1)↑ -->
							<!-- Insert 折疊項目 here -->
							</td>
						</tr>
					</table>
<!-- 區塊(2)↑ -->
<!-- Insert 區塊 here -->
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
<!-- ↓歷史資料 -->
	<table cellpadding="0" style="border-collapse: collapse; margin-top: 5; MARGIN-LEFT: 5px" border="1" bordercolor="#666668" bgcolor="#DADEE9">
		<tr>
			<td>
			<table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
				<tr>
					<td>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td style="display: none"><asp:Button id="btn_new" runat="server" Text="新增" Width="50px" Height="22px" onclick="btn_new_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_edit" runat="server" Text="編輯" Width="50px" Height="22px" onclick="btn_edit_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_delete" runat="server" Text="刪除" Width="50px" Height="22px" onclick="btn_delete_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_update" runat="server" Text="儲存" Width="50px" Height="22px" onclick="btn_update_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_cancel" runat="server" Text="取消" Width="50px" Height="22px" onclick="btn_cancel_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_print" runat="server" Text="列印" Width="50px" Height="22px" onclick="btn_print_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:TextBox id="text_goto" runat="server" style="TEXT-ALIGN: center; IME-MODE: disabled" Width="95px" AutoPostBack="True" OnTextChanged="text_goto_TextChanged" onkeypress="if(event.keyCode==13){this.blur();return false;} else return check_Num();" onblur="if(this.value==''){this.value='尋找動支編號'};" onclick='this.value=""'>尋找動支編號</asp:TextBox><input type="button" value="s" name="btn_goto" style="font-family: Webdings; width: 16; height: 22; font-size:8pt"></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<div id="_freezingDiv" class="DIV2_width">
					<asp:DataGrid id="grid_Main" runat="server"
							DataKeyField="acmNo"
							CellSpacing="1" CellPadding="3" GridLines="None"
							BorderColor="White" BackColor="White"
							AutoGenerateColumns="False"
							OnItemCreated="grid_Main_ItemCreated"
							OnItemDataBound="grid_Main_DataBound"
							OnSelectedIndexChanged="grid_Main_SelectedIndexChanged"
							AllowPaging="True" PageSize="5"
							OnPageIndexChanged="grid_Main_Page"
							AllowSorting="true"
							OnSortCommand="grid_Main_SortCommand"
							Width="100%">
						<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
						<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
						<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
						<SelectedItemStyle font-bold="True" backcolor="DarkOrange"></SelectedItemStyle>
						<Columns>
							<asp:TemplateColumn>
								<ItemStyle horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:CheckBox id="CheckBox1" runat="server" CssClass="<%# Container.ItemIndex %>" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" myKey='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="年度">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmYear" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="月份" Visible="False">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmMonth" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmMonth") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmDay") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="請示日期" Visible="False">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmMarkDate" runat="server" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.acmMarkDate") & "") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmMarkDate") & "" %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="類別" Visible="False">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmKidNum" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmKidNum") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmWordNum" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="執行單位" SortExpression="acmWorkUnitNo">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle wrap="False"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmWorkUnitNo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmWorkUnitName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmWorkUnitNo") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="承辦人員" SortExpression="acmWorkUserNo">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle wrap="False"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmWorkUserNo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmWorkUserNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmWorkUserNo") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="動支金額" SortExpression="acmMoney">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Right"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmMoney" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmMoney", "{0:#,0}") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmMoney", "{0:#,#}") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="動支事由">
								<ItemTemplate>
									<asp:Label id="lab_acmMemo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmMemo") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="最後異動">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmModifyUser" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmModifyUser") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmModifyDTime") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>

							<asp:TemplateColumn HeaderText="a" SortExpression="assNoCount" Visible="True">
								<HeaderStyle font-size="X-Small" font-names="Webdings" wrap="False" horizontalalign="Center"></HeaderStyle>
								<ItemTemplate>
									<asp:Label id="lab_assNoCount" runat="server" forecolor="Red" text='<%# set_assStatus(DataBinder.Eval(Container, "DataItem.assNoCount") & "") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.assNoCount") & "" %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
						<PagerStyle horizontalalign="Center" forecolor="DarkOrange" backcolor="#666668" mode="NumericPages" position="Bottom"></PagerStyle>
					</asp:DataGrid>
					</div>
					</td>
				</tr>
				<tr>
					<td align="right">
					<table cellpadding="0" style="border-collapse: collapse" border="0">
						<tr>
							<td><font size="2">只列出｜</font></td>
							<td>
								<asp:DropDownList id="ddl_default_month" runat="server" OnSelectedIndexChanged="ddl_filter_SelectedIndexChanged" AutoPostBack="True" Visible="True">
									<asp:ListItem Value="">…</asp:ListItem>
									<asp:ListItem Value="1">&nbsp;&nbsp;1月</asp:ListItem>
									<asp:ListItem Value="2">&nbsp;&nbsp;2月</asp:ListItem>
									<asp:ListItem Value="3">&nbsp;&nbsp;3月</asp:ListItem>
									<asp:ListItem Value="4">&nbsp;&nbsp;4月</asp:ListItem>
									<asp:ListItem Value="5">&nbsp;&nbsp;5月</asp:ListItem>
									<asp:ListItem Value="6">&nbsp;&nbsp;6月</asp:ListItem>
									<asp:ListItem Value="7">&nbsp;&nbsp;7月</asp:ListItem>
									<asp:ListItem Value="8">&nbsp;&nbsp;8月</asp:ListItem>
									<asp:ListItem Value="9">&nbsp;&nbsp;9月</asp:ListItem>
									<asp:ListItem Value="10">10月</asp:ListItem>
									<asp:ListItem Value="11">11月</asp:ListItem>
									<asp:ListItem Value="12">12月</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td><asp:DropDownList id="ddl_filter" runat="server" DataSource="<%# get_codDepartName() %>" DataTextField="dptName" DataValueField="dptCode" OnSelectedIndexChanged="ddl_filter_SelectedIndexChanged" AutoPostBack="True" Visible="True"></asp:DropDownList></td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
<!--歷史資料↑ -->

		<!-- Insert content here -->
		<font style="margin-left: 10px" face="Verdana" size="1"><%=Environment.Version.ToString() %></font>
	</form>
</body>
</html>
