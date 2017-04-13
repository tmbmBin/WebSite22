<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmPlanBiz.aspx.vb" Inherits="UI.BasicData.Web.FrmPlanBiz"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmPlanBiz</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META http-equiv="Pragma" content="No-cache">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				bgcolor="#dadee9" width="600">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td><FONT face="新細明體">
										<TABLE id="Table1" style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
											<TR>
												<TD vAlign="middle" align="right" style="WIDTH: 127px">計畫科目</TD>
												<TD vAlign="bottom" align="left">
													<asp:DropDownList id="DDLPlan" runat="server" Width="450px"></asp:DropDownList></TD>
											<TR>
												<TD vAlign="bottom" align="right" style="WIDTH: 127px">承辦業務別</TD>
												<TD vAlign="bottom" align="left"><asp:DropDownList id="DDLBiz" runat="server"></asp:DropDownList>
												</TD>
											</TR>
										</TABLE>
									</FONT>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" height="10">
					</td>
				</tr>
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="5" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td vAlign="bottom" align="left">
									<table border="0" cellpadding="1">
										<tr>
											<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Height="22" Text="新增"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Height="22" Text="修改"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Height="22" Text="刪除"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="儲存"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Height="22" Text="取消"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Height="22" Text="查詢"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Height="22" Text="列印" Visible="False"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Height="22" Text="離開" Visible="False"></asp:button></td>
											<td vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 54px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql"
													runat="server">
											</td>
											<td vAlign="bottom" align="center"><FONT face="新細明體"><INPUT id="TBOrderTxt" style="WIDTH: 54px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql"
														runat="server"></FONT>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True"
										PageSize="15">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="pbPlanCode" SortExpression="pbPlanCode" HeaderText="計畫代碼">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="plnPlanName" SortExpression="plnPlanName" HeaderText="計畫名稱">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="BizName" SortExpression="BizName" HeaderText="承辦業務別名稱">
												<HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="pbBizCode" SortExpression="pbBizCode" HeaderText="pbBizCode"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="pbOutlayYear" SortExpression="pbOutlayYear" HeaderText="pbOutlayYear"></asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" Mode="NumericPages"></PagerStyle>
									</asp:DataGrid>
								</td>
							</tr>
							<tr>
								<td><FONT face="新細明體"></FONT>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
