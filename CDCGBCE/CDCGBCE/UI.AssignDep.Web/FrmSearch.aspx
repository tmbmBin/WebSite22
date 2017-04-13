<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearch.aspx.vb" Inherits="UI.AssignDep.Web.FrmSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <base target="_self"/>
    <script language="javascript" >
        function scale_item2(sender) {
            if (document.getElementById(sender).src.slice(-8) == 'plus.gif') {
                parent.MyFrame.rows = "*,50";
                document.getElementById(sender).src = "images/minus.gif";
            }
            else {
                parent.MyFrame.rows = "*,330";
                document.getElementById(sender).src = "images/plus.gif";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="5" style="border-collapse: collapse; margin-top: 10px; margin-left: 10px; width:680px" bgcolor="#dadee9" border="0" >
            <tr>
                <td style="border-right:#666668 1pt solid; border-top:#666668 1pt solid; border-left:#666668 1pt solid; border-bottom:#666668 1pt solid">
                   <table style="border-collapse: collapse; border-color: #ffffff" cellpadding="1" border="1" width="100%">
                        <tr>
                            <td >
                                <table style="border-collapse: collapse; border-color: #FFFFFF" cellpadding="1" border="0" width="100%">
                                    <tr>
                                        <td width="90px" nowrap></td>
                                        <td width="120px"></td>
                                        <td width="90px" nowrap></td>
                                        <td width="120px"></td>
                                        <td width="90px" nowrap></td>
                                        <td align="right"><img id="img2" border="0" src="images/plus.gif" onclick="scale_item2(this.id)" align="top" style="margin-top: -2px; margin-right: 1px; cursor: row-resize" alt="Collapse/Expand"></td>
                                    </tr>
                                    <tr>
                                        <td align="right">經資門別：</td>
                                        <td><asp:DropDownList id="DDLAccKindName" runat="server" Width="120px"></asp:DropDownList></td>
                                        <td align="right">預算來源：</td>
                                        <td><asp:DropDownList id="DDLBgtSourName" runat="server" Width="120px"></asp:DropDownList></td>
                                        <td align="right"  nowrap>請示月份：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcmMonth" runat="server" AutoPostBack="True" 
                                                Width="120px">
										        <asp:ListItem Value="">......</asp:ListItem>
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
										    </asp:DropDownList>
									    </td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">經費單位：</td>
                                        <td><asp:DropDownList id="DDLBgtDepName" runat="server" AutoPostBack="True" 
                                                Width="120px"></asp:DropDownList></td>
                                        <td align="right">承辦單位：</td>
                                        <td><asp:DropDownList id="DDLWorkDepName" runat="server" Width="120px"></asp:DropDownList></td>
                                        <td align="right">電子支付：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcmEtcPayment" runat="server" Width="120px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                           </asp:DropDownList>
										</td>
                                    </tr>                                    
                                    <tr>
                                        <td align="right">動支編號：</td>
                                        <td><asp:TextBox ID="TBAcmWordNum" runat="server" Width="114px"></asp:TextBox></td>
                                        <td align="right">承辦人員：</td>
                                        <td><asp:TextBox id="TBStaffName" runat="server" Width="114px"></asp:TextBox></td>
                                        <td align="right">逕行暫付：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcvPerPayFlag" runat="server" Width="120px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                           </asp:DropDownList>
										</td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">簽文資料：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcmProdLevelKind" runat="server" Width="120px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                           </asp:DropDownList>
										</td>
                                        <td align="right">零&nbsp;&nbsp;用&nbsp;&nbsp;金：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcmProdVisaKind" runat="server" Width="120px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                           </asp:DropDownList>
										</td>
                                        <td align="right">分期付款：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcmProdKind" runat="server" Width="120px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                           </asp:DropDownList>
										</td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">動支事由：</td>
                                        <td colspan="3"><asp:TextBox ID="TBAcmMemo" runat="server" Width="332px"></asp:TextBox></td>
                                        <td align="right">動支金額：</td>
                                        <td>
                                            <asp:TextBox ID="TBAcmMoney" runat="server" Width="115px"></asp:TextBox></td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">用途說明：</td>
                                        <td colspan="3"><asp:TextBox ID="TBAcvMemo" runat="server" Width="332px"></asp:TextBox></td>
                                        <td align="right">預算金額：</td>
                                        <td>
                                            <asp:TextBox ID="TBAcvMoney" runat="server" Width="115px"></asp:TextBox></td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">廠商名稱：</td>
                                        <td colspan="3"><asp:TextBox ID="TBAcmPayName" runat="server" Width="332px"></asp:TextBox></td>
                                        <td align="right">審核狀態：</td>
                                        <td>
                                            <asp:DropDownList id="DDLAcmPassFlag" runat="server" Width="120px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">未審核</asp:ListItem>
                                                <asp:ListItem Value="1">已審核</asp:ListItem>
                                           </asp:DropDownList>
										</td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">預算科目：</td>
                                        <td colspan="5">
                                            <asp:DropDownList id="DDLPlanName" runat="server" 
                                                AutoPostBack="True" Width="558px"></asp:DropDownList></td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">計畫名稱：</td>
                                        <td colspan="5"><asp:DropDownList id="DDLBizName" runat="server" Width="558px"></asp:DropDownList></td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">用&nbsp;&nbsp;途&nbsp;&nbsp;別：</td>
                                        <td colspan="5"><asp:DropDownList id="DDLOulName" runat="server" Width="558px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td width="90px"></td>
                                        <td width="120px">
                                            <asp:Button ID="BtnOK" runat="server" Text="確認" />
                                        </td>
                                        <td width="90px"></td>
                                        <td width="120px"></td>
                                        <td width="90px"></td>
                                        <td></td>
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
