<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActMain1Group.aspx.vb"
    Inherits="UI.CDCFun7.Web.FrmActMain1Group" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>
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
                                <tr>
                                    <td width="100px" align="right">
                                        執行單位：
                                    </td>
                                    <td width="200px">
                                        <asp:DropDownList ID="ctl_AcmWorkUnitNo" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td  width="100px" align="right">
                                        動支編號：
                                    </td>
                                    <td width="100px">
                                        <asp:TextBox ID="ctl_acmWordNum" runat="server" Width="100px" Enabled="True" DBFieldName="acmWordNum"></asp:TextBox>
                                    </td>
                                    <td width="100px" align="right">再簽編號：</td>
                                    <td><asp:TextBox ID="ctl_AcmTopNo1" runat="server" Width="100px" Enabled="True" DBFieldName="acmTopNo1" Style="text-align: center" onfocus="this.select()"
                                                onkeypress="javascript:NumberAndCommaOnly();"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        備註：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ctl_AcmMemo" runat="server" Width="659px" Enabled="True" 
                                            DBFieldName="acmMemo"></asp:TextBox>
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
                            <asp:Button ID="BtnSearch" runat="server" Text="查詢" Height="22px" Width="100px"></asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" height="10">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                border-bottom: #666668 1pt solid" bordercolor="#666668">
                <table style="table-layout: fixed; border-collapse: collapse" bordercolor="#ffffff"
                    cellpadding="5" width="100%" border="1">
                    <tr>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="存檔" Width="100px" Height="22px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True"
                                GridLines="Vertical" AutoGenerateColumns="False" AllowPaging="True" 
                                PageSize="20">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CBSelect" runat="server" Enabled= '<%# IF( Val( Eval("PVCnt") &"") >0, False, True)  %>' />
                                            <input id="TBAacmYear" runat="server" type="hidden" dbfilename="acmYear" />
                                            <input id="TBAcmNo" runat="server" type="hidden" dbfilename="acmNo" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="動支編號">
                                        <ItemTemplate>
                                            <asp:Label ID="lbAcmWordNum" runat="server" Text='<%# Bind("acmWordNum") %>' ToolTip='<%# Bind("acmNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Size="Small" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="原再簽號">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TBAcmSourNo1" runat="server" Style="text-align: center" onfocus="this.select()"
                                                onkeypress="javascript:NumberOnly();" Text='<%# Bind("acmSourNo1")%>' Width="50px"
                                                DBFileName="acmSourNo1"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Size="Small" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="再簽號">
                                        <ItemTemplate>
                                            <asp:Label ID="lbAcmNo1" runat="server" Text='<%# Bind("acmNo1")%>' DBFileName="acmNo1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Size="Small" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="再簽金額">
                                        <ItemTemplate>
                                            <asp:Label ID="lbAcmMoney" runat="server" Style="text-align: right" Text='<%# Bind("acmMoney", "{0:#,0}")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle Font-Size="Small" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="事由">
                                        <ItemTemplate>
                                            <asp:Label ID="lbAcmMemo" runat="server" Text='<%# Bind("acmMemo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Size="Small" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
