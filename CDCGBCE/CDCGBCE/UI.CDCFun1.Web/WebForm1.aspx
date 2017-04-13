<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="UI.CDCFun1.Web.WebForm1" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5"
				width="1200" bgcolor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						valign="top" align="left">
						<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
							border="1">
							<tr>
								<td>
                                    <table cellSpacing="0" cellPadding="1" width="100%" border="0">
                                        <tr>
                                            <td align="right" width="90">日期區間：</td>
                                            <td colspan="3">
                                                <asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px" Visible=false ></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
                                                <asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>
            　                                    
            　                                    
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">經費單位：</td>
                                            <td class="style2"><asp:DropDownList ID="DDLBgtDepName" runat="server"></asp:DropDownList></td>
                                            <td align="right" class="style1">執行單位：</td>
                                            <td><asp:DropDownList ID="DDLWorkDepName" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">計畫名稱：</td>
                                            <td colspan="3">
                                                <asp:DropDownList ID="DDLPlanName" runat="server" Width="480px"></asp:DropDownList>
            　                                    
            　                                    
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">用途別：</td>
                                            <td colspan="3"><asp:DropDownList ID="DDLOul" runat="server" Width="480px"></asp:DropDownList>　　</td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="90">金額：</td>
                                            <td class="style2"><asp:TextBox ID="TBMoney" runat="server" Width="120px"></asp:TextBox></td>
                                            <td align="right" class="style1">廠商名稱：</td>
                                            <td ><asp:TextBox ID="TBPayName" runat="server" Width="280px" 
                                                    style="margin-left: 0px"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td align="right" width="90">動支編號：</td>
                                            <td class="style2"><asp:textbox id="TBAcmWordNum" runat="server" Width="80px" ></asp:textbox></td>
                                            <td align="right" class="style1">預設值類型：</td>
                                            <td>
                                                <asp:DropDownList ID="DDLRptName" runat="server">
                                                    <asp:ListItem Value="7">補、捐(獎)助其他政府機關或團體私人經費報告</asp:ListItem>
                                                    <asp:ListItem Value="6">委託辦理計畫(事項)經費報告表</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">設定狀態：</td>
                                            <td class="style2"><asp:DropDownList ID="DDLStatus" runat="server">
                                                <asp:ListItem Value="">------</asp:ListItem>
                                                <asp:ListItem Value="1">無預設值</asp:ListItem>
                                                <asp:ListItem Value="0">已設定</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td  align="right" class="style1">報支廠商：</td>
                                            <td>
                                                <asp:DropDownList ID="DDLPayNameFlag" runat="server">
                                                    <asp:ListItem Value="">------</asp:ListItem>
                                                    <asp:ListItem Value="0">未輸入</asp:ListItem>
                                                    <asp:ListItem Value="1">已輸入</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="90">事由：</td><td colspan=3>
                                            <asp:TextBox ID="TBAcmMemo" runat="server" Width="684px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
							    </td>
							</tr>
							<tr>
								<td>
									<asp:button id="BtnPrint" runat="server" Width="75px" Text="列出資料" Height="22px"></asp:button>
								    <asp:CheckBox ID="CBShowType" runat="server" Text="只顯示報支後資料" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" height="10"></td>
				</tr>
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						bordercolor="#666668">
						<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
						    <tr>
						        <td>
                                    <asp:Button ID="BtnSave" runat="server" Text="合併動支號存檔" Visible=true  />
                                </td>
						    </tr>
							<tr>
								<td>
									<asp:datagrid id="DataGrid1" runat="server" Width="100%" 
                                        AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" 
                                        PageSize="20">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="編輯" >
											    <HeaderStyle Width="40px"></HeaderStyle>
                                                <ItemTemplate   >
                                                    <asp:HyperLink ID="HLRptDtl"  Target="_blank"  NavigateUrl ='<%#   "FrmRptExtraDtl.aspx?workstatus=edit&acmYear="& Container.DataItem("acmYear") & "&acmNoPrv="& Container.DataItem("acmNoPrv")  &"&acmNo=" & Container.DataItem("acmNo") &"&acvNo=" & Container.DataItem("acvNo") &"&acmNo1=" & Container.DataItem("acmNo1") &"&acvNo1=" & Container.DataItem("acvNo1") &"&acmNo2=" & Container.DataItem("acmNo2")  &"&acvNo2=" & Container.DataItem("acvNo2")  &"&acpPayYear=" & Container.DataItem("acpPayYear") &"&acpPayNo=" & Container.DataItem("acpPayNo") &"&acvSubNo=" & Container.DataItem("acvSubNo") &"&acpPayNo1=" & Container.DataItem("acpPayNo1") &"&acvSubNo1=" & Container.DataItem("acvSubNo1") & "&oulcode=" & Container.DataItem("oulOutlayCode") &"&acmmemo=" & Container.DataItem("acmMemo")  %>'    runat="server">編輯</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>                                          
											<asp:TemplateColumn HeaderText="簽證資料">
                                                <HeaderStyle Width="60px" />
                                                 <ItemTemplate   >
                                                    <asp:HyperLink ID="HLDataDtl"  Target="_self"  NavigateUrl ='<%# GetUrlTxt(Container.DataItem("acmWordNum"),Container.DataItem("acmKidNum")  , Container.DataItem("acmYear") ,Container.DataItem("acmNo") , val( Container.DataItem("acmNo1") &"") , val(Container.DataItem("acmNo2")  &"") , val( Container.DataItem("acpPayYear")  &"") , val( Container.DataItem("acpPayNo") &"") , val( Container.DataItem("acpPayNo1") &""))  %>'    runat="server">簽證資料</asp:HyperLink>
                                                    <asp:HyperLink ID="HyperLink1" Visible=false  Target="_blank"  NavigateUrl ='<%# "FrmPayVisa.aspx?workstatus=edit&acmwordnum=" & Container.DataItem("acmWordNum") &"&acmYear="& Container.DataItem("acmYear") & "&acmNoPrv="& Container.DataItem("acmNoPrv")  &"&acmNo=" & Container.DataItem("acmNo") &"&acvNo=" & Container.DataItem("acvNo") &"&acmNo1=" & Container.DataItem("acmNo1") &"&acvNo1=" & Container.DataItem("acvNo1") &"&acmNo2=" & Container.DataItem("acmNo2")  &"&acvNo2=" & Container.DataItem("acvNo2")  &"&acpPayYear=" & Container.DataItem("acpPayYear") &"&acpPayNo=" & Container.DataItem("acpPayNo") &"&acvSubNo=" & Container.DataItem("acvSubNo") &"&acpPayNo1=" & Container.DataItem("acpPayNo1") &"&acvSubNo1=" & Container.DataItem("acvSubNo1") & "&oulcode=" & Container.DataItem("oulOutlayCode") &"&acmmemo=" & Container.DataItem("acmMemo")  %>'    runat="server">簽證資料</asp:HyperLink>

                                                </ItemTemplate>
                                                <ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="預設值">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#  "Images/" & IIF(Container.DataItem("defFlag") ="1" , "Cancel.gif", "OK.gif") %>' />
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="廠商名稱" >
											    <HeaderStyle Width="40px"></HeaderStyle>
                                                <ItemTemplate   >
                                                    <asp:HyperLink ID="HyperLink2" name="HyperLink2" Target="_blank" onclick="fnCallPayNameDtl(this);" CssClass='<%# "FrmEditPayName.aspx?workstatus=edit&acmYear="& Container.DataItem("acmYear") & "&acmNoPrv="& Container.DataItem("acmNoPrv")  &"&acmNo=" & Container.DataItem("acmNo") &"&acvNo=" & Container.DataItem("acvNo") &"&acmNo1=" & Container.DataItem("acmNo1") &"&acvNo1=" & Container.DataItem("acvNo1") &"&acmNo2=" & Container.DataItem("acmNo2")  &"&acvNo2=" & Container.DataItem("acvNo2")  &"&acpPayYear=" & Container.DataItem("acpPayYear") &"&acpPayNo=" & Container.DataItem("acpPayNo") &"&acvSubNo=" & Container.DataItem("acvSubNo") &"&acpPayNo1=" & Container.DataItem("acpPayNo1") &"&acvSubNo1=" & Container.DataItem("acvSubNo1") & "&oulcode=" & Container.DataItem("oulOutlayCode") &"&acmpayname=" & Container.DataItem("acmPayName")  %>' runat="server"><%#IIf(Container.DataItem("acmPayName") & "" = "", "<font color=#FF0000 size=+1 style='cursor:hand'><u><b>未設定</b></u></font>", Container.DataItem("acmPayName") & "")%></asp:HyperLink>
                                               </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmYear"   HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="合併動支號" Visible =true >
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TBdgGroupWordNum" runat="server" Width="70px" ToolTip='<%# Container.DataItem("grpWordNum") %>' Text='<%# Container.DataItem("grpWordNum") %>'></asp:TextBox>
                                                </ItemTemplate>
                                                <HeaderStyle Width="70px" />
                                            </asp:TemplateColumn>
											<asp:BoundColumn DataField="acmWordNum"   HeaderText="動支編號">
											 <HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmNo"  Visible=false   HeaderText="系統號">
												<HeaderStyle Width="70px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acpPayNo"  HeaderText="報支號">
												<HeaderStyle Width="30px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmNo1"    HeaderText="再簽號">
											    <HeaderStyle Width="30px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="PlanName"   HeaderText="計畫代碼"></asp:BoundColumn>
											<asp:BoundColumn DataField="acmMemo"   HeaderText="事由"></asp:BoundColumn>
											<asp:BoundColumn DataField="OulName"   HeaderText="用途別">
												<HeaderStyle Width="50px"></HeaderStyle>
											    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                    Font-Strikeout="False" Font-Underline="False" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acvMoney" DataFormatString="{0:#,0}"   HeaderText="金額">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Bold="False" 
                                                    Font-Italic="False" Font-Overline="False" Font-Strikeout="False" 
                                                    Font-Underline="False" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvExchNo"  HeaderText="傳票號碼">
                                                <ItemStyle Wrap="False" />
                                            </asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
								</td>
							</tr>
							<tr>
								<td align="right"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
    </form>
</body>
</html>
