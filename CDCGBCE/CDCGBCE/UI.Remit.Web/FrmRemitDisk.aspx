<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRemitDisk.aspx.vb" Inherits="UI.Remit.Web.FrmRemitDisk" %>
<%@ Import Namespace="Microsoft.Security.Application" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target ="_self" />
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSDateFun.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
        <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="600">
			<tr>
				<td bordercolor="#666668" style=" border-right:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
					<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
						<tr>
							<td>
								<table border="0" width="100%" cellpadding="1" style=" border-collapse: collapse">
									<tr>
										<td align="right" width="90px">檔案格式：</td>
										<td align="left"  width="200px">
                                            <asp:DropDownList ID="DDLRmfNo" runat="server">
                                            </asp:DropDownList>
                                        </td>
										<td align="right" width="90px">&nbsp;</td>
										<td align="left">&nbsp;</td>
									</tr>
									<tr>
										<td align="right" width="90px">匯款日期：</td>
										<td align="left"  width="200px">
                                            <asp:TextBox ID="ctl_RemitDate" runat="server" Width="80px" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "></asp:TextBox>
                                        </td>
										<td align="right" width="90px">&nbsp;</td>
										<td align="left">
                                            &nbsp;</td>
									</tr>
									<tr style ="display:none">
										<td align="right" width="90px">存款日期：</td>
										<td align="left">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="80px"></asp:TextBox>
                                            入帳日期：</td>
										
										<td align="right" width="90px">登錄日期：</td>
										
										<td align="left">
                                            <asp:TextBox ID="TextBox2" runat="server" Width="80px"></asp:TextBox>
                                            <asp:TextBox ID="ctl_BillDate" runat="server" Width="80px" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "></asp:TextBox>
                                        </td>
										
									</tr>
									</table>
							</td>
						</tr>
						<tr>
							<td>
                                <table style="table-layout:fixed; border-collapse:collapse" width="100%">
                                    <tr>
                                        <td><asp:Button ID="BtnMediaFile" runat="server" Text="媒體檔" /></td>
                                        <td><asp:Button ID="BtnMediaTotal" runat="server" Text="匯款總表" /></td>
                                        <td><asp:Button ID="BtnMediaFileList" runat="server" Text="匯款清冊" /></td>
                                    </tr>
                                </table>
                            </td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
        <iframe id="rptFrame" name="rptFrame" border="0" frameborder="0" width="100%" scrolling="no"  height=100%  src="<%=AntiXss.HtmlEncode(strFrameSrc)%>"></iframe>
    </form>
</body>
</html>
