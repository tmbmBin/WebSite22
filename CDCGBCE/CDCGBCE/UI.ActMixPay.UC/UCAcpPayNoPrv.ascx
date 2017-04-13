<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCAcpPayNoPrv.ascx.vb" Inherits="UI.ActMixPay.UC.UCAcpPayNoPrv" %>
<table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="600" border="1">
    <tr>
        <td>
            <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="590px">
                <tr>
                    <td style="width:90px; text-align:right">&nbsp;</td>
                    <td style="width:105px">
                        &nbsp;</td>
                    <td style="width:90px; text-align:right">&nbsp;</td>
                    <td style="width:105px">
                        <input id="ctl_AcpPayNo" runat="server" type="hidden" />
                    </td>
                    <td style="width:90px; text-align:right">核銷次號：</td>
                    <td style="width:105px">
                        <asp:DropDownList ID="DDLAcpPayNoPrv" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
