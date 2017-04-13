<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayeeMain.ascx.vb"
    Inherits="UI.ActPayee.UC.UCActPayeeMain" %>
<table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="100%">
    <tr>
        <td width="90px" align="right">年度：</td>
        <td width="110px">
            <asp:TextBox ID="ctl_AceYear" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%# Val(DataBinder.Eval(Container, "DataItem.aceYear") &"") %>' ToolTip='<%# Val(DataBinder.Eval(Container, "DataItem.aceNo") &"") %>'
                Width="100px" Enabled="True"
                DBFieldName="aceYear"></asp:TextBox>
        </td>
        <td width="90px" align="right">批號：</td>
        <td width="110px">
            <asp:TextBox ID="ctl_AceWordNum" Style="text-align: center"
                onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.aceWordNum") %>'
                ToolTip='<%# Val(DataBinder.Eval(Container, "DataItem.aceNo") &"") %>'
                Width="100px" Enabled="True" DBFieldName="aceWordNum"></asp:TextBox>
        </td>
        <td width="90px" align="right">資料數量：</td>
        <td>
            <asp:TextBox ID="ctl_AceDataCnt" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%#  Val(DataBinder.Eval(Container, "DataItem.aceDataCnt") &"") %>'
                Width="100px" Enabled="True" DBFieldName="aceDataCnt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td width="90px" align="right">應付金額：</td>
        <td>
            <asp:TextBox ID="ctl_AceMoney" Style="text-align: right" onfocus="this.blur();" BackColor="Transparent"
                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.aceMoney") &"")) %>'
                Width="100px" Enabled="True" DBFieldName="aceMoney"></asp:TextBox>
        </td>
        <td width="90px" align="right">種類：</td>
        <td>
            <asp:DropDownList ID="ctl_AceKind" runat="server" Width="100px" Enabled="True" DBFieldName="aceKind"></asp:DropDownList>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td width="90px" align="right">日期：</td>
        <td colspan="4">
            <asp:TextBox ID="ctl_AceSDate" onfocus="this.select()" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.aceSDate")  &"" ) %>'
                Width="100px" Enabled="True" DBFieldName="aceSDate"></asp:TextBox>
            &nbsp;～&nbsp<asp:TextBox ID="ctl_AceEDate" onfocus="this.select()" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.aceEDate")  &"" ) %>'
                Width="100px" Enabled="True" DBFieldName="aceEDate"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td width="90px" align="right">備註：</td>
        <td colspan="5">
            <asp:TextBox ID="ctl_AceMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.aceMemo") %>'
                Width="494px" Enabled="True" DBFieldName="aceMemo"></asp:TextBox>
        </td>
    </tr>
    <tr style="display: none">
        <td width="90px" align="right">匯款旗標：</td>
        <td>
            <asp:TextBox ID="ctl_AceTransferFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.aceTransferFlag") %>'
                Width="45px" Enabled="True" DBFieldName="aceTransferFlag"></asp:TextBox>
        </td>
        <td width="90px" align="right">&nbsp;</td>
        <td>
            <asp:TextBox ID="ctl_AceNo" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%# Val(DataBinder.Eval(Container, "DataItem.aceNo") &"") %>'
                Width="100px" Enabled="True"
                DBFieldName="aceNo"></asp:TextBox></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
