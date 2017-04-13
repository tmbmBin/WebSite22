<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchTrlData.aspx.vb" Inherits="UI.CDCAtd.Web.FrmSearchTrlData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript" type="text/javascript">
        function fnGetInfo(parValue) {
            returnValue = parValue;
        }

        returnValue = "Cancel";
        function fnCancel() {
            returnValue = "Cancel";
        }

    </script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSDateFun.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
        <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="700" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff"
                        cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="table-layout: fixed; border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td style="text-align: right; width: 90px">出差日期：</td>
                                        <td style="text-align: left" colspan="3">
                                            <asp:TextBox ID="ctl_SDate" runat="server" Width="80px" Style="text-align: center"
                                                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "></asp:TextBox>～
                                        <asp:TextBox ID="ctl_EDate" runat="server" Width="80px" Style="text-align: center"
                                            onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "></asp:TextBox></td>
                                        <td style="text-align: right; width: 90px">&nbsp;</td>
                                        <td style="text-align: left">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <%--20151229 [mdf]:員工代碼改為薪資代碼--%>
                                        <td style="text-align: right; width: 90px">薪資代碼：</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="ctl_EmpCode" runat="server" Width="100px"></asp:TextBox></td>
                                        <td style="text-align: right; width: 90px">員工姓名：</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="ctl_EmpName" runat="server" Width="100px"></asp:TextBox></td>
                                        <td style="text-align: right; width: 90px">已結報：</td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="ctl_ActPayFlag" runat="server">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 90px">&nbsp;</td>
                                        <td style="text-align: left">&nbsp;</td>
                                        <td style="text-align: right; width: 90px">&nbsp;</td>
                                        <td style="text-align: left">&nbsp;</td>
                                        <td style="text-align: right; width: 90px">&nbsp;</td>
                                        <td style="text-align: left">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="BtnList" runat="server" Text="列出資料" />
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>

        <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="700" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>


                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
                                    CellPadding="3" CellSpacing="1" EnableModelValidation="True"
                                    Font-Size="Small">
                                    <Columns>
                                        <asp:TemplateField HeaderText="選取" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LBdgSelect" runat="server" CausesValidation="False"
                                                    CommandName="Select" Text='<%# Eval("請假單號") %>' CommandArgument='<%# Eval("請假單號") %>' Visible='<%# IIF(Eval("已結報").ToString()="1", "False", "True") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="序號">
                                            <HeaderStyle Width="40px" />
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgDataNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="部門名稱">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgDepName" runat="server" Text='<%# Eval("部門名稱") %>' ToolTip='<%# Eval("部門代碼") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--20151229 [mdf]:員工代碼改為薪資代碼--%>
                                        <asp:TemplateField HeaderText="薪資代碼">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgEmpCode" runat="server" Text='<%# Eval("員工代碼") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="員工姓名">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgEmpName" runat="server" Text='<%# Eval("員工姓名") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="出差起始日">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgTrlSDate" runat="server" Text='<%# Eval("出差起始日") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="出差結束日">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgTrlEDate" runat="server" Text='<%# Eval("出差結束日") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="出差事由">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgTrlMemo" runat="server" Text='<%# Eval("出差事由") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
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
