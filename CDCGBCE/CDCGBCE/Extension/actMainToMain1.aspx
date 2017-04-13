<%@ Page Language="VB" Debug="true" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="DB.DbSum.DAT" %>
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
					"ZM.acmYear, ZM.acmNo, acmKidNum, " & _
					"acmMonth, acmDay, " & _
					"acmWordNum, " & _
					"acmMarkDate, " & _
					"ISNULL(DN.dptName, ZM.acmWorkUnitNo) AS acmWorkUnitName, " & _
					"acmWorkUnitNo, acmWorkUserNo, " & _
					"acmMoney, acmMemo, " & _
					"ISNULL(acmModifyUser, acmCreateUser) AS acmModifyUser, " & _
					"ISNULL(acmModifyDTime, acmCreateDTime) AS acmModifyDTime, " & _
					"(SELECT COUNT(*) FROM [actVisa] WHERE (acmYear = ZM.acmYear) AND (acmNo = ZM.acmNo)) AS [actVisaCOUNT] " & _
				"FROM actMain ZM " & _
					"INNER JOIN actVisa ZV ON  ZM.acmYear=ZV.acmYear AND ZM.acmNo=ZV.acmNo " & _
						"AND NOT EXISTS (SELECT * FROM ActVisa1 V1 WHERE V1.acmYear=ZV.acmYear And V1.acmNo=ZV.acmNo) " & _
						"AND NOT EXISTS (SELECT * FROM ActVisa2 V2 WHERE V2.acmYear=ZV.acmYear And V2.acmNo=ZV.acmNo) " & _
						"AND NOT EXISTS (SELECT * FROM ActPayVisa PV WHERE PV.acmYear=ZV.acmYear And PV.acmNo=ZV.acmNo) " & _
						"AND ZM.acmWordNum=ISNULL(ZM.acmSourWordNum,ZM.acmWordNum) " & _
					"LEFT OUTER JOIN codDepartName DN ON ZM.acmWorkUnitNo = DN.dptCode " & _
				"WHERE (ZM.acmYear = @acmYear) "


		If acmMonth <> -1 Then
			queryString & = "AND (ZM.acmMonth = @acmMonth) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (ZM.acmKidNum = @acmKidNum) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (ZM.acmWorkUnitNo = @acmWorkUnitNo) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (ZM.acmWorkUserNo = @acmWorkUserNo) "
		End If

'			queryString & = "AND (ZM.acmMoney > 0) "

			queryString &= "ORDER BY ZM.acmYear, ZM.acmNo DESC"
'Response.Write(queryString.Replace("@acmYear", acmYear).Replace("@acmMonth", acmMonth))
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
	Function get_actVisa(ByVal acmYear As Integer, ByVal acmNo As Integer) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "" & _
				"SELECT " & _
					"acmYear, acmNo, " & _
					"acvNo, " & _
					"acvBgtYear, acvBgtMonth, " & _
					"acvPlanCode, " & _
					"ISNULL(codPlanCode.plnPlanName, ISNULL(V.acvPlanCode,'')) AS plnPlanName, " & _
					"acvOutlayYear, " & _
					"acvOutlayCode, " & _
					"ISNULL(codOutlayCode.oulOutlayName, ISNULL(V.acvOutlayCode, '')) AS oulOutlayName, " & _
					"acvBgtSourceCode, " & _
					"BO.orgName, " & _
					"acvAccKind, " & _
					"AKN.accKindName, " & _
					"acvBizCode, " & _
					"BN.BizName, " & _
					"acvPrePayFlag, " & _
					"acvMoney, acvMemo " & _
				"FROM actVisa V " & _
					"LEFT OUTER JOIN codPlanCode ON V.acvOutlayYear = codPlanCode.codCodeVer AND V.acvPlanCode = codPlanCode.plnPlanCode " & _
					"LEFT OUTER JOIN codOutlayCode ON V.acvOutlayYear = codOutlayCode.codCodeVer AND V.acvOutlayCode = codOutlayCode.oulOutlayCode " & _
					"LEFT OUTER JOIN codBgtOrigin BO ON V.acvBgtSourceCode = BO.orgCode " & _
					"LEFT OUTER JOIN codAccKindName AKN ON V.acvAccKind = AKN.accKind " & _
					"LEFT OUTER JOIN codBizName BN ON V.acvBizCode = BN.BizCode AND V.acvOutlayYear = BN.codCodeVer " & _
				"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo) "
'Response.Write(queryString.Replace("@acmYear", acmYear).Replace("@acmNo", acmNo))
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

'====================================================================================================

	Function GetPageName() As String
		Dim Name As String() = HttpContext.Current.Request.Url.AbsolutePath.Split("/")
		Return Name(Name.Length - 1)
	End Function

	Function GetFileSQL(Optional ByVal SQLNo As String = Nothing)
		Dim SQL As String
		Try
			SQL = FileFun.ReadTextFile(Server.MapPath(".") & "\" & GetPageName() & SQLNo & ".sql")
		Catch
		End Try
		Return SQL
	End Function

'====================================================================================================

	Function chk_actMain1(ByVal acmYear As Integer, _
					Optional S_actWordNum As String = Nothing, _
					Optional D_actWordNum As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = GetFileSQL()
'			queryString = queryString.Replace("@acmYear", acmYear)

		If S_actWordNum <> Nothing Then
			queryString = queryString.Replace("{S_actWordNum}", "(ZM.acmWordNum = '" & S_actWordNum & "') ")
		Else
			queryString = queryString.Replace("{S_actWordNum}", "(1=1) ")
		End If

		If D_actWordNum <> Nothing Then
			queryString = queryString.Replace("{D_actWordNum}", "(ISNULL(M.acmTopWordNum,ISNULL(M.acmSourWordNum,M.acmWordNum)) = '" & D_actWordNum & "') ")
		Else
			queryString = queryString.Replace("{D_actWordNum}", "(1=1) ")
		End If

		Dim selectString As String = "" & _
			"SELECT " & _
				"@acmYear As acmYear, " & _
				"MAX(ZM.acmNo) AS acmNo, " & _
				"ZM.acmWordNum, " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmMonth END)) AS [DES_acmMonth], " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmDay END)) AS [DES_acmDay], " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmNo END)) AS [DES_acmNo], " & _
				"MIN(ISNULL(ISNULL(ISNULL(M.acmTopWordNum, M.acmSourWordNum), M.acmWordNum), '')) AS [DES_acmWordNum], " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmKidNum END)) AS [DES_acmKidNum], " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmWorkUnitNo END)) AS [DES_acmWorkUnitNo], " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmWorkUserNo END)) AS [DES_acmWorkUserNo], " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmMoney END)) AS [DES_acmMoney], " & _
				"MAX(ZM.acmMemo) AS acmMemo, " & _
				"MAX((CASE WHEN ISNULL(M.acmSourWordNum,'') = '' THEN M.acmMemo END)) AS [DES_acmMemo], " & _
				"COUNT(DISTINCT ZV.acvNo) AS [acvNo_COUNT], " & _
				"COUNT(DISTINCT (CASE WHEN V.acvNo IS NULL THEN 0 ELSE ZV.acvNo END)) AS [DES_acvNo_COUNT] "

		queryString = selectString & queryString & _
			"GROUP BY ZM.acmWordNum, ISNULL(ISNULL(ISNULL(M.acmTopWordNum, M.acmSourWordNum), M.acmWordNum), '') " & _
			"HAVING COUNT(DISTINCT ZV.acvNo)=(SELECT COUNT(*) FROM ActVisa Z WHERE Z.acmYear=MIN(ZV.acmYear) AND Z.acmNo=MIN(ZV.acmNo)) "

'			"HAVING (MIN(V.acvNo) IS NOT NULL) AND (COUNT(DISTINCT ZV.acvNo) <= COUNT(DISTINCT (CASE WHEN V.acvNo IS NULL THEN 0 ELSE ZV.acvNo END))) "
'Response.Write(queryString.Replace("@acmYear", acmYear).Replace(Environment.NewLine(),"<br>"))
'Response.End()
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))

'Dim MyParams As New ToolsFun.DbClass.ParameterCollection '參數集合
'	MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet

'Dim dataTab = MsDbFun.GetDbTable(queryString, MyParams)
'Return dataTab
	End Function


	Function get_actVisa1(ByVal acmYear As Integer, _
					Optional S_actWordNum As String = Nothing, _
					Optional D_actWordNum As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = GetFileSQL()

		If S_actWordNum <> Nothing Then
			queryString = queryString.Replace("{S_actWordNum}", "(ZM.acmWordNum = '" & S_actWordNum & "') ")
		Else
			queryString = queryString.Replace("{S_actWordNum}", "(1=1) ")
		End If

		If D_actWordNum <> Nothing Then
			queryString = queryString.Replace("{D_actWordNum}", "(ISNULL(M.acmTopWordNum,ISNULL(M.acmSourWordNum,M.acmWordNum)) = '" & D_actWordNum & "') ")
		Else
			queryString = queryString.Replace("{D_actWordNum}", "(1=1) ")
		End If

		Dim selectString As String = "" & _
			"SELECT DISTINCT " & _
				"V.acmYear, V.acmNo, " & _
				"V.acvNo, " & _
				"V.acvBgtYear, V.acvBgtMonth, " & _
				"V.acvPlanCode, " & _
				"ISNULL(codPlanCode.plnPlanName, ISNULL(V.acvPlanCode,'')) AS plnPlanName, " & _
				"V.acvOutlayYear, " & _
				"V.acvOutlayCode, " & _
				"ISNULL(codOutlayCode.oulOutlayName, ISNULL(V.acvOutlayCode, '')) AS oulOutlayName, " & _
				"V.acvBgtSourceCode, " & _
				"BO.orgName, " & _
				"V.acvAccKind, " & _
				"AKN.accKindName, " & _
				"V.acvBizCode, " & _
				"BN.BizName, " & _
				"V.acvPrePayFlag, " & _
				"(V.acvMoney - V.acvMoney_Out_V1) AS acvMoney, " & _
				"V.acvMemo, " & _
				"( CAST(ZV.acvNo AS varchar) + ': ' + REPLACE(CAST(ZV.acvMoney AS varchar),'.00','') ) AS [待選項目] "

		queryString = selectString & queryString & " " & _
			"LEFT OUTER JOIN codPlanCode ON V.acvOutlayYear = codPlanCode.codCodeVer AND V.acvPlanCode = codPlanCode.plnPlanCode " & _
			"LEFT OUTER JOIN codOutlayCode ON V.acvOutlayYear = codOutlayCode.codCodeVer AND V.acvOutlayCode = codOutlayCode.oulOutlayCode " & _
			"LEFT OUTER JOIN codBgtOrigin BO ON V.acvBgtSourceCode = BO.orgCode " & _
			"LEFT OUTER JOIN codAccKindName AKN ON V.acvAccKind = AKN.accKind " & _
			"LEFT OUTER JOIN codBizName BN ON V.acvBizCode = BN.BizCode AND V.acvOutlayYear = BN.codCodeVer "

'Response.Write(queryString & "<hr>")

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

'====================================================================================================

	'再簽主檔
	Function add_actMain1(ByVal acmYear As Integer, _
						ByVal acmNo As Integer, _
						ByVal acmNo_DES As Integer, _
						ByVal acmNo1_NEW As Integer, _
						ByVal acmCreateDTime As Object, _
						ByVal acmCreateUser As String, _
						ByVal acmModifyDTime As Object, _
						ByVal acmModifyUser As String, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actMain1] " & _
									"(" & _
										"acmYear, " & _
										"acmNo, " & _
										"acmNo1, " & _
										"acmKidNum, " & _
										"acmDate, acmMonth, acmDay, " & _
										"acmMarkDate, " & _
										"acmTeaCode, " & _
										"acmMarkUnitNo, acmMarkUnitSubNo, acmMarkUserNo, " & _
										"acmWorkUnitNo, acmWorkUnitSubNo, acmWorkUserNo, " & _
										"acmWorkRankNo, " & _
										"acmWorkLevelNo, acmWorkLevelName, " & _
										"acmWorkRankKind, acmWorkLevelKind, " & _
										"acmWorkMapNo, " & _
										"acmMoney, acmMemo, " & _
										"acmProdLevelKind, acmProdVisaKind, acmProdKind, acmPayName, " & _
										"acmPassFlag, acmPassDate, acmPassDTime, acmPassUser, " & _
										"acmFinalKind, acmFinalDate, " & _
										"acmPassMoney, acmPassMemo, " & _
										"acmUnitPassFlag, acmUnitPassDate, " & _
										"acmUnitPassDTime, acmUnitPassUser, " & _
										"acmUnitPassMoney, acmUnitPassMemo, " & _
										"acmCreateDTime, " & _
										"acmCreateUser, " & _
										"acmModifyDTime, " & _
										"acmModifyUser" & _
									") " & _
									"SELECT " & _
										"acmYear, " & _
										"@acmNo_DES, " & _
										"@acmNo1_NEW, " & _
										"acmKidNum, " & _
										"acmDate, acmMonth, acmDay, " & _
										"acmMarkDate, " & _
										"acmTeaCode, " & _
										"acmMarkUnitNo, acmMarkUnitSubNo, acmMarkUserNo, " & _
										"acmWorkUnitNo, acmWorkUnitSubNo, acmWorkUserNo, " & _
										"acmWorkRankNo, " & _
										"acmWorkLevelNo, acmWorkLevelName, " & _
										"acmWorkRankKind,acmWorkLevelKind, " & _
										"acmWorkMapNo, " & _
										"acmMoney, acmMemo, " & _
										"acmProdLevelKind, acmProdVisaKind, acmProdKind, acmPayName, " & _
										"acmPassFlag, acmPassDate, acmPassDTime, acmPassUser, " & _
										"acmFinalKind, acmFinalDate, " & _
										"acmPassMoney, acmPassMemo, " & _
										"acmUnitPassFlag, acmUnitPassDate, acmUnitPassDTime, " & _
										"acmUnitPassUser, acmUnitPassMoney, acmUnitPassMemo, " & _
										"@acmCreateDTime, " & _
										"@acmCreateUser, " & _
										"@acmModifyDTime, " & _
										"@acmModifyUser " & _
									"FROM [actMain] " & _
									"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo)"

'Response.Write(queryString.Replace("@acmYear", acmYear).Replace("@acmNo_DES", acmNo_DES).Replace("@acmNo1_NEW", acmNo1_NEW).Replace("@acmNo", acmNo) & "<hr>")

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_DES", acmNo_DES))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1_NEW", acmNo1_NEW, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@acmCreateDTime", acmCreateDTime))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmCreateUser", acmCreateUser))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@acmModifyDTime", acmModifyDTime))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmModifyUser", acmModifyUser))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'再簽明細檔
	Function add_actVisa1(ByVal acmYear As Integer, _
							ByVal acmNo As Integer, _
							ByVal acvNo As Integer, _
							ByVal _acmNo_DES As Integer, _
							ByVal acvNo_DES As Integer, _
							ByVal acmNo1_NEW As Integer, _
							ByVal acvNo1_NEW As Integer, _
							ByVal acmNo_DES As Integer, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actVisa1] " & _
									"(" & _
										"acmYear, " & _
										"acmNo, " & _
										"acmNo1, " & _
										"acvNo, " & _
										"acvNo1, " & _
										"acvBgtYear, " & _
										"acvBgtMonth, " & _
										"acvPlanCode, " & _
										"acvOutlayYear, " & _
										"acvOutlayCode, " & _
										"acvBgtSourceCode, " & _
										"acvAccKind, " & _
										"acvBizCode, " & _
										"acvPrePayFlag, " & _
										"acvMoney, " & _
										"acvMemo, " & _
										"inspect, " & _
										"acmNoPrv" & _
									") " & _
									"SELECT " & _
										"acmYear, " & _
										"@acmNo__DES, " & _
										"@acmNo1_NEW, " & _
										"@acvNo_DES, " & _
										"@acvNo1_NEW, " & _
										"acvBgtYear, " & _
										"acvBgtMonth, " & _
										"acvPlanCode, " & _
										"acvOutlayYear, " & _
										"acvOutlayCode, " & _
										"acvBgtSourceCode, " & _
										"acvAccKind, " & _
										"acvBizCode, " & _
										"acvPrePayFlag, " & _
										"acvMoney, " & _
										"acvMemo, " & _
										"inspect, " & _
										"@acmNo_DES " & _
									"FROM [actVisa] " & _
									"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo) AND (acvNo = @acvNo) "

'Response.Write(queryString.Replace("@acmYear", acmYear).Replace("@acvNo1_NEW", acvNo1_NEW).Replace("@acmNo1_NEW", acmNo1_NEW).Replace("@acvNo_DES", acvNo_DES).Replace("@acmNo_DES", acmNo_DES).Replace("@acvNo", acvNo).Replace("@acmNo", acmNo) & "<br>")

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvNo", acvNo, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_DES", acmNo_DES, False)) '同主檔
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo__DES", _acmNo_DES, False)) '明細檔
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvNo_DES", acvNo_DES, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1_NEW", acmNo1_NEW, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvNo1_NEW", acvNo1_NEW, False))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function


	'請購主檔
	Function add_actMainProd(ByVal acmYear As Integer, _
							ByVal acmNo As Integer, _
							ByVal acmNo_DES As Integer, _
							ByVal acmNo1_NEW As Integer, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actMainProd] " & _
									"(" & _
										"acmYear, " & _
										"acmNo, " & _
										"acmNo1, " & _
										"acmProdAssFlag, acmProdAssDate, acmProdAssDTime, acmProdAssUser, " & _
										"acmProdCaseKind, " & _
										"acmProdChkFlag, acmProdChkDTime, acmProdChkUser, " & _
										"acmProdCaseFlag, acmProdCaseDTime, acmProdCaseUser, " & _
										"acmProdCaseNum, acmProdCaseName, " & _
										"acmProdCaseDate, " & _
										"acmProdCaseVDate, acmProdCaseSDate, acmProdCaseEDate, " & _
										"acmProdFactory, " & _
										"acmProdFactory1, acmProdFactory2, acmProdFactory3, " & _
										"acmProdChkDate" & _
									") " & _
									"SELECT " & _
										"acmYear, " & _
										"@acmNo_DES, " & _
										"@acmNo1_NEW, " & _
										"acmProdAssFlag, acmProdAssDate, acmProdAssDTime, acmProdAssUser, " & _
										"acmProdCaseKind, " & _
										"acmProdChkFlag, acmProdChkDTime, acmProdChkUser, " & _
										"acmProdCaseFlag, acmProdCaseDTime, acmProdCaseUser, " & _
										"acmProdCaseNum, acmProdCaseName, " & _
										"acmProdCaseDate, " & _
										"acmProdCaseVDate, acmProdCaseSDate, acmProdCaseEDate, " & _
										"acmProdFactory, " & _
										"acmProdFactory1, acmProdFactory2, acmProdFactory3, " & _
										"acmProdChkDate " & _
									"FROM [actMainProd] " & _
									"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo) "

'Response.Write("<hr>" & queryString.Replace("@acmYear", acmYear).Replace("@acmNo1_NEW", acmNo1_NEW).Replace("@acmNo_DES", acmNo_DES).Replace("@acmNo", acmNo))

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_DES", acmNo_DES))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1_NEW", acmNo1_NEW, False))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'採購明細檔
	Function add_actDtlProd(ByVal acmYear As Integer, _
							ByVal acmNo As Integer, _
							ByVal acmNo_DES As Integer, _
							ByVal acmNo1_NEW As Integer, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actDtlProd] " & _
									"(" & _
										"acmYear, " & _
										"acmNo, " & _
										"acmNo1, " & _
										"acdNo, " & _
										"acdProdCode, acdProdName, acdProdRule, " & _
										"acdProdSup, acdProdUnit, acdProdQry, " & _
										"acdMemo, " & _
										"acdProdPrice, " & _
										"acdMoney, " & _
										"acdProdPriceFac1, acdProdMoneyFac1, " & _
										"acdProdPriceFac2, acdProdMoneyFac2, " & _
										"acdProdPriceFac3, acdProdMoneyFac3" & _
									") " & _
									"SELECT " & _
										"acmYear, " & _
										"@acmNo_DES, " & _
										"@acmNo1_NEW, " & _
										"acdNo, " & _
										"acdProdCode, acdProdName, acdProdRule, " & _
										"acdProdSup, acdProdUnit, acdProdQry, " & _
										"acdMemo, " & _
										"acdProdPrice, " & _
										"acdMoney, " & _
										"acdProdPriceFac1, acdProdMoneyFac1, " & _
										"acdProdPriceFac2, acdProdMoneyFac2, " & _
										"acdProdPriceFac3, acdProdMoneyFac3 " & _
									"FROM [actDtlProd] " & _
									"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo) "

'Response.Write("<hr>" & queryString.Replace("@acmYear", acmYear).Replace("@acmNo1_NEW", acmNo1_NEW).Replace("@acmNo_DES", acmNo_DES).Replace("@acmNo", acmNo))

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_DES", acmNo_DES))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1_NEW", acmNo1_NEW, False))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

'====================================================================================================

	'部門
	Function get_codDepartName(Optional dptCode As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [dptCode], (dptCode + ' ' + dptName) AS [dptName], 1 AS [ODBY] " & _
									"FROM [codDepartName] "
		If dptCode <> Nothing Then
					queryString &= "WHERE ([dptCode] = '" & dptCode & "') "
		Else
					queryString &= "WHERE (ISNULL([dptStopFlag],'0') = '0') " & _
									"UNION " & _
									"SELECT '' AS [dptCode], '…' AS [dptName], 0 AS [ODBY] " & _
									"ORDER BY [ODBY], [dptCode]"
		End If

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_UnitName(dptCode As String) As String
		Dim ds As DataSet = get_codDepartName(dptCode)
		If ds.Tables(0).Rows.Count > 0 Then
			Return Replace(ds.Tables(0).Rows(0)("dptName") & "", ds.Tables(0).Rows(0)("dptCode") & " ", "")
		Else
			Return dptCode
		End If
	End Function

'====================================================================================================

	Sub Initialize()

		text_acmYear.Text = ""					'Session("default_Year")
		text_acmNo.Text = ""
		text_acmMonth.Text = ""

		text_acmWordNum.Text = ""
			text_acmWordNum.ToolTip = ""
		text_acmMoney.Text = ""

		text_acmWorkUnitNo.Text = ""			'Session("default_UnitName")
			text_acmWorkUnitNo.ToolTip = ""		'Session("default_UnitNo")
		text_acmWorkUserNo.Text = ""			'Session("default_UserName")
			text_acmWorkUserNo.ToolTip = ""		'Session("default_UserNo")
		text_acmMarkDate.Text = "　/　/　"

		text_acmMemo.Text = ""

		grid_actVisa.DataSource = Nothing
		grid_actVisa.DataBind()

		grid_actMain1.DataSource = Nothing
		grid_actMain1.DataBind()

		grid_actVisa1.DataSource = Nothing
		grid_actVisa1.DataBind()
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
			btn_delete.Attributes.Add("onclick","if (window.confirm('按一下[確定]，轉換為簽證資料。您無法復原此項變更。') == false) return false; DisableAfterSubmit();" & Me.GetPostBackEventReference(Me.btn_delete) & ";")

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

	Sub grid_actVisa_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Or e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			e.Item.Cells(0).CssClass = "DIV1_FreezingCol"
			e.Item.Cells(1).CssClass = "DIV1_FreezingCol"
			e.Item.Cells(2).CssClass = "DIV1_FreezingCol2"
		End If
	End Sub

	Sub grid_actVisa_DataBound(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

			Dim ddl_acvPlanCode As DropDownList = e.Item.FindControl("ddl_acvPlanCode")
			ForceSelect(ddl_acvPlanCode, ddl_acvPlanCode.CssClass, DataBinder.Eval(e.Item.DataItem, "plnPlanName") & "", False)

			Dim ddl_acvOutlayCode As DropDownList = e.Item.FindControl("ddl_acvOutlayCode")
			ForceSelect(ddl_acvOutlayCode, ddl_acvOutlayCode.CssClass, DataBinder.Eval(e.Item.DataItem, "oulOutlayName") & "", False)
		End If
	End Sub

'====================================================================================================

	Sub grid_actVisa1_DataBound(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

			Dim ddl_acvPlanCode As DropDownList = e.Item.FindControl("ddl_acvPlanCode")
			ForceSelect(ddl_acvPlanCode, ddl_acvPlanCode.CssClass, DataBinder.Eval(e.Item.DataItem, "plnPlanName") & "", False)

			Dim ddl_acvOutlayCode As DropDownList = e.Item.FindControl("ddl_acvOutlayCode")
			ForceSelect(ddl_acvOutlayCode, ddl_acvOutlayCode.CssClass, DataBinder.Eval(e.Item.DataItem, "oulOutlayName") & "", False)

			Dim DropDownList1 As DropDownList = e.Item.FindControl("DropDownList1")
			ForceSelect(DropDownList1, Split(DataBinder.Eval(e.Item.DataItem, "待選項目") & ":", ":")(0), DropDownList1.CssClass, False)
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
				tc.Attributes.Add("colspan", 11)	'v2.0時須加上此段來修正Bug
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

	'再簽項目
	Sub grid_actMain1_SelectedIndexChanged(sender As Object, e As EventArgs)
		For Each item As DataGridItem In sender.Items
			Dim CheckBox1 As CheckBox = item.Cells(0).FindControl("CheckBox1")
				CheckBox1.Checked = IIf(item.ItemIndex = sender.SelectedIndex, True, False)
		Next item
	End Sub

	Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs)
		Try
			grid_actMain1.SelectedIndex = sender.NamingContainer.ItemIndex
		Catch
			grid_actMain1.SelectedIndex = Val(sender.CssClass)
		End Try

		Dim e_grid_actMain1 As System.EventArgs
		Try
			grid_actMain1_SelectedIndexChanged(sender.NamingContainer.NamingContainer, e_grid_actMain1)
		Catch
			grid_actMain1_SelectedIndexChanged(grid_actMain1, e_grid_actMain1)
		End Try


		'讀取該列資料
		Try
			Dim acmYear As Integer = Val(text_acmYear.Text)
			Dim S_actWordNum As String = text_acmWordNum.Text
			Dim D_actWordNum As String = get_tccVAL(grid_actMain1.Items(grid_actMain1.SelectedIndex).FindControl("lab_acmWordNum"))
			Dim ds As DataSet = get_actVisa1(acmYear, S_actWordNum, D_actWordNum)
			If ds.Tables(0).Rows.Count > 0 Then
				grid_actVisa1.DataSource = ds
			Else
				grid_actVisa1.DataSource = Nothing
			End If
		Catch
			grid_actVisa1.DataSource = Nothing
		End Try
			grid_actVisa1.DataBind()

		'設定按鈕狀態
		btn_delete.Enabled = True
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
		Try
			Dim gdi As DataGridItem = grid_Main.Items(grid_Main.SelectedIndex)

			text_acmYear.Text = get_tccVAL(gdi.FindControl("lab_acmYear"))
			text_acmNo.Text = get_tccVAL(gdi.FindControl("lab_acmYear"), True)
			text_acmMonth.Text = get_tccVAL(gdi.FindControl("lab_acmMonth"))

			text_acmWordNum.Text = get_tccVAL(gdi.FindControl("lab_acmWordNum"))
				text_acmWordNum.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWordNum"), True)
			text_acmMoney.Text = get_tccVAL(gdi.FindControl("lab_acmMoney"))

			text_acmWorkUnitNo.Text = get_tccVAL(gdi.FindControl("lab_acmWorkUnitNo"))
				text_acmWorkUnitNo.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWorkUnitNo"), True)
			text_acmWorkUserNo.Text = get_tccVAL(gdi.FindControl("lab_acmWorkUserNo"))
				text_acmWorkUserNo.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWorkUserNo"), True)
			text_acmMarkDate.Text = get_tccVAL(gdi.FindControl("lab_acmMarkDate"))

			text_acmMemo.Text = get_tccVAL(gdi.FindControl("lab_acmMemo"))

			grid_actVisa.DataSource = get_actVisa(Val(text_acmYear.Text), grid_Main.DataKeys(grid_Main.SelectedIndex))
			grid_actVisa.DataBind()

			grid_actMain1.DataSource = Nothing
			grid_actMain1.DataBind()

			grid_actVisa1.DataSource = Nothing
			grid_actVisa1.DataBind()

			btn_delete.Enabled = False

			Try
				Dim e_btn_goto1 As System.EventArgs
				btn_goto1_Click(btn_goto1, e_btn_goto1)
			Catch
			End Try
		Catch
			'設定按鈕狀態
			set_Butten(grid_Main, "DEF")
			Response.Write("<b><font color=red>Sorry, couldn't find</font></b>")
		End Try
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

	End Sub

'====================================================================================================

	Sub btn_addRow_Click(sender As Object, e As EventArgs)

	End Sub

'====================================================================================================

	Sub btn_new_Click(sender As Object, e As EventArgs)

	End Sub

	Sub btn_edit_Click(sender As Object, e As EventArgs)

	End Sub

	Sub btn_delete_Click(sender As Object, e As EventArgs)

		If grid_actVisa1.Items.Count > 0 Then
			Dim mySL As New SortedList()
			Dim errMsg As String = ""
			For i As Integer = 0 To grid_actVisa1.Items.Count - 1
				Dim gdi As DataGridItem = grid_actVisa1.Items(i)
				Dim tmpItemp As String = get_tccVAL(gdi.FindControl("DropDownList1"))
				If IsNumeric(tmpItemp) = True Then
					Try
						mySL.Add(tmpItemp, tmpItemp)
					Catch
						errMsg = "重複選取了轉入項目(" & tmpItemp & ")"
						Response.Write("<script" & ">self.alert('" & errMsg & "')</" & "script>")
						Exit Sub
					End Try
				End If
			Next i

			If mySL.Count <> grid_actVisa.Items.Count Then
				errMsg = "選取之轉入項目數量(" & mySL.Count & ")與原簽證項目數量(" & grid_actVisa.Items.Count & ")不等"
				Response.Write("<script" & ">self.alert('" & errMsg & "')</" & "script>")
				Exit Sub
			End If
		Else
			Response.Write("<script" & ">self.alert('無項目供轉入')</" & "script>")
			Exit Sub
		End If
'Exit Sub

		Dim des_acmNo As Integer = Val(get_tccVAL(grid_actMain1.Items(grid_actMain1.SelectedIndex).FindControl("lab_acmWordNum"), True))
		Dim des_acmWordNum As String = get_tccVAL(grid_actMain1.Items(grid_actMain1.SelectedIndex).FindControl("lab_acmWordNum"))

		Dim acmYear As Integer = Val(text_acmYear.Text)
		Dim acmNo As Integer = grid_Main.DataKeys(grid_Main.SelectedIndex)

		Dim queStr As String = "SELECT MAX(acmNo1) FROM [actMain1] " & _
									"WHERE (acmYear = " & acmYear & ") " & _
										"AND (acmNo = " & des_acmNo & ")"
		Dim new_acmNo1 As Integer = 0
		Try
			new_acmNo1 = Val(MySqlDbReader(queStr)) + 1
		Catch
			new_acmNo1 += 1
		End Try

		Dim updDateTime As DateTime = Now()

			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact


				If add_actMain1(acmYear, _
								acmNo, _
								des_acmNo, _
								new_acmNo1, _
								updDateTime, _
								Session("default_UserName"), _
								updDateTime, _
								"簽證轉入", _
					_Connection, _Transact) < 0 Then

					Response.Write("<script" & ">self.alert('儲存失敗：再簽主檔')</" & "script>")
				Else

				End If


			Dim k As Integer = 1
			For j As Integer = 0 To grid_actVisa1.Items.Count - 1

				Dim gdi As DataGridItem = grid_actVisa1.Items(j)
				Dim acvNo As String = get_tccVAL(gdi.FindControl("DropDownList1"))
				If IsNumeric(acvNo) = True Then

					Dim new_acvNo1 As Integer = k

					Dim _des_acmNo As Integer = Split(get_tccVAL(gdi.FindControl("lab_acvNo"), True), ",")(1)
					Dim des_acvNo As Integer = Split(get_tccVAL(gdi.FindControl("lab_acvNo"), True), ",")(2)

					If add_actVisa1(acmYear, _
									acmNo, _
									acvNo, _
									_des_acmNo, _
									des_acvNo, _
									new_acmNo1, _
									new_acvNo1, _
									des_acmNo, _
						_Connection, _Transact) < 0 Then

						Response.Write("<script" & ">self.alert('儲存失敗：再簽明細檔')</" & "script>")
					Else

					End If

					k += 1
				End If

			Next j

'==================================================

					If add_actMainProd(acmYear, _
										acmNo, _
										des_acmNo, _
										new_acmNo1, _
						_Connection, _Transact) < 0 Then

						Response.Write("<script" & ">self.alert('儲存失敗：請購主檔')</" & "script>")
					Else

					End If


					If add_actDtlProd(acmYear, _
										acmNo, _
										des_acmNo, _
										new_acmNo1, _
						_Connection, _Transact) < 0 Then

						Response.Write("<script" & ">self.alert('儲存失敗：採購明細檔')</" & "script>")
					Else

					End If

'==================================================

				'刪除原簽證資料
'				queStr = "DELETE FROM [actVisa] WHERE ([acmYear] = " & acmYear & ") AND ([acmNo] = " & acmNo & ")"
'				MySqlDbWriter(queStr, _Connection, _Command)
'				queStr = "DELETE FROM [actMain] WHERE ([acmYear] = " & acmYear & ") AND ([acmNo] = " & acmNo & ")"
'				MySqlDbWriter(queStr, _Connection, _Command)

				'刪除請購資料
'				queStr = "DELETE FROM [actDtlProd] WHERE ([acmYear] = " & acmYear & ") AND ([acmNo] = " & acmNo & ")"
'				MySqlDbWriter(queStr, _Connection, _Command)
'				queStr = "DELETE FROM [actMainProd] WHERE ([acmYear] = " & acmYear & ") AND ([acmNo] = " & acmNo & ")"
'				MySqlDbWriter(queStr, _Connection, _Command)

'==================================================

				_Transact.Commit()


				Response.Write("<script" & ">self.alert('轉換成功。\n\n新的簽證編號為：" & des_acmWordNum & "\n\n再簽編號為：" & new_acmNo1 & "')</" & "script>")
'Exit Sub

				Initialize()
				BindGrid()

				'設定按鈕狀態
				set_Butten(grid_Main, "S2D")

			Catch ex As Exception

				If Not _Transact Is Nothing Then

					Response.Write("<script" & ">self.alert('轉換失敗：" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")

					_Transact.Rollback()
				Else
					Response.Write("<script" & ">self.alert('SQL Server 不存在或拒絕存取。')</" & "script>")
				End If
			Finally
				_Connection.Close()
			End Try
	End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)

	End Sub

	Sub btn_cancel_Click(sender As Object, e As EventArgs)

	End Sub

	Sub btn_print_Click(sender As Object, e As EventArgs)

	End Sub

'====================================================================================================

	Sub text_goto_TextChanged(sender As Object, e As EventArgs)

		If btn_update.Enabled = True Then text_goto.Text = "尋找簽證編號": Exit Sub	'編輯中不得尋找

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

			text_goto.Text = "尋找簽證編號"
			set_CheckBox(grid_Main, "CheckBox1", r)
		Else
			grid_Main.CurrentPageIndex = p
			grid_Main.DataSource = dt.DefaultView
			grid_Main.DataBind()

			text_goto.Text = "尋找簽證編號"
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

	Sub btn_goto1_Click(sender As Object, e As EventArgs)
		Dim acmYear As Integer = Val(text_acmYear.Text)
		Dim S_actWordNum As String = Trim(text_acmWordNum.Text)
		Dim D_actWordNum As String = Nothing
		If CStr(text_goto1.Text).IndexOf("尋找再簽編號") = -1 AndAlso Trim(text_goto1.Text) <> "" Then
			D_actWordNum = Trim(text_goto1.Text)
		End If

		Dim ds As DataSet = chk_actMain1(acmYear, S_actWordNum, D_actWordNum)
'		Dim dt As DataTable = chk_actMain1(acmYear, S_actWordNum, D_actWordNum)
'Response.Write(ds.Tables(0).Rows.Count)
'Response.Write(dt.Rows.Count)
'Response.End()
		If ds.Tables(0).Rows.Count > 0 Then
'		If dt.Rows.Count > 0 Then
			grid_actMain1.DataSource = ds
			grid_actMain1.DataBind()
		End If
		Try
			grid_actMain1.SelectedIndex = -1
		Catch
		End Try

	End Sub

'====================================================================================================

'.HR1_width { width: expression((700 + 78) + "px"); }
'.HR1_noWidth { width: expression((document.body.clientWidth - 22) + "px"); }
'.S1_width { width: 790px; }
'.S1_noWidth { width: auto; }
'.S2_width { border-collapse: collapse; TABLE-LAYOUT: fixed; width: 790px; }
'.S2_noWidth { border-collapse: collapse; TABLE-LAYOUT: fixed; width: auto; }

</script>
<html>
<head>
<title>簽證轉簽證作業</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="calendarStyle.css" type="text/css" rel="stylesheet" />
<style>

/* 可摺疊標題 */
.sFoldTitle { background-color: #6699FF; CURSOR: hand; }
.sFoldTitleFont { font-size:10pt; color:#FFFFFF; padding-top:4px; padding-left:4px; }
/* DataGrid寬高 */
.DIV1_width { width: 590px; height: 197px; overflow: auto; border-style: groove; border-width: 1px; }
.DIV1_noWidth { width: auto; height: auto; overflow-x: scroll; border-style: groove; border-width: 1px; }

.DIV2_width { width: 590px; height: auto; overflow: hidden; border-style: groove; border-width: 1px; }

.DIV1_FreezingCol{
	LEFT: expression(document.getElementById("div_grid_actVisa").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 0px solid #FFFFFF;
}
.DIV1_FreezingCol2{
	LEFT: expression(document.getElementById("div_grid_actVisa").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 1px solid #FFFFFF;
}

.removeBorder	{ background-color: transparent; border: none; padding-left: 2px; padding-right: 3px }
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
	SetCookie(GetPageName() + ":div_grid_actVisa", div_grid_actVisa.className);	//縮放表格
	SetCookie(GetPageName() + ":FoldTitle_11", FoldTitle_11.style.display);	//折疊項目
	SetCookie(GetPageName() + ":div_grid_actMain1", div_grid_actMain1.className);	//縮放表格
}

function get_cookies(){
	SetFold(GetCookie(GetPageName() + ":FoldTitle_10"), "FoldTitle_10", "img_FoldTitle_10");	//折疊項目
	SetDiv(GetCookie(GetPageName() + ":div_grid_actVisa"), "div_grid_actVisa", "img1");	//縮放表格
	SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11");	//折疊項目
	SetDiv(GetCookie(GetPageName() + ":div_grid_actMain1"), "div_grid_actMain1", "img11");	//縮放表格
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
									<td width="100" align="right">簽證年度</td>
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
									<td width="100" align="right">簽證編號</td>
									<td width="100"><asp:TextBox id="text_acmWordNum" runat="server" style="TEXT-ALIGN: center" BackColor="Transparent" Width="90px" ReadOnly="True"></asp:TextBox></td>
									<td width="100" align="right">簽證金額</td>
									<td width="100"><asp:TextBox id="text_acmMoney" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">執行單位</td>
									<td width="100"><asp:TextBox id="text_acmWorkUnitNo" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">承辦人員</td>
									<td width="100"><asp:TextBox id="text_acmWorkUserNo" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">簽證日期</td>
									<td width="100"><asp:TextBox id="text_acmMarkDate" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="75px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right" valign="top">簽證事由</td>
									<td width="500" colspan="5"><asp:TextBox id="text_acmMemo" runat="server" style="TEXT-ALIGN: left; background-color: #DADEE9; OVERFLOW-Y: visible" TextMode="MultiLine" Width="472px" ReadOnly="True"></asp:TextBox></td>
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
											<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_10')">預算簽證項目</td>
											<td width="1%" align="right"><img id="img_FoldTitle_10" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_10', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr id="FoldTitle_10" style="display: block" onpropertychange="sync_title_img(this)">
									<td style="padding: 5px">

									<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr>
											<td width="100" align="right"><img id="img1" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img1.fireEvent("onclick")'>簽證項目</span></td>
											<td width="490" align="right">　</td>
										</tr>
									</table>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
											<div id="div_grid_actVisa" class="DIV1_width" alt="DIV1">
											<asp:DataGrid id="grid_actVisa" runat="server" style="MARGIN-LEFT: -1px"
													CellPadding="3" CellSpacing="1" GridLines="None"
													Borderstyle="None" BackColor="White"
													AutoGenerateColumns="False"
													OnItemCreated="grid_actVisa_ItemCreated"
													OnItemDataBound="grid_actVisa_DataBound"
													Width="100%">
												<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
												<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
												<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
												<Columns>
													<asp:TemplateColumn>
														<ItemTemplate>
															<asp:Label id="lab_acvNo" runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" Text='<%# Container.ItemIndex+1 %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.acmNo") & "," & DataBinder.Eval(Container, "DataItem.acvNo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="年度">
														<ItemTemplate>
															<asp:TextBox id="text_acvBgtYear" runat="server" style="TEXT-ALIGN: center" MaxLength="2" Width="30px" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtYear") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="月份">
														<ItemTemplate>
															<asp:TextBox id="text_acvBgtMonth" runat="server" style="TEXT-ALIGN: center" MaxLength="2" Width="30px" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtMonth") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="門別" Visible="True">
														<HeaderStyle wrap="False" />
														<ItemStyle wrap="False" />
														<ItemTemplate>
															<asp:Label id="lab_acvAccKind" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvAccKind") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="預算來源" Visible="True">
														<HeaderStyle wrap="False" />
														<ItemStyle wrap="False" />
														<ItemTemplate>
															<asp:Label id="lab_acvBgtSourceCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvBgtSourceCode") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="控帳業務" Visible="True">
														<HeaderStyle wrap="False" />
														<ItemStyle wrap="False" />
														<ItemTemplate>
															<asp:Label id="lab_acvBizCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BizName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvBizCode") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="計畫科目">
														<ItemStyle horizontalalign="Right"></ItemStyle>
														<ItemTemplate>
															<asp:DropDownList id="ddl_acvPlanCode" runat="server" style="background-color: #FFFFE0" CssClass='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvPlanCode") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="用途別科目">
														<ItemTemplate>
															<asp:DropDownList id="ddl_acvOutlayCode" runat="server" style="background-color: #FFFFE0" CssClass='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="金額">
														<ItemTemplate>
															<asp:TextBox id="text_acvMoney" style="TEXT-ALIGN: right; background-color: #E0FFFF" MaxLength="9" Width="75px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,#}") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="用途說明">
														<ItemTemplate>
															<asp:TextBox id="text_acvMemo" style="background-color: #FFFFE0" runat="server" MaxLength="255" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="移除" Visible="False">
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
									<table cellpadding="3" style="display: none; border-collapse: collapse; margin-bottom: -2px; width: 100%" border="0">
										<tr>
											<td nowrap>
												<asp:Button id="btn_addRow" runat="server" Width="75px" Height="22px" Text="增加列數" onclick="btn_addRow_Click" CausesValidation="False"></asp:Button>
											</td>
											<td align="right">　</td>
										</tr>
									</table>
									<!-- Insert 項目內容 here -->
									</td>
								</tr>
							</table>
							<!-- 折疊項目(1)↑ -->

							<!-- ↓折疊項目(2) -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
								<tr>
									<td height="20" class="sFoldTitle">
									<table cellpadding="0" style="border-collapse: collapse" border="0">
										<tr>
											<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_11')">可選再簽項目</td>
											<td width="1%" align="right"><img id="img_FoldTitle_11" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_11', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr id="FoldTitle_11" style="display: block" onpropertychange="sync_title_img(this)">
									<td style="padding: 5px">

									<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed; margin-top: -4" border="0">
										<tr>
											<td width="100" align="right"><img id="img11" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="display: none; margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img11.fireEvent("onclick")'>再簽項目</span></td>
											<td width="490" align="right"><asp:TextBox id="text_goto1" runat="server" style="TEXT-ALIGN: center; IME-MODE: disabled" Width="95px" AutoPostBack="True" OnTextChanged="btn_goto1_Click" onkeypress="if(event.keyCode==13){this.blur();return false;} else return check_Num();" onblur="if(this.value==''){this.value='尋找再簽編號'};" onclick='this.value=""'>尋找再簽編號</asp:TextBox><asp:Button id="btn_goto1" runat="server" Height="22px" Width="16px" Font-Names="Webdings" Font-Size="8pt" Text="s" CausesValidation="False" Enabled="True" onclick="btn_goto1_Click"></asp:Button></td>
										</tr>
									</table>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
											<div id="div_grid_actMain1" class="DIV1_noWidth" alt="DIV11">
											<asp:DataGrid id="grid_actMain1" runat="server"
													DataKeyField="acmNo"
													CellSpacing="1" CellPadding="3" GridLines="None"
													BorderColor="White" BackColor="White"
													AutoGenerateColumns="False"
													AllowPaging="False"
													Width="100%">
												<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
												<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
												<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
												<SelectedItemStyle font-bold="True" backcolor="DarkOrange"></SelectedItemStyle>
												<Columns>
													<asp:TemplateColumn>
														<ItemStyle horizontalalign="Center"></ItemStyle>
														<ItemTemplate>
															<asp:CheckBox id="CheckBox1" runat="server" CssClass="<%# Container.ItemIndex %>" OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="True" myKey='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.DES_acmNo")'></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="年度">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmYear" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmNo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="月份" Visible="True">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmMonth" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.DES_acmMonth") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmDay") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="類別" Visible="True">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmKidNum" runat="server" text='<%# Left(DataBinder.Eval(Container, "DataItem.DES_acmKidNum"),1) %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmKidNum") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="簽證編號">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmWordNum" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.DES_acmWordNum") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmNo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="執行單位">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle wrap="False"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmWorkUnitNo" runat="server" text='<%# get_UnitName(DataBinder.Eval(Container, "DataItem.DES_acmWorkUnitNo") & "") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmWorkUnitNo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="承辦人員">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle wrap="False"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmWorkUserNo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.DES_acmWorkUserNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmWorkUserNo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="簽證金額">
														<HeaderStyle wrap="False"></HeaderStyle>
														<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Right"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="lab_acmMoney" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.DES_acmMoney", "{0:#,0}") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.DES_acmMoney", "{0:#,#}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="簽證事由">
														<ItemTemplate>
															<asp:Label id="lab_acmMemo" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.DES_acmMemo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>

												</Columns>
												<PagerStyle horizontalalign="Center" forecolor="DarkOrange" backcolor="#666668" mode="NumericPages" position="Bottom"></PagerStyle>
											</asp:DataGrid>
											</div>
											</td>
										</tr>
										<tr>
											<td>　
											<div id="div_grid_actVisa1" class="DIV1_noWidth" alt="DIV12">
											<asp:DataGrid id="grid_actVisa1" runat="server" style="MARGIN-LEFT: -1px"
													CellPadding="3" CellSpacing="1" GridLines="None"
													Borderstyle="None" BackColor="White"
													AutoGenerateColumns="False"
													OnItemDataBound="grid_actVisa1_DataBound"
													Width="100%">
												<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
												<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
												<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
												<Columns>
													<asp:TemplateColumn>
														<ItemTemplate>
															<asp:Label id="lab_acvNo" runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" Text='<%# Container.ItemIndex+1 %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.acmNo") & "," & DataBinder.Eval(Container, "DataItem.acvNo") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="年度">
														<ItemTemplate>
															<asp:TextBox id="text_acvBgtYear" runat="server" style="TEXT-ALIGN: center" MaxLength="2" Width="30px" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtYear") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="月份">
														<ItemTemplate>
															<asp:TextBox id="text_acvBgtMonth" runat="server" style="TEXT-ALIGN: center" MaxLength="2" Width="30px" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtMonth") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="門別" Visible="True">
														<HeaderStyle wrap="False" />
														<ItemStyle wrap="False" />
														<ItemTemplate>
															<asp:Label id="lab_acvAccKind" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvAccKind") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="預算來源" Visible="True">
														<HeaderStyle wrap="False" />
														<ItemStyle wrap="False" />
														<ItemTemplate>
															<asp:Label id="lab_acvBgtSourceCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvBgtSourceCode") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="控帳業務" Visible="True">
														<HeaderStyle wrap="False" />
														<ItemStyle wrap="False" />
														<ItemTemplate>
															<asp:Label id="lab_acvBizCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BizName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvBizCode") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="計畫科目">
														<ItemStyle horizontalalign="Right"></ItemStyle>
														<ItemTemplate>
															<asp:DropDownList id="ddl_acvPlanCode" runat="server" style="background-color: #FFFFE0" CssClass='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvPlanCode") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="用途別科目">
														<ItemTemplate>
															<asp:DropDownList id="ddl_acvOutlayCode" runat="server" style="background-color: #FFFFE0" CssClass='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="可用金額">
														<ItemTemplate>
															<asp:TextBox id="text_acvMoney" style="TEXT-ALIGN: right; background-color: #FFC0CB" MaxLength="9" Width="75px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,#}") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="對應項目∕金額">
														<HeaderStyle wrap="False" forecolor="#FF8C00"></HeaderStyle>
														<ItemTemplate>
															<asp:DropDownList id="DropDownList1" runat="server" style="background-color: #E0FFFF" CssClass='<%# DataBinder.Eval(Container, "DataItem.待選項目") %>'>
																<asp:ListItem Value="">無</asp:ListItem>
															</asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="用途說明">
														<ItemTemplate>
															<asp:TextBox id="text_acvMemo" runat="server" style="background-color: #FFFFE0" Width="100px" MaxLength="255" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="移除" Visible="False">
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
												<asp:Button id="btn_delete" runat="server" Text="簽證轉至再簽" Width="100px" Height="22px" onclick="btn_delete_Click" CausesValidation="False" onpropertychange="text_goto1.disable=this.disable;btn_goto1.disable=this.disable"></asp:Button>
											</td>
											<td align="right">　</td>
										</tr>
									</table>
									<!-- Insert 項目內容 here -->
									</td>
								</tr>
							</table>
							<!-- 折疊項目(2)↑ -->

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
							<td style="display: none"><asp:Button id="btn_edit" runat="server" Text="編輯" Width="50px" Height="22px" onclick="btn_edit_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_update" runat="server" Text="儲存" Width="50px" Height="22px" onclick="btn_update_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_cancel" runat="server" Text="取消" Width="50px" Height="22px" onclick="btn_cancel_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_print" runat="server" Text="列印" Width="50px" Height="22px" onclick="btn_print_Click" CausesValidation="False"></asp:Button></td>
							<td><asp:TextBox id="text_goto" runat="server" style="TEXT-ALIGN: center; IME-MODE: disabled" Width="95px" AutoPostBack="True" OnTextChanged="text_goto_TextChanged" onkeypress="if(event.keyCode==13){this.blur();return false;} else return check_Num();" onblur="if(this.value==''){this.value='尋找簽證編號'};" onclick='this.value=""'>尋找簽證編號</asp:TextBox><input type="button" value="s" name="btn_goto" style="font-family: Webdings; width: 16; height: 22; font-size:8pt"></td>
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
							<asp:TemplateColumn HeaderText="月份" Visible="True">
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
							<asp:TemplateColumn HeaderText="類別" Visible="True">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmKidNum" runat="server" text='<%# Left(DataBinder.Eval(Container, "DataItem.acmKidNum") & "",1) %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmKidNum") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="簽證編號" SortExpression="acmWordNum">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmWordNum" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
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
							<asp:TemplateColumn HeaderText="簽證金額" SortExpression="acmMoney">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Right"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmMoney" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmMoney", "{0:#,0}") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmMoney", "{0:#,#}") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="簽證事由">
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

							<asp:TemplateColumn HeaderText="a" SortExpression="actVisaCOUNT" Visible="True">
								<HeaderStyle font-size="X-Small" font-names="Webdings" wrap="False" horizontalalign="Center"></HeaderStyle>
								<ItemTemplate>
									<asp:Label id="lab_actVisaCOUNT" runat="server" forecolor="Red" Text='<%# DataBinder.Eval(Container, "DataItem.actVisaCOUNT") & "" %>'></asp:Label>
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
