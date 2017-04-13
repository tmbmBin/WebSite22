<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCarryReserve.aspx.vb" Inherits="UI.Budget.Web.FrmCarryReserve" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
		<style type="text/css">
.Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
.FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
.FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
.FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		</style>
		<script language="javascript" type="text/javascript">
			
		function check_Num()
		{
			if((event.keyCode>=48&&event.keyCode<=57)){
				return true;}
			else{event.keyCode=0;false;}
		}
		</script>
</head>
<body>
    <form id="form1" runat="server">
			<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				bgcolor="#dadee9" width="800">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="TABLE-LAYOUT: fixed">
										<tr>
											<td vAlign="bottom" align="right" width="100">年度</td>
											<td vAlign="bottom" align="left" width="150"><asp:textbox id="TBYear" 
                                                    runat="server" Width="77px" style="TEXT-ALIGN:center" 
                                                    onkeypress="return check_Num()"></asp:textbox></td>
											<td vAlign="bottom" align="right" width="100">執行單位</td>
											<td vAlign="bottom" align="left" colspan="2"><asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
											<td vAlign="bottom" align="left">&nbsp;</td>
											<td vAlign="bottom" align="left">&nbsp;</td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" width="100">計畫</td>
											<td vAlign="bottom" align="left" colspan="6">
                                                <asp:DropDownList id="DDLPlan" runat="server" Width="600px"></asp:DropDownList></td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" width="100">用途別</td>
											<td vAlign="bottom" align="left" width="150" colspan="2" style="width: 250px">
                                                <asp:DropDownList id="DDLOul" runat="server"></asp:DropDownList></td>
											<td vAlign="bottom" align="right">動支編號</td>
											<td vAlign="bottom" align="left">
                                                <asp:textbox id="TBacmWordNum" runat="server" 
                                                    Width="120px" style="TEXT-ALIGN:center"></asp:textbox></td>
											<td vAlign="bottom" align="left">&nbsp;</td>
											<td vAlign="bottom" align="left">&nbsp;</td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" width="100"><asp:Button id="BtnList" runat="server" Text="列出資料"></asp:Button></td>
											<td vAlign="bottom" align="left" width="150"></td>
											<td vAlign="bottom" align="left" width="100"></td>
											<td vAlign="bottom" align="left"><FONT face="新細明體"></FONT></td>
											<td vAlign="bottom" align="left">&nbsp;</td>
											<td vAlign="bottom" align="left">&nbsp;</td>
											<td vAlign="bottom" align="left">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><table border="0" cellpadding="1">
										<tr>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center" style="width: 120px"><asp:button id="BtnSave" runat="server" Height="22" Text="結轉保留儲存"></asp:button></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 900px; BORDER-BOTTOM: 1px groove; HEIGHT: 600px">
										<asp:datagrid id="DataGrid1" runat="server" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False" Width="100%">
											<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
											<HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" CssClass="Freezing"
												BackColor="#003366"></HeaderStyle>
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
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="dptName" SortExpression="dptName" HeaderText="執行單位">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="TotalMoneyUnPaid" SortExpression="TotalMoneyUnPaid" HeaderText="剩餘金額"
													DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="保留數">
													<HeaderStyle Width="100px"></HeaderStyle>
													<ItemTemplate>
														<asp:TextBox id="TBdgMoney" runat="server" Width="100px" style="text-align:Right"></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn Visible="False" DataField="DoneFlag" SortExpression="DoneFlag" HeaderText="DoneFlag-10"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-11"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-12"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo2" SortExpression="acmNo2" HeaderText="acmNo2-13"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpPayNo" SortExpression="acpPayNo" HeaderText="acpPayNo-14"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo" SortExpression="acvNo" HeaderText="acvNo-15"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo1" SortExpression="acvNo1" HeaderText="acvNo1-16"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo2" SortExpression="acvNo2" HeaderText="acvNo2-17"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNoPrv" SortExpression="acmNoPrv" HeaderText="acmNoPrv-18"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="刪除">
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<HeaderTemplate>
														<asp:Label id="Label1" runat="server" BackColor="Transparent" tooltip="刪除保留資料">刪除</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBDel" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn Visible="False" DataField="acvPlanCode" SortExpression="acvPlanCode" HeaderText="acvPlanCode-20"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvOutlayYear" SortExpression="acvOutlayYear" HeaderText="acvOutlayYear-21"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvOutlayCode" SortExpression="acvOutlayCode" HeaderText="acvOutlayCode-22"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvBgtSourceCode" SortExpression="acvBgtSourceCode" HeaderText="acvBgtSourceCode-23"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvAccKind" SortExpression="acvAccKind" HeaderText="acvAccKind-24"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvBizCode" SortExpression="acvBizCode" HeaderText="acvBizCode-25"></asp:BoundColumn>
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
</html>
