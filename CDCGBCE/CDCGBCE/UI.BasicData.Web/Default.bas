<Script Language="VB" Runat="Server">

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

	Function MySqlDbWriter(queryString As String, Optional myConnection As System.Data.SqlClient.SqlConnection = Nothing, Optional myCommand As System.Data.SqlClient.SqlCommand = Nothing, Optional NoTry As Boolean = False)
		Dim dbConnection As System.Data.IDbConnection = IIf(myConnection Is Nothing, New System.Data.SqlClient.SqlConnection(connectionString), myConnection)
		Dim dbCommand As System.Data.SqlClient.SqlCommand = IIf(myCommand Is Nothing, New System.Data.SqlClient.SqlCommand(queryString, dbConnection), myCommand)

		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		If myConnection Is Nothing Then
			If NoTry = False
				Try
					dbCommand.Connection.Open()
					dbCommand.ExecuteNonQuery()
					dbConnection.Close()
				Catch ex As Exception
					Response.Write("<script" & ">self.alert('" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")
				End Try
			Else
				dbCommand.Connection.Open()
				dbCommand.ExecuteNonQuery()
				dbConnection.Close()
			End If
		Else
			dbCommand.ExecuteNonQuery()
		End If
	End Function

	'西元轉民國(y/MM/dd)
	Function ChtDate(thisDate As String, Optional OnNull As String = "") As String
		Try
			thisDate = Format(CDate(thisDate), "yyyy/MM/dd")
			Return CInt(Left(thisDate, 4))-1911 & Right(thisDate, Len(thisDate)-4)
		Catch ex As Exception
			Return OnNull
		End Try
	End Function

	'西元轉民國(yyyMMdd)
	Function ChtDateNoSplit(thisDate As String, Optional OnNull As String = "") As String
		Try
			thisDate = Format(CDate(thisDate), "yyyyMMdd")
			Return Right("00" & CInt(Left(thisDate, 4))-1911 & Right(thisDate, Len(thisDate)-4), 7)
		Catch ex As Exception
			Return OnNull
		End Try
	End Function

	'西元轉民國(含分隔符號:y/MM/dd)
	Function ChtDateSplit(thisDate As String, Optional wSplit As String = "/", Optional OnNull As String = "") As String
		Try
			thisDate = Format(CDate(thisDate), "yyyyMMdd")
			Return CInt(Left(thisDate, 4))-1911 & wSplit & Mid(thisDate, 5, 2) & wSplit & Right(thisDate, 2)
		Catch ex As Exception
			Return OnNull
		End Try
	End Function

	'西元轉民國(含時間:yyyMMdd(withSplit)HHmmss)
	Function ChtDateTime(EngDateTime As DateTime, Optional withSec As Boolean = True, Optional withSplit As String = "")
		Dim tmpDate As String = Format(EngDateTime, "yyyyMMddHHmmss")
			tmpDate = Right("00" & CInt(Left(tmpDate, 4))-1911 & Right(tmpDate, Len(tmpDate)-4), 13)
		If withSec = False Then tmpDate = Left(tmpDate, Len(tmpDate)-2)
		If Len(withSplit) <> 0 Then tmpDate = Left(tmpDate, 7) & withSplit & Right(tmpDate, Len(tmpDate)-7)
		Return (tmpDate)
	End Function

	'民國轉西元
	Function EngDate(thisDate As String, Optional OnNull As String = "") As String
		Try
			Dim tmpDate() As String = Split(thisDate & "//", "/")
			Dim newDate As String = Val(tmpDate(0)) + 1911 & "/" & Val(tmpDate(1)) & "/" & Val(tmpDate(2))

			If IsDate(newDate) = True Then
				Return newDate
			Else
				'Return System.DateTime.Now.ToString("yyyy/MM/dd")
				Return OnNull
			End If
		Catch ex As Exception
			Return OnNull
		End Try
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

	Function WindowOpen(thisUrl As String, thisName As String) As String
		Return "<script" & ">subWin = window.open('" & thisUrl & "','" & thisName & "','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no'); subWin.focus()</" & "script>"
	End Function


'頁面需先加入下列 javascript 方可使用 DisableAfterSubmit() 函數
'function DisableAfterSubmit(){
'	var obj = event.srcElement;
'	var objs = document.getElementsByTagName('INPUT');
'	for(var i=0; i<objs.length; i++){
'		if(objs[i].type.toLowerCase() == 'submit'){
'			objs[i].disabled = true;
'		}
'	}
'}
'可於 Page_Load() 中使用
'If Not Page.IsPostBack Then
'	↓刪除前確認寫法
'	btn_delete.Attributes.Add("onclick", "if(window.confirm('按一下[確定]，永遠刪除這一列。您無法復原這項變更。') == false) return false;DisableAfterSubmit();" & Me.GetPostBackEventReference(Me.btn_delete) & ";")
'	↓避免列印(Excel)後按鈕狀態失效
'	btn_print.Attributes.Add("onclick", Me.GetPostBackEventReference(Me.btn_print) & ";")
'End If

	Function DisableAfterSubmit(Optional formID As String = "_ctl0")	'v1.x:"_ctl0"; v2:"ctl00"
		Dim oForm As HtmlForm
		Dim oControls As Control
		Dim oButton As Button

		oForm = CType(Me.Page.FindControl(formID), HtmlForm)
		If oForm Is Nothing Then	'970903 防止錯誤
			Exit Function
		End If

		For Each oControls In oForm.Controls
			Select Case oControls.GetType.Name	'oControls.GetType.ToString
				Case "Button"	'"System.Web.UI.WebControls.Button"
					oButton = CType(oControls, Button)

					Me.GetPostBackEventReference(oButton)

					If Not Page.IsPostBack Then
						Dim sb As System.Text.StringBuilder = New System.Text.StringBuilder()

						'sb.Append("if (typeof(Page_ClientValidate) == 'function') { if (Page_ClientValidate() == false) { return false; }}")
						'sb.Append("if (window.confirm('are you sure?') == false) return false;")
						If oButton.CausesValidation Then
							sb.Append("if (typeof(Page_ClientValidate) == 'function') Page_ClientValidate();")
							sb.Append("if (Page_IsValid) ")
						End If
						If oButton.CausesValidation Then sb.Append("{")
						sb.Append("DisableAfterSubmit();")
						sb.Append(Me.GetPostBackEventReference(oButton))
						sb.Append(";")
						If oButton.CausesValidation Then sb.Append("}")
						'↓讓系統不再重複補上驗證js
						If oButton.CausesValidation Then oButton.CausesValidation = False

						oButton.Attributes.Add("onclick", sb.ToString())
						'oButton.Attributes.Append("onclick", sb.ToString())
					End If

			End Select
		Next
	End Function

	'選不到時，先新增再選擇
	Sub ForceSelect(sDDL As Object, sVAL As String)
		Try
			sDDL.SelectedValue = sVAL
			If sDDL.SelectedValue <> sVAL Then Throw New Exception	'故意在V2中引發錯誤
		Catch
			sDDL.Items.Insert(sDDL.Items.Count, New ListItem(sVAL & "*", sVAL))
			sDDL.SelectedValue = sVAL
		End Try
	End Sub

	'產生 SqlParameter 給 dbCommand.Parameters 來 Add
	Function creatParameter(ByVal pType As System.Data.DbType, ByVal pName As String, Optional ByVal pValue As Object = Nothing, Optional Zero2Null As Boolean = True) As System.Data.IDataParameter
		Dim dbParam As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
			dbParam.ParameterName = "@" & Replace(pName, "@", "")
			dbParam.DbType = pType
		'Try
			If pValue <> Nothing Then
				dbParam.Value = pValue
			Else
				If Zero2Null = False Then
					Select Case pType
						Case System.Data.DbType.Int32, System.Data.DbType.Currency
							dbParam.Value = 0	'不允許 NULL
						Case Else
							dbParam.Value = System.DBNull.Value
					End Select
				Else
					dbParam.Value = System.DBNull.Value
				End If
			End If
		'Catch
		'	dbParam.Value = System.DBNull.Value
		'End Try
		Return dbParam
	End Function

	'傳入 "100-2-000101"，傳出 "100-2-,000101"
	Function get_AnB(ab As String) As String
		ab = Trim(ab)
		Dim A As String
		Dim B As String
		If Len(ab) > 1 Then
			For i As Integer = Len(ab) To 1 Step -1
'Response.Write(i & " - " & Mid(ab, i, 1) & " : " & IsNumeric(Mid(ab, i, 1)) & "<br>")
				If Not IsNumeric(Mid(ab, i, 1)) Then
					A = Left(ab, i)
					B = Right(ab, Len(ab)-i)
					Exit For
				End If
			Next i
			If A <> "" Then
				Return A & "," & B
			Else
				Return "," & ab
			End If
		Else
			If Len(ab) = 1 Then
				If IsNumeric(ab) = True Then
					Return "," & ab
				Else
					Return ab & ",0"
				End If
			Else
				Return ",0"
			End If
		End If
	End Function

	'傳入 "100-2-,000101"，傳出 "100-2-000102"
	Function get_nextAB(ab As String) As String
		Dim tmp_AB() As String = Split(ab & ",", ",")
		Dim A As String = tmp_AB(0)
		Dim B As String = tmp_AB(1)
		If Len(B) = Len(Val(B)) Then
			Return A & Val(B) + 1
		Else
			Return A & String.Format("{0:D" & Len(B) & "}", CInt(Val(B) + 1))
		End If
	End Function

	'補上一層(樹狀結構用)
	Function TableAddPrv(ByRef DT As System.Data.DataTable, ByVal FieldName As String, Optional ByVal PrvFieldName As String = Nothing) As System.Data.DataTable
		If Not DT Is Nothing AndAlso DT.Columns.Contains(FieldName) Then
			Dim i As Integer
			Dim j As Integer
			If PrvFieldName Is Nothing Then
				PrvFieldName = "Prv" & FieldName
			End If
			If Not DT.Columns.Contains(PrvFieldName) Then
				DT.Columns.Add(PrvFieldName, Type.GetType("System.String"))
			End If
			For i = 0 To DT.Rows.Count - 1
				For j = i - 1 To 0 Step -1
					If CType(DT.Rows(i)(FieldName), String).StartsWith(CType(DT.Rows(j)(FieldName), String)) Then
						DT.Rows(i)(PrvFieldName) = CType(DT.Rows(j)(FieldName), String)
						Exit For
					End If
				Next
			Next
		End If
		Return DT
	End Function

	'Optional: 是否取 ToolTip
	Function get_tccVAL(ByRef tcc As Control, ByVal Optional ToolTip As Boolean = False) As Object
		Select Case tcc.GetType.Name	'tcc.ToString()
			Case "CheckBox"	'"System.Web.UI.WebControls.CheckBox"
				Return IIf(ToolTip, CType(tcc, CheckBox).ToolTip, CType(tcc, CheckBox).Checked)
			Case "Label"	'"System.Web.UI.WebControls.Label"
				Return IIf(ToolTip, CType(tcc, Label).ToolTip, Replace(CType(tcc, Label).Text, "&nbsp;", ""))
			Case "TextBox"	'"System.Web.UI.WebControls.TextBox"
				Return IIf(ToolTip, CType(tcc, TextBox).ToolTip, CType(tcc, TextBox).Text)
			Case "DropDownList"	'"System.Web.UI.WebControls.DropDownList"
				Return CType(tcc, DropDownList).SelectedValue
			Case "HtmlInputHidden"	'HtmlControls.HtmlInputHidden
				Return CType(tcc, HtmlInputHidden).value
			Case "HtmlInputCheckBox"	'System.Web.UI.HtmlControls.HtmlInputCheckBox
				Return CType(tcc, HtmlInputCheckBox).value
		End Select
	End Function

</Script>