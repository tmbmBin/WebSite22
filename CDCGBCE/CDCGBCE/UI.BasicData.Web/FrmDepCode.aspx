<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmDepCode.aspx.vb" Inherits="UI.BasicData.Web.FrmDepCode"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>���̥N�X���@</title>
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
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�����N�X</font></td>
											<td width="158"><asp:textbox id="TBID" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
											<td style="DISPLAY:none" align="right" width="83"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">�C�L�N��</FONT></td>
											<td style="DISPLAY:none" width="162"><asp:textbox id="TBNo" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�b�O�N�X</font></td>
											<td><asp:dropdownlist id="DDLTeam" runat="server" Width="100%"></asp:dropdownlist></td>
											<td style="DISPLAY:none" align="right"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">�C�L�W��</FONT></td>
											<td style="DISPLAY:none" width="162"><asp:textbox id="TBAliasName" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�ŧO</font></td>
											<td><asp:textbox id="TBLevel" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
											<td style="WIDTH: 83px" align="right"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">�w����t</FONT></td>
											<td width="162"><asp:dropdownlist id="DDLBgtFlag" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�ӿ�~��</font></td>
											<td><asp:dropdownlist id="DDLBizFlag" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
											<td style="WIDTH: 83px" align="right"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">���ޥ���</FONT></td>
											<td width="162"><FONT face="�s�ө���"><asp:dropdownlist id="DDLCtrlFlag" runat="server" Width="100%">
														<asp:ListItem Value="0">�_</asp:ListItem>
														<asp:ListItem Value="1">�O</asp:ListItem>
													</asp:dropdownlist></FONT></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">����</FONT>�W��</font></td>
											<td colSpan="3"><asp:textbox id="TBName" runat="server" MaxLength="60" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�إߤ��</font></td>
											<td><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" MaxLength="10"
													Width="100%"></asp:textbox></td>
											<td align="right" width="83" height="31" style="DISPLAY:none"><font style="FONT-SIZE: 11pt" face="�s�ө���">�b�O�X��</font></td>
											<td width="162" style="DISPLAY:none"><asp:dropdownlist id="DDLTeamFlag" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="WIDTH: 89px" align="right" height="31"><font style="FONT-SIZE: 11pt" face="�s�ө���">���Τ��</font></td>
											<td width="158" height="31"><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" MaxLength="10"
													Width="100%"></asp:textbox>
											<td style="WIDTH: 83px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�O�_����</font></td>
											<td width="162" height="31"><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
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
														<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Height="22" Text="�s�W"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Height="22" Text="�ק�"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Height="22" Text="�R��"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="�x�s" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="����" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="�d��" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="�C�L" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Text="���}" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True">��J�N�X</asp:textbox></td>
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
														<asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select">
															<HeaderStyle Width="30px"></HeaderStyle>
														</asp:ButtonColumn>
														<asp:BoundColumn DataField="dptCode" HeaderText="�����N�X">
															<HeaderStyle Width="70px"></HeaderStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="dptName" HeaderText="�����W��"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="dptLevel" HeaderText="�ŧO">
															<HeaderStyle Width="30px"></HeaderStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="dptCreateDate" HeaderText="�إߤ��">
															<HeaderStyle Width="70px"></HeaderStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="dptStopFlag" HeaderText="���Χ_">
															<HeaderStyle Width="60px"></HeaderStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="dptStopDate" HeaderText="���Τ��">
															<HeaderStyle Width="70px"></HeaderStyle>
														</asp:BoundColumn>
													</Columns>
													<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
												</asp:datagrid>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		    <COMPONENTART:CALENDAR id="UCCDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCCDate_Change"
													PopUp="Custom" PopUpExpandControlId="TBCreateDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
													PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
													DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR><COMPONENTART:CALENDAR id="UCSDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCSDate_Change"
													PopUp="Custom" PopUpExpandControlId="TBStopDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
													PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
													DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR>
		</form>
	</body>
</HTML>
