<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmTeamCode.aspx.vb" Inherits="UI.BasicData.Web.FrmTeamCode"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>���O�N�X���@</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript">


		function UCCDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBCreateDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function UCSDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBStopDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}


		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="table8" style="MARGIN-TOP: 10px; Z-INDEX: 101; LEFT: 20px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellSpacing="0" cellPadding="0" width="600" bgColor="#dadee9"
				border="1">
				<tr>
					<td>
						<table id="table9" style="BORDER-COLLAPSE: collapse" borderColor="#f8f8fa" cellSpacing="0"
							cellPadding="1" width="100%" bgColor="#dadee9" border="1">
							<tr>
								<td>
									<table id="table6" style="WIDTH: 500px; HEIGHT: 168px" cellSpacing="0" cellPadding="1"
										border="0">
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�b�O�N�X</font></td>
											<td width="158"><asp:textbox id="TBID" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
											<td align="right" width="83"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">�C�L�N��</FONT></td>
											<td width="162"><asp:textbox id="TBNo" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�C�L�W��</font></td>
											<td ><asp:textbox id="TBAliasName" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
											<td align="right" width="89" style="Display:None"><font style="FONT-SIZE: 11pt" face="�s�ө���">�b�O����</font></td>
											<td><asp:textbox id="TBCategory" runat="server" Width="100%" MaxLength="5" style="Display:None"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�b�O�W��</font></td>
											<td colSpan="3"><asp:textbox id="TBName" runat="server" Width="100%" MaxLength="60"></asp:textbox></td>
										</tr>
										<tr style="Display:None">
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�b�O�ŧO</font></td>
											<td width="158"><asp:textbox id="TBLevel" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
											<td style="WIDTH: 83px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">���ޥ���</font></td>
											<td width="162"><asp:dropdownlist id="DDLCtrlAll" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�w�]����</font></td>
											<td><asp:dropdownlist id="DDLDefDep" runat="server" Width="100%"></asp:dropdownlist></td>
											<td align="right" width="83" height="31"><font style="FONT-SIZE: 11pt" face="�s�ө���">�إߤ��</font></td>
											<td width="162" height="31"><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" Width="100%"
													MaxLength="10"></asp:textbox><COMPONENTART:CALENDAR id="UCCDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
													DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long"
													NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBCreateDate"
													PopUp="Custom" ClientSideOnSelectionChanged="UCCDate_Change" cultureid="1028"></COMPONENTART:CALENDAR></td>
										</tr>
										<tr>
											<td style="WIDTH: 89px" align="right" height="31"><font style="FONT-SIZE: 11pt" face="�s�ө���">�O�_����</font></td>
											<td width="158" height="31"><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
											<td style="WIDTH: 83px" align="right">���Τ��</td>
											<td width="162"><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" Width="100%"
													MaxLength="10"></asp:textbox><COMPONENTART:CALENDAR id="UCSDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
													DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long"
													NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBStopDate"
													PopUp="Custom" ClientSideOnSelectionChanged="UCSDate_Change" cultureid="1028"></COMPONENTART:CALENDAR></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left">
						<table id="table11" style="MARGIN-TOP: 10px; Z-INDEX: 102; BORDER-COLLAPSE: collapse" borderColor="#f8f8fa"
							cellSpacing="0" cellPadding="0" border="1">
							<tr>
								<td>
									<table id="table12" style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" borderColor="#f8f8fa"
										cellSpacing="0" cellPadding="5" bgColor="#dadee9" border="1">
										<tr>
											<td>
												<table id="table17" cellSpacing="0" cellPadding="0" border="0">
													<tr>
														<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="�s�W" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="�ק�" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="�R��" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="�x�s" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="����" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="�d��" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="�C�L" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Text="���}" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True">��J�b�O�N�X</asp:textbox></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
																value="s" name="btn_goto"></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
																runat="server">
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" Height="72px" AllowPaging="True" CellPadding="3"
													BorderColor="White" BorderWidth="1px" AutoGenerateColumns="False" BackColor="White" BorderStyle="None">
													<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
													<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
													<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
													<ItemStyle Font-Size="X-Small" Font-Names="�s�ө���" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
													<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
													<Columns>
														<asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select"></asp:ButtonColumn>
														<asp:BoundColumn DataField="teaCode" HeaderText="�b�O�N�X"></asp:BoundColumn>
														<asp:BoundColumn DataField="teaName" HeaderText="�b�O�W��"></asp:BoundColumn>
														<asp:BoundColumn DataField="teaKind" HeaderText="�b�O����" Visible=False></asp:BoundColumn>
														<asp:BoundColumn DataField="teaAllFlag" HeaderText="���ޥ���" Visible="False"></asp:BoundColumn>
														<asp:BoundColumn DataField="teaCreateDate" HeaderText="�إߤ��"></asp:BoundColumn>
														<asp:BoundColumn DataField="teaStopFlag" HeaderText="���Χ_"></asp:BoundColumn>
														<asp:BoundColumn DataField="teaStopDate" HeaderText="���Τ��"></asp:BoundColumn>
													</Columns>
													<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
												</asp:datagrid></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
