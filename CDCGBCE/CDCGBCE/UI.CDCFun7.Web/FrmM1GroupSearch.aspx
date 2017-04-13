<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmM1GroupSearch.aspx.vb" Inherits="UI.CDCFun7.Web.FrmM1GroupSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5"
        width="800" bgcolor="#dadee9">
        <tr>
            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                border-bottom: #666668 1pt solid" valign="top" align="left">
                <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                    border="1">
                    <tr>
                        <td>
                            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="100%">
                                <tr style="display: none; height: 0px">
                                    <td width="100px" align="right">
                                    </td>
                                    <td width="150px">
                                    </td>
                                    <td width="100px" align="right">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        執行單位：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ctl_AcmWorkUnitNo" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right">
                                        動支編號： 
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_acmWordNum" runat="server"  
                                            Width="120px" Enabled="True" DBFieldName="acmWordNum"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                       備註：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ctl_AcmMemo" runat="server"   Width="521px" Enabled="True" DBFieldName="acmMemo"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                        <asp:Button ID="BtnSearch" runat="server" Text="查詢" Height="22"></asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" height="10">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                border-bottom: #666668 1pt solid" bordercolor="#666668">
                <table style="table-layout: fixed; border-collapse: collapse" bordercolor="#ffffff"
                    cellpadding="5" width="100%" border="1">
                    <tr>
                        <td>
                            <asp:DataGrid ID="DG_actMain1" runat="server" Width="100%" AutoGenerateColumns="False"
                                AllowSorting="True" AllowPaging="True">
                                <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center"
                                    ForeColor="White" BackColor="#003366"></HeaderStyle>
                                <Columns>
                                    <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" Visible="false">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small"></ItemStyle>
                                        <HeaderStyle Width="30px" />
                                    </asp:ButtonColumn>
                                    <asp:TemplateColumn HeaderText="選取" >
                                        <ItemTemplate>
                                            <input id="Button1" type="button" value="..." onclick="<%# "fnCallEditDialog('" & "acmYear=" & DataBinder.Eval(Container, "DataItem.acmYear") & "&acmNo="& DataBinder.Eval(Container, "DataItem.acmNo") & "&acmNo1="& DataBinder.Eval(Container, "DataItem.acmNo1") & "&acmWordNum="& DataBinder.Eval(Container, "DataItem.acmWordNum") & "');" %>" />
                                                <asp:HyperLink Visible="false" ID="HyperLink1" runat="server"  NavigateUrl='<%# "~/UI.ActDataAss.Web/FrmActMain1Ass.aspx?acmYear=" & DataBinder.Eval(Container, "DataItem.acmYear") & "&acmNo="& DataBinder.Eval(Container, "DataItem.acmNo") & "&acmNo1="& DataBinder.Eval(Container, "DataItem.acmNo1")  %>' Target="_search" >□</asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="年度" SortExpression="acmYear">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmYear" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmYear") & "" ))) %>'
                                                ToolTip='DataBinder.Eval(Container, "DataItem.acmYear")' 
                                                DBFieldName="acmYear"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="動支編號" SortExpression="acmNo">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmWordNum0" runat="server" 
                                                Text='<%#   DataBinder.Eval(Container, "DataItem.acmWordNum") & ""  %>'  ToolTip='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmNo") & "" ))) %>'
                                                DBFieldName="acmNo"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="再簽號" SortExpression="acmNo1">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmNo1" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmNo1") & "" ))) %>'
                                                ToolTip='DataBinder.Eval(Container, "DataItem.acmNo1")' 
                                                DBFieldName="acmNo1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="50px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="執行單位" SortExpression="acmWorkUnitNo">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssWorkUnitNo" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkDepName").ToString()) %>'
                                                DBFieldName="assWorkUnitNo"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="100px" />
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="申請金額" SortExpression="acmMoney">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmMoney" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmMoney") & "" ))) %>'
                                                DBFieldName="acmMoney"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="100px" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="備註" SortExpression="assMemo">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssMemo0" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmMemo").ToString()) %>'
                                                DBFieldName="assMemo"></asp:Label>
                                        </ItemTemplate>                                      
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="assModifyDTime" SortExpression="assModifyDTime" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssModifyDTime" runat="server"  
                                                DBFieldName="assModifyDTime"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="assModifyUser" SortExpression="assModifyUser" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssModifyUser" runat="server" 
                                                DBFieldName="assModifyUser"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages">
                                </PagerStyle>
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
