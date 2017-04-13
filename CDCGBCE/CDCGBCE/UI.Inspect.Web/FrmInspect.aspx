<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmInspect.aspx.vb" Inherits="UI.Inspect.Web.FrmInspect" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

 
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
        <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
        <script language="javascript">
            function UCBDate_Change(calendar)
            {
                var vDay = new Date(calendar.GetSelectedDate());
                document.getElementById("TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
            }
            
            function UCEDate_Change(calendar)
            {
                var vDay = new Date(calendar.GetSelectedDate());
                document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
            }
        </script>
        <style type="text/css">.Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
            .FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
            .FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
            .FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		</style>
 
</head>
<body>
    <form id="form1" runat="server">
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						bordercolor="#666668">
						<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellPadding="1" border="0">
										<tr>
											<td align="right" width="90">簽證日期</td>
											<td colSpan="5"><FONT face="新細明體"><asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至
													<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox><asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label></FONT></td>
										</tr>
										<tr>
											<td align="right" width="90">計畫名稱</td>
											<td colSpan="5"><asp:dropdownlist id="DDLPlan" runat="server" Width="450px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90">用途別科目</td>
											<td width="150"><asp:dropdownlist id="DDLOul" runat="server"></asp:dropdownlist></td>
											<td align="right" width="80">動支編號</td>
											<td><asp:textbox id="TBAcmWordNum" runat="server" Width="120px"></asp:textbox></td>
											<td align="right" width="80"></td>
											<td></td>
										</tr>
										<tr>
											<td align="right" width="90">執行單位</td>
											<td width="150"><asp:dropdownlist id="DDLWorkDep" runat="server"></asp:dropdownlist></td>
											<td align="right" width="80">廠商名稱</td>
											<td><asp:textbox id="TBPayName" runat="server" Width="250px"></asp:textbox></td>
											<td align="right" width="80"></td>
											<td></td>
										</tr>
										<tr>
											<td align="right" width="90">金額</td>
											<td width="150"><asp:textbox id="TBMoney" runat="server"></asp:textbox></td>
											<td align="right" width="80">事由</td>
											<td><asp:textbox id="TBMemo" runat="server" Width="250px"></asp:textbox></td>
											<td align="right" width="80">審計狀態</td>
											<td><asp:dropdownlist id="DDLStatus" runat="server">
													<asp:ListItem Value="0">全部</asp:ListItem>
													<asp:ListItem Value="1">就地審計</asp:ListItem>
													<asp:ListItem Value="2">非就地審計</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="80"><asp:button id="BtnListData" runat="server" Text="列出資料"></asp:button></td>
											<td width="150"></td>
											<td width="80"></td>
											<td></td>
											<td align="right" width="80"></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="right"><asp:button id="BtnSave" runat="server" Text="就地審計設定存檔" Height="22"></asp:button></td>
							</tr>
							<tr>
								<td>
									<div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 900px; BORDER-BOTTOM: 1px groove; HEIGHT: 600px">
																		<asp:datagrid id="DataGrid1" runat="server" Width="100%" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False">
											<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" CssClass="Freezing" BackColor="#003366"></HeaderStyle>
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
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>												
												<asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="動支日期">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PlanName" SortExpression="PlanName" HeaderText="分支計畫名稱">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別名稱">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMoney" SortExpression="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="XX-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmPayName" SortExpression="acmPayName" HeaderText="廠商名稱">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo" SortExpression="acmNo" HeaderText="acmNo-11"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo1" SortExpression="acmNo1" HeaderText="acmNo1-12"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="inspect" SortExpression="inspect" HeaderText="inspect-13"></asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
			<COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    </form>
</body>
</html>
