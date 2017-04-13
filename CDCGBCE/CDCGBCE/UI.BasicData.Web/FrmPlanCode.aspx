<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPlanCode.aspx.vb" Inherits="UI.BasicData.Web.FrmPlanCode" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>計畫代碼維護</title>
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
							cellPadding="1" width="600px" bgColor="#dadee9" border="1">
							<tr>
								<td width="0">
									<table  width="100%" cellSpacing="0" cellPadding="1" border="0">
										<tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">科目年度別</font></td>
											<td width="170"  ><asp:textbox id="TBYear" runat="server" MaxLength="3" Width="100%"></asp:textbox></td>
											<td  align="right" width="80"><font style="FONT-SIZE: 11pt" face="新細明體">列印代號</font></td>
											<td  ><asp:textbox id="TBNo" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">計畫代碼</font></td>
											<td width="170"><asp:textbox id="TBID" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
											<td align="right" width="80"  ><font style="FONT-SIZE: 11pt" face="新細明體">列印名稱</font></td>
											<td  ><asp:textbox id="TBAliasName" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">級別</font></td>
											<td width="170"><asp:textbox id="TBLevel" runat="server" MaxLength="2" Width="100%"></asp:textbox></td>
											<td align="right" width="80"  >結尾級別</td>
											<td  ><asp:textbox id="TBEndLevel" runat="server" MaxLength="2" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">計畫名稱</font></td>
											<td colSpan="3"  ><asp:textbox id="TBName" runat="server" MaxLength="60" Width="100%"></asp:textbox></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90">借貸方</td>
											<td width="170"><asp:dropdownlist id="DDLDebit" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">不分類</asp:ListItem>
													<asp:ListItem Value="1">借方</asp:ListItem>
													<asp:ListItem Value="2">貸方</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="80"  >門別</td>
											<td  ><asp:dropdownlist id="DDLAccKind" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">不分類</asp:ListItem>
													<asp:ListItem Value="1">經常門</asp:ListItem>
													<asp:ListItem Value="2">資本門</asp:ListItem>
													<asp:ListItem Value="3">經資門</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90">科目性質</td>
											<td width="170"><asp:dropdownlist id="DDLPlanKind" runat="server" Width="100%">
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
											<td align="right" width="80">科目類別</td>
											<td width="163" height="31"><asp:dropdownlist id="DDLPlanType" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">不分類</asp:ListItem>
													<asp:ListItem Value="1">實帳戶(結轉)</asp:ListItem>
													<asp:ListItem Value="2">虛帳戶(收支)</asp:ListItem>
													<asp:ListItem Value="3">統計科目</asp:ListItem>
													<asp:ListItem Value="4">財產統制科目</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr  style="DISPLAY:none">
											<td align="right" width="90">受款人旗標</td>
											<td width="170"><asp:dropdownlist id="DDLAbatedKind" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">沖銷</asp:ListItem>
													<asp:ListItem Value="1">沖銷和受款人</asp:ListItem> 
												</asp:dropdownlist></td>
											<td align="right" width="80"  >沖銷性質</td>
											<td ><asp:dropdownlist id="DDLAbateKind" runat="server" 
                                                    Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">不冲銷</asp:ListItem>
													<asp:ListItem Value="1">科目沖銷</asp:ListItem>
													<asp:ListItem Value="2">受款人沖銷</asp:ListItem>
													<asp:ListItem Value="2">科目、受款人沖銷</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90">末層旗標</td>
											<td width="170"><asp:dropdownlist id="DDLFinalLevel" runat="server" Width="100%">
													<asp:ListItem Value="">......</asp:ListItem>
													<asp:ListItem Value="0">有細項分類</asp:ListItem>
													<asp:ListItem Value="1">最末層(無細項分類)</asp:ListItem>
													<asp:ListItem Value="2">本項末層(有細項分類)</asp:ListItem>
												</asp:dropdownlist></td>
											<td align="right" width="80" >檢查碼</td>
											<td  ><asp:textbox id="TBCheckNo" runat="server" MaxLength="2" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">建立日期</font>
											</td>
											<td width="170"><COMPONENTART:CALENDAR id="UCCDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCCDate_Change"
													PopUp="Custom" PopUpExpandControlId="TBCreateDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif"
													NextImageUrl="../images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday"
													MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" MaxLength="10"
													Width="100%"></asp:textbox></td>
											<td align="right" width="80"><font style="FONT-SIZE: 11pt" face="新細明體">是否停用</font></td>
											<td width="163" height="31"><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
													<asp:ListItem Value="0">否</asp:ListItem>
													<asp:ListItem Value="1">是</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">停用日期</font></td>
											<td width="170" ><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" MaxLength="10"
													Width="100%"></asp:textbox><COMPONENTART:CALENDAR id="UCSDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCSDate_Change"
													PopUp="Custom" PopUpExpandControlId="TBStopDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
													PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
													DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR>
											<td   align="right" width="80">&nbsp;<td  >
												&nbsp;</td>
								 
							            </tr>
							            <tr>
											<td align="right" width="90">分支代碼
											</td>
											<td width="170" >
												<asp:TextBox id="TBAliasNo1" runat="server"></asp:TextBox>
                                            </td>
											<td align="right" width="80">
											    分項代碼
											<td>
												
												<asp:TextBox id="TBAliasNo2" runat="server"></asp:TextBox>
												
										    </td>
								 
							            </tr>

							            <tr>
											<td align="right" width="90"><font style="FONT-SIZE: 11pt" face="新細明體">種類</font></td>
											<td width="170" >
                                                <asp:DropDownList ID="DDLPlanCateName" runat="server">
                                                </asp:DropDownList>
                                            </td>
											<td align="right" width="80">
											<td>
												
										    </td>
								 
							            </tr>

						</table>
 
					</td>
				</tr>
			</table>
			</td></tr>
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
															Width="96px" AutoPostBack="True">請輸入計畫代碼</asp:textbox></td>
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
										<td><asp:datagrid id="DataGrid1" runat="server" Width="600px" AllowPaging="True" CellPadding="3" BorderColor="White"
												BorderWidth="1px" AutoGenerateColumns="False" BackColor="White" BorderStyle="None">
												<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
												<SelectedItemStyle Font-Size="Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
												<EditItemStyle Font-Size="Small"></EditItemStyle>
												<AlternatingItemStyle Font-Size="X-Small" BackColor="#F7F7F7"></AlternatingItemStyle>
												<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
												<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
												<Columns>
													<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
														<HeaderStyle Width="1cm"></HeaderStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:ButtonColumn>
													<asp:BoundColumn DataField="codCodeVer" HeaderText="年度">
														<HeaderStyle Width="1cm"></HeaderStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="plnPlanCode" HeaderText="計畫代碼">
														<ItemStyle Font-Size="X-Small"></ItemStyle>
														<FooterStyle Font-Size="Small"></FooterStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="plnPlanName" HeaderText="計畫名稱">
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="plnLevel" HeaderText="級別">
														<HeaderStyle Width="1cm"></HeaderStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="plnCreateDate" HeaderText="建立日期">
														<HeaderStyle Width="2cm"></HeaderStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="plnStopFlag" HeaderText="停用否">
														<HeaderStyle Width="12mm"></HeaderStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="plnStopDate" HeaderText="停用日期">
														<HeaderStyle Width="2cm"></HeaderStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
													</asp:BoundColumn>
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
			</table></form>
	</body>
</HTML>
