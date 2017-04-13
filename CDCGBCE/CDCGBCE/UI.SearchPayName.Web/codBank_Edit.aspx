<%@ Page Language="VB" Debug="true" validaterequest="false" enableEventValidation="false" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

'====================================================================================================

	Property Editable() As Boolean
		Get
			Dim o As Object = ViewState("Editable")
			If o Is Nothing Then
				Return False
			End If
			Return CBool(o)
		End Get

		Set(ByVal Value As Boolean)
			ViewState("Editable") = Value
		End Set
	End Property

'====================================================================================================

	'產生 SqlParameter 給 dbCommand.Parameters 來 Add
	Function creatParameter(ByVal pType As System.Data.DbType, ByVal pName As String, Optional ByVal pValue As Object = Nothing) As System.Data.IDataParameter
		Dim dbParam As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
			dbParam.ParameterName = "@" & Replace(pName, "@", "")
			dbParam.DbType = pType
		If pValue <> Nothing Then
			dbParam.Value = pValue
		Else
			dbParam.Value = System.DBNull.Value
		End If
		Return dbParam
	End Function

	Function get_codBankName(Optional ignoreStopFlag As Boolean = False) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT " & _
										"[bnkBankNo], " & _
										"[bnkBankName], " & _
										"[bnkBankAlias], " & _
										"[bnkDepLen], " & _
										"ISNULL(bnkBankKind,'') AS [bnkBankKind], " & _
										"[bnkToBankNo], " & _
										"[bnkToBankDate], " & _
										"[bnkOldName], " & _
										"[bnkMemo], " & _
										"[bnkCreateDate], " & _
										"ISNULL(bnkStopFlag,'0') AS [bnkStopFlag], " & _
										"[bnkStopDate] " & _
									"FROM [codBankName] "
		If ignoreStopFlag = True Then
			queryString &= "WHERE (ISNULL([bnkStopFlag],'0') = '1') "
		End If
			queryString &= "ORDER BY [bnkBankNo]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_codBankSubName(Optional bnkBankNo As String = Nothing, Optional ignoreStopFlag As Boolean = False) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT " & _
										"[bnkBankNo], " & _
										"[bnksBankSubNo], " & _
										"[bnksBankSubName], " & _
										"[bnksBankSubAlias], " & _
										"[bnksToBankSubNo], " & _
										"[bnksToBankSubDate], " & _
										"[bnksOldName], " & _
										"[bnksMemo], " & _
										"[bnksCreateDate], " & _
										"ISNULL(bnksStopFlag,'0') AS [bnksStopFlag], " & _
										"[bnksStopDate] " & _
									"FROM [codBankSubName] " & _
									"WHERE (1=1) "
		If bnkBankNo <> Nothing Then
			queryString &= "AND ([bnkBankNo] = '" & bnkBankNo & "') "
		End If
		If ignoreStopFlag = True Then
			queryString &= "AND (ISNULL([bnkStopFlag],'0') = '1') "
		End If
			queryString &= "ORDER BY [bnkBankNo]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function upd_codBankName( _
				ByVal bnkBankNo As String, _
				ByVal bnkBankName As String, _
				ByVal bnkBankAlias As String, _
				ByVal bnkDepLen As String, _
				ByVal bnkBankKind As String, _
				ByVal bnkToBankNo As String, _
				ByVal bnkOldName As String, _
				ByVal bnkToBankDate As Object, _
				ByVal bnkMemo As String, _
				ByVal bnkStopFlag As String, _
				ByVal bnkStopDate As Object) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "UPDATE [codBankName] SET " & _
										"[bnkBankName]=@bnkBankName, " & _
										"[bnkBankAlias]=@bnkBankAlias, " & _
										"[bnkDepLen]=@bnkDepLen, " & _
										"[bnkBankKind]=@bnkBankKind, " & _
										"[bnkToBankNo]=@bnkToBankNo, " & _
										"[bnkOldName]=@bnkOldName, " & _
										"[bnkToBankDate]=@bnkToBankDate, " & _
										"[bnkMemo]=@bnkMemo, " & _
										"[bnkStopFlag]=@bnkStopFlag, " & _
										"[bnkStopDate]=@bnkStopDate " & _
									"WHERE ([bnkBankNo] = @bnkBankNo)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkBankNo", bnkBankNo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkBankName", bnkBankName))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkBankAlias", bnkBankAlias))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkDepLen", bnkDepLen))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkBankKind", IIf(bnkBankKind <> "", bnkBankKind, Nothing)))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkToBankNo", bnkToBankNo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@bnkToBankDate", bnkToBankDate))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkOldName", bnkOldName))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkMemo", bnkMemo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkStopFlag", IIf(bnkStopFlag = "1", bnkStopFlag, "0")))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@bnkStopDate", IIf(bnkStopFlag = "1", bnkStopDate, Nothing)))

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function upd_codBankSubName( _
				ByVal bnkBankNo As String, _
				ByVal bnksBankSubNo As String, _
				ByVal bnksBankSubName As String, _
				ByVal bnksBankSubAlias As String, _
				ByVal bnksToBankSubNo As String, _
				ByVal bnksToBankSubDate As Object, _
				ByVal bnksOldName As String, _
				ByVal bnksMemo As String, _
				ByVal bnksStopFlag As String, _
				ByVal bnksStopDate As Object) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "UPDATE [codBankSubName] SET " & _
										"[bnksOldName]=@bnksOldName, " & _
										"[bnksMemo]=@bnksMemo, " & _
										"[bnksToBankSubNo]=@bnksToBankSubNo, " & _
										"[bnksStopDate]=@bnksStopDate, " & _
										"[bnksBankSubName]=@bnksBankSubName, " & _
										"[bnksBankSubAlias]=@bnksBankSubAlias, " & _
										"[bnksToBankSubDate]=@bnksToBankSubDate, " & _
										"[bnksStopFlag]=@bnksStopFlag " & _
									"WHERE (([codBankSubName].[bnkBankNo] = @bnkBankNo) AND ([codBankSubName].[bnksBankSubNo] = @bnksBankSubNo))"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnkBankNo", bnkBankNo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksBankSubNo", bnksBankSubNo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksBankSubName", bnksBankSubName))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksBankSubAlias", bnksBankSubAlias))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksToBankSubNo", bnksToBankSubNo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@bnksToBankSubDate", bnksToBankSubDate))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksOldName", bnksOldName))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksMemo", bnksMemo))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@bnksStopFlag", IIf(bnksStopFlag = "1", bnksStopFlag, "0")))
		dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@bnksStopDate", IIf(bnksStopFlag = "1", bnksStopDate, Nothing)))

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

'====================================================================================================

	Sub Page_Init(sender as Object, e as EventArgs)

	End Sub

	Sub Page_Load(Sender As Object, E As EventArgs)
		If Request.QueryString("mod") <> Nothing Then
			Select Case LCase(Trim(Request.QueryString("mod")))
				Case "edit"
					Editable = True
				Case Else
					Editable = False
			End Select
		End If

		If Not Page.IsPostBack Then
			dg_codBankName.DataSource = get_codBankName()
			dg_codBankName.DataBind()

'			dg_codBankSubName.DataSource = get_codBankSubName()
'			dg_codBankSubName.DataBind()
		End If
	End Sub

'====================================================================================================

	Sub dg_codBankName_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Then
			Dim divStart As String = "<div class='title'>"
			Dim divEnd As String = "</div>"

			For i As Integer = 1 To e.Item.Cells.Count-3
				e.Item.Cells(i).Text = divStart.Replace("'title'", "'title' title='" & i & "'") & e.Item.Cells(i).Text & divEnd
			Next i

			e.Item.Cells(e.Item.Cells.Count-2).Text = "<div class='titlePadding'>" & e.Item.Cells(e.Item.Cells.Count-2).Text & divEnd
		End If
		If e.Item.ItemType = ListItemType.Pager Then
			Dim tc As TableCell = e.Item.Controls(0)
				tc.Attributes.Add("colspan", 14)	'v2.0時須加上此段來修正Bug
		End If
	End Sub

	Sub dg_codBankName_ItemDataBound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			For i As Integer = 1 To e.Item.Cells.Count-1
				Dim Controls As String() = Split("." & e.Item.Cells(i).Controls(1).ToString(), ".")
				Select Case Controls(Controls.Length-1)
					Case "TextBox"
						Dim TextBox As TextBox = e.Item.Cells(i).Controls(1)
						sender.Columns(i).HeaderStyle.Width = TextBox.Width
					Case"CheckBox"
						sender.Columns(i).HeaderStyle.Width = Unit.Pixel(35)
				End Select

				If Editable = True Then
					Dim CheckBox1 As HtmlInputCheckBox = e.Item.FindControl("CheckBox1")
'Response.Write(i & " - " & e.Item.Cells(i).Controls(1).ToString & "<br>")
					Select Case i
						Case 1,13
							'不處理
						Case Else
							Dim tmp_Object As String() = Split(e.Item.Cells(i).Controls(1).ToString, ".")
							Select Case tmp_Object(UBound(tmp_Object))
								Case "DropDownList"
									CType(e.Item.Cells(i).Controls(1), DropDownList).Attributes.Add("onchange", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
								Case "TextBox"
									CType(e.Item.Cells(i).Controls(1), TextBox).Attributes.Add("onchange", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
								Case "CheckBox"
									CType(e.Item.Cells(i).Controls(1), CheckBox).Attributes.Add("onclick", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
							End Select
					End Select
				End If
			Next i
		End If
	End Sub

	Sub dg_codBankName_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
		If sender.Items.Count > 0 Then
			Dim vCount As Integer = 0
			sender.Columns(1).Visible = Editable: vCount += IIf(Editable, 0, 1)		'儲存
			sender.Columns(5).Visible = Editable: vCount += IIf(Editable, 0, 1)		'帳號長度
			sender.Columns(6).Visible = Editable: vCount += IIf(Editable, 0, 1)		'銀行分類
			sender.Columns(7).Visible = Editable: vCount += IIf(Editable, 0, 1)		'變更後總行代碼
			sender.Columns(8).Visible = Editable: vCount += IIf(Editable, 0, 1)		'原總行名稱
			sender.Columns(9).Visible = Editable: vCount += IIf(Editable, 0, 1)		'變更日期
			sender.Columns(11).Visible = Editable: vCount += IIf(Editable, 0, 1)	'停用
			sender.Columns(12).Visible = Editable: vCount += IIf(Editable, 0, 1)	'停用日期
			sender.Columns(13).Visible = Editable: vCount += IIf(Editable, 0, 1)	'建立於
			sender.Columns(14).Visible = Editable: vCount += IIf(Editable, 0, 1)	'移除

			Dim footerIndex As Integer = sender.Controls(0).Controls.Count-1
			sender.Controls(0).Controls(footerIndex).Controls(0).Attributes("colSpan") = sender.Columns.Count - IIf(Editable, 0, vCount)
		End If
	End Sub

	Sub dg_codBankName_PageIndexChanged(Sender As Object, e As DataGridPageChangedEventArgs)
		Sender.CurrentPageIndex = e.NewPageIndex
		If ViewState("codBankName") Is Nothing Then
			Sender.DataSource = get_codBankName()
		Else
			ViewState("codBankName").DefaultView.RowFilter = ViewState("RowFilter")
			Sender.DataSource = ViewState("codBankName").DefaultView
		End If
		Sender.SelectedIndex = -1
		Sender.DataBind()

		dg_codBankSubName.DataSource = Nothing
		dg_codBankSubName.DataBind()
	End Sub

'====================================================================================================

	Sub dg_codBankSubName_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Then
			Dim divStart As String = "<div class='title'>"
			Dim divEnd As String = "</div>"

			For i As Integer = 2 To e.Item.Cells.Count-4
				e.Item.Cells(i).Text = divStart.Replace("'title'", "'title' title='" & i & "'") & e.Item.Cells(i).Text & divEnd
			Next i

			e.Item.Cells(e.Item.Cells.Count-3).Text = "<div class='titlePadding'>" & e.Item.Cells(e.Item.Cells.Count-3).Text & divEnd
		End If

		If e.Item.ItemType = ListItemType.Pager Then
			Dim tc As TableCell = e.Item.Controls(0)
'				tc.Attributes.Add("colspan", 16)	'v2.0時須加上此段來修正Bug
		End If

		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			Dim lbtn As LinkButton = e.Item.Cells(0).Controls(0)
			lbtn.Text = IIf(Editable, "儲存", "選取")
		End If
	End Sub

	Sub dg_codBankSubName_ItemDataBound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			For i As Integer = 3 To e.Item.Cells.Count-2
				Dim Controls As String() = Split("." & e.Item.Cells(i).Controls(1).ToString(), ".")
				Select Case Controls(Controls.Length-1)
					Case "TextBox"
						Dim TextBox As TextBox = e.Item.Cells(i).Controls(1)
						sender.Columns(i).HeaderStyle.Width = TextBox.Width
					Case"CheckBox"
						sender.Columns(i).HeaderStyle.Width = Unit.Pixel(35)
				End Select
			Next i


			If Editable = True Then
				Dim CheckBox1 As HtmlInputCheckBox = e.Item.FindControl("CheckBox1")
				For i As Integer = 3 To e.Item.Cells.Count - 2
'Response.Write(i & " - " & e.Item.Cells(i).Controls(1).ToString & "<br>")
					Select Case i
						Case 3,13
							'不處理
						Case Else
							Dim tmp_Object As String() = Split(e.Item.Cells(i).Controls(1).ToString, ".")
							Select Case tmp_Object(UBound(tmp_Object))
								Case "DropDownList"
									CType(e.Item.Cells(i).Controls(1), DropDownList).Attributes.Add("onchange", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
								Case "TextBox"
									CType(e.Item.Cells(i).Controls(1), TextBox).Attributes.Add("onchange", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
								Case "CheckBox"
									CType(e.Item.Cells(i).Controls(1), CheckBox).Attributes.Add("onclick", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
							End Select
					End Select
				Next i
			End If
		End If
	End Sub

	Sub dg_codBankSubName_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
		Dim footerIndex As Integer
		If sender.Items.Count = 0 Then
			Try
				Dim tc As TableCell = sender.Controls(0).Controls(sender.Controls(0).Controls.Count-1).Controls(0)
					tc.Attributes.Add("noWrap", -1)
				Dim _Label As Label = tc.Controls(0)
					_Label.Text = "<A style=" & Chr(34) & "FONT-SIZE: x-small; COLOR: #ff8000; MARGIN-TOP: 3; MARGIN-LEFT: 4" & Chr(34) & " href=" & Chr(34) & "javascript:__doPostBack('lbtn_close','')" & Chr(34) & ">尚未建立資料∕關閉</A>"

				footerIndex = sender.Controls(0).Controls.Count-1
				sender.Controls(0).Controls(footerIndex).Controls(0).Attributes("colSpan") = 7
			Catch
			End Try
		Else If sender.Items.Count > 0
			Dim vCount As Integer = 0
			sender.Columns(2).Visible = Editable: vCount += IIf(Editable, 0, 1)		'儲存
			sender.Columns(7).Visible = Editable: vCount += IIf(Editable, 0, 1)		'變更後分行代碼
			sender.Columns(8).Visible = Editable: vCount += IIf(Editable, 0, 1)		'原分行名稱
			sender.Columns(9).Visible = Editable: vCount += IIf(Editable, 0, 1)		'變更日期
			sender.Columns(11).Visible = Editable: vCount += IIf(Editable, 0, 1)	'停用
			sender.Columns(12).Visible = Editable: vCount += IIf(Editable, 0, 1)	'停用日期
			sender.Columns(13).Visible = Editable: vCount += IIf(Editable, 0, 1)	'建立於
			sender.Columns(14).Visible = Editable: vCount += IIf(Editable, 0, 1)	'移除
			sender.Columns(15).Visible = False: vCount += 1							'總行代碼

			footerIndex = sender.Controls(0).Controls.Count-1
			sender.Controls(0).Controls(footerIndex).Controls(0).Attributes("colSpan") = sender.Columns.Count - IIf(Editable, 0, vCount)
		End If
	End Sub

	Sub lbtn_close_Click(sender As Object, e As EventArgs)
		dg_codBankSubName.DataSource = Nothing
		dg_codBankSubName.DataBind()

		dg_codBankName.Enabled = True
		dg_codBankName.DataSource = get_codBankName()
		dg_codBankName.DataBind()

		Dim div_codBankSubName1 As System.Web.UI.HtmlControls.HtmlGenericControl = Me.FindControl("div_codBankSubName1")
			div_codBankSubName1.Attributes("style") = "position: absolute; width: auto; height: auto"
	End Sub

	Sub dg_codBankSubName_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs)
		Select (CType(e.CommandSource, LinkButton)).CommandName
			Case "Cancel"
				dg_codBankSubName.DataSource = Nothing
				dg_codBankSubName.DataBind()

				dg_codBankName.Enabled = True
				If ViewState("codBankName") Is Nothing Then
					dg_codBankName.DataSource = get_codBankName()
				Else
					ViewState("codBankName").DefaultView.RowFilter = ViewState("RowFilter")
					dg_codBankName.DataSource = ViewState("codBankName").DefaultView
				End If
				dg_codBankName.DataBind()

			Dim div_codBankSubName1 As System.Web.UI.HtmlControls.HtmlGenericControl = Me.FindControl("div_codBankSubName1")
				div_codBankSubName1.Attributes("style") = "position: absolute; width: auto; height: auto"
		End Select
	End Sub

	Sub dg_codBankSubName_PageIndexChanged(Sender As Object, e As DataGridPageChangedEventArgs)
		Sender.CurrentPageIndex = e.NewPageIndex
		Try
			Sender.DataSource = get_codBankSubName(CStr(dg_codBankName.DataKeys(dg_codBankName.SelectedIndex)))
		Catch
			Sender.DataSource = get_codBankSubName()
		Finally
			Sender.SelectedIndex = -1
		End Try
		Sender.DataBind()
	End Sub

'====================================================================================================

	Sub dg_codBankName_Select(Sender As Object, E As EventArgs)
		Dim text_bnkBankNo As TextBox = Sender.Items(Sender.SelectedIndex).FindControl("text_bnkBankNo")

		For i As Integer = 0 To dg_codBankName.Items.Count-1
			'Response.Write(dg_codBankName.Items(i).Cells(0).Controls(0).ToString() & "<br>")
			Dim lbtn As LinkButton = dg_codBankName.Items(i).Cells(0).Controls(0)
				lbtn.Enabled = False
		Next i
'		dg_codBankName.Enabled = False

		'使其無法換頁
		Dim footerIndex As Integer = sender.Controls(0).Controls.Count-1
		Dim TC As System.Web.UI.WebControls.TableCell = sender.Controls(0).Controls(footerIndex).Controls(0)
		For i As Integer = 0 To TC.Controls.Count - 1
			If TC.Controls(i).ToString = "System.Web.UI.WebControls.DataGridLinkButton"
				CType(TC.Controls(i), LinkButton).Enabled = False
			End If
		Next i

		BindDetailGrid()

		Dim div_codBankSubName As System.Web.UI.HtmlControls.HtmlGenericControl = Me.FindControl("div_codBankSubName")
			div_codBankSubName.Attributes("style") = "position: absolute; width: auto; height: auto; z-index: 9; " & _
														"left: 31px;"

		'預設明細DataGrid寬度：1022px
		Dim div_codBankSubName1 As System.Web.UI.HtmlControls.HtmlGenericControl = Me.FindControl("div_codBankSubName1")
			div_codBankSubName1.Attributes("style") = "position: absolute; width: auto; height: auto; z-index: expression(previousSibling.style.zIndex)"

		text_infoStream.Text = text_bnkBankNo.ClientID
	End Sub

	Sub BindDetailGrid()

		Dim bnkBankNo As String = Nothing

		If dg_codBankName.SelectedIndex <> -1 Then
			Try
				bnkBankNo = CStr(dg_codBankName.DataKeys(dg_codBankName.SelectedIndex))
			Catch
			End Try

			dg_codBankSubName.DataSource = get_codBankSubName(bnkBankNo)
		End If
		dg_codBankSubName.CurrentPageIndex = 0
		dg_codBankSubName.DataBind()
	End Sub

	Sub dg_codBankSubName_Select(Sender As Object, E As EventArgs)
			'總行代碼
		Dim bnkBankNo As String = dg_codBankSubName.Items(dg_codBankSubName.SelectedIndex).Cells(15).Text & ""
			'總行名稱*
		Dim bnkBankName As String = CType(dg_codBankName.Items(dg_codBankName.SelectedIndex).FindControl("text_bnkBankName"), TextBox).Text

			'分行代碼
		Dim bnksBankSubNo As String = CType(dg_codBankSubName.Items(dg_codBankSubName.SelectedIndex).FindControl("text_bnksBankSubNo"), TextBox).Text
			'變更後分行代碼
		Dim bnksToBankSubNo As String = CType(dg_codBankSubName.Items(dg_codBankSubName.SelectedIndex).FindControl("text_bnksToBankSubNo"), TextBox).Text

			'分行名稱
		Dim bnksBankSubName As String = CType(dg_codBankSubName.Items(dg_codBankSubName.SelectedIndex).FindControl("text_bnksBankSubName"), TextBox).Text
			'分行簡稱
		Dim bnksBankSubAlias As String = CType(dg_codBankSubName.Items(dg_codBankSubName.SelectedIndex).FindControl("text_bnksBankSubAlias"), TextBox).Text


'		If Editable Then
			'儲存()
'		Else
			Dim infoStream As String
				infoStream = bnkBankNo & _
							 "||" & IIf(bnksBankSubNo <> "", IIf(bnksBankSubAlias <> "", bnksBankSubAlias,bnksBankSubName), bnkBankName) & _
							 "||" & IIf(bnksToBankSubNo <> "", bnksToBankSubNo, bnksBankSubNo) & _
							 "||" & bnksBankSubName

'Response.Write("<script" & ">alert('" & infoStream & "');</" & "script>")
			'Response.Write("<script" & ">returnValue = '" & infoStream & "';window.close();</" & "script>")

			WebScriptFun.Write("js: returnValue = '" & infoStream & "'; window.close();")
'		End If
	End Sub

'====================================================================================================

	Sub btn_find_Click(sender As Object, e As EventArgs)
		dg_codBankName.SelectedIndex = -1
		dg_codBankName.CurrentPageIndex = 0
		ViewState("codBankName") = Nothing
		ViewState("RowFilter") = Nothing

		text_findCode.Text = Trim(text_findCode.Text)
		text_findName.Text = Trim(text_findName.Text)
		text_infoStream.Text = ""

		dg_codBankSubName.DataSource = Nothing
		dg_codBankSubName.DataBind()

		Dim ds1 As System.Data.DataSet = get_codBankName()
			ds1.Tables(0).DefaultView.RowFilter = ""

		If Len(text_findCode.Text) > 0 Then
			ds1.Tables(0).DefaultView.RowFilter = "([bnkBankNo] = '" & text_findCode.Text & "') "
		End If
		If Len(text_findName.Text) > 0 Then
			If ds1.Tables(0).DefaultView.RowFilter <> "" Then
				ds1.Tables(0).DefaultView.RowFilter &= "AND ([bnkBankName] LIKE '%" & text_findName.Text & "%')"
			Else
				ds1.Tables(0).DefaultView.RowFilter = "([bnkBankName] LIKE '%" & text_findName.Text & "%')"
			End If
		End If

		If ds1.Tables(0).DefaultView.Count > 0 Then
			ViewState("codBankName") = ds1.Tables(0)
			ViewState("RowFilter") = ds1.Tables(0).DefaultView.RowFilter
			dg_codBankName.DataSource = ViewState("codBankName")
		Else
			ds1.Tables(0).DefaultView.RowFilter = ""
			dg_codBankName.DataSource = ds1
		End If

		dg_codBankName.DataBind()
	End Sub

'====================================================================================================

	'西元轉民國(含分隔符號:y/MM/dd)
	Function ChtDateSplit(thisDate As String, Optional wSplit As String = "/", Optional OnNull As String = "") As String
		Try
			thisDate = Format(CDate(thisDate), "yyyyMMdd")
			Return CInt(Left(thisDate, 4))-1911 & wSplit & Mid(thisDate, 5, 2) & wSplit & Right(thisDate, 2)
		Catch ex As Exception
			Return OnNull
		End Try
	End Function

	Function DateTimeBy(b As String, t As String) As String
		If b = "" Or t = "" Then
		Else
			Return t & " by " & b
		End If
	End Function

</script>
<html>
<head>
<title>銀行帳戶</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<base target="_self">
<style>
.applyBorder	{ border: 2px buttonhighlight inset }
.removeBorder	{ background-color:Transparent; border: none }

.title		{width: 100%; height: 100%; text-align: justify; text-justify: distribute-all-lines; padding-left: 2px; padding-right: 2px;}
.titlePadding	{padding-left: 2px;}
.titleDynamic	{padding-top: 4px;}
.text		{width: 100%; height: 100%; overflow: hidden;}

.ActCap		{ BORDER-TOP: #FFFFFF 1px solid; BORDER-LEFT: #FFFFFF 1px solid; BORDER-RIGHT: gray 1px solid; COLOR: #000000; FONT-WEIGHT: bold; padding-top: 2px }
.InactCap	{ BORDER-TOP: #FFFFFF 1px solid; BORDER-LEFT: #FFFFFF 1px solid; BORDER-RIGHT: gray 1px solid; COLOR: #000000; BORDER-BOTTOM: #EEEEEE 1px solid; BACKGROUND-COLOR: #EEEEEE; CURSOR: hand; padding-top: 2px }
.main_tab	{ BORDER-LEFT: #FFFFFF 1px solid; BORDER-RIGHT: gray 1px solid; BORDER-BOTTOM: gray 1px solid; COLOR: #000000; }

.btn	{border: 1px solid #D4D0C8; background-color:#EEEEEE;}
</style>
<link href="calendarStyle.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
<!--

function Point(_x, _y) {
	this.x = _x;
	this.y = _y;
}
function realPosition(_obj) {
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
	calendar.Show();
}
function onCalendar_Control_Change(calendar){
	var vDay = new Date(calendar.GetSelectedDate());
	ControlToAssign.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
	ControlToAssign.fireEvent('onchange');
}

function moveDiv(){
	try{
		var text_infoStream = document.all(document.all('text_infoStream').value);
		document.all('div_codBankSubName').style.top = realPosition(text_infoStream).y + 23;
	}catch(e){;}
}


function responseInfo(){
	returnValue = document.all("text_infoStream").value;
//alert(document.getElementById("text_infoStream").value);
	window.close();
}
returnValue = "Cancel";


var flag=0;
function flickerBorder(){
	if(document.all('dg_codBankSubName')){
		myImage=document.all("div_codBankSubName1");
		if(flag==0){
			myImage.style.border="3px dotted #FF8C00";
			myImage.style.padding="1px";
			flag=1;
		}
		else{
			myImage.style.border="3px dashed #FF8C00";
			myImage.style.padding="1px";
			flag=0;
		}
		setTimeout("flickerBorder()", 500);
	}
}

function autoResize(a){
	if(a==true)
	if(document.all('dg_codBankName').offsetWidth > screen.width){
		resizeTo(screen.width, screen.availHeight/2);
		moveTo(0, screen.availHeight/4);
	}
	else{
		resizeTo(document.all('dg_codBankName').offsetWidth+28, screen.availHeight/2);
		moveTo((screen.width-(document.all('dg_codBankName').offsetWidth+28))/2, screen.availHeight/4);
	}
}

//-->
</script>
</head>
<body topmargin="0" leftmargin="0">
	<form runat="server">
		<!-- Multi-Calendar Start -->
		<div id="oDiv" style="position: absolute; width: 1px; height: 1px; overflow:hidden;"><asp:TextBox id="txt_oDiv" runat="server"></asp:TextBox></div>
		<COMPONENTART:CALENDAR id="Calendar1" runat="server" CultureId="1028" CalendarTitleCssClass="ctitle" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="images/cal_nextMonth.gif" PrevImageUrl="images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUp="Custom" ClientSideOnSelectionChanged="onCalendar_Control_Change" PopUpExpandControlId="txt_oDiv"></COMPONENTART:CALENDAR>
		<!-- Multi-Calendar End -->
<table border="0" cellpadding="0" style="border:1px solid #D4D0C8; border-collapse: collapse">
	<tr>
		<td style="padding: 1px">
		<table border="0" cellpadding="0" style="border-collapse: collapse">
			<tr>
				<td>
				<table style="TABLE-LAYOUT: fixed; border-collapse: collapse" cellpadding="0" cellspacing="0" border="1" bordercolor="#D4D0C8">
					<tr>
						<td height="20px" width="50" nowrap align="center" style="padding-top: 3px"><font size="2">代碼</font></td>
						<td height="20px" width="95"><asp:TextBox id="text_findCode" runat="server" MaxLength="6" Width="95px" style="TEXT-ALIGN: left; HEIGHT: 21px; margin-top: -1; IME-MODE: disabled" onfocus="this.select();"></asp:TextBox></td>
						<td height="20px" width="50" nowrap align="center" style="padding-top: 3px"><font size="2">名稱</font></td>
						<td height="20px" width="95"><asp:TextBox id="text_findName" runat="server" MaxLength="30" Width="95px" style="TEXT-ALIGN: left; HEIGHT: 21px; margin-top: -1" onfocus="this.select();"></asp:TextBox></td>
					</tr>
				</table>
				</td>
				<td><asp:Button id="btn_find" runat="server" class="btn" style="margin-top: 0; margin-bottom: 0" Width="68px" Height="22px" Text="尋找" onclick="btn_find_Click"></asp:Button></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 1px; padding-right: 1px; padding-bottom: 1px">
		<asp:DataGrid id="dg_codBankName" runat="server" CellPadding="0" BorderStyle="Solid" style="TABLE-LAYOUT: fixed" AutoGenerateColumns="False" BackColor="#C1D1A1" ForeColor="Black" DataKeyField="bnkBankNo" OnItemCreated="dg_codBankName_ItemCreated" OnItemDataBound="dg_codBankName_ItemDataBound" OnSelectedIndexChanged="dg_codBankName_Select" AllowPaging="True" PageSize="10" OnPageIndexChanged="dg_codBankName_PageIndexChanged" OnPreRender="dg_codBankName_PreRender">
			<HeaderStyle font-size="X-Small" wrap="False" height="20px" cssclass="titleDynamic" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>
			<ItemStyle height="22px" backcolor="#FFFCEC"></ItemStyle>
			<AlternatingItemStyle height="22px"></AlternatingItemStyle>
			<SelectedItemStyle backcolor="#E6E6FA"></SelectedItemStyle>
			<Columns>
				<asp:ButtonColumn Text="選取" CommandName="Select">
					<HeaderStyle width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center" font-size="X-Small"></ItemStyle>
				</asp:ButtonColumn>
				<asp:TemplateColumn HeaderText="儲存" Visible="True">
					<HeaderStyle wrap="False" horizontalalign="Center" width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					<ItemTemplate>
						<input type="checkbox" id="CheckBox1" alt="C1" runat="server" checked="false" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="總行代碼">
					<ItemTemplate>
						<asp:TextBox id="text_bnkBankNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="3" Width="35px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkBankNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.bnkBankNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="總行名稱">
					<ItemTemplate>
						<asp:TextBox id="text_bnkBankName" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="30" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkBankName") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="總行簡稱">
					<ItemTemplate>
						<asp:TextBox id="text_bnkBankAlias" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="10" Width="75px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkBankAlias") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="帳號長度">
					<ItemTemplate>
						<asp:TextBox id="text_bnkDepLen" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="10" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkDepLen") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="銀行分類">
					<HeaderStyle wrap="False" width="103px"></HeaderStyle>
					<ItemTemplate>
						<asp:DropDownList id="ddl_bnkBankKind" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.bnkBankKind") %>' Enabled='<%# Editable %>'>
							<asp:ListItem Value="">…</asp:ListItem>
							<asp:ListItem Value="0">不分類</asp:ListItem>
							<asp:ListItem Value="1">銀行</asp:ListItem>
							<asp:ListItem Value="2">票券金融公司</asp:ListItem>
							<asp:ListItem Value="3">信用合作社</asp:ListItem>
							<asp:ListItem Value="4">農會</asp:ListItem>
							<asp:ListItem Value="5">漁會</asp:ListItem>
						</asp:DropDownList>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="變更後總行代碼">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnkToBankNo" runat="server" style="TEXT-ALIGN: right; margin-top: -1" MaxLength="3" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkToBankNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="原總行名稱">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnkOldName" runat="server" style="TEXT-ALIGN: right; margin-top: -1" MaxLength="30" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkOldName") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="變更日期">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnkToBankDate" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="10" Width="65px" Text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnkToBankDate") & "",,"　/　/　") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select()" onblur="this.className='removeBorder'" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x;oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;" ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="備註">
					<ItemTemplate>
						<asp:TextBox id="text_bnkMemo" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="255" Width="250px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkMemo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="停用">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					<ItemTemplate>
						<asp:CheckBox id="chk_bnkStopFlag" runat="server" Checked='<%# DataBinder.Eval(Container, "DataItem.bnkStopFlag") %>' ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:CheckBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="停用日期">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnkStopDate" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="10" Width="65px" Text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnkStopDate") & "",,"　/　/　") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select()" onblur="this.className='removeBorder'" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x;oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;" ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="建立於">
					<HeaderStyle wrap="False" width="75px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center" font-size="XX-Small" font-names="Verdana"></ItemStyle>
					<ItemTemplate>
						<asp:Label id="lab_bnkCreateDate" runat="server" style="TEXT-ALIGN: center" text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnkCreateDate") & "") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.bnkCreateDate") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="移除">
					<HeaderStyle wrap="False" horizontalalign="Center" forecolor="Red" width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					<ItemTemplate>
						<asp:CheckBox id="CheckBox2" runat="server" ToolTip="移除勾選的資料列" Enabled='<%# Editable %>'></asp:CheckBox>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
			<PagerStyle mode="NumericPages"></PagerStyle>
			<FooterStyle backcolor="#C1D1A1"></FooterStyle>
		</asp:DataGrid>
		</td>
	</tr>
</table>
		<div id="div_codBankSubName" runat="server" style="position: absolute; width: auto; height: auto; z-index: 9">
		<iframe style="position: absolute; z-index: 20; width: expression(this.nextSibling.offsetWidth); height: expression(this.nextSibling.offsetHeight); top: expression(this.nextSibling.offsetTop); left: expression(this.nextSibling.offsetLeft);" frameborder="0"></iframe>
		<div id="div_codBankSubName1" runat="server" style="position: absolute; width: auto; height: auto; z-index: expression(previousSibling.style.zIndex)">
		<asp:DataGrid id="dg_codBankSubName" runat="server" CellPadding="0" BorderStyle="Solid" style="TABLE-LAYOUT: fixed; z-index: 21" AutoGenerateColumns="False" BackColor="#C1D1A1" ForeColor="Black" OnItemCreated="dg_codBankSubName_ItemCreated" OnItemDataBound="dg_codBankSubName_ItemDataBound" OnSelectedIndexChanged="dg_codBankSubName_Select" OnItemCommand="dg_codBankSubName_ItemCommand" AllowPaging="True" PageSize="10" OnPageIndexChanged="dg_codBankSubName_PageIndexChanged" OnPreRender="dg_codBankSubName_PreRender">
			<HeaderStyle font-size="X-Small" wrap="False" height="20px" cssclass="titleDynamic" forecolor="#3F3D3D" backcolor="#E6E6FA"></HeaderStyle>
			<ItemStyle height="22px" backcolor="#F8F8FF"></ItemStyle>
			<AlternatingItemStyle height="22px"></AlternatingItemStyle>
			<EditItemStyle verticalalign="Top"></EditItemStyle>
			<Columns>
				<asp:ButtonColumn Text="選取" CommandName="Select">
					<HeaderStyle width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center" font-size="X-Small"></ItemStyle>
				</asp:ButtonColumn>
				<asp:ButtonColumn Text="取消" CommandName="Cancel">
					<HeaderStyle width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center" font-size="X-Small"></ItemStyle>
				</asp:ButtonColumn>
				<asp:TemplateColumn HeaderText="儲存" Visible="True">
					<HeaderStyle width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					<ItemTemplate>
						<input type="checkbox" id="CheckBox1" alt="C1" runat="server" checked="false" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="總行代碼" Visible="True">
					<ItemTemplate>
						<asp:TextBox id="text_bnkBankNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="3" Width="35px" Text='<%# DataBinder.Eval(Container, "DataItem.bnkBankNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.bnkBankNo") %>' class="removeBorder" onfocus="this.blur()" ReadOnly="True"></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="分行代碼">
					<ItemTemplate>
						<asp:TextBox id="text_bnksBankSubNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="8" Width="75px" Text='<%# DataBinder.Eval(Container, "DataItem.bnksBankSubNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.bnksBankSubNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="分行名稱">
					<ItemTemplate>
						<asp:TextBox id="text_bnksBankSubName" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="30" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.bnksBankSubName") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="分行簡稱">
					<ItemTemplate>
						<asp:TextBox id="text_bnksBankSubAlias" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="10" Width="75px" Text='<%# DataBinder.Eval(Container, "DataItem.bnksBankSubAlias") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="變更後分行代碼">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnksToBankSubNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="8" Width="75px" Text='<%# DataBinder.Eval(Container, "DataItem.bnksToBankSubNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="原分行名稱">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnksOldName" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="30" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.bnksOldName") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="變更日期">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnksToBankSubDate" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="10" Width="65px" Text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnksToBankSubDate") & "",,"　/　/　") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select()" onblur="this.className='removeBorder'" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x;oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;" ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="備註">
					<ItemTemplate>
						<asp:TextBox id="text_bnksMemo" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="255" Width="250px" Text='<%# DataBinder.Eval(Container, "DataItem.bnksMemo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="停用">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					<ItemTemplate>
						<asp:CheckBox id="chk_bnksStopFlag" runat="server" Checked='<%# DataBinder.Eval(Container, "DataItem.bnksStopFlag") %>' ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:CheckBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="停用日期">
					<HeaderStyle forecolor="#FF8C00"></HeaderStyle>
					<ItemTemplate>
						<asp:TextBox id="text_bnksStopDate" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="10" Width="65px" Text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnksStopDate") & "",,"　/　/　") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select()" onblur="this.className='removeBorder'" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x;oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;" ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:TextBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="建立於">
					<HeaderStyle wrap="False" width="75px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center" font-size="XX-Small" font-names="Verdana"></ItemStyle>
					<ItemTemplate>
						<asp:Label id="lab_bnksCreateDate" runat="server" style="TEXT-ALIGN: center" text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnksCreateDate") & "") %>' tooltip='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.bnksCreateDate") & "") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="移除">
					<HeaderStyle wrap="False" horizontalalign="Center" forecolor="Red" width="35px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					<ItemTemplate>
						<asp:CheckBox id="CheckBox2" runat="server" ToolTip="移除勾選的資料列" Enabled='<%# Editable %>'></asp:CheckBox>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:BoundColumn DataField="bnkBankNo" HeaderText="總行代碼15" Visible="true">
					<HeaderStyle horizontalalign="Center" width="50px"></HeaderStyle>
					<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
				</asp:BoundColumn>
			</Columns>
			<PagerStyle mode="NumericPages"></PagerStyle>
			<FooterStyle backcolor="#C1D1A1"></FooterStyle>
		</asp:DataGrid></div>
		</div><asp:LinkButton id="lbtn_close" onclick="lbtn_close_Click" runat="server" ForeColor="#FF8000" Font-Size="X-Small" Visible="False">關閉</asp:LinkButton>
		<asp:TextBox id="text_infoStream" runat="server" style="display: block" EnableViewState="False"></asp:TextBox>
		<!-- Insert content here -->
		<script language="javascript" type="text/javascript">
		<!--
			if(document.all('text_infoStream').value!=''){moveDiv();}
			flickerBorder();
			autoResize(false);

			window.cart_calendar_PostBackOnSameSelection = true; //COMPONENTART:CALENDAR
		//-->
		</script>
	</form>
</body>
</html>