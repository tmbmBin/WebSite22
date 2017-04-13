<%@ Page Language="VB" Debug="True" validateRequest="False" Trace="False" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="DB.DbSum.DAT" %>
<%@ Import Namespace="ToolsFun" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script runat="server">

	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

	Function get_sysBaseUser(ByVal usrAlias As String) As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT a.PK_usrNo, a.usrAlias, a.usrName, a.DepCode, codDepartName.dptName, " & _
											"a.usrAgentUsrNo, b.usrAlias AS usrAgentUsrAlias, b.usrName AS usrAgentUsrName, " & _
											"a.usrAgentSDate, a.usrAgentEDate " & _
									"FROM sysBaseUser AS a " & _
										"LEFT OUTER JOIN sysBaseUser AS b ON a.usrAgentUsrNo = b.PK_usrNo " & _
										"LEFT OUTER JOIN codDepartName ON a.DepCode = codDepartName.dptCode " & _
									"WHERE (a.[usrAlias] = @usrAlias)"
'Response.Write(queryString.Replace("@usrAlias", "'" & usrAlias &"'"))
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

		Dim dbParam_usrAlias As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
			dbParam_usrAlias.ParameterName = "@usrAlias"
			dbParam_usrAlias.Value = usrAlias
			dbParam_usrAlias.DbType = System.Data.DbType.String
			dbCommand.Parameters.Add(dbParam_usrAlias)

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
			dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Function upd_usrAgent(ByVal pK_usrNo As Integer, _
							Optional ByVal usrAgentUsrNo As Object = Nothing, _
							Optional ByVal usrAgentSDate As Object = Nothing, _
							Optional ByVal usrAgentEDate As Object = Nothing) As Integer

		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "UPDATE [sysBaseUser] " & _
									"SET [usrAgentUsrNo]=@usrAgentUsrNo, " & _
										"[usrAgentSDate]=@usrAgentSDate, " & _
										"[usrAgentEDate]=@usrAgentEDate " & _
									"WHERE ([PK_usrNo] = @PK_usrNo)"

		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
			dbCommand.CommandText = queryString
			dbCommand.Connection = dbConnection

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@PK_usrNo", pK_usrNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@usrAgentUsrNo", usrAgentUsrNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@usrAgentSDate", usrAgentSDate))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@usrAgentEDate", usrAgentEDate))

		Dim rowsAffected As Integer = 0
		dbConnection.Open
		Try
			rowsAffected = dbCommand.ExecuteNonQuery
		Finally
			dbConnection.Close
		End Try

		Return rowsAffected
	End Function

	Function get_Members() As System.Data.IDataReader
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT [PK_usrNo], [UsrAlias], [UsrName], ISNULL([DepCode], '') AS [dptName] " & _
									"FROM [sysBaseUser] " & _
									"ORDER BY [usrTeamCode], [UsrAlias]"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		dbConnection.Open
		Dim dataReader As System.Data.IDataReader

		dataReader = dbCommand.ExecuteReader

		Do While dataReader.Read

			Dim thisItem As New ListItem()
				thisItem.Text = dataReader("UsrAlias") & " " & dataReader("UsrName") '& "(" & get_UnitName(dataReader("dptName")) & ")"
				thisItem.Value = dataReader("PK_usrNo")

			list_members.Items.Add(thisItem)
		Loop

		dataReader.Close
		dbConnection.Close
	End Function

	Function get_UnitName(thisNo As String) As String
		Return thisNo
		'Dim queStr As String = "SELECT [部門名稱] FROM [部門名稱] WHERE (部門代碼='" & thisNo & "')"
		'Try
		'	Return MySqlDbReader(queStr) & ""
		'Catch ex as Exception
		'	Return ""
		'End Try
	End Function


	Sub Initialize()

		text_pK_usrNo.Text = ""
			text_pK_usrNo.ToolTip = ""
		text_usrAgentUsrNo.Text = ""
			text_usrAgentUsrNo.ToolTip = ""
		text_usrAgentSDate.Text = "　/　/　"
		text_usrAgentEDate.Text = "　/　/　"


		Dim DT As DataTable = get_sysBaseUser(Session("default_UserAlias")).Tables(0)
		If DT.Rows.Count > 0 Then
			text_pK_usrNo.Text = Trim(DT.Rows(0)("usrAlias") & " " & DT.Rows(0)("usrName"))
				text_pK_usrNo.ToolTip = DT.Rows(0)("PK_usrNo") & ""

			text_usrAgentUsrNo.Text = Trim(DT.Rows(0)("usrAgentUsrAlias") & " " & DT.Rows(0)("usrAgentUsrName"))
				text_usrAgentUsrNo.ToolTip = DT.Rows(0)("usrAgentUsrNo") & ""
				hid_usrAgentUsrNo.Value = DT.Rows(0)("usrAgentUsrNo") & ""

			If IsDate(DT.Rows(0)("usrAgentSDate") & "") = True Then
				text_usrAgentSDate.Text = ChtDate(DT.Rows(0)("usrAgentSDate") & "")
			End If
			If IsDate(DT.Rows(0)("usrAgentEDate") & "") = True Then
				text_usrAgentEDate.Text = ChtDate(DT.Rows(0)("usrAgentEDate") & "")
			End If
		End If
	End Sub


	Sub Page_Load(sender As Object, e As EventArgs)

		If Session("default_UserName") Is Nothing Then
			Response.Redirect("Default.aspx")
		End If

		If Not Page.IsPostBack Then
			Initialize()

			Call get_Members()
		End If
	End Sub


	Sub btn_reset_Click(sender As Object, e As EventArgs)

		upd_usrAgent(text_pK_usrNo.ToolTip)

		Initialize()

	End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)
		Dim errMsg As String = ""
		Dim sDay, eDay As String
		Dim pK_usrNo, usrAgentUsrNo As String

		If IsDate(ToolsFun.WebDateFun.StrToDate(text_usrAgentSDate.Text)) = False Then
			text_usrAgentSDate.Text = "　/　/　"
			If text_usrAgentUsrNo.Text <> "" Then errMsg &= "代理[起始日期]格式錯誤或不得為空白。\n\n"
		Else
			text_usrAgentSDate.Text = ChtDate(ToolsFun.WebDateFun.StrToDate(text_usrAgentSDate.Text))
			sDay = ToolsFun.WebDateFun.StrToDate(text_usrAgentSDate.Text)
		End If

		If IsDate(ToolsFun.WebDateFun.StrToDate(text_usrAgentEDate.Text)) = False Then
			text_usrAgentEDate.Text = "　/　/　"
			If text_usrAgentUsrNo.Text <> "" Then errMsg &= "代理[終止日期]格式錯誤或不得為空白。\n\n"
		Else
			text_usrAgentEDate.Text = ChtDate(ToolsFun.WebDateFun.StrToDate(text_usrAgentEDate.Text))
			eDay = ToolsFun.WebDateFun.StrToDate(text_usrAgentEDate.Text)
		End If

		pK_usrNo = text_pK_usrNo.ToolTip
		usrAgentUsrNo = hid_usrAgentUsrNo.Value
		If usrAgentUsrNo = "" Then
			sDay = Nothing
			eDay = Nothing
		End If

		If upd_usrAgent(pK_usrNo, usrAgentUsrNo, sDay, eDay) < 0 Then

			Response.Write("<script" & ">self.alert('變更代理人設定時發生錯誤。')</" & "script>")
		Else
			Initialize()

			Response.Write("<script" & ">self.alert('儲存變更成功。')</" & "script>")
		End If


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
<title>代理人設定</title>
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache,must-revalidate" />
<link href="CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />

<script language="javascript">
<!--

function jRight(text, numb){
	var str = text;
	str = str.substring(str.length-numb, str.length);
	return str;
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
	ControlToAssign.value = (vDay.getFullYear()-1911) + '/' + jRight('0' + (vDay.getMonth()+1),2) + '/' + jRight('0' + vDay.getDate(), 2);
	ControlToAssign.fireEvent('onchange');
}


function fnCallFindStaffDialog(thisName) {

    var strReturnVal = showModalDialog("UI.SystemData.Web/FrmSysBaseUserPicker.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    //			alert(strReturnVal);
    //			alert(thisName);

    if (strReturnVal != "Cancel") {
       
        var strVal = strReturnVal.split("│");
       
        if (strVal.length <= 1)
        {
            document.all("hid_usrAgentUsrNo").value = strVal[0];
            document.all("text_usrAgentUsrNo").value = strVal[0];
        }
        else
        {
            document.all("hid_usrAgentUsrNo").value = strVal[0];
            document.all("text_usrAgentUsrNo").value = strVal[1];
        }
        
        
        


        selectDDLitemByValue(thisName, strReturnVal, '', true)
        //document.all(thisName).value = document.all(thisName).value + strReturnVal;
    }

    //Form1.TBFindSql.value=strReturnVal;

}
//-->
</script>

</head>
<body>
	<form runat="server">
		<!-- Multi-Calendar Start -->
		<div id="oDiv" style="position: absolute; width: 1px; height: 1px; overflow:hidden"><asp:TextBox id="txt_oDiv" runat="server"></asp:TextBox></div>
		<COMPONENTART:CALENDAR id="Calendar1" runat="server" CultureId="1028" CalendarTitleCssClass="ctitle" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="images/cal_nextMonth.gif" PrevImageUrl="images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUp="Custom" ClientSideOnSelectionChanged="onCalendar_Control_Change" PopUpExpandControlId="txt_oDiv"></COMPONENTART:CALENDAR>
		<!-- Multi-Calendar End -->

		<table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 5" bgcolor="#DADEE9" bordercolor="#666668">
			<tr>
				<td>
				<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
					<tr>
						<td>
						<table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed">
							<tr>
								<td width="130"><b>代理人設定</b></td>
								<td width="70">　</td>
								<td width="30">　</td>
								<td width="180">　</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>

						<table border="0" cellpadding="0" cellspacing="3">
							<tr>
								<td width="70">被代理人</td>
								<td width="130"><asp:TextBox id="text_pK_usrNo" runat="server" BackColor="Transparent" Width="190px" ReadOnly="True"></asp:TextBox></td>
								<td width="30">　</td>
								<td width="180">　</td>
							</tr>
							<tr>
								<td width="410" colspan="4"><hr noshade color="#FFFFFF" size="1" width="100%"></td>
							</tr>
							<tr>
								<td width="70">代理期間</td>
								<td width="310" colspan="3">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td><font size="2">始於</font>&nbsp;</td>
										<td><asp:TextBox id="text_usrAgentSDate" runat="server" style="TEXT-ALIGN: center" Width="70px" class="applyBorder" onfocus="this.select();" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x; oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;">099/12/31</asp:TextBox></td>
										<td>&nbsp;<font size="2">至</font>&nbsp;</td>
										<td><asp:TextBox id="text_usrAgentEDate" runat="server" style="TEXT-ALIGN: center" Width="70px" class="applyBorder" onfocus="this.select();" onContextmenu="JavaScript: oDiv.style.left=realPosition(this).x; oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;">099/12/31</asp:TextBox></td>
										<td>&nbsp;<font size="2">終止</font></td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td width="70" valign="top">代理人</td>
								<td width="310" colspan="3">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td valign="top"><asp:TextBox id="text_usrAgentUsrNo" runat="server" Width="120px" onfocus="this.blur()" onmouseover="this.title=hid_usrAgentUsrNo.value"></asp:TextBox><input type="hidden" id="hid_usrAgentUsrNo" runat="server" name="hid_usrAgentUsrNo" />
                                            <br />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" Font-Size="X-Small">備註：<br>終止日為當日生效 <br />(EX:11/20到11/21為代理期間，則僅11/20號當天代理<br />，11/21當天停止代理，故僅代理11/20日一天。)</asp:Label></td>
										<td valign="top" nowrap>&nbsp;<font size="2">« 選取</font>&nbsp;</td>
										<td>
                                                <input id="BtnFindStaff" onclick='fnCallFindStaffDialog("DDLStaffName");'  type="button" value="..." runat =server title="尋找員工資料" visible="true" /><br /><asp:ListBox id="list_members" runat="server" Width="175px" Rows="20" SelectionMode="Multiple" ondblclick="text_usrAgentUsrNo.value=this.options[this.selectedIndex].text;hid_usrAgentUsrNo.value=this.options[this.selectedIndex].value"></asp:ListBox></td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td width="410" colspan="4"><hr noshade color="#FFFFFF" size="1" width="100%"></td>
							</tr>
							<tr>
								<td width="410" colspan="4">
									<asp:Button id="btn_reset" onclick="btn_reset_Click" runat="server" Text="清除設定" Height="22px"></asp:Button>
									<asp:Button id="btn_update" onclick="btn_update_Click" runat="server" Text="儲存變更" Height="22px"></asp:Button>
								</td>
							</tr>
						</table>

						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>

		<!-- Insert content here -->
	</form>
	<script language="javascript">
	<!--
		window.cart_calendar_PostBackOnSameSelection = true; //COMPONENTART:CALENDAR
	//-->
	</script>
</body>
</html>
