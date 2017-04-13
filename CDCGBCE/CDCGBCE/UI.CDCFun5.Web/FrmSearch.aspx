<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearch.aspx.vb" Inherits="UI.CDCFun5.Web.FrmSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
            <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
				<tr>
					<td style=" border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
						valign="top" align="left">
						<table style=" border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
                                    <table style="table-layout:fixed" cellspacing="0" cellpadding="1" width="100%" border="0">
                                        <tr>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td width="150">&nbsp;</td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td width="200">&nbsp;</td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">資料類型：</td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="DDLRptName" runat="server" Width="400px">
                                                    <asp:ListItem Value="7">補、捐(獎)助其他政府機關或團體私人經費報告</asp:ListItem>
                                                    <asp:ListItem Value="6">委託辦理計畫(事項)經費報告表</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">日期區間：</td>
                                            <td colspan="5">
                                                <asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px" Visible=false ></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
                                                <asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">經費單位：</td>
                                            <td ><asp:DropDownList ID="DDLBgtDepName" runat="server"></asp:DropDownList></td>
                                            <td align="right" width="90" >執行單位：</td>
                                            <td><asp:DropDownList ID="DDLWorkDepName" runat="server"></asp:DropDownList></td>
                                            <td align="right" width="90" >承辦人員：</td>
                                            <td>
                                                <asp:TextBox ID="TBWorkUserName" runat="server" Width="100px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">計畫名稱：</td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="DDLPlanName" runat="server" Width="480px"></asp:DropDownList>
            　                             </td>                                      
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">用途別：</td>
                                            <td colspan="3"><asp:DropDownList ID="DDLOul" runat="server" Width="480px"></asp:DropDownList>　　</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="90">金額：</td>
                                            <td ><asp:TextBox ID="TBMoney" runat="server" Width="120px"></asp:TextBox></td>
                                            <td align="right" >廠商名稱：</td>
                                            <td colspan="3" >
                                                <asp:TextBox ID="TBPayName" runat="server" Width="186px" 
                                                    style="margin-left: 0px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90"  >動支編號：</td>
                                            <td   ><asp:textbox id="TBAcmWordNum" runat="server" Width="80px" ></asp:textbox></td>
                                            <td align="right">設定狀態：</td>
                                            <td  >
                                                <asp:DropDownList ID="DDLStatus" runat="server">
                                                    <asp:ListItem Value="0">未設定</asp:ListItem>
                                                    <asp:ListItem Value="1">已設定</asp:ListItem>
                                                    <asp:ListItem Value="">------</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right">審核狀態：</td>
                                            <td  >
                                                <asp:DropDownList ID="DDLPassStatus" runat="server">
                                                    <asp:ListItem Value="0">未審核</asp:ListItem>
                                                    <asp:ListItem Value="1">已審核</asp:ListItem>
                                                    <asp:ListItem Value="">------</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="90">事由：</td><td colspan=3>
                                            <asp:TextBox ID="TBAcmMemo" runat="server" Width="462px"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr style='<%= strShowFlag1 %>'>
                                            <td  align="right" width="90">主計設定：</td><td colspan=3>
                                                <asp:DropDownList ID="DDLAccDoneFlag" runat="server">
                                                    <asp:ListItem Value="0">未設定</asp:ListItem>
                                                    <asp:ListItem Value="1">已設定</asp:ListItem>
                                                    <asp:ListItem Value="">------</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
							    </td>
							</tr>
							<tr>
								<td>
									<asp:button id="BtnPrint" runat="server" Width="75px" Text="列出資料" Height="22px"></asp:button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    



       
<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5"
				width="1200" bgcolor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						valign="top" align="left">
	 						<table style=" border-collapse: collapse; border:1; border-color:#ffffff; width:100%; padding:1 ">
                            <tr>
                                <td></td>
                            </tr>
							<tr>
								<td>
									<asp:Button ID="btnPassChk" runat="server" Text="審核所勾選資料" />
                                    <asp:Button ID="btnPassAll" runat="server" Text="審核所有符合過濾條件的資料" 
                                        Visible="False" />
									<asp:datagrid id="DataGrid1" runat="server" Width="100%" 
                                        AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" 
                                        PageSize="20">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
                                           <asp:TemplateColumn HeaderText="審核" Visible="false">
											    <HeaderStyle Width="40px"></HeaderStyle>
                                                <ItemTemplate   >
                                                    <asp:CheckBox ID="CBdgPass" runat="server" Checked='<%# iif( DataBinder.Eval(Container, "DataItem.PassFlag") &""="1", True, False) %>'  ToolTip='<%#  Val(DataBinder.Eval(Container, "DataItem.PassFlag") &"") %>' Enabled='<%# IIF(DataBinder.Eval(Container, "DataItem.prjCaseKeys") &"" <>"" ,True, False) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>              
                                            <asp:BoundColumn DataField="acmYear"   HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
											</asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="編輯" >
											    <HeaderStyle Width="40px"></HeaderStyle>
                                                <ItemTemplate   >
                                                    <asp:HyperLink ID="HLRptDtl"  Target="_blank"  NavigateUrl ='<%#   GetEditUrlTxt("workstatus=edit&acmWordNum=" & Container.DataItem("acmWordNum") & "&acmYear="& Container.DataItem("acmYear") & "&acmNoPrv="& Container.DataItem("acmNoPrv")  &"&acmNo=" & Container.DataItem("acmNo") &"&acvNo=" & Container.DataItem("acvNo") &"&acmNo1=" & Container.DataItem("acmNo1") &"&acvNo1=" & Container.DataItem("acvNo1") &"&acmNo2=" & Container.DataItem("acmNo2")  &"&acvNo2=" & Container.DataItem("acvNo2")  &"&acpPayYear=" & Container.DataItem("acpPayYear") &"&acpPayNo=" & Container.DataItem("acpPayNo") &"&acvSubNo=" & Container.DataItem("acvSubNo") &"&acpPayNo1=" & Container.DataItem("acpPayNo1") &"&acvSubNo1=" & Container.DataItem("acvSubNo1") & "&oulcode=" & Container.DataItem("oulOutlayCode") &"&acmmemo=" & Container.DataItem("acmMemo")  &"&acmPayName=" & Container.DataItem("acmPayName")   )  %>'  runat="server">編輯</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="會計設定">
                                            <HeaderStyle Width="40px" Wrap="false"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LBHAccDoneFlag" runat="server" ToolTip="本旗標只看主計是否有設定廠商名稱跟備註內容。" >會計設定</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="imAccDoneFlag" runat="server" ImageUrl='<%#  "Images/" & IIF(Container.DataItem("AccDoneFlag") ="0" , "Cancel.gif", "OK.gif") %>' />
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="整筆設定">
                                            <HeaderStyle Width="40px" Wrap="false"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LBHWDoneFlag" runat="server" ToolTip="本旗標會檢查本筆資料全部是否設定完成。" >已設定</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#  "Images/" & IIF(Container.DataItem("defFlag") ="0" , "Cancel.gif", "OK.gif") %>' />
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="動支編號">
                                            <HeaderStyle Width="60px"></HeaderStyle>                                        
                                                <ItemTemplate>
                                                  <asp:HyperLink ID="HLDataDtl" Visible="false"  NavigateUrl ='<%# GetUrlTxt(Container.DataItem("acmWordNum"),Container.DataItem("acmKidNum") &""  , Container.DataItem("acmYear") ,Container.DataItem("acmNo") , val( Container.DataItem("acmNo1") &"") , val(Container.DataItem("acmNo2")  &"") , val( Container.DataItem("acpPayYear")  &"") , val( Container.DataItem("acpPayNo") &"") , val( Container.DataItem("acpPayNo1") &""))  %>' Target="_blank" runat="server"><%# DataBinder.Eval(Container, "DataItem.acmWordNum") %></asp:HyperLink>
                                                  <asp:Label ID="LBAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
                              
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="系統號" Visible="false">
                                             <HeaderStyle Width="60px"></HeaderStyle>   
                                                 <ItemTemplate   >
                                                     <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="再簽號">
                                              <HeaderStyle Width="30px" Wrap="false"></HeaderStyle>   
                                                <ItemTemplate>
                                                    <asp:Label ID="acmNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="報支號" >
                                            <HeaderStyle Width="30px" Wrap="false"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="acpPayNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="轉正號" >
                                            <HeaderStyle Width="30px" Wrap="false"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="acpPayNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="承辦人" >
											    <HeaderStyle Width="40px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBAcmWorkUserName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWorkUserNo") %>'></asp:Label>                                                    
                                               </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="廠商名稱" >
											    <HeaderStyle Width="40px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBAcmPayName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmPayName") %>'></asp:Label>                                                    
                                               </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="計畫名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgPlanName" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.PlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="事由">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmMemo" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmMemo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgOulName" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.OulName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="金額">
                                            <HeaderStyle Width="90px" Wrap="false"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvMoney" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="傳票號碼">
                                            <HeaderStyle Width="50px" Wrap="false"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvExchNo" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvExchNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                               <asp:TemplateColumn HeaderText="動支系統號" Visible="false">
                                            <HeaderStyle Width="50px" Wrap="false"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgActKeys" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.ActKeys") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="案件編號" Visible="false">
                                            <HeaderStyle Width="50px" Wrap="false"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgPrjCaseKeys" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.prjCaseKeys") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
	 </td>
     </tr>
     </table>
					</td>
				</tr>
			</table>
    
    </form>
</body>
</html>
