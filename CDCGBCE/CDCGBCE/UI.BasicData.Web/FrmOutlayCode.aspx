<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmOutlayCode.aspx.vb" Inherits="UI.BasicData.Web.FrmOutlayCode" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>�γ~�O�N�X���@</title>
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
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">��ئ~�קO</font></td>
											<td width="158"><asp:textbox id="TBYear" runat="server" Width="100%" MaxLength="3"></asp:textbox></td>
											<td style="WIDTH: 83px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�C�L�N��</font></td>
											<td width="162"><asp:textbox id="TBNo" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�γ~�O�N�X</font></td>
											<td><asp:textbox id="TBID" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="�s�ө���">�C�L�W��</font></td>
											<td width="162"><asp:textbox id="TBAliasName" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�ŧO</font></td>
											<td><asp:textbox id="TBLevel" runat="server" Width="100%" MaxLength="2"></asp:textbox></td>
											<td align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�����ŧO</font></td>
											<td><asp:textbox id="TBEndLevel" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="�s�ө���">�γ~�O�W��</font></td>
											<td colSpan="3"><asp:textbox id="TBName" runat="server" Width="100%" MaxLength="60"></asp:textbox></td>
										</tr>
										<tr style="DISPLAY:none">
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">���O</font></td>
											<td><asp:dropdownlist id="DDLAccKind" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">������</asp:ListItem>
													<asp:ListItem Value="1">�g�`��</asp:ListItem>
													<asp:ListItem Value="2">�ꥻ��</asp:ListItem>
													<asp:ListItem Value="3">�g���</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="�s�ө���">��ةʽ�</font></td>
											<td width="162"><asp:dropdownlist id="DDLOulType" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">������</asp:ListItem>
													<asp:ListItem Value="1">�w��ʽ�</asp:ListItem>
													<asp:ListItem Value="2">�D�w��ʽ�</asp:ListItem>
													<asp:ListItem Value="3">�{�����</asp:ListItem>
													<asp:ListItem Value="31">�s��</asp:ListItem>
													<asp:ListItem Value="4">�겣���</asp:ListItem>
													<asp:ListItem Value="41">���Ȩ���</asp:ListItem>
													<asp:ListItem Value="5">����æC���</asp:ListItem>
													<asp:ListItem Value="6">�ΤH���</asp:ListItem>
													<asp:ListItem Value="61">�~��</asp:ListItem>
													<asp:ListItem Value="7">�H�U�N�z�P�O�Ҭ��</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr style="DISPLAY:none">
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">���h�X��</font></td>
											<td><asp:dropdownlist id="DDLFinalLevel" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">���Ӷ�����</asp:ListItem>
													<asp:ListItem Value="1">�̥��h(�L�Ӷ�����)</asp:ListItem>
													<asp:ListItem Value="2">�������h(���Ӷ�����)</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="�s�ө���">�����p�e</font></td>
											<td width="162"><asp:dropdownlist id="DDLMapPlan" runat="server" Width="100%">
													<asp:ListItem Value="1">��b�������b��(�]�����)</asp:ListItem>
													<asp:ListItem Value="2">��X�������J(����æC)</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="DISPLAY: none;WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�ˬd�X</font></td>
											<td style="DISPLAY:none"><asp:textbox id="TBCheckNo" runat="server"></asp:textbox></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="�s�ө���">�إߤ��</font></td>
											<td width="162"><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" Width="100%"
													MaxLength="10"></asp:textbox><COMPONENTART:CALENDAR id="UCCDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
													DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long"
													NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBCreateDate"
													PopUp="Custom" ClientSideOnSelectionChanged="UCCDate_Change" cultureid="1028"></COMPONENTART:CALENDAR></td>
										</tr>
										<tr>
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">�O�_����</font></td>
											<td><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
													<asp:ListItem Value="0">�_</asp:ListItem>
													<asp:ListItem Value="1">�O</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="�s�ө���">���Τ��</font></td>
											<td width="162"><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" Width="100%"
													MaxLength="10"></asp:textbox><COMPONENTART:CALENDAR id="UCSDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
													DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long"
													NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBStopDate"
													PopUp="Custom" ClientSideOnSelectionChanged="UCSDate_Change" cultureid="1028"></COMPONENTART:CALENDAR></td>
										</tr>
										 <tr>
											<td align="right" ><font style="FONT-SIZE: 11pt" face="�s�ө���">����</font></td>
											<td   >
                                                <asp:DropDownList ID="DDLPlanCateName" runat="server">
                                                </asp:DropDownList>
                                            </td>
											<td align="right"  >
											<td>
												
										    </td>
								 
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
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnImport" runat="server" Height="22" Text="�פJ" ToolTip="�פJ�W�~�׸��"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True">��J�γ~�O�N�X</asp:textbox></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
																value="s" name="btn_goto"></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
																runat="server">
														</td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnImportGBA" runat="server" Text="�פJ�γ~�O" Height="22" Visible="False"></asp:button></td>
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
														<asp:BoundColumn DataField="codCodeVer" HeaderText="�~��"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulOutlayCode" HeaderText="�γ~�O�N�X"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulOutlayName" HeaderText="�γ~�O�W��"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulLevel" HeaderText="�ŧO"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulCreateDate" HeaderText="�إߤ��"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulStopFlag" HeaderText="���Χ_"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulStopDate" HeaderText="���Τ��"></asp:BoundColumn>
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
