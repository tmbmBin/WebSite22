<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmBgtActToAcc.aspx.vb" Inherits="UI.Budget.Web.FrmBgtActToAcc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="No-cache" />
<META http-equiv="Pragma" content="No-cache">

    <style type="text/css">
        .style1
        {
            width: 120px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    
            <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="1000" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>
                                    <table style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 width=100%>
                                        <tr>
                                            <td style="width:100px; text-align:right">計畫科目 ：</td>
                                            <td class="style1">
                                                <asp:DropDownList ID="DDLPlanName" runat="server">
                                                </asp:DropDownList>
                                            </td>                    
                                            <td style="width:100px; text-align:right">種類：</td>
                                            <td style="width:150px">
                                                <asp:DropDownList ID="DDLBgtKindSet" runat="server">
                                                    <asp:ListItem Value="">不區分</asp:ListItem>
                                                    <asp:ListItem Value="1">保留應付數</asp:ListItem>
                                                    <asp:ListItem Value="2">保留準備數</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBBudget" runat="server" Text="匯入預算數" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBMonth" runat="server" Text="匯入月分配" />
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                       
                                      </table>

                               </td>
                           </tr>
                           <tr>
                            <td>
                                <table style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 width=100%>
                                  <tr>
                                            <td style="width:120px"></td>
                                            <td style="width:120px"> <asp:Button ID="BtnList" runat="server" Text="列出預算資料" 
                                                    Width="100px" /></td>
                                            <td style="width:120px"><asp:Button ID="BtnListMonth" runat="server" Text="列出月分配資料" 
                                                    Width="100px" /></td>
                                            <td style="width:120px"><asp:Button ID="BtnSave" runat="server" Text="匯入會計系統" 
                                                    Width="100px" /></td>
                                            <td style="width:120px">&nbsp;</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                </table></td>
                           </tr>
                       </table>
                   </td>
               </tr>             
               <tr>
                   <td bgcolor="#ffffff" height="5"></td>
               </tr>
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
                       <table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
                             <tr>
                               <td>
                                 <asp:datagrid id="DataGrid1" runat="server" Width="100%" Height="72px" CellPadding="3"
													BorderColor="White" BorderWidth="1px" AutoGenerateColumns="False" 
            BackColor="White" BorderStyle="None">
													<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
													<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
													<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
													<ItemStyle Font-Size="Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
													<HeaderStyle Font-Size="Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="選取" Visible=false >
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" />
                                                            </ItemTemplate>
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateColumn>
														<asp:BoundColumn DataField="bgtYear" HeaderText="年度">
                                                            <HeaderStyle Width="30px" />
                                                        </asp:BoundColumn>
														<asp:BoundColumn DataField="PK_Subject" HeaderText="科目代碼"></asp:BoundColumn>
														<asp:BoundColumn DataField="PlanName" HeaderText="計畫名稱"></asp:BoundColumn>
														<asp:BoundColumn DataField="OulName" HeaderText="用途別"></asp:BoundColumn>
														<asp:BoundColumn DataField="bgtMMonth" HeaderText="月份"></asp:BoundColumn>
														<asp:BoundColumn DataField="F_BudgetMoney" HeaderText="預算金額" DataFormatString="{0:#,#}">
                                                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                                        </asp:BoundColumn> 
													</Columns>
													<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
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
