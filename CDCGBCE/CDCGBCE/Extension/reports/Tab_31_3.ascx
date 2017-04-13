<%@ Control Language="VB" %>
<table style="TABLE-LAYOUT: fixed; margin-top:-2" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
	<tr>
		<td width="40" height="22" style="border-right-style: none; border-right-width: medium" align="center">　</td>
		<td width="175" height="22" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium" align="right"><b><font face="標楷體"><asp:Label id="lab_acvPlanNoName" runat="server"></asp:Label></font></b></td>
		<td width="75" height="22" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium" align="right"><b><font face="標楷體" size="2">合計：</font></b></td>
		<td width="60" height="22" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium">　</td>
		<td width="75" height="22" style="border-left-style: none; border-left-width: medium; padding-right: 1px" align="right"><font face="Verdana" size="1"><asp:Label id="lab_acvMoney" runat="server"></asp:Label></font></td>
		<td width="75" height="22" style="border-left-style: solid; border-left-width: 1px; border-right-style:solid; border-right-width:1px; padding-right: 1px" align="right"><font face="Verdana" size="1"><asp:Label id="lab_acvPassMoney" runat="server"></asp:Label></font></td>
		<td width="145" height="22" style="border-left-style: solid; border-left-width: 1px">　</td>
	</tr>
</table><asp:Literal id="BlankRow" runat="server"></asp:Literal>
<table id="Signature" runat="server" style="TABLE-LAYOUT: fixed; margin-top: 0" border="0" cellpadding="0" cellspacing="0" width="650" height="100">
	<tr>
		<td width="25%" valign="top"><font face="標楷體" style="font-size: 9pt">製表人</font></td>
		<td width="25%" valign="top"><font face="標楷體" style="font-size: 9pt">覆　核</font></td>
		<td width="25%" valign="top"><font face="標楷體" style="font-size: 9pt">主　　辦<br>會計人員</font></td>
		<td width="25%" valign="top"><font face="標楷體" style="font-size: 9pt">機關長官或<br>授權代理人</font></td>
	</tr>
</table>