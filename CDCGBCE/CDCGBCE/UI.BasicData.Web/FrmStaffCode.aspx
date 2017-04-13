<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmStaffCode.aspx.vb" Inherits="UI.BasicData.Web.FrmStaffCode"%>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmStaffCode</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../calendarStyle.css" type="text/css" rel="stylesheet">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript">

var myTmpID;

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

		function dgSDate_Change(calendar){
			//var lbl_acmTrlStaySDate = document.getElementById();
			var vDay = new Date(calendar.GetSelectedDate());
			myTmpID.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}
		
		function SaveMyID(parID){
		myTmpID=parID
		
		
		}
		

		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="table8" style="MARGIN-TOP: 10px; Z-INDEX: 101; LEFT: 20px; MARGIN-LEFT: 10px; WIDTH: 602px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellSpacing="0" cellPadding="0" width="602" bgColor="#dadee9"
				border="1">
				<TBODY>
					<tr>
						<td style="HEIGHT: 201px">
							<table id="table9" style="WIDTH: 598px; BORDER-COLLAPSE: collapse; HEIGHT: 168px" borderColor="#f8f8fa"
								cellSpacing="0" cellPadding="1" width="598" bgColor="#dadee9" border="1">
								<tr>
									<td>
										<table id="table6" style="WIDTH: 520px; HEIGHT: 168px" cellSpacing="0" cellPadding="1"
											border="0">
											<tr>
												<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">���u�N�X</font></td>
												<td width="158"><asp:textbox id="TBID" runat="server" MaxLength="6" Width="100%"></asp:textbox></td>
												<td style="DISPLAY: none; WIDTH: 105px" align="right" width="105"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">���u�N��</FONT></td>
												<td width="162" style="DISPLAY:none"><asp:textbox id="TBNo" runat="server" MaxLength="6" Width="100%"></asp:textbox></td>
											</tr>
											<tr>
												<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�����Ҹ�</font></td>
												<td><asp:textbox id="TBPersonalID" runat="server" MaxLength="10" Width="100%"></asp:textbox></td>
												<td style="DISPLAY: none; WIDTH: 105px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�w�]��J�Ȧ�</font></td>
												<td width="162" style="DISPLAY:none"><asp:dropdownlist id="DDLDefBank" runat="server" Width="100%"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">���u�W��</font></td>
												<td colSpan="3"><asp:textbox id="TBName" runat="server" MaxLength="5" Width="100%"></asp:textbox></td>
											</tr>
											<tr>
												<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�إߤ��</font></td>
												<td><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" MaxLength="10"
														Width="100%"></asp:textbox><COMPONENTART:CALENDAR id="UCCDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCCDate_Change"
														PopUp="Custom" PopUpExpandControlId="TBCreateDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
														PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
														DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR></td>
												<td style="WIDTH: 105px" align="right" width="105" height="31"><font style="FONT-SIZE: 11pt" face="�s�ө���">�O�_����</font></td>
												<td width="162" height="31"><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
														<asp:ListItem Value="0">�_</asp:ListItem>
														<asp:ListItem Value="1">�O</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="WIDTH: 89px" align="right" height="31"><font style="FONT-SIZE: 11pt" face="�s�ө���">���Τ��</font></td>
												<td width="158" height="31"><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" MaxLength="10"
														Width="100%"></asp:textbox><COMPONENTART:CALENDAR id="UCSDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCSDate_Change"
														PopUp="Custom" PopUpExpandControlId="TBStopDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
														PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
														DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR>
												<td style="WIDTH: 105px" align="right"></td>
												<td width="162"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="DISPLAY:none"  height=0>
						<td>
							<div id="DivDetail" style="MARGIN-TOP: 10px; OVERFLOW-Y: scroll; MARGIN-LEFT: 10px; HEIGHT: 100px"><asp:datagrid id="DataGrid2" runat="server" Width="100%" BorderStyle="None" BackColor="White"
									AutoGenerateColumns="False" BorderWidth="1px" BorderColor="White" CellPadding="3">
									<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
									<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
									<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
									<ItemStyle Font-Size="X-Small" Font-Names="�s�ө���" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
									<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
									<Columns>
										<asp:TemplateColumn HeaderText="�Ǹ�">
											<HeaderStyle Width="0.8cm"></HeaderStyle>
											<ItemTemplate>
												<%# Container.ItemIndex +1 %>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="�Ȧ�N�X/����N�X">
											<HeaderStyle Width="3.1cm"></HeaderStyle>
											<HeaderTemplate>
												<asp:Label id="Label1" runat="server"><font style="COLOR: #ffcccc; FONT-FAMILY: �s�ө���">�Ȧ�N�X</font>/<font style="COLOR: #00ff99; FONT-FAMILY: �s�ө���">�Ȧ�N�X</font></asp:Label>
											</HeaderTemplate>
											<ItemTemplate>
												<TABLE width="100%" border="0">
													<TR>
														<TD>
															<asp:DropDownList id="DDLdgBank" runat="server" BackColor="#ffcccc" Width="100%"></asp:DropDownList></TD>
													</TR>
													<TR>
														<TD>
															<asp:DropDownList id="DDLdgSubBank" runat="server" BackColor="#00ff99" Width="100%"></asp:DropDownList></TD>
													</TR>
												</TABLE>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="�b��/�����Ҹ�">
											<HeaderStyle Width="2.5cm"></HeaderStyle>
											<HeaderTemplate>
												<asp:Label id="Label2" runat="server"><font style="COLOR: #ffcccc; FONT-FAMILY: �s�ө���">�b��</font>/<font style="COLOR: #00ff99; FONT-FAMILY: �s�ө���">�����Ҹ�</font></asp:Label>
											</HeaderTemplate>
											<ItemTemplate>
												<TABLE border="0" width="100%">
													<TR>
														<TD>
															<asp:textbox id="TBdgAccountNo" runat="server" Width="100%" MaxLength="10" BackColor="#ffcccc" Text='<%# DataBinder.Eval(Container, "DataItem.AccountNo") %>' >
															</asp:textbox></TD>
													</TR>
													<TR>
														<TD>
															<asp:textbox id="TBdgPersonal" runat="server" Width="100%" MaxLength="10" BackColor="#00ff99" Text='<%# DataBinder.Eval(Container, "DataItem.PersonalID") %>' >1234567890L</asp:textbox></TD>
													</TR>
												</TABLE>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="��W">
											<HeaderStyle Width="2.5cm"></HeaderStyle>
											<HeaderTemplate>
												<asp:Label id="Label3" runat="server"><font style="COLOR: #ffcccc; FONT-FAMILY: �s�ө���">��W</font>/<font style="COLOR: #00ff99; FONT-FAMILY: �s�ө���">�J¾���</font></asp:Label>
											</HeaderTemplate>
											<ItemTemplate>
												<TABLE border="0" width="100%">
													<TR>
														<TD>
															<asp:textbox id="TBdgAccountName" runat="server" Width="100%" MaxLength="10" BackColor="#ffcccc" Text='<%# DataBinder.Eval(Container, "DataItem.AccountName") %>' >
															</asp:textbox></TD>
													</TR>
													<TR>
														<TD>
															<asp:textbox id="TBdgCreateDate" runat="server" Width="100%" MaxLength="10" BackColor="#00ff99" Text='<%# DataBinder.Eval(Container, "DataItem.SubCreateDate") %>' >
															</asp:textbox></TD>
													</TR>
												</TABLE>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="���Χ_">
											<HeaderStyle Width="2.7cm"></HeaderStyle>
											<HeaderTemplate>
												<asp:Label id="Label4" runat="server"><font style="COLOR: #ffcccc; FONT-FAMILY: �s�ө���">��¾�_</font>/<font style="COLOR: #00ff99; FONT-FAMILY: �s�ө���">��¾���</font></asp:Label>
											</HeaderTemplate>
											<ItemTemplate>
												<TABLE border="0" width="100%">
													<TR>
														<TD>
															<asp:DropDownList id="DLLdgStop" runat="server" BackColor="#ffcccc" Width="100%">
																<asp:ListItem Value="0">�_</asp:ListItem>
																<asp:ListItem Value="1">�O</asp:ListItem>
															</asp:DropDownList></TD>
													</TR>
													<TR>
														<TD>
															<asp:textbox id="TBdgStopDate" runat="server" Width="100%" MaxLength="10" ondblclick="JavaScript: dgSDate.Show();SaveMyID(this);" BackColor="#00ff99" Text='<%# DataBinder.Eval(Container, "DataItem.SubStopDate") %>' >
															</asp:textbox>
														</TD>
													</TR>
												</TABLE>
											</ItemTemplate>
										</asp:TemplateColumn>
									</Columns>
									<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
								</asp:datagrid></div>
							&nbsp;&nbsp;<asp:button id="BtnAddDetail" runat="server" Width="80px" Text="�s�W���ӦC"></asp:button>
						</td>
					</tr>
					<TR>
						<TD align="left">
							<TABLE id="table11" style="MARGIN-TOP: 10px; Z-INDEX: 102; WIDTH: 599px; BORDER-COLLAPSE: collapse"
								borderColor="#f8f8fa" cellSpacing="0" cellPadding="0" width="599" border="1">
								<TBODY>
									<TR>
										<TD>
											<TABLE id="table12" style="TABLE-LAYOUT: fixed; WIDTH: 596px; BORDER-COLLAPSE: collapse"
												borderColor="#f8f8fa" cellSpacing="0" cellPadding="5" bgColor="#dadee9" border="1">
												<TBODY>
													<TR>
														<TD>
															<TABLE cellSpacing="0" cellPadding="0" border="0">
																<TR>
																	<TD vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="�s�W" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="�ק�" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="�R��" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="�x�s" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="����" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="�d��" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="�C�L" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Text="���}" Height="22"></asp:button></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																			Width="96px" AutoPostBack="True">��J���u�N�X</asp:textbox></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
																			value="s" name="btn_goto"></TD>
																	<TD style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
																			runat="server">
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD><asp:datagrid id="DataGrid1" runat="server" Width="100%" BorderStyle="None" BackColor="White"
																AutoGenerateColumns="False" BorderWidth="1px" BorderColor="White" CellPadding="3" Height="72px"
																AllowPaging="True">
																<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
																<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
																<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
																<ItemStyle Font-Size="X-Small" Font-Names="�s�ө���" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
																<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
																<Columns>
																	<asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select"></asp:ButtonColumn>
																	<asp:BoundColumn DataField="StaffID" HeaderText="���u�N�X"></asp:BoundColumn>
																	<asp:BoundColumn DataField="StaffName" HeaderText="���u�W��"></asp:BoundColumn>
																	<asp:BoundColumn DataField="PersonalID" HeaderText="�����Ҹ�"></asp:BoundColumn>
																	<asp:BoundColumn DataField="CreateDate" HeaderText="�إߤ��"></asp:BoundColumn>
																	<asp:BoundColumn DataField="StopFlag" HeaderText="���Χ_"></asp:BoundColumn>
																	<asp:BoundColumn DataField="StopDate" HeaderText="���Τ��"></asp:BoundColumn>
																</Columns>
																<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
															</asp:datagrid></TD>
														<COMPONENTART:CALENDAR id="dgSDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="dgSDate_Change"
															PopUp="Custom" PopUpExpandControlId="DivDetail" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif"
															NextImageUrl="../images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday"
															MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR></TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
