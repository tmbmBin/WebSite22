<%@ Control Language="VB" %>
<script runat="server">
	Function ChtDate(thisDate As String) As String
		Try
			thisDate = Format(CDate(thisDate), "yyyy/MM/dd")
			Return CInt(Left(thisDate, 4))-1911 & Right(thisDate, Len(thisDate)-4) & " " & Format(System.DateTime.Now, "hh:mm:ss")
		Catch ex as Exception
		End Try
	End Function
</script>
<table id="Header" runat="server" style="TABLE-LAYOUT: fixed" border="0" cellpadding="0" cellspacing="0" width="650">
	<tr>
		<td height="30" valign="top" colspan="3" align="center"><font face="�з���" size="5"><asp:Label id="lab_Title" runat="server"></asp:Label></font></td>
	</tr>
	<tr>
		<td height="39" width="100%" colspan="3" valign="top" style="padding-left: 7px"><font size="2" face="�з���">�p�e�W�٤ΥN�X�G</font><b><font face="�з���"><asp:Label id="lab_acvPlanNoName" runat="server"></asp:Label></font></b></td>
	</tr>
	<tr>
		<td height="25" width="70%" style="padding-left: 7px" nowrap><font size="2" face="�з���">�γ~�O�W�١G</font><b><font face="�з���"><asp:Label id="lab_acvOutlayNameFirst" runat="server"></asp:Label></font></b></td>
		<td height="25" width="10%"><b><font face="�з���"><asp:Label id="lab_acmWorkUnitSubName" runat="server"></asp:Label></font></b></td>
		<td height="25" width="20%" align="right" style="padding-right: 11px"><font face="Verdana" size="1"><%=ChtDate(System.DateTime.Now()) %></font></td>
	</tr>
</table>
<table style="TABLE-LAYOUT: fixed" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
	<tr style="display: none">
		<td width="40">�@</td>
		<td width="175">�@</td>
		<td width="75">�@</td>
		<td width="60">�@</td>
		<td width="75">�@</td>
		<td width="75">�@</td>
		<td width="145">�@</td>
	</tr>
	<tr>
		<td width="40" height="44" rowspan="2"><div class='title'><font face="�з���">����</font></div></td>
		<td width="175" height="44" rowspan="2"><div class='title'><font face="�з���">�T�ťγ~�O���</font></div></td>
		<td width="135" height="22" colspan="2"><div class='title'><font face="�з���">��ΤH��</font></div></td>
		<td width="75" height="44" rowspan="2"><div class='title'><font face="�з���">��Ϊ��B</font></div></td>
		<td width="75" height="44" rowspan="2"><div class='title'><font face="�з���">�֤���B</font></div></td>
		<td width="145" height="44" rowspan="2"><div class='title'><font face="�з���">���䤺�e�K�n����</font></div></td>
	</tr>
	<tr>
		<td width="75" height="22"><div class='title'><font face="�з���">¾��</font></div></td>
		<td width="60" height="22"><div class='title'><font face="�з���">�m�W</font></div></td>
	</tr>
</table>