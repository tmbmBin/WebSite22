<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmIncome.aspx.vb" Inherits="UI.Budget.Web.FrmIncome" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="No-cache" />
    <script language="javascript" type="text/javascript">
        function check_Num() {
            if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
                return true;
            }
            else { event.keyCode = 0; false; }
        }
        function fnCallPhraseDialog(thisName) {

            var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                document.all(thisName).value = document.all(thisName).value + strReturnVal;
            }
        }
        function UCDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBBgtDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">

    <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="850" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="650" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				<tr>
					<td>
						<table border=0 cellpadding=2 cellspacing=0 width=100% style="table-layout:fixed">
							<tr>
								<td style="font-size:10pt">&nbsp;</td>
								<td style="font-size:10pt">&nbsp;</td>
								<td style="font-size:10pt">&nbsp;</td>
								<td style="font-size:10pt">&nbsp;</td>
								<td style="font-size:10pt"><asp:CheckBox ID="CBAcmUnitPassFlag" runat="server" 
                                        Text="單位審核"  TextAlign="Left" Visible="False" /></td>
								<td style="font-size:10pt"><asp:CheckBox ID="CBAccPassFlag" runat="server" Text="主計室審核" TextAlign="Left" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
				    <td>
				        <table cellpadding="1" cellspacing="0" style=" table-layout: fixed" border="0" width="100%">
										<tr style="display:none">
											<td width="100px" align="right">&nbsp;</td>
											<td width="120px">&nbsp;</td>
											<td width="100px" align="right">&nbsp;</td>
											<td width="120px">&nbsp;</td>
											<td width="100px" align="right">&nbsp;</td>
											<td align="right">&nbsp;</td>
										</tr>
										<tr>
											<td align="right">收入年度：</td>
											<td><asp:TextBox id="TBBgtYear" runat="server" style="text-align: center" 
                                                    BackColor="Transparent" Width="110px" onfocus="this.blur();"></asp:TextBox></td>
											<td align="right">收入序號：</td>
											<td><asp:TextBox id="TBBgtNo" runat="server" MyName="TBAcmMoney" 
                                                    style="text-align:center" BackColor="Transparent" Width="110px" 
                                                    onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
											<td align="right">&nbsp;</td>
											<td></td>
										</tr>
										<tr>
											<td align="right">經費單位：</td>
											<td colspan="3">
                                                <asp:DropDownList id="DDLBgtDepName" 
                                                    style="background-color: #FFFFE0" runat="server" Width="120px"></asp:DropDownList></td>
                                            <td align="right"></td>
                                            <td></td>
										</tr>
										<tr>
											<td align="right">收入日期：</td>
											<td><asp:TextBox id="TBBgtDate" runat="server" 
                                                    style="text-align: center; background-color: #FFFFE0" Width="110px" 
                                                    ondblclick="JavaScript: UCDate.Show();"></asp:TextBox></td>
											<td align="right">收入金額：</td>
											<td>
                                                <asp:TextBox id="TBBgtMoney" runat="server" 
                                                    style="text-align: right; background-color: #FFFFE0" Width="110px" 
                                                     onkeypress="return check_Num()" ></asp:TextBox></td>
                                            <td align="left"><asp:label id="LBUnitName" runat="server" Font-Size="Small" 
                                                    ForeColor="Red">(單位：千元)</asp:label></td>
                                            <td>&nbsp;</td>
										</tr>
										<tr>
											<td align="right" style=" font-size:10pt">計畫年度與科目</td>
											<td width="500" colspan="4" nowrap>
                                                <asp:DropDownList id="DDLOulYear" 
                                                    style="background-color: #FFFFE0" runat="server" Width="50px"></asp:DropDownList>
                                                <asp:DropDownList id="DDLPlanName" style="background-color: #FFFFE0" 
                                                    runat="server"></asp:DropDownList></td>
                                                    <td></td>
										</tr>
										<tr>
											<td align="right">事　　由：</td>
											<td width="500" colspan="5" nowrap>
                                                <asp:TextBox ID="TBBgtMemo" runat="server" style="background-color: #FFFFE0" 
                                                    Width="440px"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..." onclick="fnCallPhraseDialog('TBBgtMemo');"/></td>
										</tr>
									</table>
							</td>
				</tr>
				</table>
		</td>
		<td valign="top" width="200" bgcolor="#ffffff" rowspan="3"><iframe id="iFrame" border="0" name="iFrame" frameborder="0" width="200" scrolling="no" height="300"></iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="5"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
				<tr>
					<td valign="bottom" align="left">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" 
                                        Text="查詢" Height="22" Visible="False"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" 
                                        Text="列印" Height="22" Visible="False"></asp:button></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">
								    &nbsp;</td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找編號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s" />
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server" /></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
					    <asp:datagrid id="DataGrid1" runat="server" Width="650px" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
											    <HeaderStyle Width="30px" Font-Size="X-Small" ></HeaderStyle>
											    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Font-Size="X-Small"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="bgtYear" HeaderText="年度">
												<HeaderStyle Width="30px" Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Font-Size="X-Small" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgtNo" HeaderText="編號">
												<HeaderStyle Width="40px" Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Font-Size="X-Small" ></ItemStyle>
											</asp:BoundColumn>
												<asp:BoundColumn DataField="bgtDate" HeaderText="收入日期">
												<HeaderStyle Width="70px" Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Font-Size="X-Small" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="BgtDepName" HeaderText="經費單位">
												<HeaderStyle Width="80px" Font-Size="X-Small" ></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="BgtDepName" HeaderText="計畫科目">
												<HeaderStyle Width="150px" Font-Size="X-Small" ></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgtMoney" HeaderText="收入金額" DataFormatString="{0:#,#}">
												<HeaderStyle Width="70px" Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Font-Size="X-Small" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgtMemo" HeaderText="備註">
											    <HeaderStyle Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle Font-Size="X-Small" ></ItemStyle>											</asp:BoundColumn>											 
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
				</tr>
				<tr>
					<td align="right">
					    <table style="BORDER-COLLAPSE: collapse" cellpadding="0" border="0">
                                    <tr>                                    
                                    <td style="width:200px; font-size:10pt" >共　<asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label>　筆資料｜</td>
                                    <td><font size="2">只列出｜</font></td>
                                    <td>&nbsp;<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" 
                                            AutoPostBack="True" Visible="False">
                                                                    <asp:ListItem Value="0">......</asp:ListItem>
                                                                    <asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
                                                                    <asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
                                                                    <asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
                                                                    <asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
                                                                    <asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
                                                                    <asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
                                                                    <asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
                                                                    <asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
                                                                    <asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
                                                                    <asp:ListItem Value="10">10月</asp:ListItem>
                                                                    <asp:ListItem Value="11">11月</asp:ListItem>
                                                                    <asp:ListItem Value="12">12月</asp:ListItem>
                                                            </asp:dropdownlist>
                                    </td>
                                    <td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
                                    <td><asp:dropdownlist id="DDLSortPassFlag" runat="server" AutoPostBack="True">
                                                                    <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                    <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                    <asp:ListItem Value="">不區分</asp:ListItem>
                                                                    
                                                                    
                                    </asp:dropdownlist></td>
                                    <td><font size="2">&nbsp;
                                        </font></td>

                                    </tr>
                            </table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
        <ComponentArt:Calendar ID="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBBgtDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
    </form>
</body>
</html>
