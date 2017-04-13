<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmOffSetV3.aspx.vb" Inherits="UI.OffSet.Web.FrmOffSetV3" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />

</head>
<body>
    <form id="form1" runat="server">
  <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="600" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				<tr >
					<td>
						<table border=0 cellpadding=2 cellspacing=0 width=100% style="table-layout:fixed">
							<tr >
								<td  style="font-size:10pt"> &nbsp;</td>
								<td  style="font-size:10pt"> &nbsp;</td>
								<td  style="font-size:10pt"> &nbsp;</td>
								<td  style="font-size:10pt" ><asp:CheckBox ID="CBAcpUnitPassFlag" runat="server"  
                                        Text="秘書室審核"  TextAlign="Left" /></td>
								<td  style="font-size:10pt"> <asp:CheckBox ID="CBSecrearyFlag" runat="server"  Text="秘書室審核"  TextAlign="Left" Visible="False" /> </td>
								<td style="font-size:10pt"><asp:CheckBox ID="CBAccPassFlag" runat="server" Text="會計室審核" TextAlign="Left" /></td>
							</tr>
							</table>
					</td>
				</tr>
				<tr>
					<td><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder></td>
				</tr>
				<tr >
				    <td><asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder></td>
				</tr>
				<tr>
				    <td><asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder></td>
				</tr>

				<tr>
				    <td><asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder></td>
				</tr>

			</table>
		</td>
		<td valign="top" width="200" bgcolor="#ffffff" rowspan="3">
			<iframe id="iFrame" border="0" name="iFrame" frameborder="0" width="200" scrolling="no" height="520">
			</iframe>
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
								<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><input id="BtnPrint1" type="button" value="列印" onclick="fnCallPrntWeb();" style="height:22px" runat=server /></td>
								<td valign="bottom" align="center" style="width: 3px">
                                    <asp:DropDownList ID="DDLReport" runat="server">                                       
                                        <asp:ListItem Value="Gen01">支出憑證黏存單</asp:ListItem>
                                        <asp:ListItem Value="Gen03">支出科目分攤表</asp:ListItem>
                                        <asp:ListItem Value="Gen02">分批(期)付款表</asp:ListItem>
                                    </asp:DropDownList></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找動支編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找動支編號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server" /></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server" />
									<input id="TBModFlag" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server" />
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
											<asp:BoundColumn DataField="acmYear" HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="動支系統號" SortExpression="acmNo">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="動支編號" SortExpression="X.acmWordNum">                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
											<asp:BoundColumn DataField="DepName" HeaderText="執行單位" SortExpression="DepName">
												<HeaderStyle Width="80px"></HeaderStyle>
											</asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="承辦人員" SortExpression="acmWorkUserNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWorkUserNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmEmpNo") %>' ondblclick="clipboardData.setData('text', this.title)" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
											<asp:BoundColumn DataField="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,#}" SortExpression="acmMoney">
												<HeaderStyle Width="70px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmMemo" HeaderText="動支事由" SortExpression="acmMemo"></asp:BoundColumn>
											<asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動" SortExpression="acmModifyUser">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>											
											<asp:BoundColumn Visible="False" HeaderText="P1Counter-10">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acmBgtKind" HeaderText="結轉-11">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn  Visible="False" DataField="acmWordNum" HeaderText="動支編號-12">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmNo1" HeaderText="再簽次號-13" Visible="false" >
												<HeaderStyle Width="30px"></HeaderStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
				</tr>
				<tr>
					<td align="right">
					                        <table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                                    <tr>                                    
                                    <td style="width:200px; font-size:10pt" >共　<asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label>　筆資料｜</td>
                                    <td><font size="2">只列出｜</font></td>
                                    <td>&nbsp;<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
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

        <ComponentArt:CALENDAR id="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:CALENDAR>
        
        <asp:button id="BtnPrint" runat="server" Text="列印" Height="22" Visible="False"></asp:button>
        
        <script language="javascript">if(document.all("BtnSave").disabled) setShowBudget();</script>    </form>
</body>
</html>
