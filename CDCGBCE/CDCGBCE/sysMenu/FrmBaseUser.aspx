<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmBaseUser.aspx.vb" Inherits="lsbAct.FrmBaseUser" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmBaseUser</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
		<link href="../calendarStyle.css" type="text/css" rel="stylesheet">
		<script language="javascript">

		function fnCallSearchDialog(){

		var strReturnVal=showModalDialog("FrmSortBaseUser.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel" )
			{
				Form1.TBFindSql.value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}

function fnGetAgentStaff(){


	var strReturnVal=showModalDialog("FrmChooseAgentStaff.aspx",window,"dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel" )
			{

			var tmpArray=strReturnVal.split(":");

				objSet = document.Form1.DDLAgentStaff;

				objSet.options[0]=new Option(tmpArray[0] +' ' +tmpArray[1],tmpArray[0]);

			}

		//Form1.TBFindSql.value=strReturnVal;

		}



		function UCBDate_Change(calendar){
var lbl_acmTrlStaySDate = document.getElementById("TBBDate");
var vDay = new Date(calendar.GetSelectedDate());
lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
}


function UCEDate_Change(calendar){
var lbl_acmTrlStaySDate = document.getElementById("TBEDate");
var vDay = new Date(calendar.GetSelectedDate());
lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
}



<!--
function go_left_top(){
gift.style.left=document.body.scrollLeft;
gift.style.top=document.body.scrollTop;}
//-->
</script>
</HEAD>
<body onresize="go_left_top()" style="BACKGROUND-ATTACHMENT: fixed; BACKGROUND-POSITION-Y: top; BACKGROUND-IMAGE: url(images/background_gradient.jpg); BACKGROUND-REPEAT: repeat-x" onscroll="go_left_top()" bottomMargin="50" leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
	<form id="Form1" method="post" runat="server">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
			<table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 10" bgcolor="#DADEE9" bordercolor="#666668">
				<tr>
					<td>
					<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
						<tr>
							<td>
							<table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed">
								<tr>
									<td width="100">�@</td>
									<td width="100">�@</td>
									<td width="100">�@</td>
									<td width="100">�@</td>
									<td width="100">�@</td>
									<td width="100">�@</td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<table border="0" cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed">
								<tr>
									<td width="100" align="right"><FONT color="#ff0066">*</FONT>�b��</td>
									<td width="200"><asp:TextBox id="TBUserID" runat="server"></asp:TextBox></td>
									<td width="100" align="right">�s��</td>
									<td width="200"><asp:DropDownList id="DDLGroup" runat="server"></asp:DropDownList></td>
								</tr>
								<tr>
									<td width="100" align="right"><FONT color="#ff0066">*</FONT>�K�X</td>
									<td width="200"><asp:TextBox id="TBUserPass" runat="server"></asp:TextBox></td>
									<td width="100" align="right">�v��</td>
									<td width="200"><asp:TextBox id="TBLevel" runat="server"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right"><FONT color="#ff0066">*</FONT>�m�W</td>
									<td width="200"><asp:TextBox id="TBUserName" runat="server"></asp:TextBox></td>
									<td width="100" align="right">�@�~�~��</td>
									<td width="200"><asp:TextBox id="TBYear" runat="server"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">�����Ҧr��</td>
									<td width="200"><asp:TextBox id="TBPersonID" runat="server"></asp:TextBox></td>
									<td width="100" align="right">���</td>
									<td width="200"><asp:TextBox id="TBMonth" runat="server"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">���</td>
									<td width="200"><asp:DropDownList id="DDLTeam" runat="server" AutoPostBack="True"></asp:DropDownList></td>
									<td width="100" align="right">�H���W��</td>
									<td width="200"><asp:DropDownList id="DDLStaffName" runat="server"></asp:DropDownList></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<table border="0" cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed">
								<tr>
									<td width="100" align="right">�N�z�H</td>
									<td width="500"><asp:DropDownList id="DDLAgentStaff" runat="server" AutoPostBack="True"></asp:DropDownList><INPUT type="button" value="..." onclick="fnGetAgentStaff();" id="TBAgent" name="Button1" style="width: 22px; height: 22px" runat="server"><asp:TextBox id="TBSerialNo" runat="server" Width="0px"></asp:TextBox></td>
								</tr>
								<tr>
									<td width="100" align="right">�N�z����</td>
									<td width="500">
									<table border="0" cellpadding="2" cellspacing="0">
										<tr>
											<td><asp:textbox id="TBBDate" style="TEXT-ALIGN: center" runat="server" Width="80px" ReadOnly="True" ondblclick="JavaScript: UCBDate.Show();"></asp:textbox><COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR></td>
											<td>��</td>
											<td><asp:textbox id="TBEDate" style="TEXT-ALIGN: center" runat="server" Width="80px" ReadOnly="True" ondblclick="JavaScript: UCEDate.Show();"></asp:textbox><COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							</td>
						</tr>
						</table>
					</td>
				</tr>
			</table>
			</td>
			<td valign="top" style="padding-left: 5px; padding-top: 10px" width="160"><!-- include file="../watch.html" --></td>
		</tr>
	</table>
	<table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 5" bgcolor="#DADEE9" bordercolor="#666668">
		<tr>
			<td>
			<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
				<tr>
					<td>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><asp:button id="BtnAdd" runat="server" Width="50px" Height="22" Text="�s�W"></asp:button></td>
							<td><asp:button id="BtnEdit" runat="server" Width="50px" Height="22" Text="�ק�"></asp:button></td>
							<td><asp:button id="BtnDelete" runat="server" Width="50px" Height="22" Text="�R��"></asp:button></td>
							<td><asp:button id="BtnSave" runat="server" Width="50px" Height="22" Text="�x�s"></asp:button></td>
							<td><asp:button id="BtnCancel" runat="server" Width="50px" Height="22" Text="����"></asp:button></td>
							<td><asp:button id="BtnSearch" runat="server" Width="50px" Height="22" Text="�d��"></asp:button></td>
							<td><asp:button id="BtnPrint" runat="server" Width="50px" Height="22" Text="�C�L"></asp:button></td>
							<td style="display: none"><asp:button id="BtnExit" runat="server" Width="50px" Height="22" Text="���}"></asp:button></td>
							<td><INPUT id="TBFindSql" type="text" name="Text1" runat="server" style="WIDTH: 0px; HEIGHT: 22px" size="1"><INPUT id="TBOrderTxt" type="text" name="Text1" runat="server" style="WIDTH: 0px; HEIGHT: 22px" size="1"></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<div id="_freezingDiv" style="width: 600px; height: auto; overflow: auto; border-style: groove; border-width: 1px">
						<asp:datagrid id="DataGrid1" runat="server" Borderstyle="None" BackColor="White" CellSpacing="1" CellPadding="3" GridLines="None" Width="100%" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True">
							<SelectedItemStyle font-bold="True" backcolor="DarkOrange"></SelectedItemStyle>
							<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
							<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
							<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
							<Columns>
								<asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select">
									<HeaderStyle HorizontalAlign="Center" Width="1cm"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:ButtonColumn>
								<asp:BoundColumn Visible="False" DataField="PK_usrNo" HeaderText="PK_usrNo"></asp:BoundColumn>
								<asp:BoundColumn DataField="usrName" SortExpression="usrName" HeaderText="�m�W">
									<HeaderStyle Width="3cm"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="usrAlias" SortExpression="usrAlias" HeaderText="�b��"></asp:BoundColumn>
								<asp:BoundColumn DataField="AgentName" SortExpression="AgentName" HeaderText="�N�z�H"></asp:BoundColumn>
							</Columns>
							<PagerStyle horizontalalign="Center" forecolor="DarkOrange" backcolor="#666668" mode="NumericPages"></PagerStyle>
						</asp:datagrid>
					</div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>