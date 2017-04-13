<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRemitDate.aspx.vb" Inherits="UI.ActPayee.Web.FrmRemitDate" %>
<%@ Import Namespace="MyExtensionsTools" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSDateFun.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="MyCalendar" style="behavior:url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
    <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="650" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff"
                        cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style=" table-layout:fixed; border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td style="text-align: right; width:90px">月份 ：</td>
                                        <td style="text-align: left">
                                                                    <asp:DropDownList ID="ddlMonth" runat="server">
                                                                        <asp:ListItem Value="0">......</asp:ListItem>
                                                                        <asp:ListItem Value="1">&nbsp;&nbsp;1月</asp:ListItem>
                                                                        <asp:ListItem Value="2">&nbsp;&nbsp;2月</asp:ListItem>
                                                                        <asp:ListItem Value="3">&nbsp;&nbsp;3月</asp:ListItem>
                                                                        <asp:ListItem Value="4">&nbsp;&nbsp;4月</asp:ListItem>
                                                                        <asp:ListItem Value="5">&nbsp;&nbsp;5月</asp:ListItem>
                                                                        <asp:ListItem Value="6">&nbsp;&nbsp;6月</asp:ListItem>
                                                                        <asp:ListItem Value="7">&nbsp;&nbsp;7月</asp:ListItem>
                                                                        <asp:ListItem Value="8">&nbsp;&nbsp;8月</asp:ListItem>
                                                                        <asp:ListItem Value="9">&nbsp;&nbsp;9月</asp:ListItem>
                                                                        <asp:ListItem Value="10">10月</asp:ListItem>
                                                                        <asp:ListItem Value="11">11月</asp:ListItem>
                                                                        <asp:ListItem Value="12">12月</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                        <td style="text-align: right; width:90px">批號：</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="tbAceWordNum" runat="server" Width="100px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right; width:90px">資料種類：</td>
                                        <td style="text-align: left;">
                                            <asp:DropDownList ID="ddlAceKind" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="btnList" runat="server" Text="列出資料" /></td>
                        </tr>
     
                    </table>
                </td>
            </tr>
            <tr>
                <td style="background-color:White"></td>
            </tr>
            <tr>
                <td>
                   <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td><asp:Button ID="btnSave" runat="server" Text="更新匯款日期" /></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                                                CellPadding="3" CellSpacing="1" EnableModelValidation="True" GridLines="Both" Font-Size="Small">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="是否匯款">
                                                        <ItemTemplate>                                                           
                                                            <asp:CheckBox ID="ctl_AceTransferFlag" runat="server" DBFieldName="aceTransferFlag" Checked='<%#  MyTools.BooleanTool.StringToBoolean(Eval("是否匯款") &"") %>' ToolTip='<%# Val(Eval("是否匯款") &"") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="入帳日期">
                                                        <ItemTemplate>
                                                          <asp:TextBox ID="ctl_AceBillDate" onfocus="this.select()" Style="text-align: center" onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); " runat="server" Text='<%# Eval("入帳日期").ToString.ToMyChineseDate(MyEnumTools.EnumDate.DateSplitSymbol.Slash) &""  %>'  Width="100px" Enabled='<%#   IIF(Eval("是否匯款") &"" ="1", False, True ) %>' DBFieldName="aceBillDate"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="匯款日期">
                                                        <ItemTemplate>
                                                          <asp:TextBox ID="ctl_AceTransferDate" onfocus="this.select()" Style="text-align: center" onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); " runat="server" Text='<%# Eval("匯款日期").ToString.ToMyChineseDate(MyEnumTools.EnumDate.DateSplitSymbol.Slash) &""  %>'  Width="100px" Enabled='<%#   IIF(Eval("是否匯款") &"" ="1", False, True ) %>' DBFieldName="aceTransferDate"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="年度">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceYear" runat="server" Text='<%# Eval("年度") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="月份">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceMonth" runat="server" Text='<%# Eval("月份") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="批號">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceWordNum" runat="server" Text='<%# Eval("批號") %>' ToolTip ='<%# Eval("系統號") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="數量">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceDataCnt" runat="server" Text='<%# Eval("資料數量") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="金額">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceMoney" runat="server" Text='<%# Format(Val( Eval("應付總金額") &"") , "#,0") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>                                                
                                                    <asp:TemplateField HeaderText="備註">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceMemo" runat="server" Text='<%# Eval("備註") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="檢核狀態">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceLockFlag" runat="server" Text='<%# IIF(Eval("檢核旗標") &""="1", "檢核完成" , "") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="已開傳票">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LBdgAceVoucherFlag" runat="server" Text='<%# IIF(Eval("傳票號碼") &"" <>"", "是" , "否")  %>'></asp:Label>
                                                        </ItemTemplate>
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
    </div>
    </form>
</body>
</html>
