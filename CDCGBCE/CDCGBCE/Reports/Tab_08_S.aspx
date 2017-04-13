<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Tab_08_S.aspx.vb" Inherits="Reports.Tab_08_S"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>就地審計資料設定</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
		<style type="text/css">
.Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
.FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
.FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
.FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		</style>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="800" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td vAlign="bottom" align="right" width="100"><FONT face="新細明體">用途別名稱</FONT></td>
											<td vAlign="bottom" align="left" width="400"><asp:dropdownlist id="DDLOul" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											<td vAlign="bottom" align="left"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellPadding="1" border="0">
										<tr>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="就地審計設定存檔"></asp:button></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 800px; BORDER-BOTTOM: 1px groove; HEIGHT: 600px"><asp:datagrid id="DataGrid1" runat="server" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False" Width="100%">
											<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"
												CssClass="Freezing"></HeaderStyle>
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
												<asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="動支日期">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PlanName" SortExpression="PlanName" HeaderText="計畫名稱">
													<HeaderStyle Wrap="False" Width="150px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別名稱">
													<HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="承辦單位">
													<HeaderStyle Wrap="False" Width="90px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMemo" SortExpression="acvMemo" HeaderText="事由"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-10"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-11"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo2" SortExpression="acmNo2" HeaderText="acmNo2-12"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo" SortExpression="acvNo" HeaderText="acvNo-13"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo1" SortExpression="acvNo1" HeaderText="acvNo1-14"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo2" SortExpression="acvNo2" HeaderText="acvNo2-15"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="inspect" SortExpression="inspect" HeaderText="inspect-16"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpPayYear" SortExpression="acpPayYear" HeaderText="acpPayYear-17"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpPayNo" SortExpression="acpPayNo" HeaderText="acpPayNo-18"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvSubNo" SortExpression="acvSubNo" HeaderText="acvSubNo-19"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpPayNo1" SortExpression="acpPayNo1" HeaderText="acpPayNo1-20"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvSubNo1" SortExpression="acvSubNo1" HeaderText="acvSubNo1-21"></asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
