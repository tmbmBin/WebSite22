<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashIn.aspx.vb" Inherits="UI.Cash.Web.FrmCashIn" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
     <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
    <script>
		function check_Num(){
				if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
					return true;}
				else{event.keyCode=0;false;}
		}


        function UCDate_Change(calendar)
        {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBCinDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
           // CssClass="Freezing"
        }

   
	function replaceString(sString, sReplaceThis, sWithThis) 
	{ 
		if (sReplaceThis != "" && sReplaceThis != sWithThis)
		{
			var counter = 0;
			var start = 0;
			var before = "";
			var after = "";
			
			while (counter<sString.length)
			{
				start = sString.indexOf(sReplaceThis, counter);
				if (start == -1)
				{
					break;
				}
				 else
				 {
					before = sString.substr(0, start);
					after = sString.substr(start + sReplaceThis.length, sString.length);
					sString = before + sWithThis + after;
					counter = before.length + sWithThis.length;
				}
			}
		}
		
		return sString;
	}
	



     </script>    
</head>
<body>
    <form id="form1" runat="server">
   <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668"  width="600px" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" border="1" width="100%">			 
				<tr>
					<td>
						<table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
						    <tr   >
						        <td align="right" style="width: 75px">撥入年度</td>
						        <td style="width: 90px"><asp:TextBox ID="TBCinYear" runat="server" Width="80px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
						        <td align="right" style="width: 70px">撥入編號</td>
						        <td style="width: 90px"><asp:TextBox ID="TBCinNo" runat="server" Width="80px"  BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
						        <td align="right" style="width: 70px" >帳別</td>
								<td >
                                    <asp:DropDownList ID="ddl_cashSort" runat="server" Width="110px" 
                                        style="BACKGROUND-COLOR: #ffffe0">
                                    </asp:DropDownList>
                                </td>
						    </tr>
							<tr>
								<td align="right" style="width: 75px">撥入日期</td>
								<td style="width: 90px"><asp:TextBox ID="TBCinDate" runat="server" ondblclick="JavaScript: UCDate.Show();" Width="80px" style="text-align:center"></asp:TextBox></td>
								<td align="right" style="width: 70px">撥入金額</td>
								<td style="width: 90px"><asp:TextBox ID="TBCinMoney" runat="server" Width="80px"   style="text-align:right" onkeypress="return check_Num()"  MyName ="TBAcmMoney"></asp:TextBox></td>
								<td align="right" ></td>
								<td ></td>
							</tr>
							<tr>
							    <td style="width: 75px; text-align: right;">備 &nbsp; &nbsp; &nbsp; &nbsp;註</td>
							    <td colspan="5"><asp:TextBox ID="TBMemo" runat="server" Width="457px"></asp:TextBox>
                                    <input id="BtnPhrase" runat="server" type="button" value="..." 
                                        disabled="disabled" style="display:none" /></td>
							</tr>
							<tr style="Display:none">
								<td align="right" style="width: 75px"> </td>
								<td style="width: 110px"></td>
								<td align="right" style="width: 70px"></td>
								<td style="width: 120px"><asp:TextBox ID="TBCsmYear" runat="server" Width="48px"></asp:TextBox></td>
								<td align="right" ><asp:TextBox ID="TBCsmNo" runat="server" Width="48px"></asp:TextBox></td>
								<td ></td>
							</tr>
						</table>
					</td>
				</tr>				
			</table>
		</td>
		<td valign="top" width="200" bgcolor="#ffffff" rowspan="3"><iframe id="iFrame" border="0" name="iFrame" src="FrmShowCash.aspx" frameborder="0" width="200" scrolling="no" height="200"></iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="10"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5"  border="1" width="100%">
				<tr>
					<td valign="bottom" align="left">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center" style="display:none"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:Button ID="BtnAddInital" runat="server" Text="新增期初" Height="22"></asp:button></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找撥還批號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找撥還批號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="DataGrid1" runat="server" Width="600px" AutoGenerateColumns="False" AllowSorting="True"
										AllowPaging="True" PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                <HeaderStyle Width="30px" />
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="csmYear" HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle   HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn   DataField="cinNo" HeaderText="撥入批號" Visible="False">
												<HeaderStyle Width="60px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"  ></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="撥還批號">
											    <HeaderStyle  Width="60px" Wrap="False"></HeaderStyle>
											    <ItemStyle HorizontalAlign="Center"  ></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBCsmNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmBatchNo") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
												<asp:BoundColumn DataField="csmSDate" HeaderText="撥還期間">
												<HeaderStyle Width="85px" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn  DataField="csmCnt" HeaderText="撥還數量">
												<HeaderStyle Width="50px"></HeaderStyle>
                                                <ItemStyle   HorizontalAlign="Center" />
                                                </asp:BoundColumn>
											<asp:BoundColumn DataField="csmMoney" HeaderText="撥還金額" DataFormatString="{0:#,#}">
												<HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemStyle  HorizontalAlign="Right" Wrap="False" />
											</asp:BoundColumn>
												<asp:BoundColumn DataField="cinMoney" HeaderText="撥入金額" DataFormatString="{0:#,#}">
												<HeaderStyle  Width="60px"></HeaderStyle>
                                                <ItemStyle  HorizontalAlign="Right" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmMemo" HeaderText="備註" Visible="false">	
											</asp:BoundColumn>
										    <asp:BoundColumn DataField="csmEDate" HeaderText="撥還期間" Visible="False">
                                                <HeaderStyle  Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" />
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="帳別">
											    <HeaderStyle  Width="70px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBSort" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csName") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>																			
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
				</tr>
				<tr>
					<td align="right">
					    <table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                                    <tr>
                                    <td><font size="2">只列出｜</font></td>
                                    <td>&nbsp;<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
                                                                    <asp:ListItem Value="">......</asp:ListItem>
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
                                    <td><asp:DropDownList ID="ddl_Sort" runat="server" AutoPostBack="True"></asp:DropDownList><asp:dropdownlist id="DDLSortStatus" runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="">......</asp:ListItem>
                                        <asp:ListItem Value="1">未撥入</asp:ListItem>
                                        <asp:ListItem Value="2" Selected="True">已撥入</asp:ListItem>
                                    </asp:dropdownlist></td>
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
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBCinDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
    </form>
</body>
</html>
