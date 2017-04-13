<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmImportPlan.aspx.vb" Inherits="UI.GBA.Web.FrmImportPlan"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmImportPlan</title>
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
			<TABLE style="MARGIN-TOP: 10px; Z-INDEX: 101; LEFT: 8px; MARGIN-LEFT: 10px; POSITION: absolute; TOP: 8px; BORDER-COLLAPSE: collapse"
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
											<td><FONT face="新細明體">經費/代辦別</FONT></td>
											<td><asp:dropdownlist id="DDLType" runat="server">
													<asp:ListItem Value="0">經費別</asp:ListItem>
													<asp:ListItem Value="1">代辦別</asp:ListItem>
												</asp:dropdownlist></td>
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
											<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" CssClass="Freezing" BackColor="#4A3C8C"></HeaderStyle>
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
												<asp:BoundColumn DataField="PlanYear" SortExpression="PlanYear" HeaderText="年度別">
													<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" Width="50px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PlanCode" SortExpression="PlanCode" HeaderText="計畫代碼">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="80px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PlanName" SortExpression="PlanName" HeaderText="計畫名稱">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PlanLevel" SortExpression="PlanLevel" HeaderText="級別">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="30px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="修改層級">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="60px" VerticalAlign="Middle"></HeaderStyle>
													<ItemTemplate>
														<asp:TextBox id="TBdgLevel" runat="server" MaxLength="2" Width="60px" onkeypress="return check_Num()"></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="PlanAliasNo" SortExpression="PlanAliasNo" HeaderText="原始代碼">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="90px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="PlanLevelEnd" SortExpression="PlanLevelEnd" HeaderText="尾層級別">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="60px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="PlanAliasNo1" SortExpression="PlanAliasNo1" HeaderText="原始代碼1">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="90px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ActCount" SortExpression="ActCount" HeaderText="已轉否">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="90px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="plnAbatedKind" SortExpression="plnAbatedKind" HeaderText="沖銷/受款人">
													<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="90px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
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
			</TABLE>
		</form>
	</body>
</HTML>
