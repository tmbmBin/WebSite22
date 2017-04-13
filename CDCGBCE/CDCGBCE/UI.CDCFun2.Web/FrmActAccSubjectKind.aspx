<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActAccSubjectKind.aspx.vb" Inherits="UI.CDCFun2.Web.FrmActAccSubjectKind"%>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >


<head runat="server">
   <title>FrmActAccSubjectKind</title>
   <meta http-equiv="pragma" content="no-cache" />
   <meta http-equiv="cache-control" content="no-cache" /> 
<script type="text/javascript" language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>



</head>
<body>
<form id="form1" runat="server">
         <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; border-collapse: collapse" cellpadding="5" width="700" bgcolor="#dadee9">
               <tr>
                   <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"  valign="top" align="left">
                       <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>
                                    <table style="table-layout:fixed"  border="0" cellpadding="1" cellspacing="1" width="100%">
                                        <tr style="display:none; height:0px">
                                            <td width="100px" align="right"></td>
                                            <td width="150px"></td>
                                            <td  width="100px" align="right"></td>
                                            <td></td>
                                        </tr>
                                   <tr>
                                      <td align="right" >版本別：</td>
                                       <td><asp:TextBox id="txt_askCodeVer" onfocus="this.select()"  style="Text-align:Right" onkeypress="javascript:NumberOnly();"  onblur="this.value=fmtMoney(this.value,0 , '.', ',');" onclick="this.value=replaceString(this.value,',',''); this.select();"  runat="server" Width="120px"></asp:TextBox></td>
                                      <td align="right" >&nbsp;</td>
                                       <td>&nbsp;</td>
                                   </tr>
                                   <tr>
                                      <td align="right" >部門名稱：</td>
                                       <td >
                                           <asp:DropDownList ID="ddl_DepName" runat="server">
                                           </asp:DropDownList>
                                       </td>
                                      <td align="right" >經資門別：</td>
                                       <td >
                                           <asp:DropDownList ID="ddl_AccKindName" runat="server">
                                           </asp:DropDownList>
                                       </td>
                                   </tr>
                                   <tr>
                                      <td align="right" >會計科目：</td>
                                       <td colspan="3">
                                           <asp:DropDownList ID="ddl_PlanName" runat="server">
                                           </asp:DropDownList>
                                       </td>
                                   </tr>
                                   <tr>
                                      <td align="right" >用途別名稱：</td>
                                       <td>
                                           <asp:DropDownList ID="ddl_OulName" runat="server">
                                           </asp:DropDownList>
                                       </td>
                                      <td align="right" >&nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                                           <tr style="display:none">
                                      <td align="right" >排序編號：</td>
                                       <td><asp:TextBox id="txt_askOrderNo" onfocus="this.select()"  style="Text-align:Right" onkeypress="javascript:NumberOnly();"  onblur="this.value=fmtMoney(this.value,0 , '.', ',');" onclick="this.value=replaceString(this.value,',',''); this.select();"  runat="server" Width="120px"></asp:TextBox></td>
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
                   <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                       <table style="TABLE-LAYOUT: fixed; border-collapse: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
                           <tr>
                               <td valign="bottom" align="left">
                                   <table cellpadding="1" border="0">
                                       <tr>
                                           <td valign="bottom" align="center"><asp:button id="btn_Add" runat="server" Text="新增" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Edit" runat="server" Text="修改" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Delete" runat="server" Text="刪除" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Save" runat="server" Text="儲存" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Cancel" runat="server" Text="取消" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Search" runat="server" Text="查詢" Height="22" Visible="False"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Copy" runat="server" Text="匯入" Height="22"  ToolTip ="匯入上年度資料" ></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="btn_Print" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center" style="display:none">
                                               <asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" 
                                                   id="txt_SearchSql" onblur="if(this.value==''){this.value='尋找編號';}" 
                                                   style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" 
                                                   runat="server" Width="100px" AutoPostBack="True" Visible="False">尋找編號</asp:textbox>
                                               <input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s" />
                                           </td>
                                           <td><input id="txt_WhereTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="txt_WhereTxt" runat="server" /></td>
                                           <td><input id="txt_OrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="txt_OrderTxt" runat="server" /></td>
                                       </tr>
                                   </table>

                               </td>
                           </tr>
                           <tr>
                               <td>
                                                                  <asp:DataGrid id="DataGrid1" runat="server" Width="100%" 
                                                                      AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" > 
                                     <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle> 
                                     <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>  
                                     <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>  
                                     <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>   
                                     <Columns>
										<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small"></ItemStyle>
											<HeaderStyle Width="30px" />
										</asp:ButtonColumn>
                                         <asp:TemplateColumn HeaderText="版本別">                                           
                                             <ItemTemplate>
                                                 <asp:Label ID="ctl_askCodeVer" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askCodeVer").ToString()) %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="50px" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="部門名稱">   
                                             <ItemTemplate>
                                                 <asp:Label ID="ctl_askDepCode" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askDepName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askDepCode").ToString()) %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="100px" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="會計科目">                                           
                                             <ItemTemplate>
                                                 <asp:Label ID="ctl_askPlanCode" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askPlanName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askPlanCode").ToString()) %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="200px" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="用途別名稱">                                        
                                             <ItemTemplate>
                                                 <asp:Label ID="ctl_askOulCode" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askOulName").ToString()) %>' ToolTip ='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askOulCode").ToString()) %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="150px" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="經資門別">                                        
                                             <ItemTemplate>
                                                 <asp:Label ID="ctl_askAccKind" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askAccKindName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askAccKind").ToString()) %>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle Width="80px" />
                                             <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                 Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                         </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="排序號"   SortExpression="askOrderNo">
                                               <ItemTemplate>
                                                     <asp:Label ID="lbl_AskOrderNo" runat="server" Text='<%# Format(val( AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.askOrderNo").ToString()) &"") ,"#,0")  %>'></asp:Label>
                                               </ItemTemplate>
                                               <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                         </asp:TemplateColumn>
                                    </Columns>  
                                   <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                               </asp:DataGrid>  

                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <table style="border-collapse:collapse" cellpadding="1" border="0">
                                        <tr>
                                            <td style="width:120px; font-size:10pt; text-align:center">共　<asp:Label 
                                                    ID="lbl_RecordCnt" runat="server" style="text-align:center"></asp:Label>　筆資料</td>
                                            <td style="width:170px;font-size:10pt;border-left: #000000 1pt solid; text-align:center">每頁顯<asp:TextBox 
                                                    ID="txt_PageQty" runat="server" Width="50px" AutoPostBack="True" 
                                                    style="text-align:center" BorderStyle="None" BorderWidth="0px"></asp:TextBox>示筆資料</td>
                                        </tr>
                                    </table>

                               </td>
                           </tr>
                       </table>
                   </td>
               </tr>
           </table>
</form>
</body>
</html>