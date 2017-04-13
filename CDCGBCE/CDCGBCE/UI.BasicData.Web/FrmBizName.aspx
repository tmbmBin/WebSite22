<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmBizName.aspx.vb" Inherits="UI.BasicData.Web.FrmBizName"%>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmBizName</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
									<table id="table6" style="WIDTH: 552px; HEIGHT: 143px" cellSpacing="0" cellPadding="1"
										border="0">
										<tr>
											<td style="WIDTH: 115px" align="right" width="115"><font style="FONT-SIZE: 11pt" face="新細明體">科目版本別</font></td>
											<td width="158"><asp:textbox id="TBYear" runat="server" MaxLength="3" Width="100%"></asp:textbox></td>
											<td style="WIDTH: 96px" align="right" width="96">列印代號</td>
											<td width="162"><asp:textbox id="TBNo" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 115px" align="right" width="115"><font style="FONT-SIZE: 11pt" face="新細明體">承辦業務代碼</font></td>
											<td width="158"><asp:textbox id="TBID" runat="server" MaxLength="6" Width="100%"></asp:textbox></td>
											<td style="WIDTH: 96px" align="right" width="96"><FONT style="FONT-SIZE: 11pt" face="新細明體">列印名稱</FONT></td>
											<td width="162"><asp:textbox id="TBAlias" runat="server" MaxLength="30" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 115px; HEIGHT: 27px" align="right" width="115"><font style="FONT-SIZE: 11pt" face="新細明體"><FONT style="FONT-SIZE: 11pt" face="新細明體"><FONT style="FONT-SIZE: 11pt" face="新細明體">承辦業務</FONT></FONT>名稱</font></td>
											<td style="HEIGHT: 27px" colSpan="3"><asp:textbox id="TBName" runat="server" MaxLength="50" Width="100%"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 115px" align="right"><font style="FONT-SIZE: 11pt" face="新細明體">建立日期</font></td>
											<td><asp:textbox id="TBCreateDate" ondblclick="JavaScript: UCCDate.Show();" runat="server" MaxLength="10"
													Width="100%"></asp:textbox><COMPONENTART:CALENDAR id="UCCDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCCDate_Change"
													PopUp="Custom" PopUpExpandControlId="TBCreateDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
													PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
													DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR></td>
											<td style="WIDTH: 96px" align="right" width="96" height="31"><font style="FONT-SIZE: 11pt" face="新細明體">是否停用</font></td>
											<td width="162" height="31"><asp:dropdownlist id="DDLStop" runat="server" Width="100%">
													<asp:ListItem Value="0">否</asp:ListItem>
													<asp:ListItem Value="1">是</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="WIDTH: 115px" align="right" height="31"><font style="FONT-SIZE: 11pt" face="新細明體">停用日期</font></td>
											<td width="158" height="31"><asp:textbox id="TBStopDate" ondblclick="JavaScript: UCSDate.Show();" runat="server" MaxLength="10"
													Width="100%"></asp:textbox><COMPONENTART:CALENDAR id="UCSDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCSDate_Change"
													PopUp="Custom" PopUpExpandControlId="TBStopDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
													PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover"
													DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR>
											<td style="WIDTH: 96px" align="right"></td>
											<td width="162"><FONT face="新細明體"></FONT></td>
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
														<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Height="22" Text="新增"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Height="22" Text="修改"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Height="22" Text="刪除"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="儲存"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Height="22" Text="取消"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Height="22" Text="查詢"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Height="22" Text="列印"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Height="22" Text="離開"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnImport" runat="server" Height="22" Text="匯入" ToolTip="匯入上年度資料"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True">輸入代碼</asp:textbox></td>
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
											<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" Height="72px" BorderStyle="None" BackColor="White"
													AutoGenerateColumns="False" BorderWidth="1px" BorderColor="White" CellPadding="3" AllowPaging="True">
													<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
													<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
													<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
													<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
													<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
													<Columns>
														<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select"></asp:ButtonColumn>
														<asp:BoundColumn DataField="codCodeVer" HeaderText="科目版本別"></asp:BoundColumn>
														<asp:BoundColumn DataField="bizCode" HeaderText="承辦業務代碼"></asp:BoundColumn>
														<asp:BoundColumn DataField="bizName" HeaderText="承辦業務名稱"></asp:BoundColumn>
														<asp:BoundColumn DataField="bizCreateDate" HeaderText="建立日期"></asp:BoundColumn>
														<asp:BoundColumn DataField="bizStopFlag" HeaderText="停用否"></asp:BoundColumn>
														<asp:BoundColumn DataField="bizStopDate" HeaderText="停用日期"></asp:BoundColumn>
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
