<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmMemoData.aspx.vb" Inherits="UI.CDCFun5.Web.FrmMemoData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
    	<base target="_self">
    <script language="javascript" type="text/javascript">
        function check_Num() {
            if ((event.keyCode >= 48 && event.keyCode <= 57)) {
                return true;
            }
            else { event.keyCode = 0; false; }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

    <table style=" margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>
                                   <%--      <asp:FormView ID="fv_ficEntrustMemo" runat="server" Width="100%">
                                 <ItemTemplate>--%>
                                     <table border=0 cellpadding=2 cellspacing=0 width=100%>
                                       <tr>
                                          <td style="WIDTH: 80px" align="right" >報表名稱：</td>
                                           <td ><asp:DropDownList ID="DDLRptName" runat="server">
                                               <asp:ListItem Value="06">委託辦理計畫(事項)經費報告表</asp:ListItem>
                                               <asp:ListItem Value="07">補、捐(獎)助其他政府機關或團體私人經費報告</asp:ListItem>
                                               </asp:DropDownList></td>
                                       </tr>
                                       <tr style="display:none">
                                            <td style="WIDTH: 80px" align="right"></td>
                                            <td>
                                                <asp:TextBox ID="ctl_MemoYear" onfocus="this.select()"  style="Text-align:Right" onkeypress="javascript:NumberOnly();"  MaxLength="3" runat="server" Text ='<%# Val(DataBinder.Eval(Container, "DataItem.memoYear") & "")%>'    Width="120px" Enabled="True" DBFieldName="memoYear"></asp:TextBox>
                                                <asp:TextBox ID="ctl_MemoNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>'    Width="120px" Enabled="True" DBFieldName="memoNo"></asp:TextBox>
                                                <asp:TextBox ID="ctl_memoCreateUser" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoCreateUser")%>'   Width="120px" Enabled="True" DBFieldName="memoCreateUser"></asp:TextBox>
                                                <asp:TextBox ID="ctl_memoCreateDTime" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoCreateDTime")%>'    Width="120px" Enabled="True" DBFieldName="memoCreateDTime"></asp:TextBox>
                                            </td>
                                       </tr>
                                       <tr>
                                          <td style="WIDTH: 80px" align="right" >備註號碼：</td>
                                           <td >
                                               註<asp:TextBox ID="ctl_MemoAlisaNo" runat="server" BorderStyle="None" BackColor="Transparent"  onfocus="this.blur();" Width="27px" style="text-align:center"  Text='<%# DataBinder.Eval(Container, "DataItem.memoAliasNo") %>' DBFieldName="memoAliasNo"></asp:TextBox>
                                           </td>
                                       </tr>
                                       <tr style="<%=strShowFlag1 %>">
                                          <td style="WIDTH: 80px" align="right" >&nbsp;</td>
                                           <td >
                                                <table style ="table-layout:fixed; border-collapse:collapse; width:100%; border:1px ">
                                                    <tr>
                                                        <td><asp:CheckBox ID="ctl_memoShowFlag" runat="server" DBFieldName="memoShowFlag" Text="顯示於編輯畫面上" /></td>
                                                        <td><asp:CheckBox ID="ctl_memoShareFlag" runat="server" DBFieldName="memoShareFlag" Text="分享給其他人" /></td>
                                                        <td><asp:CheckBox ID="ctl_memoEditFlag" runat="server" DBFieldName="memoEditFlag" Text="允許他人異動" /></td>
                                                        <td><asp:CheckBox ID="ctl_memoDelFlag" runat="server" DBFieldName="memoDelFlag" Text="允許他人刪除" /></td>
                                                    </tr>
                                                </table>                                            
                                           </td>                                         
                                       </tr>
                                       <tr>
                                            <td style="WIDTH: 80px" align="right" >備註：</td>
                                            <td >
                                               <asp:textbox id="ctl_Memo" runat="server" MaxLength="1000" Width="100%" Rows="10" TextMode="MultiLine" DBFieldName="Memo"></asp:textbox>
                                            </td>
                                       </tr>
                                       </table>
                                   <%--    </ItemTemplate>
                                   </asp:FormView>--%>
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
                                           <td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22" Visible=false ></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center">
                                               <asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找編號</asp:textbox>
                                               <input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
                                           </td>
                                           <td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server" /></td>
                                           <td><input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server" /></td>
                                          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                          <td><asp:Button ID="btnReturn" runat="server" Text="返回選取畫面" /></td>
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
                                         <asp:TemplateColumn HeaderText="年度">                                            
                                             <ItemTemplate>
                                                 <asp:Label ID="LBdgMemoYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoYear") %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="40px" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="備註號碼"> 
                                             <ItemTemplate>
                                                 <asp:Label ID="LBdgMemoAliasNo" runat="server" Text='<%# "註" & DataBinder.Eval(Container, "DataItem.memoAliasNo") %>'  ToolTip='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="60px" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="備註內容"> 
                                             <ItemTemplate>
                                                 <asp:Label ID="LBdgMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memo") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateColumn>
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
