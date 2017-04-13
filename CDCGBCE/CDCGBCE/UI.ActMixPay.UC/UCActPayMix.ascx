<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayMix.ascx.vb" Inherits="UI.ActMixPay.UC.UCActPayMix" %>
<table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="600"
    border="1">
    <tr>
        <td>
            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="595px">
                <tr>
                    <td style="width: 90px; text-align: right">
                        核銷年度：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcpPayYear" runat="server" Style="text-align: center" onfocus="this.blur();"
                            BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpPayYear"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">
                        核銷次號：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcpPayNoPrv" runat="server" Style="text-align: center" onfocus="this.blur();"
                            BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpPayNoPrv"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">
                        核銷金額：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcpMoney" runat="server" Style="text-align: center" onfocus="this.blur();"
                            BackColor="Transparent" Width="100px" Enabled="True" DBFieldName="acpMoney" MyName="TBPayMoney"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 90px; text-align: right">
                        群組編號：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'
                            Width="100px" Enabled="True" DBFieldName="acpGroupNo"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">
                        核銷日期：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcpMarkDate" onfocus="this.select()" Style="text-align: center"
                            onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                            runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acpMarkDate")  &"" ) %>'
                            Width="100px" Enabled="True" DBFieldName="acpMarkDate"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">
                        核銷人員：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcpMarkUserNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpMarkUserNo") %>'
                            Width="100px" Enabled="True" DBFieldName="acpMarkUserNo"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 90px; text-align: right">
                        核銷事由：
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="ctl_AcpSubMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpSubMemo") %>'
                            Width="473px" Enabled="True" DBFieldName="acpSubMemo" Rows="2" TextMode="MultiLine"></asp:TextBox><input
                                id="BtnSubPhrase" runat="server" style="height: 22px; width: 18px" type="button"
                                value="..." disabled="disabled"  />
                    </td>
                </tr>
                <tr>
                    <td style="width: 90px; text-align: right">
                        控帳事由：
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="ctl_AcpMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpMemo") %>'
                            Width="473px" Enabled="True" DBFieldName="acpMemo" Rows="2" TextMode="MultiLine"></asp:TextBox><input
                                type="button" id="BtnPhrase" runat="server" style="height: 22px; width: 18px"
                                value="..." disabled="disabled"  />
                    </td>
                </tr>
                <tr style="display: none">
                    <td style="width: 90px; text-align: right">
                        動支年度：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcmYear" runat="server" Width="100px" Enabled="True" DBFieldName="acmYear"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right; display: none">
                        系統號：
                    </td>
                    <td style="width: 105px">
                        <asp:TextBox ID="ctl_AcmNo" runat="server" Width="100px" Enabled="True" DBFieldName="acmNo"></asp:TextBox>
                    </td>
                    <td style="width: 90px; text-align: right">
                        在簽號：
                    </td>
                    <td>
                        <asp:TextBox ID="ctl_AcmNo1" runat="server" Width="100px" Enabled="True" DBFieldName="acmNo1"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
