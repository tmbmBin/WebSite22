<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPlanFromAcc.aspx.vb" Inherits="UI.BasicData.Web.FrmPlanFromAcc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    		<META http-equiv="Pragma" content="No-cache">

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
                                            <td style="width:100px; text-align:right">計畫代碼 ：</td>
                                            <td style="width:150px"><asp:TextBox ID="TBPlanCode" runat="server"></asp:TextBox></td>                    
                                            <td style="width:100px; text-align:right">計畫名稱：</td>
                                            <td style="width:150px"><asp:TextBox ID="TBPlanName" runat="server"></asp:TextBox></td>
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
                                            <td style="width:100px"></td>
                                            <td style="width:150px"><asp:Button ID="BtnListData" runat="server" Text="列出資料" /></td>
                                            <td colspan="2"><asp:Button ID="BtnSave" runat="server" Text="匯入E化系統" /></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                </table>
                             </td>
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
													<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
													<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="選取">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
														<asp:BoundColumn DataField="codCodeVer" HeaderText="年度"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnPlanCode" HeaderText="計畫代碼"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnPlanName" HeaderText="計畫名稱"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnLevel" HeaderText="級別"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnLevelEnd" HeaderText="結尾級別"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnCreateDate" HeaderText="建立日期"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnStopFlag" HeaderText="停用否"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnCodeFinal" HeaderText="末層旗標"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnAliasNo" HeaderText="列印代號"></asp:BoundColumn>
														<asp:BoundColumn DataField="plnAliasNo1" HeaderText="列印代號1"></asp:BoundColumn>
														<asp:BoundColumn DataField="OKFlag" HeaderText="已匯入"></asp:BoundColumn>
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
 