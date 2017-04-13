<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmSysCode.aspx.vb" Inherits="UI.SystemData.Web.FrmSysCode"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmSysCode</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<META http-equiv="Pragma" content="No-cache">
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
									<table id="table6" cellSpacing="0" cellPadding="1" width="600" border="0">
										<tr>
											<td align="right" width="72">�t�ΦW��</td>
											<td colSpan="5"><asp:textbox id="TBSysName" runat="server" MaxLength="50" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="72">�����a�}</td>
											<td colSpan="5"><asp:textbox id="TBOrgAddr" tabIndex="5" runat="server" MaxLength="100" Width="100%"></asp:textbox></td>
										</tr>
										<tr style="Display:None">
											<td style="WIDTH: 72px" align="right">�t�θ��|</td>
											<td colSpan="5"><asp:textbox id="TBSysPath" tabIndex="8" runat="server" MaxLength="100" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="72">�����W��</td>
											<td width="157"><asp:textbox id="TBOrgName" tabIndex="2" runat="server" MaxLength="50" Width="100%"></asp:textbox></td>
											<td align="right" width="102"><FONT face="�s�ө���"></FONT></td>
											<td width="105"><FONT face="�s�ө���"></FONT></td>
											<td style="display:none" align="right">�@�~�~��</td>
											<td style="display:none" width="82"><asp:textbox id="TBDefYear" tabIndex="9" runat="server" MaxLength="3" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="72">�����q��</td>
											<td width="157"><asp:textbox id="TBOrgTel" tabIndex="6" runat="server" MaxLength="20" Width="100%"></asp:textbox></td>
											<td></td>
											<td></td>
											<td style="display:none" align="right" width="102">�|�y�s��</td>
											<td style="display:none" width="105"><asp:textbox id="TBOrgID" tabIndex="7" runat="server" MaxLength="8" Width="100%"></asp:textbox></td>
											<td style="display:none" align="right">�@�~���</td>
											<td style="display:none"><asp:textbox id="TBDefMonth" tabIndex="10" runat="server" MaxLength="2" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="72">�����N��</td>
											<td width="157"><asp:textbox id="TBOrgNo" tabIndex="3" runat="server" MaxLength="20" Width="100%"></asp:textbox></td>
											<td style="display:none" align="right" width="102">�w�]��J�Ȧ�</td>
											<td style="display:none" width="105"><asp:textbox id="TBDefBank" tabIndex="12" runat="server" Width="100%"></asp:textbox></td>
											<td style="display:none" style="WIDTH: 69px" align="right">���|�|�v</td>
											<td style="display:none" width="82"><asp:textbox id="TBTax" style="TEXT-ALIGN: right" tabIndex="14" runat="server" MaxLength="10"
													Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="72">�����D��</td>
											<td width="157"><asp:textbox id="TBOrgChief" tabIndex="4" runat="server" MaxLength="10" Width="100%"></asp:textbox></td>
											<td style="display:none" align="right">�b�O</td>
											<td style="display:none" width="105"><asp:dropdownlist id="DDLTeam" tabIndex="11" runat="server" Width="100%" DataValueField="PK_TeaCode"></asp:dropdownlist></td>
											<td style="display:none" align="right" width="69">�K���|�B</td>
											<td  style="display:none" width="82"><asp:textbox id="TBTaxFree" style="TEXT-ALIGN: right" tabIndex="14" runat="server" MaxLength="10"
													Width="100%"></asp:textbox></td>
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
																Width="96px" AutoPostBack="True">��J�t�ΦW��</asp:textbox></td>
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
															<HeaderStyle Width="1cm"></HeaderStyle>
														</asp:ButtonColumn>
														<asp:BoundColumn DataField="SysName" HeaderText="�t�ΦW��"></asp:BoundColumn>
														<asp:BoundColumn DataField="OrgName" HeaderText="�����W��">
															<HeaderStyle Width="6cm"></HeaderStyle>
														</asp:BoundColumn>
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
