<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmPhraseCode.aspx.vb" Inherits="UI.BasicData.Web.FrmPhraseCode"%>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>���y�N�X���@</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
			<base target="_self"></base>
		<LINK href="../calendarStyle.css" type="text/css" rel="stylesheet">
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
									<table id="table6" style="WIDTH: 500px; HEIGHT: 80px" cellSpacing="0" cellPadding="1" border="0">
										<tr>
											<td align="right" width="89" style="HEIGHT: 21px"><font style="FONT-SIZE: 11pt" face="�s�ө���">���y�N�X</font></td>
											<td width="158" style="HEIGHT: 21px"><asp:textbox id="TBID" runat="server" Width="100%" MaxLength="6"></asp:textbox></td>
											<td align="right" width="83" style="HEIGHT: 21px"><FONT style="FONT-SIZE: 11pt" face="�s�ө���"></FONT></td>
											<td width="162" style="HEIGHT: 21px"></td>
										</tr>
										<tr>
											<td align="right" width="89" style="HEIGHT: 16px"><font style="FONT-SIZE: 11pt" face="�s�ө���"><FONT style="FONT-SIZE: 11pt" face="�s�ө���">���y</FONT>�W��</font></td>
											<td colSpan="3" style="HEIGHT: 16px"><asp:textbox id="TBName" runat="server" Width="100%" MaxLength="60"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89" style="HEIGHT: 8px"><font style="FONT-SIZE: 11pt" face="�s�ө���">���ɳ]�w</font></td>
											<td style="HEIGHT: 8px">
												<asp:DropDownList id="DDLShare" runat="server">
													<asp:ListItem Value="0">�֦���</asp:ListItem>													
													<asp:ListItem Value="3">�P����</asp:ListItem>
													<asp:ListItem Value="2">�Ҧ��H��</asp:ListItem>
												</asp:DropDownList></td>
											<td style="WIDTH: 83px; HEIGHT: 8px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���">���ʳ]�w</font></td>
											<td width="162" style="HEIGHT: 8px">
												<asp:DropDownList id="DDLEdit" runat="server">
													<asp:ListItem Value="0">�֦���</asp:ListItem>
													<asp:ListItem Value="3">�P����</asp:ListItem>
													<asp:ListItem Value="2">�Ҧ��H��</asp:ListItem>
												</asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="89" style="HEIGHT: 8px"><font style="FONT-SIZE: 11pt" face="�s�ө���">�R���]�w</font></td>
											<td style="HEIGHT: 8px">
												<asp:DropDownList id="DDLDel" runat="server">
													<asp:ListItem Value="0">�֦���</asp:ListItem>													
													<asp:ListItem Value="3">�P����</asp:ListItem>
													<asp:ListItem Value="2">�Ҧ��H��</asp:ListItem>
												</asp:DropDownList></td>
											<td style="WIDTH: 83px; HEIGHT: 8px" align="right"><font style="FONT-SIZE: 11pt" face="�s�ө���"></font></td>
											<td width="162" style="HEIGHT: 8px"></td>
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
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnBackChoosePhrase" runat="server" Width="96px" Height="22px" Text="��^���y���"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True">��J���y�N�X</asp:textbox></td>
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
														<asp:BoundColumn DataField="phaCode" HeaderText="���y�N�X"></asp:BoundColumn>
														<asp:BoundColumn DataField="phaData" HeaderText="���y�W��"></asp:BoundColumn>
														<asp:BoundColumn DataField="teaName" HeaderText="�b�O�W��"></asp:BoundColumn>
														<asp:BoundColumn DataField="usrName" HeaderText="�n���H��"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="phaShareKind" HeaderText="���ɳ]�w"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="phaEditKind" HeaderText="��Ʋ��ʳ]�w"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="phaDelKind" HeaderText="��ƧR���]�w"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="teaCode" HeaderText="�b�O�N�X-8"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="usrNo" HeaderText="�n���H���t�θ�-9"></asp:BoundColumn>
														<asp:TemplateColumn HeaderText="�����W��">                                                          
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgDepName" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.dptName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.depCode").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
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
		</form>
	</body>
</HTML>
