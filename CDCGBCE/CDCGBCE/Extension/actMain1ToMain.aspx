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
				"SELECT " & _
					"M1.acmYear, M1.acmNo, M1.acmNo1, M.acmKidNum, " & _
					"M1.acmMonth, M1.acmDay, " & _
					"ISNULL(ISNULL(M.acmTopWordNum, M.acmSourWordNum), M.acmWordNum) AS acmWordNum, " & _
					"M1.acmMarkDate, " & _
					"ISNULL(DN.dptName, M1.acmWorkUnitNo) AS acmWorkUnitName, " & _
					"M1.acmWorkUnitNo, M1.acmWorkUserNo, " & _
					"M1.acmMoney, M1.acmMemo, " & _
					"ISNULL(M1.acmModifyUser, M1.acmCreateUser) AS acmModifyUser, " & _
					"ISNULL(M1.acmModifyDTime, M1.acmCreateDTime) AS acmModifyDTime, " & _
					"(SELECT COUNT(*) FROM actVisa1 V1 WHERE (V1.acmYear = M1.acmYear) AND (ISNULL(V1.acmNoPrv, V1.acmNo) = M1.acmNo) AND (V1.acmNo1 = M1.acmNo1)) AS actVisa1Count " & _
				"FROM [actMain1] M1 " & _
					"INNER JOIN [actMain] M ON M1.acmYear = M.acmYear AND M1.acmNo = M.acmNo " & _
					"LEFT OUTER JOIN codDepartName DN ON M1.acmWorkUnitNo = DN.dptCode " & _
				"WHERE (M1.acmYear = @acmYear) " & _
					"AND ((SELECT COUNT(*) FROM [actPay] P WHERE (P.acmYear = M1.acmYear) AND (P.acmNo = M1.acmNo) AND (P.acmNo1 = M1.acmNo1)) = 0) " & _
					"AND ((SELECT COUNT(*) FROM actVisa1 V1 WHERE (V1.acmYear = M1.acmYear) AND (ISNULL(V1.acmNoPrv, V1.acmNo) = M1.acmNo) AND (V1.acmNo1 = M1.acmNo1)) > 0) " & _
					"AND (ISNULL(M.acmBgtYear, M.acmYear) = M1.acmYear) "
'					"AND (ISNULL(M1.acmPassFlag,'0') = '0') "

		If acmMonth <> -1 Then
			queryString & = "AND (M1.acmMonth = @acmMonth) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (M.acmKidNum = @acmKidNum) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (M1.acmWorkUnitNo = @acmWorkUnitNo) "
		End If

		If acmKidNum <> Nothing Then
			queryString & = "AND (M1.acmWorkUserNo = @acmWorkUserNo) "
		End If

'			queryString & = "AND (M1.acmMoney > 0) "

			queryString &= "ORDER BY M1.acmYear, M1.acmNo, M1.acmNo1 DESC"
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
	Function get_actVisa1(ByVal acmYear As Integer, ByVal acmNo As Integer, ByVal acmNo1 As Integer) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "" & _
				"SELECT " & _
					"V1.acmYear, V1.acmNo, V1.acvNo, V1.acmNo1, V1.acvNo1, " & _
					"ISNULL(ISNULL(V1.acvBgtYear, V.acvBgtYear), V1.acmYear) AS acvBgtYear, " & _
					"ISNULL(V1.acvBgtMonth, V.acvBgtMonth) AS acvBgtMonth, " & _
					"ISNULL(V1.acvPlanCode, V.acvPlanCode) AS acvPlanCode, " & _
					"ISNULL(codPlanCode.plnPlanName, ISNULL(V1.acvPlanCode, V.acvPlanCode)) AS plnPlanName, " & _
					"ISNULL(V1.acvOutlayYear, V.acvOutlayYear) AS acvOutlayYear, " & _
					"ISNULL(V1.acvOutlayCode, V.acvOutlayCode) AS acvOutlayCode, " & _
					"ISNULL(codOutlayCode.oulOutlayName, ISNULL(V1.acvOutlayCode, V.acvOutlayCode)) AS oulOutlayName, " & _
					"ISNULL(V1.acvBgtSourceCode, V.acvBgtSourceCode) AS acvBgtSourceCode, " & _
					"BO.orgName, " & _
					"ISNULL(V1.acvAccKind, V.acvAccKind) AS acvAccKind, " & _
					"AKN.accKindName, " & _
					"ISNULL(V1.acvBizCode, V.acvBizCode) AS acvBizCode, " & _
					"BN.BizName, " & _
					"ISNULL(V1.acvPrePayFlag, V.acvPrePayFlag) AS acvPrePayFlag, " & _
					"V1.acvMoney, " & _
					"ISNULL(V1.acvMemo, V.acvMemo) AS acvMemo " & _
				"FROM [actVisa1] V1 " & _
					"INNER JOIN [actVisa] V ON V1.acmYear = V.acmYear AND V1.acmNo = V.acmNo AND V1.acvNo = V.acvNo " & _
					"LEFT OUTER JOIN codAccKindName AKN ON ISNULL(V1.acvAccKind, V.acvAccKind) = AKN.accKind " & _
					"LEFT OUTER JOIN codBgtOrigin BO ON ISNULL(V1.acvBgtSourceCode, V.acvBgtSourceCode) = BO.orgCode " & _
					"LEFT OUTER JOIN codBizName BN ON ISNULL(V1.acvBizCode, V.acvBizCode) = BN.BizCode AND ISNULL(V1.acvOutlayYear, V.acvOutlayYear) = BN.codCodeVer " & _
					"LEFT OUTER JOIN codPlanCode ON ISNULL(V1.acvOutlayYear, V.acvOutlayYear) = codPlanCode.codCodeVer AND ISNULL(V1.acvPlanCode, V.acvPlanCode) = codPlanCode.plnPlanCode " & _
					"LEFT OUTER JOIN codOutlayCode ON ISNULL(V1.acvOutlayYear, V.acvOutlayYear) = codOutlayCode.codCodeVer AND ISNULL(V1.acvOutlayCode, V.acvOutlayCode) = codOutlayCode.oulOutlayCode " & _
				"WHERE (V1.[acmYear] = @acmYear) AND (ISNULL(V1.acmNoPrv, V1.[acmNo]) = @acmNo) AND (V1.[acmNo1] = @acmNo1) "
'Response.Write(queryString.Replace("@acmYear", acmYear).Replace("@acmNo1", acmNo1).Replace("@acmNo", acmNo))
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

'====================================================================================================

	'動支主檔
	Function add_actMain(ByVal acmYear As Integer, _
						ByVal acmNo As Integer, _
						ByVal acmNo1 As Integer, _
					ByVal acmNo_NEW As Integer, _
					ByVal acmWordNum_NEW As String, _
						ByVal acmCreateDTime As Object, _
						ByVal acmCreateUser As String, _
						ByVal acmModifyDTime As Object, _
						ByVal acmModifyUser As String, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actMain] " & _
									"(" & _
										"acmYear, " & _
										"acmNo, " & _
										"acmKidNum, " & _
										"acmMonth, " & _
										"acmDay, " & _
										"acmWordNum, " & _
										"acmWordNumSubNo, " & _
										"acmMarkDate, " & _
										"acmTeaCode, " & _
										"acmMarkUnitNo, " & _
										"acmMarkUnitSubNo, " & _
										"acmMarkUserNo, " & _
										"acmWorkUnitNo, " & _
										"acmWorkUnitSubNo, " & _
										"acmWorkUserNo, " & _
										"acmWorkRankNo, " & _
										"acmWorkLevelNo, " & _
										"acmWorkLevelName, " & _
										"acmWorkRankKind, " & _
										"acmWorkLevelKind, " & _
										"acmWorkMapNo, " & _
										"acmMoney, " & _
										"acmMemo, " & _
										"acmProdLevelKind, acmProdVisaKind, acmProdKind, acmPayName, " & _
										"acmPassFlag, " & _
										"acmPassDate, " & _
										"acmPassDTime, " & _
										"acmPassUser, " & _
										"acmFinalKind, " & _
										"acmFinalDate, " & _
										"acmPassMoney, " & _
										"acmPassMemo, " & _
										"acmDate, " & _
										"acmUnitPassFlag, " & _
										"acmUnitPassDate, " & _
										"acmUnitPassDTime, " & _
										"acmUnitPassUser, " & _
										"acmUnitPassMoney, " & _
										"acmUnitPassMemo, " & _
										"acmCreateDTime, " & _
										"acmCreateUser, " & _
										"acmModifyDTime, " & _
										"acmModifyUser" & _
									") " & _
									"SELECT " & _
										"M1.acmYear, " & _
										"@acmNo_NEW, " & _
										"ISNULL(M1.acmKidNum, M.acmKidNum) AS acmKidNum, " & _
										"M1.acmMonth, " & _
										"M1.acmDay, " & _
										"@acmWordNum_NEW, " & _
										"0, " & _
										"M1.acmMarkDate, " & _
										"M1.acmTeaCode, " & _
										"M1.acmMarkUnitNo, " & _
										"M1.acmMarkUnitSubNo, " & _
										"M1.acmMarkUserNo, " & _
										"M1.acmWorkUnitNo, " & _
										"M1.acmWorkUnitSubNo, " & _
										"M1.acmWorkUserNo, " & _
										"M1.acmWorkRankNo, " & _
										"M1.acmWorkLevelNo, " & _
										"M1.acmWorkLevelName, " & _
										"M1.acmWorkRankKind, " & _
										"M1.acmWorkLevelKind, " & _
										"M1.acmWorkMapNo, " & _
										"M1.acmMoney, " & _
										"M1.acmMemo, " & _
										"M1.acmProdLevelKind, M1.acmProdVisaKind, M1.acmProdKind, M1.acmPayName, " & _
										"M1.acmPassFlag, " & _
										"M1.acmPassDate, " & _
										"M1.acmPassDTime, " & _
										"M1.acmPassUser, " & _
										"M1.acmFinalKind, " & _
										"M1.acmFinalDate, " & _
										"M1.acmPassMoney, " & _
										"M1.acmPassMemo, " & _
										"M1.acmDate, " & _
										"M1.acmUnitPassFlag, " & _
										"M1.acmUnitPassDate, " & _
										"M1.acmUnitPassDTime, " & _
										"M1.acmUnitPassUser, " & _
										"M.acmUnitPassMoney, " & _
										"M.acmUnitPassMemo, " & _
										"@acmCreateDTime, " & _
										"@acmCreateUser, " & _
										"@acmModifyDTime, " & _
										"@acmModifyUser " & _
									"FROM [actMain1] M1 " & _
										"INNER JOIN [actMain] M ON (M1.acmYear = M.acmYear) AND (M1.acmNo = M.acmNo) " & _
									"WHERE (M1.acmYear = @acmYear) AND (M1.acmNo = @acmNo) AND (M1.acmNo1 = @acmNo1)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_NEW", acmNo_NEW))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmWordNum_NEW", acmWordNum_NEW))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@acmCreateDTime", acmCreateDTime))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmCreateUser", acmCreateUser))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@acmModifyDTime", acmModifyDTime))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@acmModifyUser", acmModifyUser))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'動支明細檔
	Function add_actVisa( _
				ByVal acmYear As Integer, _
				ByVal acmNo As Integer, _
				ByVal acmNo1 As Integer, _
				ByVal acmNo_NEW As Integer, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "INSERT INTO [actVisa] " & _
									"(" & _
										"acmYear, " & _
										"acmNo, " & _
										"acvNo, " & _
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
										"inspect" & _
									") " & _
									"SELECT " & _
										"V1.acmYear, " & _
										"@acmNo_NEW, " & _
										"V1.acmNo + V1.acvNo * 100 + V1.acvNo1, " & _
										"ISNULL(V1.acvBgtYear, V.acvBgtYear) AS acvBgtYear, " & _
										"ISNULL(V1.acvBgtMonth, V.acvBgtMonth) AS acvBgtMonth, " & _
										"ISNULL(V1.acvPlanCode, V.acvPlanCode) AS acvPlanCode, " & _
										"ISNULL(V1.acvOutlayYear, V.acvOutlayYear) AS acvOutlayYear, " & _
										"ISNULL(V1.acvOutlayCode, V.acvOutlayCode) AS acvOutlayCode, " & _
										"ISNULL(V1.acvBgtSourceCode, V.acvBgtSourceCode) AS acvBgtSourceCode, " & _
										"ISNULL(V1.acvAccKind, V.acvAccKind) AS acvAccKind, " & _
										"ISNULL(V1.acvBizCode, V.acvBizCode) AS acvBizCode, " & _
										"ISNULL(V1.acvPrePayFlag, V.acvPrePayFlag) AS acvPrePayFlag, " & _
										"V1.acvMoney, " & _
										"ISNULL(V1.acvMemo, V.acvMemo) AS acvMemo, " & _
										"ISNULL(V1.inspect, V.inspect) AS inspect " & _
									"FROM [actVisa1] V1 " & _
										"INNER JOIN [actVisa] V ON V1.acmYear = V.acmYear AND V1.acmNo = V.acmNo AND V1.acvNo = V.acvNo " & _
									"WHERE (V1.acmYear = @acmYear) AND (ISNULL(V1.acmNoPrv, V1.acmNo) = @acmNo) AND (V1.acmNo1 = @acmNo1)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_NEW", acmNo_NEW))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'動支明細檔
	Function get_actVisa1_for_INSERT( _
				ByVal acmYear As Integer, _
				ByVal acmNo As Integer, _
				ByVal acmNo1 As Integer, _
				ByVal acmNo_NEW As Integer, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As System.Data.DataSet

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT " & _
										"V1.acmYear, " & _
										"@acmNo_NEW AS acmNo, " & _
										"V1.acmNo + V1.acvNo * 100 + V1.acvNo1 AS acvNo, " & _
										"ISNULL(V1.acvBgtYear, V.acvBgtYear) AS acvBgtYear, " & _
										"ISNULL(V1.acvBgtMonth, V.acvBgtMonth) AS acvBgtMonth, " & _
										"ISNULL(V1.acvPlanCode, V.acvPlanCode) AS acvPlanCode, " & _
										"ISNULL(V1.acvOutlayYear, V.acvOutlayYear) AS acvOutlayYear, " & _
										"ISNULL(V1.acvOutlayCode, V.acvOutlayCode) AS acvOutlayCode, " & _
										"ISNULL(V1.acvBgtSourceCode, V.acvBgtSourceCode) AS acvBgtSourceCode, " & _
										"ISNULL(V1.acvAccKind, V.acvAccKind) AS acvAccKind, " & _
										"ISNULL(V1.acvBizCode, V.acvBizCode) AS acvBizCode, " & _
										"ISNULL(V1.acvPrePayFlag, V.acvPrePayFlag) AS acvPrePayFlag, " & _
										"V1.acvMoney, " & _
										"ISNULL(V1.acvMemo, V.acvMemo) AS acvMemo, " & _
										"ISNULL(V1.inspect, V.inspect) AS inspect " & _
									"FROM [actVisa1] V1 " & _
										"INNER JOIN [actVisa] V ON V1.acmYear = V.acmYear AND V1.acmNo = V.acmNo AND V1.acvNo = V.acvNo " & _
									"WHERE (V1.acmYear = @acmYear) AND (ISNULL(V1.acmNoPrv, V1.acmNo) = @acmNo) AND (V1.acmNo1 = @acmNo1) " & _
									"ORDER BY ISNULL(V1.acmNoPrv, V1.acmNo), V1.acvNo, V1.acvNo1"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_NEW", acmNo_NEW))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
	End Function


	'請購主檔
	Function add_actMainProd(ByVal acmYear As Integer, _
						ByVal acmNo As Integer, _
						ByVal acmNo1 As Integer, _
					ByVal acmNo_NEW As Integer, _
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
										"@acmNo_NEW, " & _
										"NULL, " & _
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
									"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo) AND (acmNo1 = @acmNo1) "

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_NEW", acmNo_NEW))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

	'採購明細檔
	Function add_actDtlProd(ByVal acmYear As Integer, _
						ByVal acmNo As Integer, _
						ByVal acmNo1 As Integer, _
					ByVal acmNo_NEW As Integer, _
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
										"@acmNo_NEW, " & _
										"NULL, " & _
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
									"WHERE (acmYear = @acmYear) AND (acmNo = @acmNo) AND (acmNo1 = @acmNo1) "

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection
			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo_NEW", acmNo_NEW))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function


	Function get_actVisa(ByVal acmYear As Integer, ByVal acmNo As Integer, _
			myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As System.Data.DataSet
'		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
		Dim dbConnection As System.Data.IDbConnection = myConnection

		Dim queryString As String = "SELECT [acmYear], [acmNo], [acvNo] " & _
									"FROM [actVisa] " & _
									"WHERE ([acmYear] = @acmYear) AND ([acmNo] = @acmNo) " & _
									"ORDER BY [acvNo]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Transaction = myTransaction

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet
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

	Sub grid_actVisa1_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Header Or e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
			e.Item.Cells(0).CssClass = "DIV1_FreezingCol"
			e.Item.Cells(1).CssClass = "DIV1_FreezingCol"
			e.Item.Cells(2).CssClass = "DIV1_FreezingCol2"
		End If
	End Sub

	Sub grid_actVisa1_DataBound(sender As Object, e As DataGridItemEventArgs)
		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

			Dim ddl_acvPlanCode As DropDownList = e.Item.FindControl("ddl_acvPlanCode")
			ForceSelect(ddl_acvPlanCode, ddl_acvPlanCode.CssClass, DataBinder.Eval(e.Item.DataItem, "plnPlanName") & "", False)

			Dim ddl_acvOutlayCode As DropDownList = e.Item.FindControl("ddl_acvOutlayCode")
			ForceSelect(ddl_acvOutlayCode, ddl_acvOutlayCode.CssClass, DataBinder.Eval(e.Item.DataItem, "oulOutlayName") & "", False)
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
			text_acmMoney.Text = get_tccVAL(gdi.FindControl("lab_acmMoney"))

			text_acmWorkUnitNo.Text = get_tccVAL(gdi.FindControl("lab_acmWorkUnitNo"))
				text_acmWorkUnitNo.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWorkUnitNo"), True)
			text_acmWorkUserNo.Text = get_tccVAL(gdi.FindControl("lab_acmWorkUserNo"))
				text_acmWorkUserNo.ToolTip = get_tccVAL(gdi.FindControl("lab_acmWorkUserNo"), True)
			text_acmMarkDate.Text = get_tccVAL(gdi.FindControl("lab_acmMarkDate"))

			text_acmMemo.Text = get_tccVAL(gdi.FindControl("lab_acmMemo"))

			grid_actVisa1.DataSource = get_actVisa1(Val(text_acmYear.Text), grid_Main.DataKeys(grid_Main.SelectedIndex), get_tccVAL(gdi.FindControl("lab_acmNo1")))
			grid_actVisa1.DataBind()

			'由資料判斷是否改變預設按鈕狀態
			If grid_actVisa1.Items.Count = 0 Then
				btn_delete.Enabled = False
				btn_edit.Text = "新增"
			Else
				btn_edit.Text = "編輯"
			End If
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

'		System.Threading.Thread.Sleep(1000)
'		Initialize()
'		'設定按鈕狀態
'		set_Butten(grid_Main, "S2D")
'		Exit Sub

		Dim tmp_acmNo As Integer = ToolsFun.MsDbFun.GetDbTableYearInc("actMain", "acmYear", Session("default_Year"), "acmNo", 1)
		Dim tmp_acmWordNum As String = Val(MySqlDbReader("SELECT ISNULL(MAX([acmWordNum]), '" & Session("default_Year") & "00000') FROM [actMain] WHERE (ISNULL(acmBgtKind, '0') = '0') AND ([acmYear] = " & Session("default_Year") & ")")) + 1
			tmp_acmWordNum = Right("00000000" & tmp_acmWordNum, 8)

		Dim acmYear As Integer = Val(text_acmYear.Text)
		Dim acmNo As Integer = grid_Main.DataKeys(grid_Main.SelectedIndex)
		Dim acmNo1 As Integer = Val(get_tccVAL(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_acmNo1")))
		Dim acmKidNum As String = get_tccVAL(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_acmKidNum"))
		Dim acmMarkDate As String = EngDate(text_acmMarkDate.Text)
		Dim old_acmWordNum As String = text_acmWordNum.Text

		Dim updDateTime As DateTime = Now()

			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact


				If add_actMain(acmYear, acmNo, acmNo1, _
								tmp_acmNo, _
								tmp_acmWordNum, _
								updDateTime, _
								Session("default_UserName"), _
								updDateTime, _
								"再簽轉入", _
					_Connection, _Transact) < 0 Then

					Response.Write("<script" & ">self.alert('儲存失敗：動支主檔')</" & "script>")
				Else

				End If

	'==================================================

		Dim ds As DataSet = get_actVisa1_for_INSERT(acmYear, acmNo, acmNo1, tmp_acmNo, _Connection, _Transact)
		If ds.Tables(0).Rows.Count > 0 Then

			Dim updStr As String = ""
			For i As Integer = 0 To ds.Tables(0).Rows.Count - 1

				updStr &= "INSERT INTO [actVisa] " & _
							"(" & _
								"acmYear, " & _
								"acmNo, " & _
								"acvNo, " & _
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
								"inspect" & _
							") " & _
							"VALUES " & _
							"(" & _
								ds.Tables(0).Rows(i)("acmYear") & ", " & _
								ds.Tables(0).Rows(i)("acmNo") & ", " & _
								i + 1 & ", " & _
								ds.Tables(0).Rows(i)("acvBgtYear") & ", " & _
								ds.Tables(0).Rows(i)("acvBgtMonth") & ", " & _
								"'" & ds.Tables(0).Rows(i)("acvPlanCode") & "', " & _
								ds.Tables(0).Rows(i)("acvOutlayYear") & ", " & _
								"'" & ds.Tables(0).Rows(i)("acvOutlayCode") & "', " & _
								"'" & ds.Tables(0).Rows(i)("acvBgtSourceCode") & "', " & _
								"'" & ds.Tables(0).Rows(i)("acvAccKind") & "', " & _
								"'" & ds.Tables(0).Rows(i)("acvBizCode") & "', " & _
								"'" & ds.Tables(0).Rows(i)("acvPrePayFlag") & "', " & _
								ds.Tables(0).Rows(i)("acvMoney") & ", " & _
								"N'" & ds.Tables(0).Rows(i)("acvMemo") & "', " & _
								"'" & ds.Tables(0).Rows(i)("inspect") & "'" & _
							");"
			Next i
'Response.Write(updStr)
'Response.End()
			If updStr <> "" Then
				Try
					MySqlDbWriter(updStr, _Connection, _Command, True)
				Catch
					Response.Write("<script" & ">self.alert('儲存失敗：動支明細檔')</" & "script>")
					Throw New Exception
				End Try
			End If
		End If

	'==================================================

'				If add_actVisa(acmYear, acmNo, acmNo1, _
'								tmp_acmNo, _
'					_Connection, _Transact) < 0 Then

'					Response.Write("<script" & ">self.alert('儲存失敗：動支明細檔')</" & "script>")
'				Else

'				End If

	'==================================================

		'重新編acvNo
'		Dim ds As DataSet = get_actVisa(acmYear, tmp_acmNo, _Connection, _Transact)
'		If ds.Tables(0).Rows.Count > 0 Then

'			Dim updStr As String = ""
'			For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
'				Dim acvNo As Integer = ds.Tables(0).Rows(i)("acvNo")
'				updStr &= "UPDATE [actVisa] SET [acvNo] = " & i + 1 & " WHERE (acmYear = " & acmYear & ") AND (acmNo = " & tmp_acmNo & ") AND (acvNo = " & acvNo & ");"
'			Next i

'			If updStr <> "" Then
'				MySqlDbWriter(updStr, _Connection, _Command)
'			End If
'		End If

	'==================================================

				If add_actMainProd(acmYear, acmNo, acmNo1, _
								tmp_acmNo, _
					_Connection, _Transact) < 0 Then

					Response.Write("<script" & ">self.alert('儲存失敗：請購主檔')</" & "script>")
				Else

				End If

				If add_actDtlProd(acmYear, acmNo, acmNo1, _
								tmp_acmNo, _
					_Connection, _Transact) < 0 Then

					Response.Write("<script" & ">self.alert('儲存失敗：請購明細檔')</" & "script>")
				Else

				End If

	'==================================================

				'刪除原再簽資料
				Dim delStr As String = ""
				delStr = "DELETE FROM [actVisa1] WHERE ([acmYear] = " & acmYear & ") AND (ISNULL([acmNoPrv], [acmNo]) = " & acmNo & ") AND ([acmNo1] = " & acmNo1 & ")"
				MySqlDbWriter(delStr, _Connection, _Command)

				delStr = "DELETE FROM [actMain1] WHERE ([acmYear] = " & acmYear & ") AND ([acmNo] = " & acmNo & ") AND ([acmNo1] = " & acmNo1 & ")"
				MySqlDbWriter(delStr, _Connection, _Command)


				_Transact.Commit()


				'再次檢查動支編號是否重複
				Try
					DB.DbSum.DAT.BudgetDT.ChkWordNum(tmp_acmWordNum, Nothing, Nothing, _
						acmKidNum, 0, Nothing, acmMarkDate, acmYear, tmp_acmNo, True)

					Dim queStr As String = "SELECT acmWordNum FROM [actMain] WHERE (acmYear = " & acmYear & ") AND (acmNo = " & tmp_acmNo & ")"
					Try
						tmp_acmWordNum = MySqlDbReader(queStr)
						Response.Write("<script" & ">self.alert('轉換成功。\n\n新的簽證編號為：\n\n" & tmp_acmWordNum & "')</" & "script>")
					Catch
					End Try

				Catch ex As Exception
					Response.Write("<script" & ">self.alert('修正動支編號(" & tmp_acmWordNum & ")重複失敗！該動支系統號為：" & tmp_acmNo & "\n\n" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")
				End Try


				Initialize()
				BindGrid()

				'設定按鈕狀態
				set_Butten(grid_Main, "S2D")

			Catch ex As Exception

				If Not _Transact Is Nothing Then

					Response.Write("<script" & ">self.alert('轉換失敗：" & ex.Message.Replace("\", "\\").Replace(vbCrLf, "\n").Replace("""", "\""").Replace("'", "\'") & "')</" & "script>")

					_Transact.Rollback()
				Else
					Response.Write("<script" & ">self.alert('SQL Server 不存在或拒絕存取。')/</" & "script>")
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

	'轉至簽證
	Sub btn_trans_Click(sender As Object, e As EventArgs)
System.Threading.Thread.Sleep(1000)
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
<title>再簽轉簽證作業</title>
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
	LEFT: expression(document.getElementById("div_grid_actVisa1").scrollLeft+1);
	/*freezingDiv is the name of the div to make your datagrid scrollable */
	POSITION: relative;
	z-index: 9;

	border-top: 0px solid #FFFFFF;
	border-bottom: 0px solid;
	border-left: 0px solid #003366;
	border-right: 0px solid #FFFFFF;
}
.DIV1_FreezingCol2{
	LEFT: expression(document.getElementById("div_grid_actVisa1").scrollLeft+1);
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
	SetCookie(GetPageName() + ":div_grid_actVisa1", div_grid_actVisa1.className);	//縮放表格
}

function get_cookies(){
	SetFold(GetCookie(GetPageName() + ":FoldTitle_10"), "FoldTitle_10", "img_FoldTitle_10");	//折疊項目
	SetDiv(GetCookie(GetPageName() + ":div_grid_actVisa1"), "div_grid_actVisa1", "img1");	//縮放表格
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
									<td width="100" align="right">再簽金額</td>
									<td width="100"><asp:TextBox id="text_acmMoney" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">執行單位</td>
									<td width="100"><asp:TextBox id="text_acmWorkUnitNo" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">承辦人員</td>
									<td width="100"><asp:TextBox id="text_acmWorkUserNo" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
									<td width="100" align="right">再簽日期</td>
									<td width="100"><asp:TextBox id="text_acmMarkDate" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="75px" onfocus="this.blur()"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right" valign="top">再簽事由</td>
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
											<td width="100" align="right"><img id="img1" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img1.fireEvent("onclick")'>項目明細</span></td>
											<td width="490" align="right">　</td>
										</tr>
									</table>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
											<div id="div_grid_actVisa1" class="DIV1_width" alt="DIV1">
											<asp:DataGrid id="grid_actVisa1" runat="server" style="MARGIN-LEFT: -1px"
													CellPadding="3" CellSpacing="1" GridLines="None"
													Borderstyle="None" BackColor="White"
													AutoGenerateColumns="False"
													OnItemCreated="grid_actVisa1_ItemCreated"
													OnItemDataBound="grid_actVisa1_DataBound"
													Width="100%">
												<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
												<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
												<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
												<Columns>
													<asp:TemplateColumn>
														<ItemTemplate>
															<asp:Label id="lab_acvNo1" runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" Text='<%# Container.ItemIndex+1 %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmYear") & "," & DataBinder.Eval(Container, "DataItem.acmNo") & "," & DataBinder.Eval(Container, "DataItem.acvNo") & "," & DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
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
														<ItemTemplate>
															<asp:TextBox id="lab_acvAccKind" runat="server" style="TEXT-ALIGN: center" BackColor="Transparent" Width="50px" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvAccKind") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="預算來源" Visible="True">
														<ItemTemplate>
															<asp:TextBox id="lab_acvBgtSourceCode" runat="server" BackColor="Transparent" Width="95px" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvBgtSourceCode") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="控帳業務" Visible="True">
														<ItemTemplate>
															<asp:TextBox id="lab_acvBizCode" runat="server" BackColor="Transparent" Width="115px" Text='<%# DataBinder.Eval(Container, "DataItem.BizName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvBizCode") %>' onfocus="this.blur()"></asp:TextBox>
														</ItemTemplate>
													</asp:TemplateColumn>

													<asp:TemplateColumn HeaderText="計畫科目">
														<ItemTemplate>
															<asp:DropDownList id="ddl_acvPlanCode" style="background-color: #FFFFE0" runat="server" CssClass='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvPlanCode") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="用途別科目">
														<ItemTemplate>
															<asp:DropDownList id="ddl_acvOutlayCode" style="background-color: #FFFFE0" runat="server" CssClass='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") & ":" & DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>' Enabled="False"></asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="金額">
														<ItemTemplate>
															<asp:TextBox id="text_acvMoney" style="TEXT-ALIGN: right; background-color: #FFFFE0" MaxLength="9" Width="75px" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,#}") %>' onfocus="this.blur()"></asp:TextBox>
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
							<td><asp:Button id="btn_delete" runat="server" Text="再簽轉至簽證" Width="100px" Height="22px" onclick="btn_delete_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_update" runat="server" Text="儲存" Width="50px" Height="22px" onclick="btn_update_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_cancel" runat="server" Text="取消" Width="50px" Height="22px" onclick="btn_cancel_Click" CausesValidation="False"></asp:Button></td>
							<td style="display: none"><asp:Button id="btn_print" runat="server" Text="列印" Width="50px" Height="22px" onclick="btn_print_Click" CausesValidation="False"></asp:Button></td>
							<td>&nbsp;</td>
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
							<asp:TemplateColumn HeaderText="類別" Visible="True">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmKidNum" runat="server" text='<%# Left(DataBinder.Eval(Container, "DataItem.acmKidNum"),1) %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmKidNum") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="簽證編號" SortExpression="acmWordNum">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmWordNum" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="再簽">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmNo1" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="執行單位" SortExpression="acmWorkUnitNo">
								<HeaderStyle wrap="False"></HeaderStyle>
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
							<asp:TemplateColumn HeaderText="再簽金額" SortExpression="acmMoney">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Right"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_acmMoney" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.acmMoney", "{0:#,0}") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmMoney", "{0:#,#}") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="再簽事由">
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

							<asp:TemplateColumn HeaderText="a" SortExpression="actVisa1Count" Visible="True">
								<HeaderStyle font-size="X-Small" font-names="Webdings" wrap="False" horizontalalign="Center"></HeaderStyle>
								<ItemTemplate>
									<asp:Label id="lab_actVisa1Count" runat="server" forecolor="Red" Text='<%# DataBinder.Eval(Container, "DataItem.actVisa1Count") & "" %>'></asp:Label>
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
