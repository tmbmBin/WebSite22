<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmOutlayCode.aspx.vb" Inherits="UI.BasicData.Web.FrmOutlayCode" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>用途別代碼維護</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript">


		function UCCDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBCreateDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function UCSDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBStopDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}


		</script>
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
									<table id="table6" style="WIDTH: 500px; HEIGHT: 168px" cellSpacing="0" cellPadding="1"
										border="0">
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="新細明體">科目年度別</font></td>
											<td width="158"><asp:textbox id="TBYear" runat="server" Width="100%" MaxLength="3"></asp:textbox></td>
											<td style="WIDTH: 83px" align="right"><font style="FONT-SIZE: 11pt" face="新細明體">列印代號</font></td>
											<td width="162"><asp:textbox id="TBNo" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="新細明體">用途別代碼</font></td>
											<td><asp:textbox id="TBID" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="新細明體">列印名稱</font></td>
											<td width="162"><asp:textbox id="TBAliasName" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="新細明體">級別</font></td>
											<td><asp:textbox id="TBLevel" runat="server" Width="100%" MaxLength="2"></asp:textbox></td>
											<td align="right"><font style="FONT-SIZE: 11pt" face="新細明體">結尾級別</font></td>
											<td><asp:textbox id="TBEndLevel" runat="server" Width="100%" MaxLength="30"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="89"><font style="FONT-SIZE: 11pt" face="新細明體">用途別名稱</font></td>
											<td colSpan="3"><asp:textbox id="TBName" runat="server" Width="100%" MaxLength="60"></asp:textbox></td>
										</tr>
										<tr style="DISPLAY:none">
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="新細明體">門別</font></td>
											<td><asp:dropdownlist id="DDLAccKind" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">不分類</asp:ListItem>
													<asp:ListItem Value="1">經常門</asp:ListItem>
													<asp:ListItem Value="2">資本門</asp:ListItem>
													<asp:ListItem Value="3">經資門</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="新細明體">科目性質</font></td>
											<td width="162"><asp:dropdownlist id="DDLOulType" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">不分類</asp:ListItem>
													<asp:ListItem Value="1">預算性質</asp:ListItem>
													<asp:ListItem Value="2">非預算性質</asp:ListItem>
													<asp:ListItem Value="3">現金科目</asp:ListItem>
													<asp:ListItem Value="31">存款</asp:ListItem>
													<asp:ListItem Value="4">資產科目</asp:ListItem>
													<asp:ListItem Value="41">公務車輛</asp:ListItem>
													<asp:ListItem Value="5">收支並列科目</asp:ListItem>
													<asp:ListItem Value="6">用人科目</asp:ListItem>
													<asp:ListItem Value="61">薪資</asp:ListItem>
													<asp:ListItem Value="7">信託代理與保證科目</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr style="DISPLAY:none">
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="新細明體">末層旗標</font></td>
											<td><asp:dropdownlist id="DDLFinalLevel" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">有細項分類</asp:ListItem>
													<asp:ListItem Value="1">最末層(無細項分類)</asp:ListItem>
													<asp:ListItem Value="2">本項末層(有細項分類)</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="新細明體">對應計畫</font></td>
											<td width="162"><asp:dropdownlist id="DDLMapPlan" runat="server" Width="100%">
													<asp:ListItem Value="1">實帳戶對應虛帳戶(財產科目)</asp:ListItem>
													<asp:ListItem Value="2">支出對應收入(收支並列)</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="DISPLAY: none;WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="新細明體">檢查碼</font></td>
											<td style="DISPLAY:none"><asp:textbox id="TBCheckNo" runat="server"></asp:textbox></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="新細明體">建立日期</font></td>
											<td width="162"><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" Width="100%"
													MaxLength="10"></asp:textbox><COMPONENTART:CALENDAR id="UCCDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
													DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long"
													NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBCreateDate"
													PopUp="Custom" ClientSideOnSelectionChanged="UCCDate_Change" cultureid="1028"></COMPONENTART:CALENDAR></td>
										</tr>
										<tr>
											<td style="WIDTH: 89px" align="right"><font style="FONT-SIZE: 11pt" face="新細明體">是否停用</font></td>
											<td><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
													<asp:ListItem Value="0">否</asp:ListItem>
													<asp:ListItem Value="1">是</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="83"><font style="FONT-SIZE: 11pt" face="新細明體">停用日期</font></td>
											<td width="162"><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" Width="100%"
													MaxLength="10"></asp:textbox><COMPONENTART:CALENDAR id="UCSDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
													DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long"
													NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBStopDate"
													PopUp="Custom" ClientSideOnSelectionChanged="UCSDate_Change" cultureid="1028"></COMPONENTART:CALENDAR></td>
										</tr>
										 <tr>
											<td align="right" ><font style="FONT-SIZE: 11pt" face="新細明體">種類</font></td>
											<td   >
                                                <asp:DropDownList ID="DDLPlanCateName" runat="server">
                                                </asp:DropDownList>
                                            </td>
											<td align="right"  >
											<td>
												
										    </td>
								 
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
														<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Text="離開" Height="22"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnImport" runat="server" Height="22" Text="匯入" ToolTip="匯入上年度資料"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True">輸入用途別代碼</asp:textbox></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
																value="s" name="btn_goto"></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
																runat="server">
														</td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnImportGBA" runat="server" Text="匯入用途別" Height="22" Visible="False"></asp:button></td>
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
													<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
													<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
													<Columns>
														<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select"></asp:ButtonColumn>
														<asp:BoundColumn DataField="codCodeVer" HeaderText="年度"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulOutlayCode" HeaderText="用途別代碼"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulOutlayName" HeaderText="用途別名稱"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulLevel" HeaderText="級別"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulCreateDate" HeaderText="建立日期"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulStopFlag" HeaderText="停用否"></asp:BoundColumn>
														<asp:BoundColumn DataField="oulStopDate" HeaderText="停用日期"></asp:BoundColumn>
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
