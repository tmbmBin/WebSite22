<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActAccCode.aspx.vb" Inherits="UI.BasicData.Web.FrmActAccCode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />

</head>
<body>
    <form id="form1" runat="server">
         <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>
                                    <table border=0 cellpadding=1 cellspacing=1 style="table-layout:fixed;width:100%">
                                        <tr>
                                            <td style="width:100px; text-align:right">部門名稱：</td>
                                            <td ><asp:DropDownList ID="DDLDepName" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td style="width:100px; text-align:right">計畫名稱：</td>
                                            <td><asp:DropDownList ID="DDLPlanName" runat="server"></asp:DropDownList></td>
                                        </tr>
                                    </table>
                                </td>
                           </tr>
                           <tr>
                               <td>
                                    <table border=0 cellpadding=1 cellspacing=1 style="table-layout:fixed;width:100%">
                                        <tr>
                                            <td style="width:270px; text-align:center">已選科目</td>
                                            <td style="width:50px; text-align:center"></td>
                                            <td style="width:270px; text-align:center">待選科目</td>
                                        </tr>
                                        <tr>
                                            <td style="width:270px; text-align:center">
                                                <asp:ListBox ID="LBSelect" runat="server" Height="250px" SelectionMode="Multiple" Width="100%"></asp:ListBox>
                                            </td>
                                            <td style="text-align:center">                                                
                                                <asp:Button ID="BtnSelectAll" runat="server" Height="22px" Text="<<" ToolTip="加入全部項目" Width="50px" /><br /><br />
                                                <asp:Button ID="BtnSelect" runat="server" Height="22px" Text="<" ToolTip="加入選擇項目" Width="50px" /><br /><br />
                                                <asp:Button ID="BtnRemove" runat="server" Height="22px" Text=">" ToolTip="移除選擇項目" Width="50px" /><br /><br />                                                
                                                <asp:Button ID="BtnRemoveall" runat="server" Height="22px" Text=">>" ToolTip="移除全部項目" Width="50px" />
                                            </td>
                                            <td  style="width:270px; text-align:center">
                                                <asp:ListBox ID="LBUnSelect" runat="server" Height="250px" SelectionMode="Multiple" Width="100%"></asp:ListBox>
                                            </td>
                                        </tr>
                                    </table>
                                   <input id="BtnSelectedDown" runat="server" name="BtnSelectedDown" onclick="Mark(LBSelect);"
                                       type="button" value="選下層" /><input id="BtnSelectedUp" runat="server" name="BtnSelectedUp"
                                           onclick="Mark(LBSelect,true);" type="button" value="選上層" /><input id="BtnUnSelectUp"
                                               runat="server" name="BtnUnSelectUp" onclick="Mark(LBUnSelect,true);" type="button"
                                               value="選上層" /><input id="BtnUnSelectDown" runat="server" name="BtnUnSelectDown" onclick="Mark(LBUnSelect);"
                                                   type="button" value="選下層" /></td>
                           </tr>
                           <tr>
                               <td>

                               </td>
                           </tr>

                       </table>
                   </td>
               </tr>
               <tr>
                   <td bgcolor="#ffffff" height="10"><font forecolor="red" ></font></td>
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
                                           <td valign="bottom" align="center" style="width: 3px">
                                               </td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center">
                                               <asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;}" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找編號</asp:textbox>
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
                                    <asp:datagrid id="DataGrid1" runat="server" Width="100%" 
                                                                      AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" > 
                                     <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle> 
                                     <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>  
                                     <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>  
                                     <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>   
                                     <Columns>
                                         <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
                                             <HeaderStyle Width="30px" />
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                         </asp:ButtonColumn>
                                         <asp:BoundColumn DataField="dptName" HeaderText="單位名稱"   SortExpression="dptName"  >
                                             <HeaderStyle Width="90px" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="plnPlanName" HeaderText="計畫名稱"   SortExpression="plnPlanName"  ></asp:BoundColumn>
                                         <asp:BoundColumn Visible="False" DataField="accTeaCode" SortExpression="accTeaCode" HeaderText="部門代碼"></asp:BoundColumn>
                                         <asp:BoundColumn Visible="False" DataField="accCodeVer" SortExpression="accCodeVer" HeaderText="科目年度別"></asp:BoundColumn>
                                         <asp:BoundColumn Visible="False" DataField="accPlanCode" SortExpression="accPlanCode" HeaderText="計畫代碼"></asp:BoundColumn>
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
           </table>    </form>
</body>
</html>
