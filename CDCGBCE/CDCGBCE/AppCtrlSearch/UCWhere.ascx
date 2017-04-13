<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCWhere.ascx.vb" Inherits="AppCtrlSearch.UCWhere" %>
<style type="text/css">
	.TxtStyle
	{
		width: 100px;
		text-align:right;
	}
</style>
<table id="TableCtrl" style="table-layout:fixed" runat="server" cellpadding="1" cellspacing="1" border="0" width="500px">
	<tr>
		<td style="width:100px">&nbsp;</td>
		<td style="width:150px">&nbsp;</td>
		<td style="width:100px">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="TxtStyle">日期區間：</td>
		<td colspan="3"><asp:TextBox ID="TBBDate" runat="server" Width="80px"></asp:TextBox>至<asp:TextBox ID="TBEDate" runat="server" Width="80px"></asp:TextBox></td>
	</tr>
	<tr>
		<td class="TxtStyle">預算來源：</td>
		<td><asp:DropDownList ID="DDLBgtSourName" runat="server" Width="140px"></asp:DropDownList></td>
		<td class="TxtStyle">經資門別：</td>
		<td><asp:DropDownList ID="DDLAccKind" runat="server" Width="140px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td class="TxtStyle">經費單位：</td>
		<td><asp:DropDownList ID="DDLBgtDepName" runat="server" Width="140px"></asp:DropDownList></td>
		<td class="TxtStyle">承辦單位：</td>
		<td><asp:DropDownList ID="DDLWorkDepName" runat="server" Width="140px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td class="TxtStyle">承辦人員：</td>
		<td><asp:TextBox ID="TBAcmWorkUserName" runat="server" Width="140px"></asp:TextBox></td>
		<td class="TxtStyle">動支編號：</td>
		<td><asp:TextBox ID="TBAcmWordNum" runat="server" Width="140px"></asp:TextBox></td>
	</tr>
	<tr>
		<td class="TxtStyle">摘　　要：</td>
		<td colspan="3"><asp:TextBox ID="TBAcmMemo" runat="server" Width="390px"></asp:TextBox></td>
	</tr>
	<tr>
		<td class="TxtStyle">會計科目：</td>
		<td colspan="3"><asp:DropDownList ID="DDLPlanName" runat="server" Width="390px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td class="TxtStyle">用途別：</td>
		<td colspan="3"><asp:DropDownList ID="DDLOulName" runat="server" Width="390px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td class="TxtStyle">審核狀態：</td>
		<td><asp:DropDownList ID="DDLAcmPassFlag" runat="server">
			<asp:ListItem Value="">......</asp:ListItem>
			<asp:ListItem Value="1">已審</asp:ListItem>
			<asp:ListItem Value="0">未審</asp:ListItem>
			</asp:DropDownList></td>
		<td></td>
		<td></td>
	</tr>
	<tr style="display:none">
		<td class="TxtStyle">動支總額：</td>
		<td colspan="3"><asp:TextBox ID="TBBMoney" runat="server" Width="80px"></asp:TextBox>～<asp:TextBox ID="TBEMoney" runat="server" Width="80px"></asp:TextBox></td>
	</tr>
	<tr style="display:none">
		<td class="TxtStyle">帳　　別：</td>
		<td><asp:DropDownList ID="DDLTeamName" runat="server" Width="140px"></asp:DropDownList></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

