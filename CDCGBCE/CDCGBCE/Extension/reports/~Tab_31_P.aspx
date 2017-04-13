<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="ToolsFun" %>
<%@ import Namespace="ExcelHelper" %>
<!-- #include file="Report_SQL.bas" -->
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Function get_AllData(acpPayYear As String, acpPayMonth As String, WorkUnitNo As String, WorkUnitSubNo As String, WorkUserNo As String, Optional Bat As String = Nothing, Optional Prev As String = Nothing) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String

		Dim selectString As String = "SELECT actMain.acmWorkUnitNo, codDepartName.dptName AS acmWorkUnitName, " & _
								"ISNULL(actMain.acmWorkUnitSubNo,'') AS acmWorkUnitSubNo, " & _
								"'' AS acmWorkUnitSubName, " & _
								"ISNULL(actMain.acmWorkRankNo,'') AS acmWorkRankNo, '　' AS acmWorkRankName, " & _
								"ISNULL(actMain.acmEmpNo,'') As acmWorkUserNo, " & _
								"actMain.acmWorkUserNo AS acmWorkUserName, " & _
								"actPayVisa.acvOutlayYear AS acvPlanYear, " & _
								"actPayVisa.acvPlanCode, " & _
								"codPlanCode.plnPlanName AS acvPlanName, " & _
								"actPayVisa.acvOutlayYear, " & _
								"actPayVisa.acvOutlayCode, " & _
								"codOutlayCode.oulOutlayName AS acvOutlayName, " & _
								"o1.oulOutlayCode AS acvOutlayCodePrev, o1.oulOutlayName AS acvOutlayNamePrev, " & _
									 "ISNULL(o2.oulOutlayCode, o1.oulOutlayCode) AS acvOutlayCodeFirst, " & _
									 "ISNULL(o2.oulOutlayName, o1.oulOutlayName) AS acvOutlayNameFirst, " & _
									 "actPayVisa.acvMoney, " & _
									 "ISNULL(actPayVisa.acvPassMoney, " & IIf(Pass = "1", "actPayVisa.acvMoney", "0") & ") AS acvPassMoney, " & _
									 "(CASE WHEN actPayVisa.acvOutlayCode = '029101' THEN ISNULL(NULLIF (REPLACE(REPLACE((CASE " & _
											"WHEN LEFT(REPLACE(actPayVisa.acvDateMemo, ' ', ''), 1) = '0' THEN RIGHT(REPLACE(actPayVisa.acvDateMemo, ' ', ''), " & _
												"LEN(REPLACE(actPayVisa.acvDateMemo, ' ', '')) - 1) " & _
											"ELSE REPLACE(actPayVisa.acvDateMemo, ' ', '') END), '/0', '/'), ',0', ','), ''), " & _
										"ISNULL(NULLIF (actPayVisa.acvMemo, ''), actMain.acmMemo)) " & _
									"ELSE ISNULL(NULLIF (actPayVisa.acvMemo, ''), actMain.acmMemo) END) AS acvMemo, actMain.acmWordNum " & _
							"FROM actPayVisa INNER JOIN actMain ON actPayVisa.acmYear = actMain.acmYear AND actPayVisa.acmNo = actMain.acmNo " & _
								"INNER JOIN codPlanCode ON actPayVisa.acvOutlayYear = codPlanCode.codCodeVer AND actPayVisa.acvPlanCode = codPlanCode.plnPlanCode " & _
								"INNER JOIN codOutlayCode ON actPayVisa.acvOutlayYear = codOutlayCode.codCodeVer AND actPayVisa.acvOutlayCode = codOutlayCode.oulOutlayCode " & _
								"INNER JOIN actPay ON actPayVisa.acmYear = actPay.acmYear AND actPayVisa.acmNo = actPay.acmNo " & _
								"LEFT OUTER JOIN codDepartName ON actMain.acmWorkUnitNo = codDepartName.dptCode " & _
								"LEFT OUTER JOIN codOutlayCode o1 ON o1.codCodeVer = codOutlayCode.codCodeVer AND codOutlayCode.oulOutlayCode LIKE o1.oulOutlayCode + '_%' AND o1.oulLevel = codOutlayCode.oulLevel - 1 " & _
								"LEFT OUTER JOIN codOutlayCode o2 ON o1.codCodeVer = o2.codCodeVer AND o1.oulOutlayCode LIKE o2.oulOutlayCode + '_%' AND o2.oulLevel = o1.oulLevel - 1 "

		Dim whereString As String = "WHERE (actPay.acpPassFlag = '" & Pass & "') AND (actPay.acpPayKind = '0') "

			whereString &= "AND (actPay.acpPayYear = " & acpPayYear & ") "

			If acpPayMonth <> Nothing Then
				whereString &= "AND (actPay.acpPayMonth = " & acpPayMonth & ") "
			End If

			whereString &= "AND (actMain.acmWorkUnitNo = '" & WorkUnitNo & "') "

			If WorkUserNo <> Nothing Then
				whereString &= "AND (actMain.acmWorkUserNo = N'" & WorkUserNo & "') "
			Else
				If WorkUnitSubNo <> Nothing Then
					whereString &= "AND (ISNULL(actMain.acmWorkUnitSubNo,'') = '" & WorkUnitSubNo & "') "
				End If
			End If

			If Bat <> Nothing Then
				whereString &= "AND (actPay.acpPassBat = " & Bat & ") "
			End If

			If Prev <> Nothing Then
				Select Case Prev
					Case "0291"
						whereString &= "AND (o1.oulOutlayCode = '" & Prev & "') "
					Case "!0291"
						whereString &= "AND (o1.oulOutlayCode <> '" & Replace(Prev, "!", "") & "') "
				End Select
			End If

		Dim orderbyString As String = "ORDER BY actMain.acmWorkUnitNo, ISNULL(actMain.acmWorkUnitSubNo,''), " & _
												"actPayVisa.acvPlanCode, " & _
												"acvOutlayCodeFirst, acvOutlayCodePrev, actPayVisa.acvOutlayCode, " & _
												"ISNULL(actMain.acmWorkRankNo,''), actMain.acmWorkUserNo"

		queryString = selectString + whereString + orderbyString

'		Response.Write(queryString)
'		Response.End

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function newRow(ByRef tmpDS As DataSet, ByRef newDS As DataSet, i As Integer, DynaNo As String, PageCount As String, PageFlag As String) As DataRow
		Dim NR As DataRow = newDS.Tables(0).NewRow()
			NR("DynaNo") = DynaNo

			NR("acmWorkUnitNo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitNo") & ""
			NR("acmWorkUnitName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & ""
			NR("acmWorkUnitSubNo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & ""
			NR("acmWorkUnitSubName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubName") & ""

			NR("acmWorkRankNo") = tmpDS.Tables(0).Rows(i).Item("acmWorkRankNo") & ""
			NR("acmWorkRankName") = tmpDS.Tables(0).Rows(i).Item("acmWorkRankName") & ""
			NR("acmWorkUserNo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUserNo") & ""
			NR("acmWorkUserName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUserName") & ""

			NR("acvPlanYear") = tmpDS.Tables(0).Rows(i).Item("acvPlanYear") & ""
			NR("acvPlanCode") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
			NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""

			NR("acvOutlayYear") = tmpDS.Tables(0).Rows(i).Item("acvOutlayYear") & ""
			NR("acvOutlayCode") = tmpDS.Tables(0).Rows(i).Item("acvOutlayCode") & ""
			NR("acvOutlayName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayName") & ""
			NR("acvOutlayCodePrev") = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & ""
			NR("acvOutlayNamePrev") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNamePrev") & ""
			NR("acvOutlayCodeFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & ""
			NR("acvOutlayNameFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""

			NR("acvMoney") = tmpDS.Tables(0).Rows(i).Item("acvMoney") & ""
			NR("acvPassMoney") = tmpDS.Tables(0).Rows(i).Item("acvPassMoney") & ""

			NR("acvMemo") = tmpDS.Tables(0).Rows(i).Item("acvMemo") & ""
			NR("acmWordNum") = tmpDS.Tables(0).Rows(i).Item("acmWordNum") & ""

			NR("PageCount") = PageCount
			NR("PageFlag") = PageFlag

'			NR("PageTitle") = NR("acmWorkUnitName") & " " & yymm
'			NR("PagePlanNoName") = NR("acvPlanCode") & " " & NR("acvPlanName")
'			NR("PageOutlayName") = NR("acvOutlayNameFirst")
		Return NR
	End Function

	Function newTitle(acpPayYear As String, acpPayMonth As String, report As Integer) As String
		Dim newYYMM As String

		If acpPayMonth = Nothing Then
			newYYMM = acpPayYear & "年"
		Else
			newYYMM = acpPayYear & "年" & acpPayMonth & "月"
		End If

		Select Case report
			Case 31
				newYYMM &= " 報支暨核支明細表"
		End Select

		Return newYYMM
	End Function

	Dim acpPayYear, acpPayMonth As String
	Dim WorkUnitNo, WorkUnitSubNo, WorkUserNo, Pass, Bat, Prev As String
	Dim yymm As String

	Sub Page_Load(Sender As Object, E As EventArgs)

		If Request.QueryString("UnitNo") = Nothing Then
			Response.Write("<script" & ">self.alert('必須指定單位'); window.close()</" & "script>")
		Else
			WorkUnitNo = Trim(Request.QueryString("UnitNo"))
		End If

		If Request.QueryString("UnitSubNo") = Nothing Then
			WorkUnitSubNo = Nothing
		Else
			WorkUnitSubNo = Trim(Request.QueryString("UnitSubNo"))
		End If

		If Request.QueryString("year") = Nothing Or IsNumeric(Request.QueryString("year")) = False Then
			acpPayYear = System.DateTime.Now.Year() - 1911
		Else
			acpPayYear = Val(Request.QueryString("year"))
		End If

		If Request.QueryString("month") = Nothing Or IsNumeric(Request.QueryString("month")) = False Then
			acpPayMonth = Nothing
		Else
			Select Case Val(Request.QueryString("month"))
				Case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
					acpPayMonth = Val(Request.QueryString("month"))
				Case Else
					acpPayMonth = Nothing
			End Select
		End If

		If Request.QueryString("UserNo") = Nothing Then
			WorkUserNo = Nothing
		Else
			WorkUserNo = Trim(Request.QueryString("UserNo"))
		End If

		If Request.QueryString("Pass") = Nothing Then
			Pass = "1"
		Else
			Pass = Request.QueryString("Pass")
		End If

		If Request.QueryString("Bat") = Nothing Then
			Bat = Nothing
		Else
			Bat = Request.QueryString("Bat")
		End If
		If Request.QueryString("Prev") = Nothing Then
			Prev = Nothing
		Else
			Prev = Request.QueryString("Prev")
		End If

		yymm = newTitle(acpPayYear, acpPayMonth, 31)

		'產生實際需要的 DataSet
		Dim tmpDS As New System.Data.DataSet
			tmpDS = get_AllData(acpPayYear, acpPayMonth, WorkUnitNo, WorkUnitSubNo, WorkUserNo, Bat, Prev)

		'產生空白DS
		Dim newDS As New System.Data.DataSet
			newDS = tmpDS.Clone()
			newDS.Tables(0).Columns.Add("DynaNo", Type.GetType("System.String"))
			newDS.Tables(0).Columns.Add("PageCount", Type.GetType("System.String"))
			newDS.Tables(0).Columns.Add("PageFlag", Type.GetType("System.String"))

			newDS.Tables(0).Columns.Add("PageTitle", Type.GetType("System.String"))
			newDS.Tables(0).Columns.Add("PagePlanNoName", Type.GetType("System.String"))
			newDS.Tables(0).Columns.Add("PageOutlayName", Type.GetType("System.String"))

		Dim DynaNo, PageCount, PageMax As Integer
		Dim acmWorkUnitSubNo, acvPlanCode, acvOutlayCodePrev, acvOutlayCodeFirst As String
		Dim acvMoney, acvPassMoney As Double
		Dim total_acvMoney, total_acvPassMoney As Double
		Dim NR As DataRow

		PageMax = 34

		For i As Integer = 0 To tmpDS.Tables(0).Rows.Count() - 1

			If i = 0 Then
				'表頭
				NR = newDS.Tables(0).NewRow()
					NR("acmWorkUnitSubName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubName") & ""

					NR("acvPlanCode") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
					NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
						NR("PagePlanNoName") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & " " & tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
						NR("PageOutlayName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""
					NR("acvOutlayNameFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""

					NR("acvMemo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
						NR("PageTitle") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
					NR("PageFlag") = "0"	'表頭
				newDS.Tables(0).Rows.Add(NR)

				'資料
				NR = newRow(tmpDS, newDS, i, "1", "1", "1")
				newDS.Tables(0).Rows.Add(NR)

				acmWorkUnitSubNo = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & ""
				acvPlanCode = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
				acvOutlayCodeFirst = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & ""
				acvOutlayCodePrev = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & ""

				DynaNo = 2
				PageCount = 2

				acvMoney = tmpDS.Tables(0).Rows(i).Item("acvMoney")
				acvPassMoney = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
				total_acvMoney = acvMoney
				total_acvPassMoney = acvPassMoney
			End If
'====================================================================================================
			If i = 0 AndAlso i = tmpDS.Tables(0).Rows.Count() - 1 Then
				'小計
				NR = newDS.Tables(0).NewRow()
					NR("acmWorkUserName") = "小計："

					NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNamePrev") & ""

					NR("acvMoney") = tmpDS.Tables(0).Rows(i).Item("acvMoney")
					NR("acvPassMoney") = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
					NR("PageCount") = PageCount
					NR("PageFlag") = "2"	'小計
				newDS.Tables(0).Rows.Add(NR)
				PageCount += 1

				'合計
				NR = newDS.Tables(0).NewRow()
					NR("acmWorkUserName") = "合計："

					NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""

					NR("acvMoney") = tmpDS.Tables(0).Rows(i).Item("acvMoney")
					NR("acvPassMoney") = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
					NR("PageCount") = PageCount
					NR("PageFlag") = "3"	'合計
				newDS.Tables(0).Rows.Add(NR)
				PageCount += 1
			End If
'====================================================================================================
			If i > 0 AndAlso i <= tmpDS.Tables(0).Rows.Count() - 1 Then
				If tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & "" <> acmWorkUnitSubNo Then
					'小計
					NR = newDS.Tables(0).NewRow()
						NR("acmWorkUserName") = "小計："

						NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNamePrev") & ""

						NR("acvMoney") = acvMoney
						NR("acvPassMoney") = acvPassMoney
						NR("PageCount") = PageCount
						NR("PageFlag") = "2"	'小計
					newDS.Tables(0).Rows.Add(NR)
					PageCount += 1

					'合計
					NR = newDS.Tables(0).NewRow()
						NR("acmWorkUserName") = "合計："

						NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNameFirst") & ""

						NR("acvMoney") = total_acvMoney
						NR("acvPassMoney") = total_acvPassMoney
						NR("PageCount") = PageCount
						NR("PageFlag") = "3"	'合計
					newDS.Tables(0).Rows.Add(NR)
					PageCount += 1

					'換頁

					'表頭
					NR = newDS.Tables(0).NewRow()
						NR("acmWorkUnitSubName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubName") & ""

						NR("acvPlanCode") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
						NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
							NR("PagePlanNoName") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & " " & tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
							NR("PageOutlayName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst")
						NR("acvOutlayNameFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst")

						NR("acvMemo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
							NR("PageTitle") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
						NR("PageFlag") = "0"	'表頭
					newDS.Tables(0).Rows.Add(NR)

					'資料
					NR = newRow(tmpDS, newDS, i, "1", "1", "1")
					newDS.Tables(0).Rows.Add(NR)

					acmWorkUnitSubNo = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & ""
					acvPlanCode = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
					acvOutlayCodeFirst = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & ""
					acvOutlayCodePrev = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & ""

					DynaNo = 2
					PageCount = 2

					acvMoney = tmpDS.Tables(0).Rows(i).Item("acvMoney")
					acvPassMoney = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
					total_acvMoney = acvMoney
					total_acvPassMoney = acvPassMoney
				Else
					'==============================↓工作站相同↓==============================
					If tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & "" <> acvPlanCode Then
						'小計
						NR = newDS.Tables(0).NewRow()
							NR("acmWorkUserName") = "小計："

							NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNamePrev") & ""

							NR("acvMoney") = acvMoney
							NR("acvPassMoney") = acvPassMoney
							NR("PageCount") = PageCount
							NR("PageFlag") = "2"	'小計
						newDS.Tables(0).Rows.Add(NR)
						PageCount += 1

						'合計
						NR = newDS.Tables(0).NewRow()
							NR("acmWorkUserName") = "合計："

							NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNameFirst") & ""

							NR("acvMoney") = total_acvMoney
							NR("acvPassMoney") = total_acvPassMoney
							NR("PageCount") = PageCount
							NR("PageFlag") = "3"	'合計
						newDS.Tables(0).Rows.Add(NR)
						PageCount += 1

						'換頁

						'表頭
						NR = newDS.Tables(0).NewRow()
							NR("acmWorkUnitSubName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubName") & ""

							NR("acvPlanCode") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
							NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
								NR("PagePlanNoName") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & " " & tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
								NR("PageOutlayName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""
							NR("acvOutlayNameFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""

							NR("acvMemo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
								NR("PageTitle") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
							NR("PageFlag") = "0"	'表頭
						newDS.Tables(0).Rows.Add(NR)

						'資料
						NR = newRow(tmpDS, newDS, i, "1", "1", "1")
						newDS.Tables(0).Rows.Add(NR)

						acmWorkUnitSubNo = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & ""
						acvPlanCode = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
						acvOutlayCodeFirst = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & ""
						acvOutlayCodePrev = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & ""

						DynaNo = 2
						PageCount = 2

						acvMoney = tmpDS.Tables(0).Rows(i).Item("acvMoney")
						acvPassMoney = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
						total_acvMoney = acvMoney
						total_acvPassMoney = acvPassMoney
					Else
						'==============================↓計畫相同↓==============================

						If tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & "" <> acvOutlayCodeFirst Then
							'小計
							NR = newDS.Tables(0).NewRow()
								NR("acmWorkUserName") = "小計："

								NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNamePrev") & ""

								NR("acvMoney") = acvMoney
								NR("acvPassMoney") = acvPassMoney
								NR("PageCount") = PageCount
								NR("PageFlag") = "2"	'小計
							newDS.Tables(0).Rows.Add(NR)
							PageCount += 1

							'合計
							NR = newDS.Tables(0).NewRow()
								NR("acmWorkUserName") = "合計："

								NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNameFirst") & ""

								NR("acvMoney") = total_acvMoney
								NR("acvPassMoney") = total_acvPassMoney
								NR("PageCount") = PageCount
								NR("PageFlag") = "3"	'合計
							newDS.Tables(0).Rows.Add(NR)
							PageCount += 1

							'換頁

							'表頭
							NR = newDS.Tables(0).NewRow()
								NR("acmWorkUnitSubName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubName") & ""

								NR("acvPlanCode") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
								NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
									NR("PagePlanNoName") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & " " & tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
									NR("PageOutlayName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""
								NR("acvOutlayNameFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""

								NR("acvMemo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
									NR("PageTitle") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
								NR("PageFlag") = "0"	'表頭
							newDS.Tables(0).Rows.Add(NR)

							'資料
							NR = newRow(tmpDS, newDS, i, "1", "1", "1")
							newDS.Tables(0).Rows.Add(NR)

							acmWorkUnitSubNo = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & ""
							acvPlanCode = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
							acvOutlayCodeFirst = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & ""
							acvOutlayCodePrev = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & ""

							DynaNo = 2
							PageCount = 2

							acvMoney = tmpDS.Tables(0).Rows(i).Item("acvMoney")
							acvPassMoney = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
							total_acvMoney = acvMoney
							total_acvPassMoney = acvPassMoney
						Else
							'==============================↓一級用途別相同↓==============================

							If tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & "" <> acvOutlayCodePrev Then
								'小計
								NR = newDS.Tables(0).NewRow()
									NR("acmWorkUserName") = "小計："

									NR("acvPlanName") = tmpDS.Tables(0).Rows(i-1).Item("acvOutlayNamePrev") & ""

									NR("acvMoney") = acvMoney
									NR("acvPassMoney") = acvPassMoney
									NR("PageCount") = PageCount
									NR("PageFlag") = "2"	'小計
								newDS.Tables(0).Rows.Add(NR)
								PageCount += 1

								'資料
								NR = newRow(tmpDS, newDS, i, DynaNo, PageCount, "1")
								newDS.Tables(0).Rows.Add(NR)

								acmWorkUnitSubNo = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubNo") & ""
								acvPlanCode = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
								acvOutlayCodeFirst = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodeFirst") & ""
								acvOutlayCodePrev = tmpDS.Tables(0).Rows(i).Item("acvOutlayCodePrev") & ""

								DynaNo += 1
								PageCount += 1

								acvMoney = tmpDS.Tables(0).Rows(i).Item("acvMoney")
								acvPassMoney = tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
								total_acvMoney += acvMoney
								total_acvPassMoney += acvPassMoney
							Else
								'==============================↓三級用途別相同↓==============================

								If PageCount > PageMax Then
									'換頁

									'表頭
									NR = newDS.Tables(0).NewRow()
										NR("acmWorkUnitSubName") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitSubName") & ""

										NR("acvPlanCode") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & ""
										NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
											NR("PagePlanNoName") = tmpDS.Tables(0).Rows(i).Item("acvPlanCode") & " " & tmpDS.Tables(0).Rows(i).Item("acvPlanName") & ""
											NR("PageOutlayName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""
										NR("acvOutlayNameFirst") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst") & ""

										NR("acvMemo") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
											NR("PageTitle") = tmpDS.Tables(0).Rows(i).Item("acmWorkUnitName") & " " & yymm
										NR("PageFlag") = "0"	'表頭
									newDS.Tables(0).Rows.Add(NR)

									PageCount = 1
								End If

								'資料
								NR = newRow(tmpDS, newDS, i, DynaNo, PageCount, "1")
								newDS.Tables(0).Rows.Add(NR)

								DynaNo += 1
								PageCount += 1

								acvMoney += tmpDS.Tables(0).Rows(i).Item("acvMoney")
								acvPassMoney += tmpDS.Tables(0).Rows(i).Item("acvPassMoney")
								total_acvMoney += tmpDS.Tables(0).Rows(i).Item("acvMoney")
								total_acvPassMoney += tmpDS.Tables(0).Rows(i).Item("acvPassMoney")

								'==============================↑三級用途別相同↑==============================
							End If

							'==============================↑一級用途別相同↑==============================
						End If

						'==============================↑計畫相同↑==============================
					End If

					'==============================↑工作站相同↑==============================
				End If

			End If
'====================================================================================================
			If i = tmpDS.Tables(0).Rows.Count() - 1
				'資料

				'小計
				NR = newDS.Tables(0).NewRow()
					NR("acmWorkUserName") = "小計："

					NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNamePrev")

					NR("acvMoney") = acvMoney
					NR("acvPassMoney") = acvPassMoney

					NR("PageFlag") = "2"	'小計
				newDS.Tables(0).Rows.Add(NR)

				'合計
				NR = newDS.Tables(0).NewRow()
					NR("acmWorkUserName") = "合計："

					NR("acvPlanName") = tmpDS.Tables(0).Rows(i).Item("acvOutlayNameFirst")

					NR("acvMoney") = total_acvMoney
					NR("acvPassMoney") = total_acvPassMoney

					NR("PageFlag") = "3"	'合計
				newDS.Tables(0).Rows.Add(NR)

				PageCount += 2	'990131
			End If

		Next i

'修正 >34 未歸 0 者
If 1=1 Then
Dim bigNum As Integer = 0
For i As Integer = 0 To newDS.Tables(0).Rows.Count() - 1
	Try
		If Val(newDS.Tables(0).Rows(i).Item("PageCount")) > 34 Then
			newDS.Tables(0).Rows(i).Item("PageCount") = bigNum + 1
			bigNum += 1
		Else
			bigNum = 0
		End If
	Catch
'		bigNum = 0
	End Try
Next i
End If

		DataGrid1.DataSource = newDS.Tables(0)
		DataGrid1.DataBind()
'start_Print(newDS.Tables(0))
		Exit Sub


		Dim myCtrl(4) As Control

		For j As Integer = 0 To newDS.Tables(0).Rows.Count() - 1
			Dim DR As DataRow = newDS.Tables(0).Rows(j)

			Select Case DR("PageFlag") & ""	'修正v2時錯誤
				Case "0"
					myCtrl(0) = CType(LoadControl("tab_31_0.ascx"), Control)

					If j <> 0 Then
						'插入換頁屬性
						CType(myCtrl(0).FindControl("Header"), HtmlTable).Attributes("Style") = "PAGE-BREAK-BEFORE: always"
					End If

					CType(myCtrl(0).FindControl("lab_Title"), Label).Text = DR("acvMemo")
					CType(myCtrl(0).FindControl("lab_acvPlanNoName"), Label).Text = DR("acvPlanCode") & " " & DR("acvPlanName")
					CType(myCtrl(0).FindControl("lab_acmWorkUnitSubName"), Label).Text = DR("acmWorkUnitSubName")
					CType(myCtrl(0).FindControl("lab_acvOutlayNameFirst"), Label).Text = DR("acvOutlayNameFirst")

					PlaceHolder1.Controls.Add(myCtrl(0))
				Case "1"
					myCtrl(1) = CType(LoadControl("tab_31_1.ascx"), Control)

					CType(myCtrl(1).FindControl("lab_DynaNo"), Label).Text = DR("DynaNo")
					If Request.QueryString("debug") = 1 Then
						CType(myCtrl(1).FindControl("lab_DynaNo"), Label).ToolTip = DR("acmWordNum")
						CType(myCtrl(1).FindControl("lab_acvPlanNoName"), Label).ToolTip = DR("acvPlanCode") & " " & DR("acvPlanName") & ""
						CType(myCtrl(1).FindControl("lab_acmWorkUserNoName"), Label).ToolTip = DR("acmWorkUserNo") & ""
						CType(myCtrl(1).FindControl("lab_acvMemo"), Label).ToolTip = DR("acvMemo")
					End If
					CType(myCtrl(1).FindControl("lab_acvPlanNoName"), Label).Text = DR("acvOutlayCode") & " " & DR("acvOutlayName")
					CType(myCtrl(1).FindControl("lab_acmWorkRankNoName"), Label).Text = DR("acmWorkRankName")
					CType(myCtrl(1).FindControl("lab_acmWorkUserNoName"), Label).Text = DR("acmWorkUserName")
					CType(myCtrl(1).FindControl("lab_acvMoney"), Label).Text = Format(DR("acvMoney"), "#,0")
					CType(myCtrl(1).FindControl("lab_acvPassMoney"), Label).Text = Format(DR("acvPassMoney"), "#,0")
					CType(myCtrl(1).FindControl("lab_acvMemo"), Label).Text = DR("acvMemo")

					PlaceHolder1.Controls.Add(myCtrl(1))
				Case "2"
					myCtrl(2) = CType(LoadControl("tab_31_2.ascx"), Control)

					CType(myCtrl(2).FindControl("lab_acvPlanNoName"), Label).Text = DR("acvPlanName")
					CType(myCtrl(2).FindControl("lab_acvMoney"), Label).Text = Format(DR("acvMoney"), "#,0")
					CType(myCtrl(2).FindControl("lab_acvPassMoney"), Label).Text = Format(DR("acvPassMoney"), "#,0")

					PlaceHolder1.Controls.Add(myCtrl(2))
				Case "3"
					myCtrl(3) = CType(LoadControl("tab_31_3.ascx"), Control)

					CType(myCtrl(3).FindControl("lab_acvPlanNoName"), Label).Text = DR("acvPlanName")
					CType(myCtrl(3).FindControl("lab_acvMoney"), Label).Text = Format(DR("acvMoney"), "#,0")
					CType(myCtrl(3).FindControl("lab_acvPassMoney"), Label).Text = Format(DR("acvPassMoney"), "#,0")

					'960205 插入核章欄前補空白
					Try
						Dim PageCountX = Val(newDS.Tables(0).Rows(j-2)("PageCount"))
						If PageCountX <= PageMax Then
							'補空白列
							CType(myCtrl(3).FindControl("BlankRow"), Literal).Text = Set_BlankRows(22, (PageMax - PageCountX))
						End If
					Catch
					End Try

					PlaceHolder1.Controls.Add(myCtrl(3))
			End Select

		Next j

	End Sub

	Function Set_BlankRows(H As Integer, Optional R As Integer = 1) As String
		Dim myRow As String = "<table id='blank' style='border-top: 1px solid #000000; border-left:1px solid #FFFFFF; border-right:1px solid #FFFFFF; TABLE-LAYOUT: fixed; margin-top:-2' cellpadding='0' cellspacing='0' width='642' height='RowHeight'><tr><td>　</td></tr></table>"
		Return Replace(myRow, "RowHeight", H * R)
	End Function

	Sub start_Print(DT As System.Data.DataTable)
		Dim objWB As New ExcelHelper.ExcelRpt
		With objWB
			.OpenExcel(Server.MapPath(".") & "\" & GetPageName() & ".xls")
			.OutputFilePath = Server.MapPath("./") & "DesExcel\"
'			.DataGroupField = "月1"
			.DataTableToExcel(DT)	', 1, "ODBY")
			.IsDownloadFile = True
			.OutputExcelFile()
			objWB = Nothing
		End With
	End Sub

</script>
<html>
<head>
<style media="print">
.noPrint	{display: none;}
</style>
<style>
.title		{width: 100%; height: 100%; text-align: justify; text-justify: distribute-all-lines;}
.text		{width: 100%; height: 100%; overflow: hidden;}
</style>
<script language="javascript">
<!--
resizeTo(800,screen.availHeight);
moveTo((screen.width-800)/2,0);

function show_item(item){
myitem = document.all[item].style;
if (myitem.display == 'none')
myitem.display = "block";
else myitem.display = "none";}

function go_right_top(){
gift.style.left = document.body.clientWidth - 222 + document.body.scrollLeft;
gift.style.top = document.body.scrollTop + 6;}
//-->
</script>
</head>
<body onload="gift.style.posLeft = document.body.clientWidth - 222 + document.body.scrollLeft; gift.style.posTop = 6" onscroll="go_right_top()" onresize="go_right_top()">
	<div id="gift" class="noPrint" style="display: none; position: absolute; width: auto; height: auto; z-index: 3">
	<table border="1" bordercolor="#C1D1A1" cellpadding="3" cellspacing="0" bgcolor="#FFFCEC" style="border-collapse: collapse">
		<tr>
			<td>
			<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: -2">
				<tr>
					<td><font color="#C1D1A1">｜</font></td>
					<a onclick="show_item('mPrint')"><td width="21" style="CURSOR: hand"><img border="0" src="images/icon_printer.gif" width="16" height="16"></td></a>
					<td id="mPrint" style="display: block">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td nowrap><a style="CURSOR: hand;" onclick="javascript:WebBrowser.ExecWB(8,1);">設定</a></td>
							<td><font color="#C1D1A1">｜</font></td>
							<td nowrap><a style="CURSOR: hand;" onclick="javascript:WebBrowser.ExecWB(6,1);">列印</a></td>
							<td><font color="#C1D1A1">｜</font></td>
							<td nowrap><a style="CURSOR: hand;" onclick="javascript:WebBrowser.ExecWB(7,1);">預覽列印</a></td>
						</tr>
					</table>
					</td>
					<td><font color="#C1D1A1">｜</font></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
	<object id="WebBrowser" width=0 height=0 classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>
	<form runat="server">
		<div style="margin-top: -20"><asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder></div>
		<asp:DataGrid id="DataGrid1" runat="server"></asp:DataGrid>
	</form>
</body>
</html>