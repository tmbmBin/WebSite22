<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmBaseUser.aspx.vb" Inherits="UI.SystemData.Web.FrmBaseUser"%>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmBaseUser</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript">


		function UCCDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBAgentBDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function UCSDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBAgentEDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function fnCallFindStaffDialog(thisName) {

		    var strReturnVal = showModalDialog("../FrmFindStaff.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		    if (strReturnVal != "Cancel") {
		        //document.all(thisName).value = document.all(thisName).value + strReturnVal;
		    }

		    //Form1.TBFindSql.value=strReturnVal;

		}
        
        
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table id="table8" style="MARGIN-TOP: 10px; Z-INDEX: 101; LEFT: 20px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellSpacing="0" cellPadding="0" width="600" bgColor="#dadee9"
				border="1">
				<tr>
					<td valign="top">
						<table style="WIDTH: 598px; BORDER-COLLAPSE: collapse" borderColor="#f8f8fa" cellSpacing="0"
							cellPadding="1" width="598" bgColor="#dadee9" border="1">
							<tr>
								<td valign="top">
									<TABLE borderColor="#f8f8fa" cellSpacing="0" cellPadding="1" width="100%" border="0">
										<TR>
											<TD style="WIDTH: 76px; TEXT-ALIGN: right" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">登錄帳號</FONT></TD>
											<TD style="WIDTH: 186px"><asp:textbox id="TBUserID" runat="server" Width="100%" MaxLength="50"></asp:textbox></TD>
											<TD style="WIDTH: 76px;display:none" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">登錄群組</FONT></TD>
											<TD style="display:none" ><asp:textbox id="TBUserGroup" runat="server" Width="120" MaxLength="20" tabIndex="1"></asp:textbox></TD>
										</TR>
										<TR>
											<TD style="<%= strShowFlag(0) %>" style="WIDTH: 76px" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">登錄密碼</FONT></TD>
											<TD style="<%= strShowFlag(0) %>" style="WIDTH: 186px"><asp:textbox id="TBUserPass" tabIndex="2" runat="server" Width="100%" MaxLength="100" TextMode="Password"></asp:textbox></TD>
											<TD style="WIDTH: 76px" align="right" width="89"><FONT style="FONT-SIZE: 12pt" face="新細明體">登錄權限</FONT></TD>
											<TD><asp:textbox id="TBUserLevel" tabIndex="3" runat="server" Width="120" MaxLength="20"></asp:textbox></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 76px" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">登錄姓名</FONT></TD>
											<TD style="WIDTH: 186px"><asp:textbox id="TBUserName" tabIndex="4" runat="server" Width="100%" MaxLength="100"></asp:textbox></TD>
											<TD style="WIDTH: 89px;display:none" align="right" width="89"><FONT style="FONT-SIZE: 12pt" face="新細明體">作業年份</FONT></TD>
											<TD style="display:none"><asp:textbox id="TBWorkYear" tabIndex="5" runat="server" Width="120" MaxLength="20"></asp:textbox></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 76px" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">身分證號</FONT></TD>
											<TD style="WIDTH: 186px"><asp:textbox id="TBPersonID" tabIndex="6" runat="server" Width="100%" MaxLength="50"></asp:textbox></TD>
											<TD style="WIDTH: 89px;display:none" align="right" width="89"><FONT style="FONT-SIZE: 12pt" face="新細明體">作業月份</FONT></TD>
											<TD style="display:none"><asp:textbox id="TBWorkMonth" tabIndex="7" runat="server" Width="120" MaxLength="20"></asp:textbox></TD>
										</TR>
										<TR>
											<td style="WIDTH: 76px; HEIGHT: 24px" align="right">部門名稱</td>
											<td style="WIDTH: 186px"><asp:dropdownlist id="DDLDep" runat="server" 
                                                    width="150px" tabIndex="8"></asp:dropdownlist></td>
											<TD  style="display:none;WIDTH: 89px" align="right" width="89"><FONT style="FONT-SIZE: 12pt" face="新細明體">帳別</FONT></TD>
											<TD  style="display:none;HEIGHT: 24px"><asp:dropdownlist id="DDLTeam" runat="server" width="150px" tabIndex="8"></asp:dropdownlist></TD>
										</TR>
										<TR style="display:none">
											<td style="WIDTH: 76px; HEIGHT: 24px" align="right">人員種類</td>
											<td style="WIDTH: 186px">
                                           <asp:DropDownList ID="DDLPayKind" runat="server" AutoPostBack="True">
                                               <asp:ListItem Value="0">其他</asp:ListItem>
                                               <asp:ListItem Value="1">員工</asp:ListItem>
                                               <asp:ListItem Value="2">專戶</asp:ListItem>
                                               <asp:ListItem Value="3">債權人</asp:ListItem>
                                           </asp:DropDownList>
                                            </td>
											<TD style="WIDTH: 89px" align="right" width="89">員工姓名</TD>
											<TD  style="HEIGHT: 24px">
                                                <asp:dropdownlist id="DDLStaffName" runat="server" 
                                                    width="150px" tabIndex="8"></asp:dropdownlist>
                                                <input id="BtnFindStaff" onclick='fnCallFindStaffDialog();'  type="button" value="..." runat =server title="尋找員工資料" visible="false" /></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 76px; HEIGHT: 24px" align="right">機關名稱</TD>
											<TD colspan="3" style="HEIGHT: 24px">
                                                <asp:DropDownList ID="DDLAgentName" runat="server" tabIndex="8" width="230px">
                                                </asp:DropDownList>
                                            </TD>
										</TR>
										<TR style="DISPLAY:none">
											<TD colSpan="4">
												<TABLE style="BORDER-TOP: 2px solid; MARGIN-TOP: 2px" borderColor="#f8f8fa" cellSpacing="1"
													cellPadding="0" width="100%">
													<TR>
														<TD style="WIDTH: 76px" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">代理人員</FONT></TD>
														<TD colSpan="3"><asp:dropdownlist id="DDLAgent" runat="server" Width="120px" tabIndex="10"></asp:dropdownlist><INPUT type="button" value="..." id="BtnStaff" name="Button2" runat="server" Height="20px"
																style="WIDTH: 21px; HEIGHT: 20px"><asp:dropdownlist id="DDLStaff" runat="server" width="120" tabIndex="9" Visible="False"></asp:dropdownlist></TD>
													</TR>
													<TR>
														<TD style="WIDTH: 76px" align="right"><FONT style="FONT-SIZE: 12pt" face="新細明體">代理期間</FONT></TD>
														<TD style="WIDTH: 127px"><asp:textbox id="TBAgentBDate" ondblclick="JavaScript: UCCDate.Show();" tabIndex="11" runat="server"
																Width="120px" MaxLength="10"></asp:textbox></TD>
														<TD align="center" width="28"><FONT style="FONT-SIZE: 12pt" face="新細明體">至</FONT></TD>
														<TD align="left"><asp:textbox id="TBAgentEDate" ondblclick="JavaScript: UCSDate.Show();" tabIndex="12" runat="server"
																Width="120px" MaxLength="10"></asp:textbox></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left">
						<table style="MARGIN-TOP: 10px; Z-INDEX: 102; BORDER-COLLAPSE: collapse" borderColor="#f8f8fa"
							cellSpacing="0" cellPadding="0" border="1">
							<tr>
								<td>
									<table id="table12" style="TABLE-LAYOUT: fixed; WIDTH: 595px; BORDER-COLLAPSE: collapse"
										borderColor="#f8f8fa" cellSpacing="0" cellPadding="5" bgColor="#dadee9" border="1">
										<tr>
											<td>
												<table cellSpacing="0" cellPadding="0" border="0">
													<tr>
														<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Height="22" Text="新增"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Height="22" Text="修改"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid; WIDTH: 41px" vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Height="22" Text="刪除"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="儲存"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Height="22" Text="取消"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Height="22" Text="查詢"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Height="22" Text="列印"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Height="22" Text="離開"></asp:button></td>
														<td style="BORDER-LEFT: #edecf2 1px solid" vAlign="bottom" align="center"><asp:textbox id="TBSearchSql" onfocus="this.select()" onclick='this.value=""' runat="server"
																Width="96px" AutoPostBack="True" ToolTip="輸入帳號" style="Text-align:Center">輸入帳號</asp:textbox></td>
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
											<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" Height="72px" AllowPaging="True" CellPadding="3"
													BorderColor="White" BorderWidth="1px" AutoGenerateColumns="False" BackColor="White" BorderStyle="None">
													<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
													<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
													<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
													<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
													<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
													<Columns>
														<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
															<HeaderStyle Width="30px"></HeaderStyle>
														    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                                Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" 
                                                                Wrap="False" />
														</asp:ButtonColumn>
														<asp:BoundColumn DataField="PK_usrNo" HeaderText="編號" Visible="False"></asp:BoundColumn>
														<asp:BoundColumn DataField="usrName" HeaderText="登錄姓名">
                                                            <HeaderStyle Width="150px" />
                                                        </asp:BoundColumn>
														<asp:BoundColumn DataField="usrAlias" HeaderText="登錄帳號"></asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="AgentName" HeaderText="代理人"></asp:BoundColumn>
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
		    <COMPONENTART:CALENDAR id="UCSDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCSDate_Change"
																PopUp="Custom" PopUpExpandControlId="TBAgentEDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
																PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader"
																DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR><COMPONENTART:CALENDAR id="UCCDate" runat="server" cultureid="1028" ClientSideOnSelectionChanged="UCCDate_Change"
																PopUp="Custom" PopUpExpandControlId="TBAgentBDate" CalendarCssClass="calendar" PrevImageUrl="../images/cal_prevMonth.gif" NextImageUrl="../images/cal_nextMonth.gif"
																PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader"
																DayCssClass="day" CalendarTitleCssClass="title"></COMPONENTART:CALENDAR>
		</form>
	</body>
</HTML>
