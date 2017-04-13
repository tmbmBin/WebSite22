<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmFileList.aspx.vb" Inherits="UI.CDCFun5.Web.FrmFileList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            height: 24px;
        }
    </style>
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
                                            <td width="150">&nbsp;</td>
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
                                                <asp:TextBox ID="TBWorkUserName" runat="server"></asp:TextBox>
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
                                                <asp:TextBox ID="TBPayName" runat="server" Width="200px" 
                                                    style="margin-left: 0px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90" class="style1" >動支編號：</td>
                                            <td class="style1"  ><asp:textbox id="TBAcmWordNum" runat="server" Width="80px" ></asp:textbox></td>
                                            <td align="right" class="style1" >設定狀態：</td>
                                            <td class="style1" >
                                                <asp:DropDownList ID="DDLStatus" runat="server">
                                                    <asp:ListItem Value="0">未設定</asp:ListItem>
                                                    <asp:ListItem Value="1">已設定</asp:ListItem>
                                                    <asp:ListItem Value="">------</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="style1" >
                                                審核狀態：</td>
                                            <td class="style1" >
                                                <asp:DropDownList ID="DDLPassStatus" runat="server">
                                                    <asp:ListItem Value="0">未審核</asp:ListItem>
                                                    <asp:ListItem Value="1">已審核</asp:ListItem>
                                                    <asp:ListItem Value="">------</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="90">事由：</td><td colspan=3>
                                            <asp:TextBox ID="TBAcmMemo" runat="server" Width="500px"></asp:TextBox>
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
    
    <div>
    
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </form>
</body>
</html>
