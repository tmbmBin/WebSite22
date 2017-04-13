<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPay1.ascx.vb" Inherits="AppCtrlOffSet.UCActPay1" %>
    <style type="text/css">
        .style1
        {
            width: 72px;
        }
    </style>
    <table border="0" cellpadding="1" cellspacing="1" style="600px" style="table-layout:fixed">
        <tr>
            <td style="width: 75px" align="right">轉正日期</td>
            <td style="width: 105px">
                <asp:TextBox id="TBAcpMarkDate" style="background-color: #ffffe0; text-align:center"  runat="server" Width="90px"  Enabled="False" ondblclick="JavaScript: UCDate.Show();"  ></asp:TextBox></td>
            <td width="75" align="right">轉正金額</td>
            <td width="85"><asp:TextBox id="TBPayMoney" runat="server" Width="80px" onfocus="this.blur();" onkeypress="return check_Num()" BackColor="Transparent"  style="text-align:right" MyName="TBPayMoney"></asp:TextBox></td>
            <td align="right" style="width: 80px">轉正次數</td>
            <td><asp:DropDownList ID="DDLAcpPayNo1" runat="server" Width="85px" 
                    AutoPostBack="True"></asp:DropDownList></td>
            <td align="right" class="style1">&nbsp;</td>
        </tr>                               
        <tr >
            <td style="width: 75px" align="right"></td>
            <td style="width: 105px"></td>
            <td width="75" align="right"></td>
            <td width="85">&nbsp;</td>
            <td align="right" style="width: 80px">匯出批號</td>
            <td><asp:TextBox ID="TBGroupNo" runat="server" Width="80px"></asp:TextBox></td>
            <td align="right" class="style1"></td>
        </tr>                                
        <tr >
            <td width="75" align="right">報支事由</td>
            <td colspan=6><asp:TextBox id="TBPayMemo"  style="background-color: #ffffe0"  runat="server" Width="590px"  Enabled="False" ></asp:TextBox><input id="BtnPhrase"  style="height:22px;  text-align:center; text-align:center" runat="server" type="button" value="..." onclick='fnCallPhraseDialog("TBPayMemo");'  /></td>
        </tr>                                
    </table> 
