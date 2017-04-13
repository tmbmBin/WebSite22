<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmImportBudget.aspx.vb" Inherits="UI.GBA.Web.FrmImportBudget"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmImportBudget</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
		<script language="javascript">
		
		function check_Num(){
				if((event.keyCode>=48&&event.keyCode<=57)){
					return true;}
				else{event.keyCode=0;false;}
		}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE style="MARGIN-TOP: 10px; Z-INDEX: 101; LEFT: 8px; MARGIN-LEFT: 10px; POSITION: absolute; TOP: 8px; BORDER-COLLAPSE: collapse"
				cellPadding="5" width="400" bgColor="#dadee9">
				<TR>
					<TD style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<TABLE style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td width="80" align="right">預算年度</td>
								<td align="left"><asp:textbox onkeypress="return check_Num()" id="TBYear" style="TEXT-ALIGN: center" runat="server"
										Width="50px" MaxLength="3"></asp:textbox>
									<asp:CheckBox id="CheckBox1" runat="server" Text="覆寫現有資料"></asp:CheckBox></td>
							</tr>
							<TR>
								<TD colSpan="2">
									<asp:button id="BtnImport" runat="server" Text="轉入資料"></asp:button></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
