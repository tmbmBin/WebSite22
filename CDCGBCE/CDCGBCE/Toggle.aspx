<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<!-- include file="UI.tmAcc.Web/Default.bas" -->
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Sub get_default_Year()
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		'Dim queryString As String = "SELECT DISTINCT [PK_Year] FROM [accMain] ORDER BY [PK_Year]"
        Dim queryString As String = " Select  DISTINCT [codCodeVer] From ( " & vbCrLf & _
                                    "SELECT DISTINCT [codCodeVer] FROM [codPlanCode] " & vbCrLf & _
                                          " Union All " & vbCrLf & _
                                    "SELECT DISTINCT [codCodeVer] FROM [codPlanCodePN] " & vbCrLf & _
                                    ") DS ORDER BY [codCodeVer] "

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		ddl_default_year.Items.Clear
		If dataSet.Tables(0).Rows.Count > 0 Then

			For i As Integer = 0 To dataSet.Tables(0).Rows.Count - 1
				ddl_default_year.Items.Add(New ListItem(Right("00" & dataSet.Tables(0).Rows(i).Item(0), 3), dataSet.Tables(0).Rows(i).Item(0)))
			Next i

			Dim next_year As Integer = dataSet.Tables(0).Rows(dataSet.Tables(0).Rows.Count-1).Item(0) + 1
			ddl_default_year.Items.Add(New ListItem(Right("00" & next_year, 3), next_year))
		Else
			ddl_default_year.Items.Add(New ListItem(Right("00" & System.DateTime.Now.Year - 1911, 3), System.DateTime.Now.Year - 1911))
		End If

		ddl_default_year.Items.Insert(0, New ListItem(Right("00" & Val(ddl_default_year.Items(0).Value) - 1, 3), Val(ddl_default_year.Items(0).Value) - 1))
		ddl_default_year.Items.Insert(0, New ListItem(Right("00" & Val(ddl_default_year.Items(0).Value) - 1, 3), Val(ddl_default_year.Items(0).Value) - 1))
	End Sub

	Function upd_YearMonth(ByVal pK_usrNo As Integer, ByVal usrDefYear As Integer, ByVal usrDefMonth As Integer) As Integer
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "UPDATE [sysBaseUser] SET [usrDefYear]=" & IIf(usrDefYear = 0, "NULL", usrDefYear) & ", [usrDefMonth]=" & IIf(usrDefMonth = 0, "NULL", usrDefMonth) & " WHERE ([PK_usrNo] = " & PK_usrNo & ")"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function get_usrAgentInfo(ByVal usrAlias As String, ByVal loginDate As Object, Optional IsAgent As Boolean = False) As System.Data.DataTable
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "" & _
			"SELECT D.*, ISNULL(dptName, '(未設定)') AS dptName " & _
			"FROM " & _
			"(" & _
				"SELECT PK_usrNo, usrAlias, ISNULL(DepCode, '-') AS DepCode, " & _
				"	usrName, usrLevel, usrGroup, usrTeamCode, " & _
				"	payCode, payKind, " & _
				"	usrDefYear, usrDefMonth, " & _
				"	usrAgentUsrNo, "

	If IsAgent = False Then
		'queryString &= "( SELECT '被 ' + CAST(COUNT(*) AS varchar) + ' 人指定為代理' FROM sysBaseUser B WHERE (B.usrAgentUsrNo = A.PK_usrNo) ) AS usrAgentUsrName, "
		queryString &= "( SELECT B.usrName FROM sysBaseUser B WHERE (B.PK_usrNo = A.usrAgentUsrNo) ) AS usrAgentUsrName, "
		'queryString &= "NULL AS usrAgentSDate, NULL AS usrAgentEDate "
		queryString &= "A.usrAgentSDate, DATEADD(day, -1, A.usrAgentEDate) AS usrAgentEDate "
	Else
		queryString &= "( SELECT B.usrName FROM sysBaseUser B WHERE (B.PK_usrNo = A.usrAgentUsrNo) ) AS usrAgentUsrName, "
		'queryString &= "usrAgentSDate, usrAgentEDate "
		queryString &= "(SELECT MIN(usrAgentSDate) FROM sysBaseUser B WHERE (B.usrAgentUsrNo = A.PK_usrNo)) AS usrAgentSDate, " & _
						"(SELECT DATEADD(day, -1, MIN(usrAgentEDate)) FROM sysBaseUser B WHERE (B.usrAgentUsrNo = A.PK_usrNo)) AS usrAgentEDate "
	End If
	queryString &= "FROM sysBaseUser A " & _
				"WHERE (usrAlias = @usrAlias) " & _
				"" & _
				"UNION ALL " & _
				"" & _
				"SELECT BU.PK_usrNo, BU.usrAlias, ISNULL(BU.DepCode, '-') AS DepCode, " & _
				"	BU.usrName, BU.usrLevel, BU.usrGroup, BU.usrTeamCode, " & _
				"	BU.payCode, BU.payKind, " & _
				"	BU.usrDefYear, BU.usrDefMonth, " & _
				"	BU.usrAgentUsrNo, " & _
				"	BU1.usrName AS usrAgentUsrName, " & _
				"	BU.usrAgentSDate, DATEADD(day, -1, BU.usrAgentEDate) AS usrAgentEDate " & _
				"FROM sysBaseUser BU LEFT OUTER JOIN sysBaseUser BU1 ON (BU.usrAgentUsrNo = BU1.PK_usrNo) " & _
				"WHERE (BU.usrAgentUsrNo = (SELECT PK_usrNo FROM sysBaseUser WHERE (usrAlias = @usrAlias)) ) " & _
				"	AND (@loginDate BETWEEN BU.usrAgentSDate AND ISNULL(DATEADD(day, -1, BU.usrAgentEDate),'2110/12/31'))" & _
			") D LEFT OUTER JOIN codDepartName DEP ON (D.DepCode = DEP.dptCode) " & _
			"ORDER BY (CASE usrAlias WHEN @usrAlias THEN 0 ELSE 1 END) ASC"

'Response.Write(queryString.Replace("@usrAlias", "'" & usrAlias & "'").Replace("@loginDate", "'" &  loginDate & "'"))
'Response.End
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@usrAlias", usrAlias))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@loginDate", loginDate))

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
			dataAdapter.Fill(dataSet)

		Return dataSet.Tables(0)
	End Function

	Function set_usrAgentInfo(ByVal DT As DataTable, ByVal PK_usrNo As Integer) As Integer
		Dim idx As Integer = -1
		For i As Integer = 0 To Dt.Rows.Count - 1
			If Dt.Rows(i)("PK_usrNo") = PK_usrNo Then
				idx = i
				Exit For
			End If
		Next i
		Return idx
	End Function

'====================================================================================================

	Sub Page_Init(sender as Object, e as EventArgs)

		lab_IsNew.Text = System.Configuration.ConfigurationSettings.AppSettings("tmVersion")

		get_default_Year()
		Try
			ddl_default_Year.SelectedValue = ToolsFun.WebDateFun.GetWorkCYear()'System.DateTime.Now.Year - 1911
		Catch
			'ddl_default_year.Items.Add(New ListItem(Right("00" & System.DateTime.Now.Year - 1911, 3), System.DateTime.Now.Year - 1911))
			'ddl_default_Year.SelectedValue = System.DateTime.Now.Year - 1911

			ddl_default_year.Items.Add(New ListItem(Right("00" & ToolsFun.WebDateFun.GetWorkCYear(), 3), ToolsFun.WebDateFun.GetWorkCYear()))
			ddl_default_Year.SelectedValue = ToolsFun.WebDateFun.GetWorkCYear()
		End Try
		ddl_default_Month.SelectedValue = ToolsFun.WebDateFun.GetWorkMonth() 'System.DateTime.Now.Month
	End Sub


	Dim Old_UserSysNo as String
	Dim tmp_this_No As String

	Sub Page_Load(Sender As Object, E As EventArgs)

		If Session("default_UserSysNo") Is Nothing Then
			Response.Redirect("Default.aspx")
		End If

		Old_UserSysNo = Session("default_UserSysNo")

		Session("default_Year") = ddl_default_Year.SelectedValue
		Session("default_Month") = ddl_default_Month.SelectedValue
	End Sub

'====================================================================================================

	Sub rebuild_usrAgentInfo(ByRef dt As DataTable, ByVal def_usrAlias As String, Optional Dday As Object = Nothing)
		If Dday = Nothing OrElse IsDate(Dday) = False Then Dday = Today()

		Dim defDT As DataTable = get_usrAgentInfo(def_usrAlias, Dday, True)	'取得目前身分相關代理資訊

		If defDT.Rows.Count > 0 Then

			If dt.Rows.Count > 0 Then

				Dim expression As String = ""
				Dim foundRows() As DataRow

				For i As Integer = 0 To defDT.Rows.Count-1
					expression = "(PK_usrNo = " & defDT.Rows(i)("PK_usrNo") & ")"
					foundRows = dt.Select(expression)

					If foundRows.Length = 0 Then
						'defDT.Rows(i)("usrName") = "　" & defDT.Rows(i)("usrName")
						defDT.Rows(i)("usrAgentUsrName") = "» " & defDT.Rows(i)("usrAgentUsrName") & "(代)"
						dt.ImportRow(defDT.Rows(i))
					End If
				Next i
			Else
				dt = defDT.Copy()
			End If

			dt.AcceptChanges()
		End If
	End Sub

	'未使用
	Function get_usrAgentInfoRow(ByVal usrAlias As String, Optional Dday As Object = Nothing) As DataTable
		Dim queStr As String = "" & _
			"SELECT " & _
				"D.*, ISNULL(dptName, '(未設定)') AS dptName " & _
			"FROM " & _
			"(" & _
				"SELECT BU.PK_usrNo, BU.usrAlias, BU.DepCode, BU.usrPwd, BU.usrName, " & _
				"	NULLIF(BU.payCode,'') AS payCode, BU.usrLevel, BU.usrDefYear, BU.usrDefMonth, " & _
				"	BU.usrTeamCode, BU.payKind, BU.usrGroup, " & _
				"	BU.usrAgentUsrNo, " & _
				"	NULL AS usrAgentUsrName, BU1.usrAgentSDate, DATEADD(day, -1, BU1.usrAgentEDate) AS usrAgentEDate " & _
				"FROM sysBaseUser BU " & _
				"	LEFT OUTER JOIN sysBaseUser BU1 ON (BU.PK_usrNo = BU1.usrAgentUsrNo) AND (BU1.usrAlias = '@usrAlias') " & _
				"WHERE (BU.PK_usrNo IN (" & _
				"	SELECT usrAgentUsrNo FROM sysBaseUser " & _
				"	WHERE (usrAlias = '@usrAlias') AND ('@today' BETWEEN usrAgentSDate AND DATEADD(day, -1, ISNULL(usrAgentEDate,'2110/12/31')) )" & _
				"	) )" & _
			") D " & _
			"LEFT OUTER JOIN codDepartName DEP ON (D.DepCode = DEP.dptCode) "

		Dim queStr1 As String = queStr.Replace("@usrAlias", usrAlias)
			queStr1 = queStr1.Replace("@today", Format( IIf(Dday <> Nothing AndAlso IsDate(Dday) = True , CDate(Dday), Today()) ,"yyyy/MM/dd"))
		Dim dt1 As DataTable = MsDbFun.GetDbTable(queStr1)
		Return dt1
	End Function

'====================================================================================================

	Sub Page_PreRender(Sender As Object, E As EventArgs)
		Dim SelectNo As Integer = -1
'		If Page.IsPostBack Or SelectNo Then
			If grid_Main.SelectedIndex >= 0 Then
				SelectNo = grid_Main.DataKeys(grid_Main.SelectedIndex)
			Else
				SelectNo = Session("default_UserSysNo")
			End If
'		End If

		Dim DT As DataTable = get_usrAgentInfo(Session("login_UserAlias"), Today())	'LOGIN: 本身 + 可代理
'Response.Write("login_UserAlias: " & Session("login_UserAlias") & "<br>")
'Response.Write("default_UserAlias: " & Session("default_UserAlias") & "<br>")
		rebuild_usrAgentInfo(DT, Session("default_UserAlias"), Today())	'DEFAULT: 本身代理的 + 本身代理的可代理
		grid_Main.DataSource = DT

'DataGrid1.DataSource = DT
'DataGrid1.DataBind()

'		SelectNo = Session("default_UserSysNo")

		Dim SelectIdx As Integer = set_usrAgentInfo(grid_Main.DataSource, SelectNo)
		get_Selected()

		grid_Main.SelectedIndex = SelectIdx	'IIf(SelectIdx > 0, SelectIdx - 1, -1)
		grid_Main.DataBind()


		If Old_UserSysNo <> Session("default_UserSysNo") Then
			Response.Redirect("Default.aspx?returnUrl=" & Server.UrlEncode(Request.Url.PathAndQuery))
		Else
			If Page.IsPostBack Then
				Response.write("<script" & ">try{ parent.topFrame.location.reload();}catch(e){;}</" & "script>")
				'Response.write("<script" & "> parent.topFrame.location.reload();</" & "script>")
			End If
		End If
	End Sub

'====================================================================================================

	Sub grid_Main_DataBound(sender As Object, e As DataGridItemEventArgs)

		If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.SelectedItem Then
			Try
				Dim CheckBox1 As CheckBox = e.Item.FindControl("CheckBox1")

			Catch
			End Try
		End If
	End Sub

	Function set_Selected(thisIndex As Integer) As Boolean
		Try
			If grid_Main.Items.Count = 0 Then
				Return False
			Else
				grid_Main.SelectedIndex = thisIndex
			End If

			For i As Integer = 0 To grid_Main.Items.Count-1
				If CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).CssClass <> grid_Main.SelectedIndex
					CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).Checked = False
				Else
					CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).Checked = True
				End If
			Next i

			Return True
		Catch ex As Exception
			grid_Main.SelectedIndex = -1
			Return False
		End Try
	End Function

	'Public Sub grid_Main_OnItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) 'Handles grid_Main.ItemCommand
		'If e.CommandName = "Select" Then
			'grid_Main.SelectedIndex = e.Item.ItemIndex
		'End If
	'End Sub

	'Sub grid_Main_SelectedIndexChanged(sender As Object, e As DataGridSelectedIndexEventArgs)
		'grid_Main.SelectedIndex = e.Item.ItemIndex()
	'End Sub

	Sub CheckBox_CheckedChanged(sender As Object, e As EventArgs)
		grid_Main.SelectedIndex = CInt(sender.CssClass)
		'If sender.Checked = True Then

		'	Dim i As Integer
		'	For i = 0 To grid_Main.Items.Count-1
		'		If CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).CssClass <> sender.CssClass
		'			CType(grid_Main.Items(i).Cells(0).FindControl("CheckBox1"), CheckBox).Checked = False
		'		Else
		'			grid_Main.SelectedIndex = CInt(sender.CssClass)
'
'					'取得選取位置資料
'					get_Selected()
'				End If
'			Next i
'		End If
'		sender.Checked = True
	End Sub

	Sub get_Selected()
		If grid_Main.SelectedIndex <> -1 Then

			'grid_Main.DataKeys(grid_Main.SelectedIndex)

			Session("default_Year") = ddl_default_Year.SelectedValue
			Session("default_Month") = ddl_default_Month.SelectedValue

			'代理人員(申請人)
			Session("default_UserSysNo") = grid_Main.Items(grid_Main.SelectedIndex).Cells(5).Text	'1.PK_usrNo登入者或被代理者編號 '*必須存在 (使用者可暫時切換)
			Session("default_UserAlias") = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_UserName"), Label).ToolTip	'2.帳號
			Session("default_UserName") = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_UserName"), Label).Text		'3.姓名
			'Session("default_UserID") = grid_Main.Items(grid_Main.SelectedIndex).Cells(xx).Text.Replace("&nbsp;","")	'4.身分證號
			Session("default_UserKind") = grid_Main.Items(grid_Main.SelectedIndex).Cells(7).Text.Replace("&nbsp;","")	'5.payKind所屬人員種類(基本資料之索引鍵)
			Session("default_UserNo") = grid_Main.Items(grid_Main.SelectedIndex).Cells(8).Text.Replace("&nbsp;","")		'6.payCode所屬人員代碼(基本資料之索引鍵)
			Session("default_TeamNo") = grid_Main.Items(grid_Main.SelectedIndex).Cells(9).Text.Replace("&nbsp;","")		'7.usrTeamCode所屬帳別代碼
			Session("default_Level") = grid_Main.Items(grid_Main.SelectedIndex).Cells(10).Text.Replace("&nbsp;","")		'8.usrLevel限定等階
			Session("default_Group") = grid_Main.Items(grid_Main.SelectedIndex).Cells(11).Text.Replace("&nbsp;","")		'9.usrGroup限定群組

			Session("default_UnitNo") = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_UnitName"), Label).ToolTip
			Session("default_UnitName") = CType(grid_Main.Items(grid_Main.SelectedIndex).FindControl("lab_UnitName"), Label).Text

			'登入人員(填表人)
			'Session("login_UnitNo") = text_default_UnitNo.Text
			'Session("login_UnitName") = text_default_UnitName.Text
			'Session("login_UserNo") = text_default_UserNo.Text
			'Session("login_UserName") = text_default_UserName.Text
		End If
	End Sub

'====================================================================================================

	Sub btn_update_Click(sender As Object, e As EventArgs)
		Try
			upd_YearMonth(Session("login_UserSysNo"), Val(ddl_default_Year.SelectedValue), Val(ddl_default_Month.SelectedValue))
		Catch
		End Try
	End Sub

	Sub btn_clear_Click(sender As Object, e As EventArgs)
		Try
			upd_YearMonth(Session("login_UserSysNo"), 0, 0)
		Catch
		End Try
	End Sub

'====================================================================================================

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

	'西元轉民國(y/MM/dd)
	Function ChtDate(thisDate As String, Optional OnNull As String = "") As String
		Try
			thisDate = Format(CDate(thisDate), "yyyy/MM/dd")
			Return CInt(Left(thisDate, 4))-1911 & Right(thisDate, Len(thisDate)-4)
		Catch ex As Exception
			Return OnNull
		End Try
	End Function

</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<script language="javascript">
<!--
function go_left_top(){
gift.style.left=document.body.scrollLeft;
gift.style.top=document.body.scrollTop;}
//-->
</script>
</head>
<body topmargin="0" leftmargin="0" bottommargin="50">
	<form runat="server">
		<div style="z-index: 3; width: auto; position: absolute; height: auto; display: none" id="gift"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-position-y: top; background-image: url(images/title_background.gif); background-repeat: repeat-x" height="30">
				<tr>
					<td style="padding-left: 50px">
						<table border="0" cellpadding="0" cellspacing="0" height="30">
							<tr>
								<td width="10" style="background-position: right top; background-image: url(images/title_item_left.gif); background-repeat: no-repeat"></td>
								<td style="background-position-y: top; background-image: url(images/title_item_top.gif); padding-top: 5px; background-repeat: repeat-x" nowrap><font color="#ffffff">經費核銷整合系統</font> <sup><asp:Label id="lab_IsNew" runat="server" forecolor="DarkOrange"></asp:Label></sup></td>
								<td width="10" style="background-position: left top; background-image: url(images/title_item_right.gif); background-repeat: no-repeat"></td>
							</tr>
						</table>
					</td>
					<td style="padding-right: 10px" align="right" nowrap><font color="white" size="1">報支年份 <u><font size="+1"><%= Session("default_Year") %></font></u>∕月份 <u><font size="+1"><%=Session("default_Month") %></font></u>∕登錄人員 <u><span title='<%=Session("default_UnitNo") %>'><%=Session("default_UnitName") %></span>：<span title='<%=Session("default_UserNo") %>'><%=Session("default_UserName") %></span></u> <sup><font color='DarkOrange'><span title='<%=Session("default_TeamNo") %>'><%=Session("default_TeamName") %></span></font></sup></td>
				</tr>
			</table>
		</div>
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
				<table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 5" bgcolor="#DADEE9" bordercolor="#666668">
					<tr>
						<td>
						<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
							<tr style="display: none">
								<td>
								<table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed">
									<tr>
										<td width="100">　</td>
										<td width="100">　</td>
										<td width="100">　</td>
										<td width="100" align="right">　</td>
										<td width="100" align="right">　</td>
										<td width="100" align="right">　</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td>
								<table border="0" cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed">
									<tr>
										<td width="80"><b>工作年月</b></td>
										<td width="80" align="right">年份</td>
										<td width="80"><asp:DropDownList id="ddl_default_Year" runat="server" Width="50px" AutoPostBack="True"></asp:DropDownList></td>
										<td width="80" align="right">月份</td>
										<td width="80">
											<asp:DropDownList id="ddl_default_Month" runat="server" Width="50px" AutoPostBack="True">
												<asp:ListItem Value="1">1</asp:ListItem>
												<asp:ListItem Value="2">2</asp:ListItem>
												<asp:ListItem Value="3">3</asp:ListItem>
												<asp:ListItem Value="4">4</asp:ListItem>
												<asp:ListItem Value="5">5</asp:ListItem>
												<asp:ListItem Value="6">6</asp:ListItem>
												<asp:ListItem Value="7">7</asp:ListItem>
												<asp:ListItem Value="8">8</asp:ListItem>
												<asp:ListItem Value="9">9</asp:ListItem>
												<asp:ListItem Value="10">10</asp:ListItem>
												<asp:ListItem Value="11">11</asp:ListItem>
												<asp:ListItem Value="12">12</asp:ListItem>
											</asp:DropDownList>
										</td>
										<td width="200"><asp:Button id="btn_update" onclick="btn_update_Click" runat="server" Height="22px" Text="儲存目前工作年月" title="儲存工作年月,下次登入時將以目前儲存之工作年月作為工作年月"></asp:Button><asp:Button id="btn_clear" Text="取消工作年月設定" title="清除工作年月設定,下次登入時將以系統年月作為目前工作年月" onclick="btn_clear_Click" runat="server"  Height="22px" ></asp:Button></td>
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
		<table border="1" cellpadding="0" style="display: block; border-collapse: collapse; margin-left: 10; margin-top: 5" bgcolor="#DADEE9" bordercolor="#666668">
			<tr>
				<td>
				<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
					<tr>
						<td>
						<table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed">
							<tr>
								<td width="100"><b>操作身分</b></td>
								<td width="100">　</td>
								<td width="100">　</td>
								<td width="100">　</td>
								<td width="100">　</td>
								<td width="100">　</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td><% Dim scrollPosURL As String = "ScrollPos.htc" %>
						<div id="_freezingDiv" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>" style="behavior: url(<%= resolveurl(scrollposurl)%>); width: 600px; height: 191px; overflow: auto; border-style: groove; border-width: 1px"><input id="savescrollpos" type="hidden" runat="server" name="savescrollpos">
						<asp:DataGrid id="grid_Main" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyField="PK_usrNo" GridLines="None" CellPadding="3" CellSpacing="1" BackColor="White" Borderstyle="None" OnItemDataBound="grid_Main_DataBound">
							<SelectedItemStyle font-bold="True" backcolor="DarkOrange"></SelectedItemStyle>
							<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
							<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
							<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<asp:CheckBox id="CheckBox1" runat="server" Checked='<%# IIf(Container.ItemIndex=grid_Main.SelectedIndex, True, False) %>' CssClass='<%# Container.ItemIndex %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.PK_usrNo") %>' AutoPostBack="True" CommandName="Select" OnCheckedChanged="CheckBox_CheckedChanged"></asp:CheckBox>
									</ItemTemplate>
								</asp:TemplateColumn>

								<asp:TemplateColumn HeaderText="部門">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_UnitName" runat="server" tooltip='<%# DataBinder.Eval(Container, "DataItem.DepCode") %>' text='<%# DataBinder.Eval(Container, "DataItem.dptName") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>

								<asp:TemplateColumn HeaderText="姓名">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="lab_UserName" runat="server" tooltip='<%# DataBinder.Eval(Container, "DataItem.usrAlias ") %>' text='<%# DataBinder.Eval(Container, "DataItem.usrName") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>

								<asp:BoundColumn DataField="usrAgentUsrName" HeaderText="指定代理人" Visible="True"></asp:BoundColumn>

								<asp:TemplateColumn HeaderText="代理期間">
									<HeaderStyle wrap="False"></HeaderStyle>
									<ItemStyle wrap="False" horizontalalign="Left"></ItemStyle>
									<ItemTemplate>
										&nbsp;<asp:Label runat="server" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.usrAgentSDate", "{0:yyyy/MM/dd}") & "") & IIf(DataBinder.Eval(Container, "DataItem.usrAgentSDate", "{0:yyyy/MM/dd}") & "" <> "", " 至 ", "") %>'></asp:Label><asp:Label runat="server" text='<%# ChtDate(DataBinder.Eval(Container, "DataItem.usrAgentEDate", "{0:yyyy/MM/dd}") & "") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>

								<asp:BoundColumn DataField="PK_usrNo" Visible="False" HeaderText="5"></asp:BoundColumn>
								<asp:BoundColumn DataField="usrAlias" Visible="False" HeaderText="6"></asp:BoundColumn>
								<asp:BoundColumn DataField="payKind" Visible="False" HeaderText="7"></asp:BoundColumn>
								<asp:BoundColumn DataField="payCode" Visible="False" HeaderText="8"></asp:BoundColumn>
								<asp:BoundColumn DataField="usrTeamCode" Visible="False" HeaderText="9"></asp:BoundColumn>
								<asp:BoundColumn DataField="usrLevel" Visible="False" HeaderText="10"></asp:BoundColumn>
								<asp:BoundColumn DataField="usrGroup" Visible="False" HeaderText="11"></asp:BoundColumn>

								<asp:BoundColumn DataField="usrDefYear" Visible="False" HeaderText="12"></asp:BoundColumn>
								<asp:BoundColumn DataField="usrDefMonth" Visible="False" HeaderText="13"></asp:BoundColumn>
							</Columns>
							<PagerStyle horizontalalign="Center" forecolor="DarkOrange" backcolor="#666668" mode="NumericPages"></PagerStyle>
						</asp:DataGrid>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<!-- Insert content here -->
		<asp:DataGrid id="DataGrid1" runat="server"></asp:DataGrid>
	</form>
</body>
</html>