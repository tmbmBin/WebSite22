<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCarryOver.aspx.vb" Inherits="UI.Budget.Web.FrmCarryOver" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
        <style type="text/css">.Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
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
		<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="1000" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td vAlign="bottom" align="right" width="100">&nbsp;</td>
											<td vAlign="bottom" align="left" width="150">&nbsp;</td>
											<td vAlign="bottom" align="left" width="100"></td>
											<td vAlign="bottom" align="left">
												
											</td>
											<td vAlign="bottom" align="left" colspan="3">
												<table style="BORDER-COLLAPSE: collapse" cellSpacing="0" cellPadding="0" border="0">
													<tr>
														<td><FONT face="新細明體" color="#ff6633"><asp:label id="Label1" runat="server">指定類別</asp:label></FONT></td>
														<td><FONT face="新細明體" color="#ff6633"><asp:checkboxlist id="CBLOutlay" runat="server" Visible="False" ForeColor="#ff6633"></asp:checkboxlist></FONT></td>
														<td><FONT face="新細明體" color="#ff6633"><asp:label id="Label2" runat="server">科目年度別</asp:label></FONT></td>
														<td><FONT face="新細明體" color="#ff6633"><asp:textbox onkeypress="return check_Num()" id="TBNextYear" style="TEXT-ALIGN: center" runat="server"
																	Width="50px" Visible="False" ForeColor="#ff6633"></asp:textbox></FONT></td>
													</tr>
												</table>
											    </td>
										</tr>
										<tr>
											<td align="right" width="100">年度</td>
											<td align="left" width="150"><asp:textbox onkeypress="return check_Num()" id="TBYear" style="TEXT-ALIGN: center" runat="server"
													Width="50px"></asp:textbox></td>
											<td align="right">執行單位</td>
											<td><asp:dropdownlist id="DDLWorkDep" runat="server"></asp:dropdownlist></td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" width="100">計畫</td>
											<td colspan="6"><asp:dropdownlist id="DDLPlan" runat="server" Width="550px"></asp:dropdownlist></td>
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
											<td width="100"><asp:button id="BtnList" runat="server" Text="列出資料"></asp:button></td>
											<td width="150"></td>
											<td width="100"></td>
											<td></td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="3" border="0">
										<tr>
											<td width="150"><asp:button id="BtnCarryNext" runat="server" Width="100px" Text="結轉至下年度" Height="22px"></asp:button></td>
											<td width="50"></td>
											<td style="WIDTH: 74px" width="74"><FONT face="新細明體">申請總數</FONT></td>
											<td width="100"><asp:label id="LBVisaTotal" runat="server" Width="100%"></asp:label></td>
											<td style="WIDTH: 77px" width="77"><FONT face="新細明體">剩餘總數</FONT></td>
											<td style="WIDTH: 148px" width="148"><FONT face="新細明體"><asp:label id="LBVisaLeftTotal" runat="server" Width="100%"></asp:label></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<div id="freezingDiv1" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 1000px; BORDER-BOTTOM: 1px groove; HEIGHT: 300px">
									<asp:datagrid id="DataGrid1" runat="server" Width="100%" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False">
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
												<asp:TemplateColumn HeaderText="保留原因">
													<HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
													<ItemTemplate>
														<asp:TextBox id="TBReason" runat="server" Width="200px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container, "DataItem.acmReason") %>'>
														</asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="動支日期">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="dptName" SortExpression="dptName" HeaderText="執行單位">
													<HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="TotalMoneyUnPaid" SortExpression="TotalMoneyUnPaid" HeaderText="剩餘金額"
													DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" HeaderText="空白-9"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="DoneFlag" SortExpression="DoneFlag" HeaderText="DoneFlag-10"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-11"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-12"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo2" SortExpression="acmNo2" HeaderText="acmNo2-13"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="payCount" SortExpression="payCount" HeaderText="payCount-14"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo" SortExpression="acvNo" HeaderText="acvNo-15"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo1" SortExpression="acvNo1" HeaderText="acvNo1-16"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo2" SortExpression="acvNo2" HeaderText="acvNo2-17"></asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgColor="#ffffff" height="10"><FONT face="新細明體"></FONT></td>
				</tr>
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" width="100%"
							border="1">
							<tr>
								<td vAlign="bottom" align="left">
									<table cellSpacing="0" cellPadding="0" border="0">
										<tr>
											<td width="120"><asp:button id="BtnDelete" runat="server" Text="刪除已結轉" Height="22"></asp:button></td>
											<td><asp:button id="BtnPrint" runat="server" Width="75px" Visible="False" Text="列印" Height="22px"></asp:button></td>
											<td width="50"><FONT face="新細明體"></FONT></td>
											<td style="WIDTH: 70px"><FONT face="新細明體">結轉總數</FONT></td>
											<td><FONT face="新細明體"><asp:label id="LBCarryTotal" runat="server" Width="100%"></asp:label></FONT></td>
											<td><FONT face="新細明體"></FONT></td>
											<td><FONT face="新細明體"></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 1000px; BORDER-BOTTOM: 1px groove; HEIGHT: 300px"><asp:datagrid id="DataGrid2" runat="server" Width="100%" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False">
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
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect2',this.checked);" runat="server"
															ToolTip="打勾全選"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect2" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="acmReason" SortExpression="acmReason" HeaderText="保留原因">
													<HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="動支日期">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="dptName" SortExpression="dptName" HeaderText="執行單位">
													<HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="TotalMoneyUnPaid" SortExpression="TotalMoneyUnPaid" HeaderText="剩餘金額"
													DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" HeaderText="空白-10"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="DoneFlag" SortExpression="DoneFlag" HeaderText="DoneFlag-11"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-12"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-13"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo2" SortExpression="acmNo2" HeaderText="acmNo2-14"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="payCount" SortExpression="payCount" HeaderText="payCount-15"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo" SortExpression="acvNo" HeaderText="acvNo-16"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo1" SortExpression="acvNo1" HeaderText="acvNo1-17"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo2" SortExpression="acvNo2" HeaderText="acvNo2-18"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmBgtAcmNo" SortExpression="acvNo2" HeaderText="acmBgtAcmNo-19"></asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </form>
</body>
</html>
