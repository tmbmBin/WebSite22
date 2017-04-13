<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPay.ascx.vb" Inherits="UI.ActMixPay.UC.UCActPay" %>

<table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="600" border="1">
    <tr>
        <td>
            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="590px">
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="590px">
                <tr>
                    <td style="width:90px; text-align:right">�ʤ�~�סG</td>
                    <td style="width:105px">
                        <asp:TextBox ID="ctl_AcmYear"    style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" MaxLength="3" runat="server" Enabled="True" DBFieldName="acmYear"></asp:TextBox>
                    </td>
                    <td style="width:90px; text-align:right">�ʤ�s���G</td>
                    <td style="width:105px">
                        <asp:TextBox ID="ctl_AcmWordNum" style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" MaxLength="10" runat="server" Enabled="True" DBFieldName="acmWordNum"></asp:TextBox>
                    </td>
                    <td style="width:90px; text-align:right">�ʤ���B�G</td>
                    <td style="width:105px">
                        <asp:TextBox ID="ctl_AcmMoney"   style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px"                 runat="server" Enabled="True" DBFieldName="acmMoney"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
        <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="595px">
        <tr>
            <td style="width:90px; text-align:right">�־P�~�סG</td>
            <td style="width:105px">
            <asp:TextBox ID="ctl_AcpPayYear" runat="server" style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpPayYear"></asp:TextBox>
            </td>
            <td style="width:90px; text-align:right">�־P�����G</td>
            <td style="width:105px">
            <asp:TextBox ID="ctl_AcpPayNoPrv" runat="server" style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpPayNoPrv"></asp:TextBox>
            </td>
            <td style="width:90px; text-align:right">�־P���B�G</td>
            <td>
            <asp:TextBox ID="ctl_AcpMoney" runat="server" style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpMoney"></asp:TextBox>
            </td>
        </tr>
    <tr>
        <td style="width:90px; text-align:right">
            �s�սs���G</td>
        <td style="width:105px">
            <asp:TextBox ID="ctl_AcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'
                Width="100px" Enabled="True" DBFieldName="acpGroupNo"></asp:TextBox>
        </td>
        <td style="width:90px; text-align:right">
            �־P����G</td>
        <td>
            <asp:TextBox ID="ctl_AcpMarkDate" onfocus="this.select()" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acpMarkDate")  &"" ) %>'
                Width="100px" Enabled="True" DBFieldName="acpMarkDate"></asp:TextBox>
        </td>
        <td style="width:90px; text-align:right">
            �־P�H���G</td>
        <td>
            <asp:TextBox ID="ctl_AcpMarkUserNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpMarkUserNo") %>'
                Width="100px" Enabled="True" DBFieldName="acpMarkUserNo"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:90px; text-align:right">
            �־P�ƥѡG</td>
        <td colspan="5">
            <asp:TextBox ID="ctl_AcpSubMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpSubMemo") %>'
                Width="473px" Enabled="True" DBFieldName="acpSubMemo" Rows="2" 
                TextMode="MultiLine"></asp:TextBox><input id="BtnSubPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" type="button" value="..." disabled="disabled" /></td>
    </tr>
    <tr>
        <td style="width:90px; text-align:right">
            ���b�ƥѡG</td>
        <td colspan="5">
            <asp:TextBox ID="ctl_AcpMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpMemo") %>'
                Width="473px" Enabled="True" DBFieldName="acpMemo" Rows="2" 
                TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..."  disabled="disabled"/></td>
    </tr>

    <tr style="display:none">
        <td style="width:90px; text-align:right; display:none">
            �t�θ�</td>
        <td style="width:105px">
            <asp:TextBox ID="ctl_AcmNo" runat="server" Width="100px" Enabled="True" DBFieldName="acmNo"></asp:TextBox>
        </td>
        <td style="width:90px; text-align:right">�bñ��</td>
        <td><asp:TextBox ID="ctl_AcmNo1" runat="server" Width="100px" Enabled="True" DBFieldName="acmNo1"></asp:TextBox></td>
        <td style="width:90px; text-align:right">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
        </td>
    </tr>
</table>
