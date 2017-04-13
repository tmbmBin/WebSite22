<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmOffSetList.aspx.vb" Inherits="UI.OffSet.Web.FrmOffSetList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                                <td>
                                    <table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
                                        <tr>
								            <td  style="font-size:10pt"> <asp:CheckBox ID="CBAllowanceFalg" runat="server"  Text="零用金支付"   TextAlign="Right" Visible="True" Enabled="False" /></td>
								            <td  style="font-size:10pt"> <asp:CheckBox ID="CBSeparateFlag" runat="server"  Text="分期付款"     TextAlign="Right" Visible="True" Enabled="False" /></td>
								            <td  style="font-size:10pt"> <asp:CheckBox ID="CBDocFlag" runat="server"  Text="簽文" TextAlign="Right"    Visible="True" Enabled="False" /></td>
								            <td  style="font-size:10pt">&nbsp;</td>
								            <td  style="font-size:10pt">&nbsp;<asp:CheckBox ID="CBSecrearyFlag" runat="server"  Text="秘書室審核"  TextAlign="Left" Visible="False" Enabled="False" /></td>
								            <td  style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CBAccPassFlag" runat="server" Text="會計室審核" TextAlign="Left" onclick="javascript:setpassdate(this);" /></td>
							            </tr>
							         </table>
							   </td>
                           </tr>
                           <tr>
                               <td>
                                    <table id="myTable" runat=server style="table-layout:fixed" border=0 cellpadding=2 cellspacing=0 width=100%>
                                        <tr style="display:none">
                                            <td style="WIDTH: 100px" align="right" >年度</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinPrjYear" runat="server" MaxLength="2" Width="120px"></asp:textbox></td>
                                            <td style="WIDTH: 120px" align="right" >計畫編號</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinPrjCaseNum" runat="server" MaxLength="9" Width="120px"></asp:textbox></td>
                                            <td style="width: 80px">明細號</td>
                                            <td><asp:TextBox ID="TBpinDetailNo" runat="server" MaxLength="2" Width="120px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="WIDTH: 100px" align="right" >繳回日期</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinDate" style="text-align:center" ondblclick="JavaScript: oDiv.style.left=realPosition(this).x; oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;"  runat="server" MaxLength="10" Width="120px"></asp:textbox></td>
                                            <td style="WIDTH: 120px" align="right" >審核日期</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinPassDate" style="BACKGROUND-COLOR: #ffe0c0;text-align:center"  ondblclick="JavaScript: oDiv.style.left=realPosition(this).x; oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show(); return false;"  runat="server" MaxLength="10" Width="120px"></asp:textbox></td>
                                            <td style="width: 80px">作業年度</td>
                                            <td><asp:TextBox ID="TBpinYear" runat="server" BackColor="Transparent" MaxLength="2" Width="35px" onfocus="this.blur()" ></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="WIDTH: 100px" align="right" >繳回金額</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinMoney" runat="server" MaxLength="8" Width="120px" Style="TEXT-ALIGN: right" onFocus="this.select()" onkeypress="return check_Num()"></asp:textbox></td>
                                            <td style="WIDTH: 120px" align="right" >孳息結案</td>
                                            <td style="WIDTH: 150px"><asp:checkbox id="CBpinFinalFlag" runat="server" Font-Size="Small" TextAlign="Left" Text=""　Visible="True"></asp:checkbox></td>
                                            <td style="width: 80px"> </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="WIDTH: 100px" align="right" >無孳息原因</td>
                                            <td colspan="5">
                                                <asp:textbox id="TBpinCause" runat="server" MaxLength="255" Width="650px"></asp:textbox></td>
                                        </tr>
                                        <tr >
                                            <td style="WIDTH: 100px" align="right" >傳票年度</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinExchYear" runat="server" MaxLength="2" Width="120px"></asp:textbox></td>
                                            <td style="WIDTH: 120px" align="right" >傳票號碼</td>
                                            <td style="WIDTH: 150px"><asp:textbox id="TBpinExchNo" runat="server" MaxLength="6" Width="120px"></asp:textbox></td>
                                            <td style="width: 80px"></td>
                                            <td>
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
                                           <td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"  Visible=false ></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center" style="display:none">
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
                                    <asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" > 
                                     <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle> 
                                     <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>  
                                     <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>  
                                     <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>   
                                     <Columns>
                                         <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                              <HeaderStyle Width="30px" />
                                         </asp:ButtonColumn>                                         
                                         <asp:BoundColumn DataField="acmNoPrv" Visible=False HeaderText="acmNoPrv"   SortExpression="acmNoPrv"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="acmNo1" HeaderText="再簽次號"   SortExpression="acmNo1"  >
                                            <HeaderStyle Font-Size="X-Small" Width="30px" Wrap="false" />
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="acpPayNo" HeaderText="報支次號"   SortExpression="acpPayNo"  >
                                            <HeaderStyle Font-Size="X-Small" Width="30px" Wrap="false" />
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="acpPayNo1" HeaderText="轉正次號"   SortExpression="acpPayNo1"  >
                                            <HeaderStyle Font-Size="X-Small" Width="30px" Wrap="false" />
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="acpMarkDate" HeaderText="報支日期"   SortExpression="pinDate"  >
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                             <HeaderStyle Width="80px" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinMoney" HeaderText="繳回金額"   SortExpression="pinMoney"  DataFormatString="{0:#,0}"  >
                                             <HeaderStyle Width="100px" />
                                             <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Wrap="False" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinCause" HeaderText="無孳息原因"   SortExpression="pinCause"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinFinalFlag" HeaderText="結案"   SortExpression="pinFinalFlag"  >
                                             <HeaderStyle Width="30px" />
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinPassFlag" HeaderText="審核"   SortExpression="pinPassFlag"  >
                                             <HeaderStyle Width="30px" />
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinPassDate" Visible=False HeaderText="審核日期"   SortExpression="pinPassDate"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinExchYear" Visible=False HeaderText="傳票年度"   SortExpression="pinExchYear"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinExchNo" HeaderText="傳票號碼"   SortExpression="pinExchNo"  >
                                             <HeaderStyle Width="80px" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinModifyDTime" Visible=False HeaderText="修改日期"   SortExpression="pinModifyDTime"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="pinModifyName" HeaderText="異動人員"   SortExpression="pinModifyName"  >
                                             <HeaderStyle Width="80px" />
                                         </asp:BoundColumn>
                                          <asp:BoundColumn DataField="pinPassName" Visible=False HeaderText="審核人員"   SortExpression="pinPassName"  ></asp:BoundColumn>
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
