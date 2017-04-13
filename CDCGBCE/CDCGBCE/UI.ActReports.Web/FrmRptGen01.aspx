<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptGen01.aspx.vb" Inherits="UI.ActReports.Web.FrmRptGen01" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" /> 
<script language="javascript">
//    function f_frameStyleResize(targObj) {
//        var targWin = targObj.parent.document.all[targObj.name];
//        if (targWin != null) {
//            var HeightValue = targObj.document.body.scrollHeight
//            if (HeightValue < 600) { HeightValue = 600 }
//            targWin.style.pixelHeight = HeightValue;
//        }
//    }

//    function f_iframeResize() {
//        bLoadComplete = true; f_frameStyleResize(self);
//    }

//    var bLoadComplete = false;
//    window.onload = f_iframeResize;
</script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:DataGrid ID="DataGrid1" runat="server"></asp:DataGrid>
    <table>  
        <tr style="display:none">
        <td>
 	    <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="550">
 	        <tr>
 	            <td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
 	                <table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>
                                <table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
                                    <tr style="display:none">
	                                    <td align="right" width="85">&nbsp;</td>
	                                    <td align="left"  width="150">&nbsp;</td>
	                                    <td align="right" width="85">&nbsp;</td>
	                                    <td align="left" width="150">&nbsp;</td>
	                                    <td align="left">&nbsp;</td>
                                    </tr>
                                    <tr>
	                                    <td align="right">動支編號：</td>
	                                    <td align="left">
                                            <asp:TextBox ID="TBAcmWordNum" runat="server" Width="120px"></asp:TextBox>
                                        </td>
	                                    <td align="right">&nbsp;</td>
	                                    <td align="left">&nbsp;</td>
	                                    <td align="left">&nbsp;</td>
                                    </tr>
                                    <tr>
	                                    <td align="right">經費單位：</td>
	                                    <td align="left">
	                                        <asp:DropDownList ID="DDLBgtDepName" runat="server"></asp:DropDownList>
	                                    </td>
	                                    <td align="right">審核狀態：</td>
	                                    <td align="left">
	                                        <asp:DropDownList ID="DDLAcpPassFlag" runat="server">
	                                            <asp:ListItem Value="0">未核支</asp:ListItem>
	                                            <asp:ListItem Value="1">已核支</asp:ListItem>
	                                            <asp:ListItem Value="">不區分</asp:ListItem>
	                                        </asp:DropDownList>
	                                    </td>
	                                    <td align="left">&nbsp;</td>
                                    </tr>
                                    <tr>
	                                    <td align="right">事　　由：</td>
	                                    <td align="left" colspan="4">
	                                        <asp:TextBox ID="TBAcpMemo" runat="server" Width="400px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <asp:Label ID="LBMemo" runat="server" Text="請注意：如不勾選(過濾)任何資料，則會印前一畫面所選的該筆資料。" Font-Size="Small" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
						<tr>
						    <td>
                                <table  border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse; table-layout:fixed">
                                    <tr>
                                        <td><asp:Button ID="BtnList" runat="server" Text="列出資料" /></td>
                                    </tr>
                                </table>
                            </td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
 	    <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="550">
 	        <tr>
 	            <td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
 	                <table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>
                                <table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
                                    <tr style="display:none">
	                                    <td align="right"></td>	                                   
                                    </tr>                                   
                                    <tr>
	                                    <td align="center">↓選取下方要合併資料↓</td>	                                   
                                    </tr>
                                    <tr>
	                                    <td align="left">
	                                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines=Horizontal AutoGenerateColumns="False" AllowSorting="True">
                                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Font-Size="Small" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取">
                                                            <HeaderStyle Font-Size="Small" Width="30px" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="動支編號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acmWordNum").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("acmNo").ToString()) %>'> </asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="70px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="再簽號" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmNo1" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acmNo1").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="報支號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpPayNo").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("acpPayYear").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="預算單位">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgBgtDepName" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("BgtDepName").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("BgtDepCode").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="核銷金額" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcpMoney" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpMoney", "{0:#,0}").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="100px" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="事由">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcpMemo" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpMemo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="轉正次號" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpPayNo1").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("acpPayYear").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="x-Small" Width="30px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                            </asp:GridView>
                                        </td>	                                    
                                    </tr>
                                    <tr>
	                                    <td align="center">
                                            <asp:Button ID="BtnListSubject" runat="server" 
                                                Text="列出所選的科目資料" Enabled="False" /></td>	                                   
                                    </tr>
                                </table>
                            </td>
                        </tr>
						</table>
				</td>
			</tr>
		</table>
 	    <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="800">
 	        <tr>
 	            <td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
 	                <table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>
                                <table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
                                    <tr style="display:none">
	                                    <td align="right"></td>	                                   
                                    </tr>                                   
                                    <tr>
	                                    <td align="center">↓設定科目合併↓</td>	                                   
                                    </tr>                                   
                                    <tr>
	                                    <td align="left">
	                                        <asp:GridView ID="GVGroupPlan" runat="server" BackColor="White" 
                                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                                GridLines=Horizontal AutoGenerateColumns="False" AllowSorting="True">
                                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Font-Size="Small" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取">
                                                            <HeaderStyle Font-Size="Small" Width="30px" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="群組號" >
                                                            <ItemTemplate>                                                                 
                                                                <asp:TextBox ID="TBdgAcvSubGroupNo" runat="server" Width="50" style="text-align:center"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small"  Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="動支編號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acmWordNum").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("acmNo").ToString()) %>'> </asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="70px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="再簽號"  Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmNo1" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acmNo1").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="報支號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpPayNo").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("acpPayYear").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="報支明細號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acvSubNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="計畫科目" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgPlanName" runat="server" Text='<%#    AntiXss.HtmlEncode(Eval("FullPlanName").ToString()) %>'  ToolTip='<%# Container.DataItem("acvOutlayYear") & ":"& Container.DataItem("acvPlanCode") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="用途別">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgOulName" runat="server" Text='<%#  AntiXss.HtmlEncode(Eval("FullOulName").ToString()) %>'  ToolTip='<%# Container.DataItem("acvOutlayYear") & ":"& Container.DataItem("acvOutlayCode")   %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="核銷金額" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcvMoney" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acvMoney", "{0:#,0}").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="80px" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="事由">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcvMemo" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpMemo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="轉正次號" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acpPayNo1").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(Eval("acpPayYear").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="x-Small" Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="轉正明細號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcvSubNo1" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("acvSubNo1").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Font-Size="Small" Width="50px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
	                                    <td align="center">
	                                        <table  border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse; table-layout:fixed">
                                                <tr>
                                                    <td><asp:Button ID="BtnPrint" runat="server" Text="列印報表" Enabled="False" />
                                                        <asp:CheckBox ID="CBFormat" runat="server" Text="Excel格式" Checked="True" 
                                                            Visible="False"  /></td>
                                                </tr>
                                            </table>
	                                    </td>	                                   
                                    </tr>                                   
                                </table>
                            </td>
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
