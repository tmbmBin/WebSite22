<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmStaffTrans.aspx.vb" Inherits="UI.BasicData.Web.FrmStaffTrans" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmStaffTrans</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" encType="multipart/form-data" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 104; LEFT: 8px; POSITION: absolute; TOP: 16px" cellSpacing="1"
				cellPadding="1" width="300" border="0">
				<TR>
					<TD><INPUT id="File1" style="WIDTH: 380px; HEIGHT: 24px" type="file" size="44" name="File1."
							runat="server"></TD>
					<TD><asp:button id="btn_Upload" runat="server" CausesValidation="False" Height="22" Width="64px"
							Text="上傳更新"></asp:button></TD>
				</TR>
			</TABLE>
			&nbsp;<asp:datagrid id="DataGrid1" style="Z-INDEX: 101; LEFT: 40px; POSITION: absolute; TOP: 192px"
				runat="server" Visible="False"></asp:datagrid>&nbsp;
		</form>
	</body>
</HTML>
