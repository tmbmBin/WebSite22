<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmUserPower.aspx.vb" Inherits="UI.SystemData.Web.FrmUserPower" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                        <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                            <tr>
                                <td>
                                    <table border=0 cellpadding=0 cellspacing=0 width=100%>
                                        <tr>
                                            <td style="WIDTH: 120px" align="right" >群組名稱</td>
                                            <td  ><asp:textbox id="TBgrpName" runat="server" MaxLength="50" Width="120px"></asp:textbox></td>
                                        </tr>
                                    </table>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <table border="0" cellpadding="2" cellspacing="0" width="100%"> 
                                        <tr>
                                            <td align="center">已選項目</td>
                                            <td width="50"></td>
                                            <td align="center">未選科目</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:listbox id="LBSelect" runat="server" Height="250px" Width="100%" SelectionMode="Multiple"></asp:listbox>
                                            </td>
                                            <td>
                                                <asp:button id="BtnSelectAll" runat="server" Width="50px" Height="22px" Text="<<" ToolTip="加入全部項目"></asp:button>
                                                    <br>
                                                    <br>
                                                <asp:button id="BtnSelect" runat="server" Width="50px" Height="22px" Text="<" ToolTip="加入選擇項目"></asp:button>
                                                    <br>
                                                    <br>
                                                <asp:button id="BtnRemove" runat="server" Width="50px" Height="22px" Text=">" ToolTip="移除選擇項目"></asp:button>
                                                    <br>
                                                    <br>
                                                <asp:button id="BtnRemoveall" runat="server" Width="50px" Height="22px" Text=">>" ToolTip="移除全部項目"></asp:button>
                                            </td>
                                            <td>
                                                <asp:listbox id="LBUnSelect" runat="server" Height="250px" Width="100%" SelectionMode="Multiple"></asp:listbox>
                                            </td>
                                        </tr>
                                    </table>
                            </td>
                            </tr>
                        </table>
                   </td>
               </tr>
               <tr>
                   <td bgcolor="#ffffff" height="10"></td>
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
                                           <td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center">
                                               <asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找編號</asp:textbox>
                                               <input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
                                           </td>
                                           <td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
                                           <td><input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server"></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr>
                               <td>
                                                                  <asp:datagrid id="DataGrid1" runat="server" Width="100% " AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" > 
                                     <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle> 
                                     <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>  
                                     <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>  
                                     <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>   
                                     <Columns>
                                         <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                         </asp:ButtonColumn>
                                         <asp:BoundColumn DataField="PK_grpNo" HeaderText="編號"   SortExpression="PK_grpNo"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="grpName" HeaderText="群組名稱"   SortExpression="grpName"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="grpEditName" HeaderText="異動人員"   SortExpression="grpEditName"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="grpEditDTime" HeaderText="異動時間"   SortExpression="grpEditDTime"  ></asp:BoundColumn>
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
    </form>
</body>
</html>
