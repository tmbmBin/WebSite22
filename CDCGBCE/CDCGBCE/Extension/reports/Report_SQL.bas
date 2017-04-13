<Script Languate="VB" Runat="Server">

	Function GetPageName() As String
		Dim Name As String() = HttpContext.Current.Request.Url.AbsolutePath.Split("/")
		Return Name(Name.Length - 1)
	End Function
	
	Function GetFileSQLAll(Optional ByVal SQLNo As String = Nothing,Optional ByVal FNamePos as String="$",Optional ByVal FValPos as String="#") As String
		Dim File As String
		Dim FileSets, Dats As String()
		Dim SQLSub As String
		Dim PosStart As Integer = 1
		Dim PosEnd, i As Integer
		Dim SQL As String = GetFileSQL(SQLNo)
		if FNamePos="" Then
			FNamePos="$"
		End If	
		if FValPos="" Then
			FValPos="#"
		End If	
		Do
			PosStart = InStr(PosStart, SQL, "@@") 'SELECT FROM @@File$@Year#97$@Month#2; WHERE 
			If PosStart <= 0 Then
				Exit Do
			End If
			PosEnd = InStr(PosStart + 2, SQL, ";")
			File = SQL.Substring(PosStart + 1, PosEnd - PosStart - 2)
			FileSets = File.Split(FNamePos)
			if InStr(FileSets(0),"?")>0 Then
				SQLSub = ToolsFun.FileFun.ReadTextFile(Server.MapPath(FileSets(0).Replace("?",GetPageName()))) 'SELECT AAA FORM B WHERE YEAR=@Year
			else
			  SQLSub = ToolsFun.FileFun.ReadTextFile(Server.MapPath(FileSets(0))) 'SELECT AAA FORM B WHERE YEAR=@Year
		    end if
			For i = 1 To FileSets.Length - 1
				Dats = FileSets(i).Split(FValPos)
				SQLSub = SQLSub.Replace(Dats(0), Dats(1))
			Next
			SQL = SQL.Replace("@@" & File & ";", SQLSub)
		Loop
		Return SQL
	End Function
	
	Function GetFileSQL(Optional ByVal SQLNo As String = Nothing)
		Dim SQL As String
		Try
			SQL = FileFun.ReadTextFile(Server.MapPath(".") & "\" & GetPageName() & SQLNo & ".sql")
		Catch
		End Try
		Return SQL
	End Function

	'從交易檔中抓取存在年度
	Function get_accExchYear() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT DISTINCT [PK_Year] FROM [accExch]"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function setLevel(oName As String, oStr As String, Optional levStr As String = "　", Optional ByVal levStart As Integer=1) As String
		Dim tmpStr As String() = Split(oName, oStr)
		If tmpStr.Length = 1 Then
			Return oName
		Else
			Dim newStr As String = ""
			For i As Integer = 0 To tmpStr.Length-1
				newStr &= tmpStr(i) & IIf(i < tmpStr.Length-1, oStr & StrDup(i+levStart, levStr), "")
			Next i

			Return newStr
		End If
	End Function

</Script>