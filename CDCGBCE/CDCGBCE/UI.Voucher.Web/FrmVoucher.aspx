<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmVoucher.aspx.vb" Inherits="UI.Voucher.Web.FrmVoucher" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="No-cache" />
    <style type="text/css">
        .Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
	    .FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
	    .FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
	    .FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
	</style>
	<script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
	<script language="javascript">
		 
	</script>	
</head>
<body>
    <form id="form1" runat="server">
	<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="900" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellPadding="1" border="0">
										<tr>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="傳票號碼登錄存檔"></asp:button></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"><asp:label id="Label1" runat="server" ForeColor="Red">請存檔後再換頁。</asp:label></td>
											<td vAlign="bottom" align="center">報支總和：</td>
											<td vAlign="bottom" align="center"><asp:label id="LBPayTotal" runat="server" Width="120px"></asp:label></td>
											<td vAlign="bottom" align="center">轉正總和：</td>
											<td vAlign="bottom" align="center"><asp:label id="LBOffsetTotal" runat="server" Width="120px"></asp:label></td>
											<td vAlign="bottom" align="center">繳回總和：</td>
											<td vAlign="bottom" align="center"><asp:label id="LBPayBackTotal" runat="server" Width="120px"></asp:label></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="DataGrid1" runat="server" Width="900px" CellSpacing="1" BorderStyle="None" BackColor="White"
										CellPadding="3" GridLines="None" AutoGenerateColumns="False" AllowPaging="True">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn Visible="False" HeaderText="選取">
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
											<asp:BoundColumn DataField="acpPassDate" SortExpression="acpPassDate" HeaderText="報支日期">
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
												<HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別名稱">
												<HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
												<HeaderStyle Wrap="False" Width="90px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
												<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="報支金額" SortExpression="報支金額" HeaderText="報支金額" DataFormatString="{0:#,0}">
												<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
												<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="轉正金額" SortExpression="轉正金額" HeaderText="轉正金額" DataFormatString="{0:#,0}">
												<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
												<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acvMemo" SortExpression="acvMemo" HeaderText="事由">
												<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="繳回款" SortExpression="繳回款" HeaderText="繳回款" DataFormatString="{0:#,0}">
												<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acpGroupNo" SortExpression="acpGroupNo" HeaderText="匯出批號">
												<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="傳票號碼">
												<ItemTemplate>
													<asp:TextBox id="TBdgAccNo" runat="server" Width="70px" Text ='<%# DataBinder.Eval(Container, "DataItem.acvExchNo") %>' tooltip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvExchNo").ToString()) %>'>
													</asp:TextBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-14"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-15"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acmNo2" SortExpression="acmNo2" HeaderText="acmNo2-16"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acvNo" SortExpression="acvNo" HeaderText="acvNo-17"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acvNo1" SortExpression="acvNo1" HeaderText="acvNo1-18"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acvNo2" SortExpression="acvNo2" HeaderText="acvNo2-19"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acpPayYear" SortExpression="acpPayYear" HeaderText="acpPayYear-20"></asp:BoundColumn>
											<asp:BoundColumn Visible="True" DataField="acpPayNo" SortExpression="acpPayNo" HeaderText="報支號"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acvSubNo" SortExpression="acvSubNo" HeaderText="acvSubNo-22"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acpPayNo1" SortExpression="acpPayNo1" HeaderText="acpPayNo1-23"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acvSubNo1" SortExpression="acvSubNo1" HeaderText="acvSubNo1-24"></asp:BoundColumn>
											<asp:TemplateColumn HeaderText="繳回款傳票號碼">
												<ItemTemplate>
													<asp:TextBox id="TBdgOffSetAccNo" runat="server" Width="70px" Text ='<%# DataBinder.Eval(Container, "DataItem.acvExchNo1") %>' tooltip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvExchNo1").ToString()) %>' >
													</asp:TextBox>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>    </form>
</body>
</html>
