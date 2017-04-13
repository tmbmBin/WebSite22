<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSelect.ascx.vb" Inherits="AppCtrlSearch.UCSelect" %>
<table style="border-collapse: collapse;table-layout:fixed;BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  border="0"  cellpadding="0" cellspacing="0" height="100%" width="310">
    <tr style="display:none">
        <td style=" width:25px">1</td>
        <td style=" width:130px">2
            <input id="TBSelectFiled" runat="server" type="hidden" style="width: 60px" /></td>
        <td style=" width:25px">3</td>
        <td>4</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center"><asp:Label ID="LBTitle" runat="server" Text="顯示欄位"></asp:Label></td>
    </tr>
    <tr>
        <td></td>
        <td align="center" valign="middle"><font size="2">已選項目 </font></td>
        <td></td>
        <td align="center" valign="middle"><font size="2">待選項目</font></td>
    </tr>
    <tr>
        <td style="text-align:center">
            <input title="置頂" type="button" value="╤" style="width:23px" runat="server" id="BtnMoveTop"/><br/><br/>
            <input title="上移" type="button" value="↑" style="width:23px" runat="server" id="BtnMoveDwn"/><br /><br />
            <input title="下移" type="button" value="↓" style="width:23px" runat="server" id="BtnMoveUp"/><br /><br />
            <input title="置底" type="button" value="╧" style="width:23px" runat="server" id="BtnMoveBtn"/>
        </td>
        <td style="text-align:center"><asp:ListBox ID="LBSelect" runat="server" Height="200px" SelectionMode="Multiple" Width="125px"></asp:ListBox></td>
        <td style="text-align:center">
            <input title="全部左移" type="button" value="<<"   style="width:23px" runat="server" id="BtnMoveAllLeft" /><br /><br />
            <input title="左移"     type="button" value="<"    style="width:23px" runat="server" id="BtnMoveLeft" /><br /><br />
            <input title="右移"     type="button" value=">"    style="width:23px" runat="server" id="BtnMoveRight" /><br /><br />
            <input title="全部右移" type="button" value=">>"   style="width:23px" runat="server" id="BtnMoveAllRight" />
        </td>
        <td style="text-align:center">
            <asp:ListBox ID="LBUnSelect" runat="server" Height="200px" SelectionMode="Multiple"  Width="125"></asp:ListBox>
        </td>
    </tr>
</table>