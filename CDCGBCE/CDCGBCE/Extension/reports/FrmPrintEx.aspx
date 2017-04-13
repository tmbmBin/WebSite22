<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Configuration" %>
<script runat="server">

    Public strFrameSrc As String
	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Function get_Department(ByVal thisYear As Integer, ByVal thisMonth As Integer) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim maxDay As Integer = System.DateTime.DaysInMonth(thisYear + 1911, thisMonth)
		Dim sDay As String = thisYear + 1911 & "/" & thisMonth & "/" & 1
		Dim eDay As String = thisYear + 1911 & "/" & thisMonth & "/" & maxDay

		Dim queryString As String = "SELECT dptName AS [部門名稱], dptCode AS [部門代碼] FROM [codDepartName] " & _
							"WHERE ((ISNULL([dptCreateDate], '') <= '" & eDay & "') AND (ISNULL([dptStopFlag], '') <> 'Y') OR " & _
								"(ISNULL([dptCreateDate], '') <= '" & eDay & "') AND ([dptStopDate] > '" & eDay & "')) "& _
							"ORDER BY [dptCode]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_Workstation(thisDate As String, ByVal acmWorkUnitNo As String) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT * FROM [工作站名稱] "& _
							"WHERE ([部門代碼] = '" & acmWorkUnitNo & "') "& _
								"AND ((ISNULL(停用否, 'N') <> 'Y') "& _
								"OR (ISNULL(停用日期, '2100/12/31') >= '" & thisDate & "'))"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Sub get_default_Year()
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT DISTINCT [acmYear] FROM [actMain] ORDER BY [acmYear]"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		ddl_year.Items.Clear
		If dataSet.Tables(0).Rows.Count > 0 Then

			For i As Integer = 0 To dataSet.Tables(0).Rows.Count - 1
				ddl_year.Items.Add(New ListItem(Right("00" & dataSet.Tables(0).Rows(i).Item(0), 3), dataSet.Tables(0).Rows(i).Item(0)))
			Next i

			Dim next_year As Integer = dataSet.Tables(0).Rows(dataSet.Tables(0).Rows.Count-1).Item(0) + 1
			ddl_year.Items.Add(New ListItem(Right("00" & next_year, 3), next_year))
		Else
			ddl_year.Items.Add(New ListItem(Right("00" & System.DateTime.Now.Year - 1911, 3), System.DateTime.Now.Year - 1911))
		End If

		ddl_year.Items.Insert(0, New ListItem(Right("00" & Val(ddl_year.Items(0).Value) - 1, 3), Val(ddl_year.Items(0).Value) - 1))
		ddl_year.Items.Insert(0, New ListItem(Right("00" & Val(ddl_year.Items(0).Value) - 1, 3), Val(ddl_year.Items(0).Value) - 1))
	End Sub

	Sub Page_Init(sender as Object, e as EventArgs)
		get_default_Year()

		ddl_year.SelectedValue = ToolsFun.WebDateFun.GetWorkCYear()
		ddl_month.SelectedValue = ToolsFun.WebDateFun.GetWorkMonth()


	End Sub

	Dim thisDate As Date
	Dim thisYear, thisMonth As Integer

	Sub Page_Load(Sender As Object, E As EventArgs)
		If Session("default_UserName") Is Nothing Then
			Response.Redirect("../Default.aspx")
		End If

		If IsDate(Request.QueryString("date")) = True Then
			thisDate = Format(CDate(Request.QueryString("date")), "yyyy/MM/dd")
				 thisYear = thisDate.Year
			thisMonth = thisDate.Month
		Else
			thisDate = Format(System.DateTime.Now, "yyyy/MM/dd")
			thisYear = System.DateTime.Now.Year()
			thisMonth = System.DateTime.Now.Month()
		End If

		If Not Page.IsPostBack Then
			ddl_acmWorkUnitNo.DataSource = get_Department(thisYear, thisMonth)
			ddl_acmWorkUnitNo.DataBind()
			ddl_acmWorkUnitNo.Items.Insert(0, New ListItem("…", ""))

dim strModFlag as string = DB.sysMenu.DAT.sysMenuBZ.Request("mod")

			Select Case strModFlag
				Case "2"
					Try
						ddl_acmWorkUnitNo.SelectedValue = Session("default_UnitNo")

'						Dim e_ddl_acmWorkUnitNo As System.EventArgs
'						ddl_acmWorkUnitNo_SelectedIndexChanged(ddl_acmWorkUnitNo, e_ddl_acmWorkUnitNo)

'						ddl_acmWorkUnitSubNo.SelectedValue = Session("default_UnitSubNo")
					Catch
					End Try
				Case Else
					Try
						ddl_acmWorkUnitNo.SelectedValue = Session("default_UnitNo")
'						Dim e_ddl_acmWorkUnitNo As System.EventArgs
'						ddl_acmWorkUnitNo_SelectedIndexChanged(ddl_acmWorkUnitNo, e_ddl_acmWorkUnitNo)

'						ddl_acmWorkUnitSubNo.SelectedValue = Session("default_UnitSubNo")

						ddl_acmWorkUnitNo.Enabled = False
'						ddl_acmWorkUnitSubNo.Enabled = False
					Catch
					End Try
			End Select

			If Request.QueryString("rpt") <> Nothing Then
				Try
					ddl_report.SelectedValue = Request.QueryString("rpt")

					If Request.QueryString("rpt") = "31" Then
						rbl_acpPassFlag.Items(0).Selected = True
					End If
				Catch
					ddl_report.SelectedIndex = -1
					rbl_acpPassFlag.Items(0).Selected = True
				End Try
			End If
		End If
	End Sub

	Sub ddl_acmWorkUnitNo_SelectedIndexChanged(sender As Object, e As EventArgs)

		ddl_acmWorkUnitSubNo.DataSource = get_Workstation(thisDate, ddl_acmWorkUnitNo.SelectedValue)
		ddl_acmWorkUnitSubNo.DataBind()

		If ddl_acmWorkUnitSubNo.Items.Count > 0 Then
			ddl_acmWorkUnitSubNo.Items.Insert(0, New ListItem("…", ""))
		End If
	End Sub

	Function WindowOpen(thisUrl As String, thisName As String) As String
		Return "<script" & ">subWin = window.open('" & thisUrl & "','" & thisName & "','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no'); subWin.focus()</" & "script>"
	End Function

	Sub btn_print_Click(sender As Object, e As EventArgs)
		If ddl_acmWorkUnitNo.SelectedIndex = 0 Then
			Response.Write("<script" & ">self.alert('必須指定單位')</" & "script>")
		Else
			Select Case ddl_report.SelectedValue
				Case 31
                    'Response.Write(WindowOpen("Tab_31_P.aspx?year=" & ddl_year.SelectedValue & "&month=" & ddl_month.SelectedValue & "&UnitNo=" & ddl_acmWorkUnitNo.SelectedValue & "&UnitSubNo=" & ddl_acmWorkUnitSubNo.SelectedValue & _
                    '    "&UserNo=" & Server.UrlEncode(Trim(text_acmWorkUserNo.Text)) & _
                    '    "&Pass=" & rbl_acpPassFlag.SelectedValue & "&Bat=" & ddl_acpPassBat.SelectedValue & "&Prev=" & ddl_acvOutlayCodePrev.SelectedValue, "Print"))
                    
                    
                    strFrameSrc = "Tab_31_P.aspx?year=" & ddl_year.SelectedValue & "&month=" & ddl_month.SelectedValue & "&UnitNo=" & ddl_acmWorkUnitNo.SelectedValue & "&UnitSubNo=" & ddl_acmWorkUnitSubNo.SelectedValue & _
                        "&UserNo=" & Server.UrlEncode(Trim(text_acmWorkUserNo.Text)) & _
                        "&Pass=" & rbl_acpPassFlag.SelectedValue & "&Bat=" & ddl_acpPassBat.SelectedValue & "&Prev=" & ddl_acvOutlayCodePrev.SelectedValue
                    
                    
			End Select
		End If
	End Sub

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
<body topmargin="0" leftmargin="0">
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
				<table border="1" bordercolor="#666668" cellpadding="0" bgcolor="#DADEE9" style="border-collapse: collapse; margin-left: 10; margin-top: 10">
					<tr>
						<td>
						<table border="1" bordercolor="#FFFFFF" cellpadding="5" style="border-collapse: collapse">
							<tr>
								<td>
								<table border="0" cellpadding="5" cellspacing="0">
									<tr>
										<td width="100" align="right">報表名稱</td>
										<td width="200">
											<asp:DropDownList id="ddl_report" runat="server">
												<asp:ListItem Value="31">報支暨核支明細表</asp:ListItem>
											</asp:DropDownList>
										</td>
										<td width="100">　</td>
										<td width="100">　</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td>
								<table border="0" cellpadding="5" cellspacing="0">
									<tr>
										<td width="100" align="right">報支年度</td>
										<td width="100"><asp:DropDownList id="ddl_year" runat="server"></asp:DropDownList></td>
										<td width="100" align="right">報支月份</td>
										<td width="100">
											<asp:DropDownList id="ddl_month" runat="server">
												<asp:ListItem Value="0">…</asp:ListItem>
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
										<td width="100">　</td>
									</tr>
									<tr>
										<td width="100" align="right">單位</td>
										<td width="100"><asp:DropDownList id="ddl_acmWorkUnitNo" runat="server" DataTextField="部門名稱" DataValueField="部門代碼" ></asp:DropDownList></td>
										<td width="100" align="right">經手人</td>
										<td width="100"><asp:TextBox id="text_acmWorkUserNo" runat="server" Width="75px" MaxLength="6"></asp:TextBox></td>
										<td width="100">　</td>
									</tr>
									<tr style="display: none">
										<td width="100" align="right">工作站</td>
										<td width="200" colspan="2"><asp:DropDownList id="ddl_acmWorkUnitSubNo" runat="server" DataTextField="工作站名稱" DataValueField="工作站代碼"></asp:DropDownList></td>
										<td width="100" valign="top"><font size="2">(員工編號)</font></td>
										<td width="100">　</td>
									</tr>
									<tr style="display: none">
										<td width="100" align="right">批次</td>
										<td width="100"><asp:DropDownList id="ddl_acpPassBat" runat="server">
												<asp:ListItem></asp:ListItem>
												<asp:ListItem Value="1">1</asp:ListItem>
												<asp:ListItem Value="2">2</asp:ListItem>
												<asp:ListItem Value="3">3</asp:ListItem>
												<asp:ListItem Value="4">4</asp:ListItem>
												<asp:ListItem Value="5">5</asp:ListItem>
												<asp:ListItem Value="6">6</asp:ListItem>
												<asp:ListItem Value="7">7</asp:ListItem>
												<asp:ListItem Value="8">8</asp:ListItem>
												<asp:ListItem Value="9">9</asp:ListItem>
											</asp:DropDownList></td>
										<td width="100" align="right">列印範圍</td>
										<td width="200" colspan="2"><asp:DropDownList id="ddl_acvOutlayCodePrev" runat="server">
												<asp:ListItem Value="">全部</asp:ListItem>
												<asp:ListItem Value="0291">只列出旅費</asp:ListItem>
												<asp:ListItem Value="!0291">不列出旅費</asp:ListItem>
											</asp:DropDownList></td>
									</tr>
									<tr>
										<td width="100" align="right">審核狀態</td>
										<td width="200" colspan="2"><asp:RadioButtonList ID="rbl_acpPassFlag" runat="server" Font-Size="X-Small" RepeatDirection="Horizontal">
												<asp:ListItem Value="1">已審</asp:ListItem>
												<asp:ListItem Value="0">未審</asp:ListItem>
											</asp:RadioButtonList>
										</td>
										<td width="100" valign="top">　</td>
										<td width="100">　</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td>
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="100"><asp:Button id="btn_print" runat="server" Text="列印" Width="50px" onclick="btn_print_Click"></asp:Button></td>
										<td width="100">　</td>
										<td width="100">　</td>
										<td width="100">　</td>
										<td width="100">　</td>
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
		<iframe  id="rptFrame" name="rptFrame" border="0" frameborder="0" width="100%" scrolling="no"  height=100%  src="<%=strFrameSrc%>"></iframe>                             </td>

		<!-- Insert content here -->
	</form>
</body>
</html>
