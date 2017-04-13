<%@ Page Language="VB" debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Function get_members() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT sysBaseUser.PK_usrNo As [mNo], " & _
											"sysBaseUser.usrName, " & _
											"sysBaseUser.DepCode, " & _
											"codDepartName.dptName, " & _
											"sysBaseUser.usrName + ' (' + ISNULL(codDepartName.dptName,'') + ')' AS [mName] " & _
									"FROM [sysBaseUser] " & _
										"LEFT OUTER JOIN [codDepartName] ON sysBaseUser.DepCode = codDepartName.dptCode " & _
									"ORDER BY sysBaseUser.DepCode, sysBaseUser.PK_usrNo"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_groups() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [PK_grpNo] AS [gNo], " & _
											"[grpName] AS [gName] " & _
									"FROM [sysGroupName] " & _
									"ORDER BY 1"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function get_memberGroups(ByVal pK_usrNo As Integer) As System.Data.DataTable
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [PK_grpNo] FROM [sysUserPower] " & _
									"WHERE ([PK_usrNo] = @PK_usrNo) " & _
									"ORDER BY 1"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dbParam_pK_usrNo As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
		dbParam_pK_usrNo.ParameterName = "@PK_usrNo"
		dbParam_pK_usrNo.Value = pK_usrNo
		dbParam_pK_usrNo.DbType = System.Data.DbType.Int32
		dbCommand.Parameters.Add(dbParam_pK_usrNo)

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet.Tables(0)
	End Function

	Dim memberNum As Integer

	Sub Page_Load(sender As Object, e As EventArgs)
		If Not Page.IsPostBack Then

			list_members.DataSource = get_members()
			list_members.DataBind()
			memberNum = list_members.Items.Count

			cbl_groups.DataSource = get_groups()
			cbl_groups.DataBind()

			list_members.Attributes.Add("onChange","DoCallback(this[this.selectedIndex].value);")
		End If
	End Sub

	Sub list_members_SelectedIndexChanged(sender As Object, e As EventArgs)
		Dim mNo As Integer = list_members.SelectedItem.Value
'Response.Write(mNo & "<hr>")
		Dim DT As System.Data.DataTable = get_memberGroups(mNo)
		If list_members.Items.Count = 0 Then
			cbl_groups.DataSource = get_groups()
			cbl_groups.DataBind()
		End If

		ChkCBL(cbl_groups, DT)
	End Sub

' OnSelectedIndexChanged="list_members_SelectedIndexChanged" AutoPostBack="false"

	Sub ChkCBL(ByRef CBL As CheckBoxList, ByVal DT As System.Data.DataTable)
		If DT.Rows.Count > 0 Then
			For i As Integer = 0 To CBL.Items.Count-1
				Dim foundRows() As System.Data.DataRow
					foundRows = DT.Select("PK_grpNo = " & Val(CBL.Items(i).Value) )
'Response.Write(i & ": " & "PK_grpNo = " & Val(CBL.Items(i).Value) & ";COUNT: " & DT.Rows.Count & "<br>")
				If UBound(foundRows) <> -1 Then
					CBL.Items(i).Selected = True
				Else
					CBL.Items(i).Selected = False
				End If

			Next i
		End If
	End Sub

	Sub UnChkCBL(ByRef CBL As CheckBoxList)
		If CBL.Items.Count > 0 Then
			For i As Integer = 0 To CBL.Items.Count - 1
				CBL.Items(i).Selected = False
			Next i
		End If
	End Sub

	Sub cbl_groups_SelectedIndexChanged(sender As Object, e As EventArgs)

	End Sub

	Sub cbl_groups_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
		For i As Integer = 0 To sender.Items.Count -1
			sender.Items(i).Attributes.Add("onclick","alert(this[this.selectedIndex].value);")
		Next i
	End Sub

' OnDataBound="cbl_groups_DataBound"
' OnSelectedIndexChanged="cbl_groups_SelectedIndexChanged" AutoPostBack="false"

	Sub btn_update_Click(sender As Object, e As EventArgs)
		Dim mNo As Integer = list_members.SelectedItem.Value
		Dim delStr As String = "DELETE FROM sysUserPower WHERE (PK_usrNo = " & mNo & ");"
		Dim updStr As String = ""

		If cbl_groups.Items.Count > 0 Then
			For i As Integer = 0 To cbl_groups.Items.Count-1
				If cbl_groups.Items(i).Selected = True Then
'Response.Write(i & ": " & cbl_groups.Items(i).Value & " " & cbl_groups.Items(i).Text & "<br>")

					updStr &= "INSERT INTO sysUserPower " & _
								"(PK_usrNo, PK_grpNo, powEditName, powEditDTime) " & _
								"VALUES " & _
								"(" & _
								mNo & ", " & _
								cbl_groups.Items(i).Value & ", " & _
								"'" & Session("login_UserName") & "', " & _
								"getdate()" & _
								");"
				End If
			Next i
'Response.Write(Replace(delStr & updStr,";",";<br>"))
			Try
				MsDbFun.GetDbExec(delStr & updStr)
				ToolsFun.WebScriptFun.Show("更新 群組 完畢。")
			Catch
				ToolsFun.WebScriptFun.Show("更新 群組 時發生錯誤！")
			End Try
		End If
	End Sub


	Public Sub CallBack1_Callback(ByVal sender As Object, ByVal e As ComponentArt.Web.UI.CallBackEventArgs)
		Literal1.Text = ""

		Dim mNo As Integer = e.Parameter
		Dim DT As System.Data.DataTable = get_memberGroups(mNo)
		If list_members.Items.Count = 0 Then
			cbl_groups.DataSource = get_groups()
			cbl_groups.DataBind()
		End If

		ChkCBL(cbl_groups, DT)

		'Literal1.Text = "傳入 " & mNo & "，找到群組 " & DT.Rows.Count()

		'cbl_groups.RenderControl(e.Output)	'已被DIV包含，故只需div1.RenderControl

		Literal1.RenderControl(e.Output)
		div1.RenderControl(e.Output)
	End Sub

</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<script language="javascript">
function DoCallback(param)
{
	Callback1.Callback(param);
}
</script>
</head>
<body style="background-image: url('images/bg_FFFFFF_D4DEF4.gif'); background-repeat: repeat-x; background-position-y: top; background-attachment: fixed" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<form runat="server">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top: -5; background-image: url('images/header_bg.gif'); background-repeat: repeat-x; background-position: left top" height="45">
			<tr>
				<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="45">
					<tr>
						<td style="background-image: url('images/header_right.gif'); background-repeat: no-repeat; background-position: right bottom">
						<table border="0" cellpadding="0" cellspacing="0" height="45">
							<tr>
								<td valign="bottom" width="58" rowspan="2"><img border="0" src="images/header_left.gif" width="58" height="33"></td>
								<td height="24" valign="bottom" nowrap>　</td>
							</tr>
							<tr>
								<td height="21" valign="top" nowrap><p style="margin-top: 0px"><font size="2">人員所屬群組</font></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table style="margin-left: 15; margin-top: 15" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="150">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img border="0" src="images/icon_group.gif" width="16" height="16"></td>
							<td style="padding-left: 1px"><p style="margin-top: 2px"><font size="2" color="#000080">現有成員<font face="Verdana" size="1"> (<%=list_members.Items.Count %>)</font></font></td>
						</tr>
					</table>
				</td>
				<td align="middle" width="35">
				</td>
				<td width="150">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img border="0" src="images/icon_gmember.gif" width="16" height="16"></td>
							<td style="padding-left: 1px" nowrap><p style="margin-top: 2px"><font size="2" color="#000080">現有群組</font></td>
						</tr>
					</table>
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
			<tr>
				<td width="150">
					<asp:ListBox id="list_members" runat="server" Height="294px" Width="150px" DataTextField="mName" DataValueField="mNo"></asp:ListBox>
				</td>
				<td align="middle" width="35">
				</td>
				<td width="150" valign="top">
				<ComponentArt:Callback id="Callback1" runat="server" OnCallback="CallBack1_Callback">
					<Content>
						<div id="div1" runat="server" style="height: 294px; width: 150px; Overflow: auto; border-style: inset; border-width: 2px; background-color: #FFFFFF">
							<asp:CheckBoxList id="cbl_groups" runat="server" CellPadding="0" CellSpacing="0" Font-Size="10pt" DataTextField="gName" DataValueField="gNo"></asp:CheckBoxList>
						</div>
					</Content>
				</ComponentArt:Callback>
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
			<tr>
				<td width="150" style="padding-top: 2px" valign="top">
				</td>
				<td align="middle" width="35" style="padding-top: 5px" valign="top">
				</td>
				<td width="150" style="padding-top: 2px" valign="top">
					<asp:Button id="btn_update" runat="server" Height="22px" Width="150px" Text="儲存" onclick="btn_update_Click"></asp:Button>
				</td>
				<td align="middle" width="50" style="padding-top: 5px" valign="top">
				</td>
				<td width="100" valign="top">
				</td>
			</tr>
			<tr>
				<td width="150">
				</td>
				<td align="middle" width="35">
				</td>
				<td width="150">
				</td>
				<td align="middle" width="50">
				</td>
				<td width="100">
				</td>
			</tr>
		</table>
		<asp:Literal id="Literal1" runat="server"></asp:Literal>
		<!-- Insert content here -->
	</form>
</body>
</html>
