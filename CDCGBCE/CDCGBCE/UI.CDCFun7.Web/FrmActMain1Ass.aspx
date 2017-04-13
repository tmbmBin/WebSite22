<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActMain1Ass.aspx.vb" Inherits="UI.CDCFun7.Web.FrmActMain1Ass" %>
<%@ Import Namespace="Microsoft.Security.Application" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <base target="_self" />
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/"
        rocdate counter>
    </div>
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
                                <tr style="display: block; height: 0px">
                                    <td width="100px" align="right">
                                        動支編號：</td>
                                    <td width="170px">
                                        <asp:Label ID="ctl_acmWordNum" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td width="100px" align="right">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr style="display:none">
                                    <td class="style1">
                                        動支年度
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_AcmYear" onfocus="this.select()" Style="text-align: Right" onkeypress="javascript:NumberOnly();"
                                            MaxLength="2" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmYear") &"")) %>'
                                            ToolTip='DataBinder.Eval(Container, "DataItem.acmYear")' Width="120px" Enabled="True"
                                            DBFieldName="acmYear"></asp:TextBox>
                                    </td>
                                    <td class="style1">
                                        系統號
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_AcmNo" onfocus="this.select()" Style="text-align: Right" onkeypress="javascript:NumberOnly();"
                                            MaxLength="4" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmNo") &"")) %>'
                                            ToolTip='DataBinder.Eval(Container, "DataItem.acmNo")' Width="120px" Enabled="True"
                                            DBFieldName="acmNo"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="display:none">
                                    <td class="style1">
                                        在簽號
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_AcmNo1" onfocus="this.select()" Style="text-align: Right" onkeypress="javascript:NumberOnly();"
                                            MaxLength="2" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmNo1") &"")) %>'
                                            ToolTip='DataBinder.Eval(Container, "DataItem.acmNo1")' Width="120px" Enabled="True"
                                            DBFieldName="acmNo1"></asp:TextBox>
                                    </td>
                                    <td class="style1">
                                        流水號
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_AssNo" onfocus="this.select()" Style="text-align: Right" onkeypress="javascript:NumberOnly();"
                                            MaxLength="2" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.assNo") &"")) %>'
                                            ToolTip='DataBinder.Eval(Container, "DataItem.assNo")' Width="120px" Enabled="True"
                                            DBFieldName="assNo"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="display:none">
                                    <td class="style1">
                                        請示金額：</td>
                                    <td>
                                        <asp:TextBox ID="ctl_AcmMoney" onfocus="this.select()" Style="text-align: Right"
                                            onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};"
                                            onclick="this.value=replaceString(this.value,',',''); this.select();" MaxLength="8"
                                            runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmMoney") &"")) %>'
                                            Width="120px" Enabled="True" DBFieldName="acmMoney"></asp:TextBox>
                                    </td>
                                    <td class="style1">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        部門名稱：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ctl_AssWorkUnitNo" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style1">
                                        出差人名：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_AssWorkUserNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.assWorkUserNo") %>'
                                            Width="120px" Enabled="True" DBFieldName="assWorkUserNo"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="display:none">
                                    <td class="style1">
                                        差旅金額：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ctl_AssMoney" onfocus="this.select()" Style="text-align: Right"
                                            onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};"
                                            onclick="this.value=replaceString(this.value,',',''); this.select();" MaxLength="8"
                                            runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.assMoney") &"")) %>'
                                            Width="120px" Enabled="True" DBFieldName="assMoney"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        備註：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ctl_AssMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.assMemo") %>'
                                            Width="521px" Enabled="True" DBFieldName="assMemo"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" height="10">
            </td>
        </tr>
        <tr>
            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                border-bottom: #666668 1pt solid" bordercolor="#666668">
                <table style="table-layout: fixed; border-collapse: collapse" bordercolor="#ffffff"
                    cellpadding="5" width="100%" border="1">
                    <tr>
                        <td valign="bottom" align="left">
                            <table cellpadding="1" border="0">
                                <tr>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnAdd" runat="server" Text="新增" Height="22"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnEdit" runat="server" Text="修改" Height="22"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Height="22"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnSave" runat="server" Text="儲存" Height="22"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnCancel" runat="server" Text="取消" Height="22"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnSearch" runat="server" Text="查詢" Height="22" Visible="False"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:Button ID="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:Button>
                                    </td>
                                    <td valign="bottom" align="center">
                                    </td>
                                    <td valign="bottom" align="center">
                                    </td>
                                    <td valign="bottom" align="center">
                                        <asp:TextBox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
                                            ID="TBSearchSql" onblur="if(this.value==''){this.value='尋找編號';}" Style="text-align: center"
                                            onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px"
                                            AutoPostBack="True">尋找編號</asp:TextBox>
                                        <input style="font-size: 8pt; width: 16px; font-family: Webdings; height: 22px" type="button"
                                            value="s">
                                    </td>
                                    <td>
                                        <input id="ctl_WhereSql" style="width: 23px; height: 22px" type="hidden" size="1"
                                            name="ctl_WhereSql" runat="server">
                                    </td>
                                    <td>
                                        <input id="ctl_OrderSql" style="width: 23px; height: 22px" type="hidden" size="1"
                                            name="ctl_OrderSql" runat="server">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataGrid ID="DG_actMain1Ass" runat="server" Width="100%" AutoGenerateColumns="False"
                                AllowSorting="True" AllowPaging="True">
                                <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center"
                                    ForeColor="White" BackColor="#003366"></HeaderStyle>
                                <Columns>
                                    <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small"></ItemStyle>
                                        <HeaderStyle Width="30px" />
                                    </asp:ButtonColumn>
                                    <asp:TemplateColumn HeaderText="acmYear" SortExpression="acmYear" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmYear" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmYear") & "" ))) %>'
                                                ToolTip='DataBinder.Eval(Container, "DataItem.acmYear")' DBFieldName="acmYear"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="acmNo" SortExpression="acmNo" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmNo" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmNo") & "" ))) %>'
                                                ToolTip='DataBinder.Eval(Container, "DataItem.acmNo")' DBFieldName="acmNo"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="acmNo1" SortExpression="acmNo1" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmNo1" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmNo1") & "" ))) %>'
                                                ToolTip='DataBinder.Eval(Container, "DataItem.acmNo1")' DBFieldName="acmNo1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="assNo" SortExpression="assNo" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssNo" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.assNo") & "" ))) %>'
                                                ToolTip='DataBinder.Eval(Container, "DataItem.assNo")' DBFieldName="assNo"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="acmMoney" SortExpression="acmMoney" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AcmMoney" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acmMoney") & "" ))) %>'
                                                DBFieldName="acmMoney"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                  
                                    <asp:TemplateColumn HeaderText="部門名稱" SortExpression="assWorkUnitNo">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssWorkUnitNo" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.assWorkUnitNo").ToString()) %>'
                                                DBFieldName="assWorkUnitNo"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="出差人名" SortExpression="assWorkUserNo">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssWorkUserNo" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.assWorkUserNo").ToString()) %>'
                                                DBFieldName="assWorkUserNo"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                      <asp:TemplateColumn HeaderText="差旅金額" SortExpression="assMoney" Visible="false" >
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssMoney" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.assMoney") & "" ))) %>'
                                                DBFieldName="assMoney"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="備註" SortExpression="assMemo">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssMemo" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.assMemo").ToString()) %>'
                                                DBFieldName="assMemo"></asp:Label>
                                        </ItemTemplate>                                      
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="assModifyDTime" SortExpression="assModifyDTime" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssModifyDTime" runat="server" Text='<%# AntiXss.HtmlEncode(MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.assModifyDTime").ToString())  & ""  ) %>'
                                                DBFieldName="assModifyDTime"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="assModifyUser" SortExpression="assModifyUser" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_AssModifyUser" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.assModifyUser").ToString()) %>'
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
