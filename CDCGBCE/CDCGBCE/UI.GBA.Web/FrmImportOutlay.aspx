<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmImportOutlay.aspx.vb" Inherits="UI.GBA.Web.FrmImportOutlay"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmImportOutlay</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
		<style type="text/css">
.Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
.FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
.FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
.FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		</style>
		<script language="javascript">
		
		function check_Num(){
				if((event.keyCode>=48&&event.keyCode<=57)){
					return true;}
				else{event.keyCode=0;false;}
		}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE style="MARGIN-TOP: 10px; Z-INDEX: 102; LEFT: 8px; MARGIN-LEFT: 10px; POSITION: absolute; TOP: 8px; BORDER-COLLAPSE: collapse"
				cellPadding="5" width="800" bgColor="#dadee9">
				<TR>
					<TD style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<TABLE id="Table2" style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1"
							width="800" border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="2">
										<tr>
											<td style="WIDTH: 150px" align="right" width="190">科目年度</td>
											<td style="WIDTH: 150px"><asp:textbox onkeypress="return check_Num()" id="TBYear" style="TEXT-ALIGN: center" runat="server"
													Width="50px" MaxLength="3"></asp:textbox><asp:button id="BtnShow" runat="server" Text="列出"></asp:button></td>
										</tr>
									</table>
								</td>
							</tr>
							<TR>
								<TD colSpan="2">
									<div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 800px; BORDER-BOTTOM: 1px groove; HEIGHT: 600px"><asp:datagrid id="DataGrid1" runat="server" Width="100%" GridLines="Vertical" CellPadding="3"
											BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="White" AutoGenerateColumns="False">
											<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
											<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
											<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
											<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C" CssClass="Freezing"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" runat="server"
															ToolTip="打勾全選"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="OulYear" SortExpression="OulYear" HeaderText="科目年度別">
													<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" Width="80px" VerticalAlign="Middle"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="OulCode" SortExpression="OulCode" HeaderText="用途別代碼">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="120px" VerticalAlign="Middle"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別名稱">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="OulLevel" SortExpression="OulLevel" HeaderText="級別">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="50px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ActCount" SortExpression="ActCount" HeaderText="已轉否">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="50px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</TD>
							</TR>
							<TR>
								<TD colSpan="2"><asp:button id="BtnImport" runat="server" Text="轉入資料"></asp:button></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				</TD></TR></TABLE>
		</form>
	</body>
</HTML>
