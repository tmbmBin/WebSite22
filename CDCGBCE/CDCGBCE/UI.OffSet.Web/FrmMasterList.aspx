<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmMasterList.aspx.vb" Inherits="UI.OffSet.Web.FrmMasterList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-cache">
    <script language=javascript>
        function fnCallSearchDialog()
        {
            var strReturnVal=showModalDialog("FrmSearchData.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
 
		    if (strReturnVal != "Cancel")
			{
			    document.all("TBFindSql").value=strReturnVal;
            }
		}

    </script>
</head>
<body>
    <form id="form1" runat="server">
         <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>
                               <iframe id="myFrame" border="0" name="myFrame" frameBorder="0" width="100%" scrolling="yes" height="<%=strFrameHeight%>"   src="<%=strFrameSrc%>"></iframe>                             </td>
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
									<table cellPadding="1" border="0">
										<tr>
											<td valign="bottom" align="center" ></td>
											<td valign="bottom" align="center"></td>
											<td valign="bottom" align="center"></td>
											<td valign="bottom" align="center"></td>
											<td valign="bottom" align="center"></td>
											<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
											<td valign="bottom" align="center"></td>
											<td valign="bottom" align="center"></td>
											<td valign="bottom" align="center" style="width: 43px"></td>
											<td valign="bottom" align="center"><asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
													id="TBSearchSql" onblur='if(this.value==""){this.value="尋找動支編號";}' style="TEXT-ALIGN: center" onfocus="this.select()" onclick='this.value=""'
													runat="server" Width="100px" AutoPostBack="True">尋找動支編號</asp:textbox><input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
													value="s"></td>
											<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql"
													runat="server"></td>
											<td><input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt"
													runat="server"></td>
										</tr>
									</table>
							    </td>
                           </tr>
                           <tr>
                               <td>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                                       AllowPaging="True" PageSize="5" Width="100%">
             <RowStyle Font-Size="Small" BackColor="WhiteSmoke" />
             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
             <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668"  />
             <SelectedRowStyle Font-Bold="True" BackColor="DarkOrange" />
             <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" />
             <AlternatingRowStyle  BackColor="#E0E0E0" />              
             <Columns>
                 <asp:CommandField HeaderText="選取" SelectText="□" ShowSelectButton="True"  >
                    <HeaderStyle Font-Size="Small" Wrap="false" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                 </asp:CommandField>
                 <asp:BoundField DataField="acmNo" HeaderText="系統號" SortExpression="acmNo" Visible="false" />
                 <asp:BoundField DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate" >
                    <HeaderStyle Font-Size="Small" Width="60px"  Wrap="false" />
                 </asp:BoundField>
                 <asp:BoundField DataField="acmWordNum" HeaderText="動支編號" SortExpression="acmWordNum" >
                    <HeaderStyle Font-Size="Small" Width="60px" Wrap="false" />
                 </asp:BoundField>
                 <asp:BoundField DataField="WorkDepName" HeaderText="承辦單位" SortExpression="WorkDepName">
                    <HeaderStyle Font-Size="Small" Width="100px" Wrap="false" />
                 </asp:BoundField>
                 <asp:BoundField DataField="acmWorkUserNo" HeaderText="承辦人員" SortExpression="acmWorkUserNo">
                    <HeaderStyle Font-Size="Small" Width="80px" Wrap="false" />
                 </asp:BoundField>
                 <asp:BoundField DataField="acmMoney" HeaderText="暫付金額" SortExpression="acmMoney" DataFormatString="{0:#,0}" >
                    <HeaderStyle Font-Size="Small" Width="80px" Wrap="false" />
                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right"  />
                 </asp:BoundField>
                 <asp:BoundField DataField="acmMemo" HeaderText="動支事由" SortExpression="acmMemo" HtmlEncode ="true"  />
                 <asp:BoundField DataField="acpModifyUser" HeaderText="最後異動" SortExpression="P.acpModifyUser">
                    <HeaderStyle Font-Size="Small" Width="60px" Wrap="false" />
                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                 </asp:BoundField>
                 <asp:BoundField DataField="acmNo1" HeaderText="再簽次號" SortExpression="acmNo1"  >
                    <HeaderStyle Font-Size="X-Small" Width="30px" Wrap="false" />
                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                 </asp:BoundField>
                 <asp:BoundField DataField="acpPayNo" HeaderText="報支次號" SortExpression="P.acpPayNo"  >
                    <HeaderStyle Font-Size="X-Small" Width="30px" Wrap="false" />
                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                 </asp:BoundField>
             </Columns>
         </asp:GridView>
                               </td>
                           </tr>
                           <tr>
                               <td align="right">
                                 <table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                                    <tr>
                                        <td>
                                            <table border=0 width100% cellpadding=0 cellspacing=0>
                                                <tr>
                                                    <td style="font-size:10pt; width:80px">每頁顯示</td>
                                                    <td style="font-size:10pt;"><asp:TextBox ID="TBDataQty" runat="server" Width="30px" Text="5"></asp:TextBox></td>
                                                    <td style="font-size:10pt;">筆資料</td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="font-size:10pt;">｜只列出</td>
                                    <td><asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
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
                                        <td style="font-size:10pt;">｜承辦單位</td>
                                    <td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
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
