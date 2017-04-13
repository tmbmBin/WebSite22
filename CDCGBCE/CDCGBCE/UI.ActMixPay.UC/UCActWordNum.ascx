<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActWordNum.ascx.vb" Inherits="UI.ActMixPay.UC.UCActWordNum" %>

<table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="600" border="0">
    <tr>
        <td>
            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="590px">
                <tr>
                    <td style="width:90px; text-align:right">動支編號：</td>
                    <td style="width:105px">
                        <asp:TextBox ID="ctl_AcmWordNum" style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" MaxLength="10" runat="server" Enabled="True" DBFieldName="acmWordNum"></asp:TextBox>                        
                    </td>
                    <td style="width:90px; text-align:right">請示日期：</td>
                    <td style="width:105px">
                        <asp:TextBox ID="ctl_AcmMarkDate"    style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px" MaxLength="3" runat="server" Enabled="True" DBFieldName="acmMarkDate"></asp:TextBox>
                    </td>
                    <td style="width:90px; text-align:right">動支金額：</td>
                    <td style="width:105px">
                        <asp:TextBox ID="ctl_AcmMoney"   style="text-align:center" onfocus="this.blur();" BackColor="Transparent" Width="100px"                 runat="server" Enabled="True" DBFieldName="acmMoney"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
