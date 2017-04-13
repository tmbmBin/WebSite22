<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCCashMain2.ascx.vb" Inherits="UI.TrlBatch.UC.UCCashMain2" %>
<style type="text/css">
    .style1
    {
        text-align: right;
        width:90px;
    }
    .style2
    {  width:100px;
    }
</style>
<table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="600px">
    <tr>
        <td class="style1">
            年度：</td>
        <td class="style2">
            <asp:TextBox ID="ctl_CsmYear" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>'
               Width="80px" Enabled="True"
                DBFieldName="csmYear"></asp:TextBox>
        </td>
        <td  class="style1">
            數量：</td>
        <td   class="style2">
            <asp:TextBox ID="ctl_CsmCnt" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmCnt") %>'
                Width="80px" Enabled="True" DBFieldName="csmCnt"></asp:TextBox>
        </td>
        <td  class="style1">
            金額：</td>
        <td>
            <asp:TextBox ID="ctl_CsmMoney" Style="text-align:right" onfocus="this.blur();" BackColor="Transparent"
                runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.csmMoney") &"")) %>'
                Width="90px" Enabled="True" DBFieldName="csmMoney"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style1">建檔日期：</td>
        <td colspan="3">
            <asp:TextBox ID="ctl_CsmSDate" onfocus="this.select()" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.csmSDate")  &"" ) %>'
                Width="80px" Enabled="True" DBFieldName="csmSDate"></asp:TextBox>
        &nbsp;&nbsp;</td>
        <td  class="style1">
            批號：</td>
        <td>
            <asp:TextBox ID="ctl_CsmBatchNo" Style="text-align:center" onfocus="this.blur();" BackColor="Transparent" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmBatchNo") %>'
                Width="90px" Enabled="True" DBFieldName="csmBatchNo"></asp:TextBox>
        </td>

    </tr>
    <tr>
        <td class="style1">
            備註：</td>
        <td colspan="5">
            <asp:TextBox ID="ctl_CsmMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmMemo") %>'
                Width="470px" Enabled="True" DBFieldName="csmMemo"></asp:TextBox>
        </td>
    </tr>
    <tr style="display:none">
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
          
        </td>
        <td>
            <input id="ctl_CsmNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.csmNo")  %>'  DBFieldName="csmNo" />
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
