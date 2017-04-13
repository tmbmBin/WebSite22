<%@ Page Language="VB" Debug="true" validaterequest="false" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<!-- #include file="Default.bas" -->
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

	Function get_basPayName(Optional ByVal payCode As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT " & _
										"[payCode], " & _
										"ISNULL([payKind],'') AS payKind, " & _
										"[payID], " & _
										"[payName], " & _
										"[payAliasNo], " & _
										"[payEMail], " & _
										"[payZipCode], " & _
										"[payAddress], " & _
										"[payTalk1], " & _
										"[payTel1], " & _
										"[payTalk2], " & _
										"[payTel2], " & _
										"ISNULL([payShareKind],'0') AS payShareKind, " & _
										"ISNULL([payEditKind],'0') AS payEditKind, " & _
										"ISNULL([payDelKind],'0') AS payDelKind, " & _
										"[payCreateUserNo], " & _
										"[payCreateUser], " & _
										"[payCreateDTime], " & _
										"[payModifyUser], " & _
										"[payModifyDTime] " & _
									"FROM [basPayName] "
		If payCode <> Nothing Then
					queryString &= "WHERE ([payCode] = @payCode) "
		End If
					queryString &= "ORDER BY CAST([payCode] AS integer)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		If payCode <> Nothing Then
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
		End If

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function


	Function get_basPayBank(Optional ByVal payCode As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT " & _
										"[payCode], " & _
										"[paydBankNo], " & _
										"[paydBankName], " & _
										"[paydBankSubNo], " & _
										"[paydDepositor], " & _
										"[paydDepositorNo], " & _
										"[paydDepOfID], " & _
										"ISNULL([paydDefFlag], '0') AS paydDefFlag, " & _
										"[paydStopFlag], " & _
										"[paydStopDate], " & _
										"[paydCreateUsrNo], " & _
										"[paydCreateUser], " & _
										"[paydCreateDTime], " & _
										"[payModifyUser], " & _
										"[paydModifyDTime] " & _
									"FROM [basPayBank] "
		If payCode <> Nothing Then
					queryString &= "WHERE ([payCode] = @payCode)"
		End If

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		If payCode <> Nothing Then
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
		End If

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function upd_basPayName( _
				ByVal payCode As String, _
				ByVal payKind As String, _
				ByVal payID As String, _
				ByVal payName As String, _
				ByVal payAliasNo As String, _
				ByVal payTalk1 As String, _
				ByVal payTel1 As String, _
				ByVal payTalk2 As String, _
				ByVal payTel2 As String, _
				ByVal payEMail As String, _
				ByVal payZipCode As String, _
				ByVal payAddress As String, _
				ByVal payShareKind As String, _
				ByVal payEditKind As String, _
				ByVal payDelKind As String, _
				ByVal payModifyUser As String) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "UPDATE [basPayName] SET " & _
										"[payKind]=@payKind, " & _
										"[payID]=@payID, " & _
										"[payName]=@payName, " & _
										"[payAliasNo]=@payAliasNo, " & _
										"[payTalk1]=@payTalk1, " & _
										"[payTel1]=@payTel1, " & _
										"[payTalk2]=@payTalk2, " & _
										"[payTel2]=@payTel2, " & _
										"[payEMail]=@payEMail, " & _
										"[payZipCode]=@payZipCode, " & _
										"[payAddress]=@payAddress, " & _
										"[payShareKind]=@payShareKind, " & _
										"[payEditKind]=@payEditKind, " & _
										"[payDelKind]=@payDelKind, " & _
										"[payModifyDTime]=getdate(), " & _
										"[payModifyUser]=@payModifyUser " & _
									"WHERE ([payCode] = @payCode)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payKind", IIf(payKind <> "", payKind, Nothing) ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payID", payID))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payName", payName))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payAliasNo", payAliasNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTalk1", payTalk1))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTel1", payTel1))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTalk2", payTalk2))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTel2", payTel2))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payEMail", payEMail))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payZipCode", payZipCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payAddress", payAddress))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payShareKind", payShareKind))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payEditKind", payEditKind))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payDelKind", payDelKind))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payModifyUser", payModifyUser))

		Dim rowsAffected As Integer = 0
			dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function del_basPayName(ByVal payCode As String) As Integer
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "DELETE FROM [basPayName] WHERE ([payCode] = @payCode)"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function add_basPayName( _
				ByVal payCode As String, _
				ByVal payKind As String, _
				ByVal payID As String, _
				ByVal payName As String, _
				ByVal payAliasNo As String, _
				ByVal payTalk1 As String, _
				ByVal payTel1 As String, _
				ByVal payTalk2 As String, _
				ByVal payTel2 As String, _
				ByVal payEMail As String, _
				ByVal payZipCode As String, _
				ByVal payAddress As String, _
				ByVal payShareKind As String, _
				ByVal payEditKind As String, _
				ByVal payDelKind As String, _
				ByVal payCreateUserNo As Object, _
				ByVal payCreateUser As String) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "INSERT INTO [basPayName] " & _
									"(" & _
										"[payCode], [payKind], [payID], [payName], [payAliasNo], " & _
										"[payTalk1], [payTel1], [payTalk2], [payTel2], " & _
										"[payEMail], [payZipCode], [payAddress], " & _
										"[payShareKind], [payEditKind], [payDelKind], " & _
										"[payCreateUserNo], [payCreateUser]" & _
									") " & _
									"VALUES " & _
									"(" & _
										"@payCode, @payKind, @payID, @payName, @payAliasNo, " & _
										"@payTalk1, @payTel1, @payTalk2, @payTel2, " & _
										"@payEMail, @payZipCode, @payAddress, " & _
										"@payShareKind, @payEditKind, @payDelKind, " & _
										"@payCreateUserNo, @payCreateUser" & _
									")"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payKind", IIf(payKind <> "", payKind, Nothing) ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payID", payID))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payName", payName))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payAliasNo", payAliasNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTalk1", payTalk1))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTel1", payTel1))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTalk2", payTalk2))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payTel2", payTel2))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payEMail", payEMail))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payZipCode", payZipCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payAddress", payAddress))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payShareKind", payShareKind))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payEditKind", payEditKind))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payDelKind", payDelKind))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@payCreateUserNo", payCreateUserNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCreateUser", payCreateUser))

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function


	Function upd_basPayBank( _
					ByVal payCode As String, _
				ByVal paydBankNo_OLD As String, _
				ByVal paydBankSubNo_OLD As String, _
				ByVal paydDepositorNo_OLD As String, _
					ByVal paydBankNo As String, _
					ByVal paydBankSubNo As String, _
					ByVal paydDepositorNo As String, _
				ByVal paydBankName As String, _
				ByVal paydDepositor As String, _
				ByVal paydDepOfID As String, _
				ByVal paydDefFlag As String, _
				ByVal paydStopFlag As String, _
				ByVal paydStopDate As Object, _
				ByVal payModifyUser As String) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "UPDATE [basPayBank] SET " & _
										"[paydBankNo]=@paydBankNo, " & _
										"[paydBankSubNo]=@paydBankSubNo, " & _
										"[paydBankName]=@paydBankName, " & _
										"[paydDepositorNo]=@paydDepositorNo, " & _
										"[paydDepositor]=@paydDepositor, " & _
										"[paydDepOfID]=@paydDepOfID, " & _
										"[paydDefFlag]=@paydDefFlag, " & _
										"[paydStopFlag]=@paydStopFlag, " & _
										"[paydStopDate]=@paydStopDate, " & _
										"[paydModifyDTime]=getdate(), " & _
										"[payModifyUser]=@payModifyUser " & _
									"WHERE ([payCode] = @payCode) " & _
										"AND ([paydBankNo] = @paydBankNo_OLD) " & _
										"AND ([paydBankSubNo] = @paydBankSubNo_OLD) " & _
										"AND ([paydDepositorNo] = @paydDepositorNo_OLD)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankNo_OLD", paydBankNo_OLD))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankSubNo_OLD", paydBankSubNo_OLD))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepositorNo_OLD", paydDepositorNo_OLD))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankNo", paydBankNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankSubNo", paydBankSubNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepositorNo", paydDepositorNo, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankName", paydBankName))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepositor", paydDepositor))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepOfID", paydDepOfID))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.StringFixedLength, "@paydDefFlag", IIf(paydDefFlag = "1", paydDefFlag, "0") ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydStopFlag", IIf(paydStopFlag = "1", paydStopFlag, "0")))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@paydStopDate", IIf(paydStopFlag = "1", paydStopDate, Nothing) ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payModifyUser", payModifyUser))

		Dim rowsAffected As Integer = 0
			dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function del_basPayBank(ByVal payCode As String, ByVal paydBankNo As String, _
							ByVal paydBankSubNo As String, ByVal paydDepositorNo As String) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "DELETE FROM [basPayBank] " & _
									"WHERE ([payCode] = @payCode) " & _
										"AND ([paydBankNo] = @paydBankNo) " & _
										"AND ([paydBankSubNo] = @paydBankSubNo) " & _
										"AND ([paydDepositorNo] = @paydDepositorNo)"

'Response.Write(queryString.Replace("@payCode", payCode).Replace("@paydBankNo", paydBankNo).Replace("@paydBankSubNo", paydBankSubNo).Replace("@paydDepositorNo", paydDepositorNo))

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankNo", paydBankNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankSubNo", paydBankSubNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepositorNo", paydDepositorNo))

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function add_basPayBank(ByVal payCode As String, ByVal paydBankNo As String, ByVal paydBankSubNo As String, ByVal paydDepositorNo As String, _
							ByVal paydBankName As String, ByVal paydDepositor As String, ByVal paydDepOfID As String, ByVal paydDefFlag As String, _
							ByVal paydStopFlag As String, ByVal paydStopDate As Object, _
							ByVal paydCreateUsrNo As Object, ByVal paydCreateUser As String) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "INSERT INTO [basPayBank] " & _
									"(" & _
										"[payCode], [paydBankNo], [paydBankSubNo], [paydDepositorNo], " & _
										"[paydBankName], [paydDepositor], [paydDepOfID], " & _
										"[paydDefFlag], " & _
										"[paydStopFlag], [paydStopDate], " & _
										"[paydCreateUsrNo], [paydCreateUser]" & _
									") " & _
									"VALUES " & _
									"(" & _
										"@payCode, @paydBankNo, @paydBankSubNo, @paydDepositorNo, " & _
										"@paydBankName, @paydDepositor, @paydDepOfID, " & _
										"@paydDefFlag, " & _
										"@paydStopFlag, @paydStopDate, " & _
										"@paydCreateUsrNo, @paydCreateUser" & _
									")"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankNo", paydBankNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankSubNo", paydBankSubNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepositorNo", paydDepositorNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydBankName", paydBankName))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepositor", paydDepositor))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydDepOfID", paydDepOfID))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.StringFixedLength, "@paydDefFlag", IIf(paydDefFlag = "1", paydDefFlag, "0") ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydStopFlag", IIf(paydStopFlag = "1", paydStopFlag, "0") ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@paydStopDate", IIf(paydStopFlag = "1", paydStopDate, Nothing) ))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@paydCreateUsrNo", paydCreateUsrNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@paydCreateUser", paydCreateUser))

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
Try
			dg_basPayName.DataSource = get_basPayName()
			dg_basPayName.DataBind()
		   Catch ex As Exception
			 
		End Try

			
		End If
	End Sub

'====================================================================================================

	Sub dg_basPayName_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Then
			Dim divStart As String = "<div class='title'>"
			Dim divEnd As String = "</div>"

			For i As Integer = 2 To e.Item.Cells.Count-4
				e.Item.Cells(i).Text = divStart & e.Item.Cells(i).Text & divEnd
			Next i

			For i As Integer = e.Item.Cells.Count-3 To e.Item.Cells.Count-2
				e.Item.Cells(i).Text = "<div class='titlePadding'>" & e.Item.Cells(i).Text & divEnd
			Next i
		End If

	End Sub

	Sub dg_basPayName_ItemDataBound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			If Editable = True Then
				Dim CheckBox1 As HtmlInputCheckBox = e.Item.FindControl("CheckBox1")
				For i As Integer = 3 To e.Item.Cells.Count - 1
'Response.Write(i & " - " & e.Item.Cells(i).Controls(1).ToString & "<br>")
					Select Case i
						Case 17,18
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

	Sub dg_basPayName_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
		If sender.Items.Count > 0 Then
			Dim vCount As Integer = 0
			sender.Columns(1).Visible = Editable: vCount += IIf(Editable, 0, 1)		'儲存
			sender.Columns(3).Visible = Editable: vCount += IIf(Editable, 0, 1)		'分類
			sender.Columns(14).Visible = Editable: vCount += IIf(Editable, 0, 1)	'分享設定
			sender.Columns(15).Visible = Editable: vCount += IIf(Editable, 0, 1)	'異動設定
			sender.Columns(16).Visible = Editable: vCount += IIf(Editable, 0, 1)	'刪除設定
			sender.Columns(17).Visible = Editable: vCount += IIf(Editable, 0, 1)	'建立於
			sender.Columns(18).Visible = Editable: vCount += IIf(Editable, 0, 1)	'修改於
			sender.Columns(19).Visible = Editable: vCount += IIf(Editable, 0, 1)	'移除

			Dim footerIndex As Integer = sender.Controls(0).Controls.Count-1
			sender.Controls(0).Controls(footerIndex).Controls(0).Attributes("colSpan") = sender.Columns.Count - IIf(Editable, 0, vCount)
		End If
	End Sub

	Sub dg_basPayName_PageIndexChanged(Sender As Object, e As DataGridPageChangedEventArgs)
		Sender.CurrentPageIndex = e.NewPageIndex
		If ViewState("payCode") Is Nothing Then
			Sender.DataSource = get_basPayName()
		Else
			ViewState("payCode").DefaultView.RowFilter = ViewState("RowFilter")
			Sender.DataSource = ViewState("payCode").DefaultView
		End If
		Sender.SelectedIndex = -1
		Sender.DataBind()

		dg_basPayBank.DataSource = Nothing
		dg_basPayBank.DataBind()
	End Sub

'====================================================================================================

	Sub dg_basPayBank_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Then
			Dim divStart As String = "<div class='title'>"
			Dim divEnd As String = "</div>"

			For i As Integer = 3 To e.Item.Cells.Count-5
				e.Item.Cells(i).Text = divStart & e.Item.Cells(i).Text & divEnd
			Next i

			For i As Integer = e.Item.Cells.Count-4 To e.Item.Cells.Count-3
				e.Item.Cells(i).Text = "<div class='titlePadding'>" & e.Item.Cells(i).Text & divEnd
			Next i
		End If

		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			Dim lbtn As LinkButton = e.Item.Cells(0).Controls(0)
			lbtn.Text = IIf(Editable, "儲存", "選取")
		End If
	End Sub

	Sub dg_basPayBank_ItemDataBound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
		'If e.Item.ItemType = ListItemType.Header Then
			'e.Item.Cells(1).ColumnSpan = 2
			'e.Item.Cells.RemoveAt(2)
			'e.Item.Cells(1).Text = "金融機構*"
			'e.Item.Cells(1).Width = Unit.Pixel(116)
		'End If

		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			If Editable = True Then
				Dim CheckBox1 As HtmlInputCheckBox = e.Item.FindControl("CheckBox1")
				For i As Integer = 3 To e.Item.Cells.Count - 2
'Response.Write(i & " - " & e.Item.Cells(i).Controls(1).ToString & "<br>")
					Select Case i
						Case 3	'金融機構
							CType(e.Item.Cells(i).Controls(1), TextBox).Attributes.Add("onchange", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
							CType(e.Item.Cells(i).Controls(3), TextBox).Attributes.Add("onchange", "javascript: if(this.title!=this.value){" & CheckBox1.ClientID & ".checked='ON'}")
						Case 4,11,12
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

	Sub dg_basPayBank_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
		If sender.Items.Count > 0 Then
			Dim vCount As Integer = 0
			sender.Columns(2).Visible = Editable: vCount += IIf(Editable, 0, 1)		'儲存
			sender.Columns(8).Visible = Editable: vCount += IIf(Editable, 0, 1)		'預設
			sender.Columns(9).Visible = Editable: vCount += IIf(Editable, 0, 1)		'停用
			sender.Columns(10).Visible = Editable: vCount += IIf(Editable, 0, 1)	'停用日期
			sender.Columns(11).Visible = Editable: vCount += IIf(Editable, 0, 1)	'建立於
			sender.Columns(12).Visible = Editable: vCount += IIf(Editable, 0, 1)	'修改於
			sender.Columns(13).Visible = Editable: vCount += IIf(Editable, 0, 1)	'移除
			sender.Columns(14).Visible = Editable: vCount += IIf(Editable, 0, 1)	'受款人代碼

			'假如有分頁
			'Dim footerIndex As Integer = sender.Controls(0).Controls.Count-1
			'sender.Controls(0).Controls(footerIndex).Controls(0).Attributes("colSpan") = sender.Columns.Count - IIf(Editable, 0, vCount)
		End If
	End Sub

	Sub AfterUpdateCancel()
		dg_basPayBank.DataSource = Nothing
		dg_basPayBank.DataBind()

		dg_basPayName.Enabled = True
		If ViewState("payCode") Is Nothing Then
			dg_basPayName.DataSource = get_basPayName()
		Else
			ViewState("payCode").DefaultView.RowFilter = ViewState("RowFilter")
			dg_basPayName.DataSource = ViewState("payCode").DefaultView
		End If
			dg_basPayName.DataBind()

		Dim div_basPayBank As System.Web.UI.HtmlControls.HtmlGenericControl = Me.FindControl("div_basPayBank")
			div_basPayBank.Attributes("style") = "position: absolute; width: auto; height: auto; z-index: 9"
	End Sub

	Sub dg_basPayBank_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs)
		Select (CType(e.CommandSource, LinkButton)).CommandName
			Case "Cancel"
				AfterUpdateCancel()

			Case "Select"
				Dim lbtn As LinkButton = e.CommandSource
				If lbtn.Text = "儲存" Then
					lbtn.Text = IIf(Editable, "儲存", "選取")
				End If
		End Select
	End Sub

'====================================================================================================

	Sub dg_basPayName_Select(Sender As Object, E As EventArgs)
		Dim text_payCode As TextBox = Sender.Items(Sender.SelectedIndex).FindControl("text_payCode")

		For i As Integer = 0 To dg_basPayName.Items.Count-1
'Response.Write(dg_basPayName.Items(i).Cells(0).Controls(0).ToString() & "<br>")
			Dim lbtn As LinkButton = dg_basPayName.Items(i).Cells(0).Controls(0)
				lbtn.Enabled = False
		Next i

		'使其無法換頁
		Dim footerIndex As Integer = sender.Controls(0).Controls.Count-1
		Dim TC As System.Web.UI.WebControls.TableCell = sender.Controls(0).Controls(footerIndex).Controls(0)
		For i As Integer = 0 To TC.Controls.Count - 1
			If TC.Controls(i).ToString = "System.Web.UI.WebControls.DataGridLinkButton"
				CType(TC.Controls(i), LinkButton).Enabled = False
			End If
		Next i

		BindDetailGrid()

		Dim div_basPayBank As System.Web.UI.HtmlControls.HtmlGenericControl = Me.FindControl("div_basPayBank")
		div_basPayBank.Attributes("style") = "position: absolute; width: auto; height: auto; z-index: 9; " & _
												"border: 3px solid #FF8C00; padding: 1px; " & _
												IIf(Editable,"left: 181px", "left: 81px")

		text_infoStream.Text = text_payCode.ClientID
	End Sub

	Sub BindDetailGrid()

		Dim chkLast As Boolean = False	'自動勾選末筆

		Dim payCode As String = Nothing

		If dg_basPayName.SelectedIndex <> -1 Then
			Try
				payCode = CStr(dg_basPayName.DataKeys(dg_basPayName.SelectedIndex))
			Catch
			End Try

			Dim ds As DataSet = get_basPayBank(payCode)
			If Editable = True AndAlso ds.Tables(0).Rows.Count = 0 Then
				Dim NR As DataRow
					NR = ds.Tables(0).NewRow()
					NR("payCode") = payCode
					NR("paydDefFlag") = "0"
					NR("paydStopFlag") = "0"
					NR("paydCreateUsrNo") = 0
					NR("paydCreateDTime") = Now()
					NR("paydCreateUser") = "Admin"
				ds.Tables(0).Rows.Add(NR)

				chkLast = True	'自動勾選末筆
			End If

			dg_basPayBank.DataSource = ds
		End If

		dg_basPayBank.DataBind()

		If chkLast = True Then Check_LastItem(dg_basPayBank)	'自動勾選末筆
	End Sub

	Sub dg_basPayBank_Select(Sender As Object, E As EventArgs)
		Dim si As Integer = dg_basPayName.SelectedIndex
		'受款人代碼
		Dim payCode As String = CStr(dg_basPayName.DataKeys(si))
		'受款人統編/身分證號*
		Dim payID As String = CType(dg_basPayName.Items(si).FindControl("text_payID"), TextBox).Text
		'受款人名稱
		Dim payName As String = CType(dg_basPayName.Items(si).FindControl("text_payName"), TextBox).Text
		'聯絡電話１
		Dim payTel1 As String = CType(dg_basPayName.Items(si).FindControl("text_payTel1"), TextBox).Text
		'郵遞區號
		Dim payZipCode As String = CType(dg_basPayName.Items(si).FindControl("text_payZipCode"), TextBox).Text
		'地址
		Dim payAddress As String = CType(dg_basPayName.Items(si).FindControl("text_payAddress"), TextBox).Text

		si = dg_basPayBank.SelectedIndex
			'銀行別代號
		Dim paydBankNo As String = CType(dg_basPayBank.Items(si).FindControl("text_paydBankNo"), TextBox).Text
			'分行代號
		Dim paydBankSubNo As String = CType(dg_basPayBank.Items(si).FindControl("text_paydBankSubNo"), TextBox).Text
			'帳號
		Dim paydDepositorNo As String = CType(dg_basPayBank.Items(si).FindControl("text_paydDepositorNo"), TextBox).Text
			'金融機構名稱
		Dim paydBankName As String = CType(dg_basPayBank.Items(si).FindControl("text_paydBankName"), TextBox).Text
			'戶名
		Dim paydDepositor As String = CType(dg_basPayBank.Items(si).FindControl("text_paydDepositor"), TextBox).Text
			'帳戶所屬人身份證號*
		Dim paydDepOfID As String = CType(dg_basPayBank.Items(si).FindControl("text_paydDepOfID"), TextBox).Text

		If Editable Then
			'儲存
			If upd_dg_basPayName() = "" Then

				upd_dg_basPayBank()

				dg_basPayName.DataSource = get_basPayName()
				dg_basPayName.DataBind()
			Else
				'更新主檔有出錯
			End If

			AfterUpdateCancel()

		Else
			Dim infoStream As String
				infoStream = payCode & "||" & IIf(paydDepOfID <> "", paydDepOfID, payID) & "||" & payName & "||" & payTel1 & "||" & payZipCode & "||" & _
							payAddress & "||" & paydBankNo & "||" &paydBankSubNo & "||" & paydDepositorNo & "||" & paydBankName & "||" & paydDepositor
'Response.Write("<script" & ">alert('" & infoStream & "');</" & "script>")

			Response.Write("<script" & ">returnValue = '" & infoStream & "';window.close();</" & "script>")
		End If

	End Sub

'====================================================================================================

	Sub btn_find_Click(sender As Object, e As EventArgs)
		dg_basPayName.SelectedIndex = -1
		dg_basPayName.CurrentPageIndex = 0
		ViewState("payCode") = Nothing
		ViewState("RowFilter") = Nothing

		text_findCode.Text = Trim(text_findCode.Text)
		text_findName.Text = Trim(text_findName.Text)
		text_infoStream.Text = ""

		dg_basPayBank.DataSource = Nothing
		dg_basPayBank.DataBind()

		Dim ds1 As System.Data.DataSet = get_basPayName()
			ds1.Tables(0).DefaultView.RowFilter = ""

		If Len(text_findCode.Text) > 0 Then
			ds1.Tables(0).DefaultView.RowFilter = "([payID] = '" & text_findCode.Text & "') "
		End If
		If Len(text_findName.Text) > 0 Then
			If ds1.Tables(0).DefaultView.RowFilter <> "" Then
				ds1.Tables(0).DefaultView.RowFilter &= "AND ([payName] LIKE '%" & text_findName.Text & "%')"
			Else
				ds1.Tables(0).DefaultView.RowFilter = "([payName] LIKE '%" & text_findName.Text & "%')"
			End If
		End If

		If ds1.Tables(0).DefaultView.Count > 0 Then
			ViewState("payCode") = ds1.Tables(0)
			ViewState("RowFilter") = ds1.Tables(0).DefaultView.RowFilter
			dg_basPayName.DataSource = ViewState("payCode")
		Else
			ds1.Tables(0).DefaultView.RowFilter = ""
			dg_basPayName.DataSource = ds1
		End If
Try

		dg_basPayName.DataBind()
  Catch ex As Exception
 End Try
	End Sub

'====================================================================================================

	Function upd_dg_basPayName() As String
		Dim ErrMsg As String = ""
		Dim dgi As DataGridItem
		For i As Integer = 0 To dg_basPayName.Items.Count - 1
			dgi = dg_basPayName.Items(i)

			Dim CheckBox1 As HtmlInputCheckBox =  get_tccOBJ(dgi.FindControl("CheckBox1"))
			Dim CheckBox2 As CheckBox =  get_tccOBJ(dgi.FindControl("CheckBox2"))

			Dim payCode As String = dg_basPayName.DataKeys(dg_basPayName.SelectedIndex)

			If CheckBox2.Checked = True Then
				'刪除
				If del_basPayName(payCode) <= 0 Then
					'沒刪到
				End If

			Else
				If CheckBox1.Checked = True Then
					'儲存
					Dim payKind As String = get_tccVAL(dgi.FindControl("DropDownList1"))
					Dim payID As String = Trim(get_tccVAL(dgi.FindControl("text_payID")) )
					Dim payName As String = Trim(get_tccVAL(dgi.FindControl("text_payName")) )
					Dim payAliasNo As String = Trim(get_tccVAL(dgi.FindControl("text_payAliasNo")) )
					Dim payTalk1 As String = Trim(get_tccVAL(dgi.FindControl("text_payTalk1")) )
					Dim payTel1 As String = Trim(get_tccVAL(dgi.FindControl("text_payTel1")) )
					Dim payTalk2 As String = Trim(get_tccVAL(dgi.FindControl("text_payTalk2")) )
					Dim payTel2 As String = Trim(get_tccVAL(dgi.FindControl("text_payTel2")) )
					Dim payEMail As String = Trim(get_tccVAL(dgi.FindControl("text_payEMail")) )
					Dim payZipCode As String = Trim(get_tccVAL(dgi.FindControl("text_payZipCode")) )
					Dim payAddress As String = Trim(get_tccVAL(dgi.FindControl("text_payAddress")) )
					Dim payShareKind As String = get_tccVAL(dgi.FindControl("ddl_payShareKind"))
					Dim payEditKind As String = get_tccVAL(dgi.FindControl("ddl_payEditKind"))
					Dim payDelKind As String = get_tccVAL(dgi.FindControl("ddl_payDelKind"))
					Dim payModifyUser As String = "Admin"

					If CheckBox2.Enabled = True Then
						'修改
						If upd_basPayName(payCode, payKind, payID, payName, payAliasNo, _
											payTalk1, payTel1, payTalk2, payTel2, _
											payEMail, payZipCode, payAddress, _
											payShareKind, payEditKind, payDelKind, _
											payModifyUser) < 0 Then

							ErrMsg = "更新 [basPayName] 失敗！"
							Exit For
						Else
							CheckBox1.Checked = False
						End If

					Else	'新增
						payCode = Trim(get_tccVAL(dgi.FindControl("text_payCode")) )

					End If

				End If

			End If

		Next i

		Return ErrMsg
	End Function


	Sub upd_dg_basPayBank()
		Dim dgi As DataGridItem
		For i As Integer = 0 To dg_basPayBank.Items.Count - 1
			dgi = dg_basPayBank.Items(i)

			Dim CheckBox1 As HtmlInputCheckBox =  get_tccOBJ(dgi.FindControl("CheckBox1"))
			Dim CheckBox2 As CheckBox =  get_tccOBJ(dgi.FindControl("CheckBox2"))

			Dim payCode As String = dg_basPayBank.DataKeys(dg_basPayBank.SelectedIndex)
			Dim paydBankNo_OLD As String = get_tccVAL(dgi.FindControl("text_paydBankNo"), True)
			Dim paydBankSubNo_OLD As String = get_tccVAL(dgi.FindControl("text_paydBankSubNo"), True)
			Dim paydDepositorNo_OLD As String = get_tccVAL(dgi.FindControl("text_paydDepositorNo"), True)

			If CheckBox2.Checked = True Then
				'刪除
				If del_basPayBank(payCode, paydBankNo_OLD, paydBankSubNo_OLD, paydDepositorNo_OLD) <= 0 Then
					'沒刪到
				End If

			Else
				If CheckBox1.Checked = True Then
					'儲存
					Dim paydBankNo As String = Trim(get_tccVAL(dgi.FindControl("text_paydBankNo")) )
					Dim paydBankSubNo As String = Trim(get_tccVAL(dgi.FindControl("text_paydBankSubNo")) )
					Dim paydDepositorNo As String = Trim(get_tccVAL(dgi.FindControl("text_paydDepositorNo")) )

					Dim paydBankName As String = Trim(get_tccVAL(dgi.FindControl("text_paydBankName")) )
					Dim paydDepositor As String = Trim(get_tccVAL(dgi.FindControl("text_paydDepositor")) )
					Dim paydDepOfID As String = Trim(get_tccVAL(dgi.FindControl("text_paydDepOfID")) )
					Dim paydDefFlag As String = Bool2Str(get_tccVAL(dgi.FindControl("chk_paydDefFlag")) )
					Dim paydStopFlag As String = Bool2Str(get_tccVAL(dgi.FindControl("chk_paydStopFlag")) )

					Dim text_paydStopDate As TextBox = get_tccOBJ(dgi.FindControl("text_paydStopDate"))
					If IsDate(ToolsFun.WebDateFun.StrToDate(text_paydStopDate.Text)) = False Then
						text_paydStopDate.Text = "　/　/　"
						paydStopFlag = "0"
					Else
						text_paydStopDate.Text = ChtDate(ToolsFun.WebDateFun.StrToDate(text_paydStopDate.Text))
					End If
					Dim paydStopDate As Object = EngDate(text_paydStopDate.Text)

					Dim payModifyUser As String = "Admin"

					Dim paydCreateUsrNo As String = 0
					Dim paydCreateUser As String = "Admin"

					If CheckBox2.Enabled = True Then
						'修改
						If upd_basPayBank(payCode, paydBankNo_OLD, paydBankSubNo_OLD, paydDepositorNo_OLD, _
											paydBankNo, paydBankSubNo, paydDepositorNo, _
											paydBankName, paydDepositor, paydDepOfID, _
											paydDefFlag, _
											paydStopFlag, paydStopDate, _
											payModifyUser) < 0 Then

						Else
							CheckBox1.Checked = False
						End If

					Else	'新增
						If add_basPayBank(payCode, paydBankNo, paydBankSubNo, paydDepositorNo, _
							paydBankName, paydDepositor, paydDepOfID, paydDefFlag, _
							paydStopFlag, paydStopDate, _
							paydCreateUsrNo, paydCreateUser) < 0 Then

						Else
							CheckBox1.Checked = False
						End If
					End If

				End If
			End If
		Next i
	End Sub

'====================================================================================================

	Sub Check_LastItem(ByRef DG As DataGrid)
		Dim LastIndex As Integer = DG.Items.Count - 1
		Dim CheckBox1 As HtmlInputCheckBox = DG.Items(LastIndex).FindControl("CheckBox1")
			CheckBox1.Checked = True
		Dim CheckBox2 As CheckBox = DG.Items(LastIndex).FindControl("CheckBox2")
			CheckBox2.Enabled = False
	End Sub

	Sub lbtn_new_Click(sender As Object, e As EventArgs)
		Dim DG As DataGrid = sender.NamingContainer.NamingContainer
		Select Case DG.Id
			Case "dg_basPayName"
				Dim ds As DataSet = get_basPayName()
				Dim NR As DataRow
					NR = ds.Tables(0).NewRow()
					NR("payCode") = -1
					NR("payShareKind") = "0"
					NR("payEditKind") = "0"
					NR("payDelKind") = "0"
					NR("payCreateUserNo") = 0
					NR("payCreateDTime") = Now()
					NR("payCreateUser") = "Admin"
				ds.Tables(0).Rows.Add(NR)

				DG.DataSource = ds
				DG.DataBind()

				Check_LastItem(DG)

			Case "dg_basPayBank"
				Dim payCode As String = CStr(dg_basPayName.DataKeys(dg_basPayName.SelectedIndex))
				Dim ds As DataSet = get_basPayBank(payCode)
				Dim NR As DataRow
					NR = ds.Tables(0).NewRow()
					NR("payCode") = payCode
					NR("paydDefFlag") = "0"
					NR("paydStopFlag") = "0"
					NR("paydCreateUsrNo") = 0
					NR("paydCreateDTime") = Now()
					NR("paydCreateUser") = "Admin"
				ds.Tables(0).Rows.Add(NR)

				DG.DataSource = ds
				DG.DataBind()

				Check_LastItem(DG)
		End Select
	End Sub


'====================================================================================================

	Function DateTimeBy(b As String, t As String) As String
		If b = "" Or t = "" Then
		Else
			'Return t & " by " & b
			Return b & " 於 " & t
		End If
	End Function

'<div id="oDiv" style="background-color: #CFCFCF; position: absolute; width: 100px; height: 50px; overflow:hidden; left:expression(document.body.clientWidth/2-oDiv.offsetWidth/2); top:expression(document.body.clientHeight/4-oDiv.offsetHeight/2)"><asp:TextBox id="txt_oDiv" runat="server" Width="65px"></asp:TextBox></div>
</script>
<html>
<head>
<title>受款人</title>
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
		document.all('div_basPayBank').style.top = realPosition(text_infoStream).y + 23;
	}catch(e){;}
}


function responseInfo(){
	returnValue = document.all("text_infoStream").value;
//alert(document.getElementById("text_infoStream").value);
	window.close();
}
returnValue = "Cancel";

function requestInfo_codBankSubName(thisID, replaceID){
	var url = "codBank_Edit.aspx?bnkBankNo=";
	var sw = screen.width - 100
	var infoStream = showModalDialog(url,window,"dialogWidth: "+ sw + "px ; dialogHeight: 325px; dialogTop: px; dialogLeft: 50px; edge: Raised; center: Yes; help: No; resizable: Yes; status: No;");
	var prvID = thisID.replace(replaceID,'');
	if(infoStream != "Cancel"){
		//資料傳回時：0:總行代碼;1:總行名稱;2:分行代碼;3:分行名稱
		//alert(infoStream);	//008||華南銀行||008-1278||華銀復興
		var infoArray = infoStream.split("||");

		//金融機構代號
		document.all(prvID + 'text_paydBankNo').value = infoArray[0].replace(' ', '');
		document.all(prvID + 'text_paydBankNo').style.fontWeight = 'bold';
//		document.all(prvID + 'text_paydBankSubNo').value = "";
		//金融機構名稱
		document.all(prvID + 'text_paydBankName').value = infoArray[1].replace(' ', '');
		document.all(prvID + 'text_paydBankName').style.fontWeight = 'bold';
		document.all(prvID + 'hid_paydBankName').value = infoArray[1].replace(' ', '');
		//分行代碼
		document.all(prvID + 'text_paydBankSubNo').value = infoArray[2].replace(' ', '');
//		document.all(prvID + 'text_paydBankSubNo').value = infoArray[2].replace(' ', '');
		document.all(prvID + 'text_paydBankSubNo').style.fontWeight = 'bold';

		document.all(prvID + 'CheckBox1').checked='ON';
	}
}


var flag=0;
function flickerBorder(){
	if(document.all('dg_basPayBank')){
		myImage=document.all("div_basPayBank");
		if(flag==0){
			myImage.style.border="3px dotted #FF8C00";
			flag=1;
		}
		else{
			myImage.style.border="3px dashed #FF8C00";
			flag=0;
		}
		setTimeout("flickerBorder()", 500);
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
								<td height="20px" width="100" nowrap align="center" style="padding-top: 3px"><font size="2">身分證字號</font></td>
								<td height="20px" width="95"><asp:TextBox id="text_findCode" runat="server" MaxLength="10" Width="95px" style="TEXT-ALIGN: left; HEIGHT: 21px; margin-top: -1; IME-MODE: disabled" onfocus="this.select();"></asp:TextBox></td>
								<td height="20px" width="50" nowrap align="center" style="padding-top: 3px"><font size="2">姓名</font></td>
								<td height="20px" width="95"><asp:TextBox id="text_findName" runat="server" MaxLength="10" Width="95px" style="TEXT-ALIGN: left; HEIGHT: 21px; margin-top: -1" onfocus="this.select();"></asp:TextBox></td>
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
				<asp:DataGrid id="dg_basPayName" runat="server" CellPadding="0" BorderStyle="Solid" style="TABLE-LAYOUT: fixed" AutoGenerateColumns="False" BackColor="#C1D1A1" ForeColor="Black" DataKeyField="payCode" OnItemCreated="dg_basPayName_ItemCreated" OnItemDataBound="dg_basPayName_ItemDataBound" OnSelectedIndexChanged="dg_basPayName_Select" AllowPaging="True" PageSize="10" OnPageIndexChanged="dg_basPayName_PageIndexChanged" OnPreRender="dg_basPayName_PreRender" ShowFooter="True">
					<HeaderStyle font-size="X-Small" wrap="False" height="20px" cssclass="titleDynamic" forecolor="#3F3D3D" backcolor="#E0E8B9"></HeaderStyle>
					<ItemStyle height="22px" backcolor="#FFFCEC"></ItemStyle>
					<AlternatingItemStyle height="22px"></AlternatingItemStyle>
					<SelectedItemStyle backcolor="#E6E6FA"></SelectedItemStyle>
					<EditItemStyle verticalalign="Top"></EditItemStyle>
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
							<FooterStyle wrap="False" horizontalalign="Center" backcolor="#FFFCEC"></FooterStyle>
							<FooterTemplate>
								<asp:LinkButton id="lbtn_new" runat="server" Font-Size="X-Small" ForeColor="Red" onclick="lbtn_new_Click">新增</asp:LinkButton>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="代碼">
							<HeaderStyle wrap="False" width="35px" font-bold="True"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payCode" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="12" Width="35px" Text='<%# DataBinder.Eval(Container, "DataItem.payCode") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.payCode") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly="True"></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="分類">
							<HeaderStyle wrap="False" width="65px"></HeaderStyle>
							<ItemTemplate>
								<asp:DropDownList id="DropDownList1" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.payKind") %>' Enabled='<%# Editable %>'>
									<asp:ListItem Value="">…</asp:ListItem>
									<asp:ListItem Value="1">員工</asp:ListItem>
									<asp:ListItem Value="2">專戶</asp:ListItem>
									<asp:ListItem Value="3">債權人</asp:ListItem>
								</asp:DropDownList>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="身分證字號">
							<HeaderStyle wrap="False" width="85px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payID" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="12" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.payID") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="受款人名稱">
							<HeaderStyle wrap="False" width="100px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payName" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="120" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.payName") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="受款人簡稱">
							<HeaderStyle wrap="False" width="85px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payAliasNo" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="15" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.payAliasNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="聯絡人１">
							<HeaderStyle wrap="False" width="80px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payTalk1" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="15" Width="80px" Text='<%# DataBinder.Eval(Container, "DataItem.payTalk1") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="聯絡電話１">
							<HeaderStyle wrap="False" width="80px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payTel1" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="20" Width="80px" Text='<%# DataBinder.Eval(Container, "DataItem.payTel1") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="聯絡人２">
							<HeaderStyle wrap="False" width="80px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payTalk2" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="15" Width="80px" Text='<%# DataBinder.Eval(Container, "DataItem.payTalk2") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="聯絡電話２">
							<HeaderStyle wrap="False" width="80px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payTel2" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="20" Width="80px" Text='<%# DataBinder.Eval(Container, "DataItem.payTel2") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="電子郵件信箱">
							<HeaderStyle wrap="False" width="150px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payEMail" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="50" Width="150px" Text='<%# DataBinder.Eval(Container, "DataItem.payEMail") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="郵遞區號">
							<HeaderStyle wrap="False" width="60px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payZipCode" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="10" Width="60px" Text='<%# DataBinder.Eval(Container, "DataItem.payZipCode") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="地址">
							<HeaderStyle wrap="False" width="300px"></HeaderStyle>
							<ItemTemplate>
								<asp:TextBox id="text_payAddress" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="100" Width="300px" Text='<%# DataBinder.Eval(Container, "DataItem.payAddress") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="分享設定">
							<HeaderStyle wrap="False" horizontalalign="Center" width="75px" forecolor="#FF8C00"></HeaderStyle>
							<ItemTemplate>
								<asp:DropDownList id="ddl_payShareKind" runat="server" Width="75px" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.payShareKind") %>' Enabled='<%# Editable %>'>
									<asp:ListItem Value="0">擁有者</asp:ListItem>
									<asp:ListItem Value="1">同帳別者</asp:ListItem>
									<asp:ListItem Value="2">所有人員</asp:ListItem>
								</asp:DropDownList>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="異動設定">
							<HeaderStyle wrap="False" horizontalalign="Center" width="75px" forecolor="#FF8C00"></HeaderStyle>
							<ItemTemplate>
								<asp:DropDownList id="ddl_payEditKind" runat="server" Width="75px" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.payEditKind") %>' Enabled='<%# Editable %>'>
									<asp:ListItem Value="0">擁有者</asp:ListItem>
									<asp:ListItem Value="1">同帳別者</asp:ListItem>
									<asp:ListItem Value="2">所有人員</asp:ListItem>
								</asp:DropDownList>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="刪除設定">
							<HeaderStyle wrap="False" horizontalalign="Center" width="75px" forecolor="#FF8C00"></HeaderStyle>
							<ItemTemplate>
								<asp:DropDownList id="ddl_payDelKind" runat="server" Width="75px" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.payDelKind") %>' Enabled='<%# Editable %>'>
									<asp:ListItem Value="0">擁有者</asp:ListItem>
									<asp:ListItem Value="1">同帳別者</asp:ListItem>
									<asp:ListItem Value="2">所有人員</asp:ListItem>
								</asp:DropDownList>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="建立於">
							<HeaderStyle wrap="False" width="100px"></HeaderStyle>
							<ItemStyle wrap="False" horizontalalign="Center" font-size="XX-Small" font-names="Verdana"></ItemStyle>
							<ItemTemplate>
								<asp:Label id="lab_payCreateBy" runat="server" style="TEXT-ALIGN: center" text='<%# DateTimeBy(DataBinder.Eval(Container, "DataItem.payCreateUser") & "", DataBinder.Eval(Container, "DataItem.payCreateDTime", "{0:MM/dd}") & "") %>' tooltip='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.payCreateDTime") & "") %>'></asp:Label>
								<input id="hid_payCreateUserNo" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.payCreateUserNo") %>' runat="server" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="修改於">
							<HeaderStyle wrap="False" width="100px"></HeaderStyle>
							<ItemStyle wrap="False" horizontalalign="Center" font-size="XX-Small" font-names="Verdana"></ItemStyle>
							<ItemTemplate>
								<asp:Label id="lab_payModifyBy" runat="server" style="TEXT-ALIGN: center" text='<%# DateTimeBy(DataBinder.Eval(Container, "DataItem.payModifyUser") & "", DataBinder.Eval(Container, "DataItem.payModifyDTime", "{0:MM/dd}") & "") %>' tooltip='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.payModifyDTime") & "") %>'></asp:Label>
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
					<FooterStyle backcolor="White"></FooterStyle>
				</asp:DataGrid>
				</td>
			</tr>
		</table>
		<div id="div_basPayBank" runat="server" style="position: absolute; width: auto; height: auto; z-index: 9">
			<asp:DataGrid id="dg_basPayBank" runat="server" CellPadding="0" BorderStyle="Solid" style="TABLE-LAYOUT: fixed" AutoGenerateColumns="False" BackColor="#C1D1A1" ForeColor="Black" DataKeyField="payCode" OnItemCreated="dg_basPayBank_ItemCreated" OnItemDataBound="dg_basPayBank_ItemDataBound" OnSelectedIndexChanged="dg_basPayBank_Select" OnItemCommand="dg_basPayBank_ItemCommand" OnPreRender="dg_basPayBank_PreRender" ShowFooter="True">
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
						<HeaderStyle wrap="False" horizontalalign="Center" width="35px"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<input type="checkbox" id="CheckBox1" alt="C1" runat="server" checked="false" />
						</ItemTemplate>
						<FooterStyle wrap="False" horizontalalign="Center" backcolor="#F8F8FF"></FooterStyle>
						<FooterTemplate>
							<asp:LinkButton id="lbtn_new" runat="server" Font-Size="X-Small" ForeColor="Red" onclick="lbtn_new_Click">新增</asp:LinkButton>
						</FooterTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="金融機構">
						<HeaderStyle wrap="False" width="110px" font-bold="True"></HeaderStyle>
						<ItemTemplate>
							<table style="table-layout:fixed; border-collapse: collapse" border="0" cellpadding="0" height="21">
								<tr>
									<td nowrap style="overflow:hidden" width="44"><asp:TextBox id="text_paydBankNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="3" Width="45px" Text='<%# DataBinder.Eval(Container, "DataItem.paydBankNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.paydBankNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox></td>
									<td style="border-left: 1px solid #D4D0C8"><asp:TextBox id="text_paydBankSubNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="8" Width="65px" Text='<%# DataBinder.Eval(Container, "DataItem.paydBankSubNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.paydBankSubNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox></td>
								</tr>
							</table>
							<input id="hid_paydBankName" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.paydBankName") %>' runat="server" />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="<p style='margin-top: -3px'>金融機構名稱<sup><font style='font-size: 6pt'>▼</font></sup>">
						<HeaderStyle wrap="False" width="110px"></HeaderStyle>
						<ItemTemplate>
							<asp:TextBox id="text_paydBankName" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="20" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.paydBankName") %>' class="removeBorder" onfocus="this.blur()" ReadOnly='<%# Not(Editable) %>' onContextmenu='<%# "JavaScript: if(1==" & IIf(Editable, 1, 0) & "){requestInfo_codBankSubName(this.id," & Chr(39) & "text_paydBankName" & Chr(39) & ")}; return false;" %>'></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="帳號">
						<HeaderStyle wrap="False" width="110px" font-bold="True"></HeaderStyle>
						<ItemTemplate>
							<asp:TextBox id="text_paydDepositorNo" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="20" Width="110px" Text='<%# DataBinder.Eval(Container, "DataItem.paydDepositorNo") %>' tooltip='<%# DataBinder.Eval(Container, "DataItem.paydDepositorNo") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="戶名">
						<HeaderStyle wrap="False" width="100px"></HeaderStyle>
						<ItemTemplate>
							<asp:TextBox id="text_paydDepositor" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="100" Width="100px" Text='<%# DataBinder.Eval(Container, "DataItem.paydDepositor") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="身分證字號">
						<HeaderStyle wrap="False" width="85px"></HeaderStyle>
						<ItemTemplate>
							<asp:TextBox id="text_paydDepOfID" runat="server" style="TEXT-ALIGN: left; margin-top: -1" MaxLength="12" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.paydDepOfID") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select();" onblur="this.className='removeBorder'" ReadOnly='<%# Not(Editable) %>'></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="預設">
						<HeaderStyle wrap="False" horizontalalign="Center" width="35px"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<asp:CheckBox id="chk_paydDefFlag" runat="server" Checked='<%# DataBinder.Eval(Container, "DataItem.paydDefFlag") %>' ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:CheckBox><br>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="停用">
						<HeaderStyle wrap="False" horizontalalign="Center" width="35px" forecolor="#FF8C00"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<asp:CheckBox id="chk_paydStopFlag" runat="server" Checked='<%# DataBinder.Eval(Container, "DataItem.paydStopFlag") %>' ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:CheckBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="停用日期">
						<HeaderStyle wrap="False" width="65px" forecolor="#FF8C00"></HeaderStyle>
						<ItemTemplate>
							<asp:TextBox id="text_paydStopDate" runat="server" style="TEXT-ALIGN: center; margin-top: -1" MaxLength="10" Width="65px" Text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.paydStopDate") & "",,"　/　/　") %>' class="removeBorder" onfocus="this.className='applyBorder';this.select()" onblur="this.className='removeBorder'" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x;oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;" ReadOnly='<%# Not(Editable) %>' Enabled='<%# Editable %>'></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="建立於">
						<HeaderStyle wrap="False" width="100px"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center" font-size="XX-Small" font-names="Verdana"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="lab_paydCreateBy" runat="server" style="TEXT-ALIGN: center" text='<%# DateTimeBy(DataBinder.Eval(Container, "DataItem.paydCreateUser") & "", DataBinder.Eval(Container, "DataItem.paydCreateDTime", "{0:MM/dd}") & "") %>' tooltip='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.paydCreateDTime") & "") %>'></asp:Label>
							<input id="hid_paydCreateUsrNo" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.paydCreateUsrNo") %>' runat="server" />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="修改於">
						<HeaderStyle wrap="False" width="100px"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center" font-size="XX-Small" font-names="Verdana"></ItemStyle>
						<ItemTemplate>
							<asp:Label id="lab_paydModifyBy" runat="server" style="TEXT-ALIGN: center" text='<%# DateTimeBy(DataBinder.Eval(Container, "DataItem.payModifyUser") & "", DataBinder.Eval(Container, "DataItem.paydModifyDTime", "{0:MM/dd}") & "") %>' tooltip='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.paydModifyDTime") & "") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="移除">
						<HeaderStyle wrap="False" horizontalalign="Center" forecolor="Red" width="35px"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
						<ItemTemplate>
							<asp:CheckBox id="CheckBox2" runat="server" ToolTip="移除勾選的資料列" Enabled='<%# Editable %>'></asp:CheckBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="payCode" HeaderText="受款人代碼" Visible="True">
						<HeaderStyle horizontalalign="Center" width="50px" font-bold="True"></HeaderStyle>
						<ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
					</asp:BoundColumn>
				</Columns>
				<FooterStyle backcolor="White"></FooterStyle>
			</asp:DataGrid>
		</div>
		<asp:TextBox id="text_infoStream" runat="server" style="display: none" EnableViewState="False"></asp:TextBox>
		<!-- Insert content here -->
		<script language="javascript" type="text/javascript">
		<!--
			if(document.all('text_infoStream').value!=''){moveDiv();}
			flickerBorder();

			window.cart_calendar_PostBackOnSameSelection = true; //COMPONENTART:CALENDAR
		//-->
		</script>
	</form>
</body>
</html>