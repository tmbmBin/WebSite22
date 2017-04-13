<%@ Page enableEventValidation="false" Language="vb" AutoEventWireup="false" CodeBehind="FrmSeach.aspx.vb" Inherits="UI.ActPayeeRpt.Web.FrmSeach" %>

<%@ Register src="UCOrder.ascx" tagname="UCOrder" tagprefix="uc1" %>

<%@ Register src="UCSelect.ascx" tagname="UCSelect" tagprefix="uc2" %>

<%@ Register src="UCGroup.ascx" tagname="UCGroup" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JS_ActSearch_LBSelectFun.js"></script>
</head>
<body>
    <form id="form1" runat="server">
<div>
<div id="MyCalendar" style="behavior:url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
<table bgcolor="#dadee9" cellpadding="5" style=" margin-top: 10px; margin-left: 10px; border-collapse: collapse" width="600px">
	<tr>
		<td align="left" style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" valign="top">
			<table border="1" bordercolor="#ffffff" cellpadding="1" style="BORDER-COLLAPSE: collapse">
				<tr>
					<td>
					<table style="padding:2; border:1;" border="0"  cellspacing="0">
						<tr>
							<td style=" width: 300px; text-align:Left"><uc2:UCSelect ID="UCSelect1" runat="server" /></td>
							<td style=" width:5px; ">&nbsp;</td>
							<td style=" width: 150px; text-align:right"><uc1:UCOrder ID="UCOrder1" runat="server" /></td>
							<td style=" width:5px; ">&nbsp;</td>
						</tr>
                        <tr>
                            <td>
                                <table style="table-layout:fixed; width:100%">
                                    <tr>
                                        <td style="width:85px; text-align:right">員工代碼：</td>
                                        <td>
                                            <asp:TextBox ID="ctl_acnPayCode" runat="server" Width="80px"></asp:TextBox>
                                        </td>
                                        <td style="width:85px; text-align:right">員工姓名：</td>
                                        <td>
                                            <asp:TextBox ID="ctl_acnEmpName" runat="server" Width="80px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:85px; text-align:right">月份：</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="ctl_SMonth" runat="server" Width="50px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
                                                <asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
                                                <asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
                                                <asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
                                                <asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
                                                <asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
                                                <asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
                                                <asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
                                                <asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
                                                <asp:ListItem Value="10">10月</asp:ListItem>
                                                <asp:ListItem Value="11">11月</asp:ListItem>
                                                <asp:ListItem Value="12">12月</asp:ListItem>
                                            </asp:DropDownList>
                                            ～<asp:DropDownList ID="ctl_EMonth" runat="server" Width="50px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
                                                <asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
                                                <asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
                                                <asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
                                                <asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
                                                <asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
                                                <asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
                                                <asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
                                                <asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
                                                <asp:ListItem Value="10">10月</asp:ListItem>
                                                <asp:ListItem Value="11">11月</asp:ListItem>
                                                <asp:ListItem Value="12">12月</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:85px; text-align:right">出差日期：</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="ctl_acdTrlSDate" onfocus="this.select()" Style="text-align: center" onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); " runat="server" Width="100px" ></asp:TextBox>～
                                        <asp:TextBox ID="ctl_acdTrlEDate" onfocus="this.select()" Style="text-align: center" onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); " runat="server"   Width="100px" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:85px; text-align:right">資料種類：</td>
                                        <td>
                                            <asp:DropDownList ID="ctl_AcnSubKind" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width:85px; text-align:right">&nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:85px; text-align:right">部門名稱：</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="ctl_AcnDepCode" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:85px; text-align:right">計畫名稱：</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="ctl_acvPlanCode" runat="server" Width="260px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:85px; text-align:right">用途別：</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="ctl_acvOutlayCode" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td></td>
                            <td><uc3:UCGroup ID="UCGroup1" runat="server" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
					</table>
					</td>
				</tr>
                <tr><td>
                                <asp:Button ID="btnList" runat="server" Text="列出資料" />
                                <asp:Button ID="btnExport" runat="server" Text="匯出至Excel" />
                            </td></tr>
			</table>
		</td>
	</tr>

</table>

<br/>

<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
	BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
	CellPadding="3" CellSpacing="1" EnableModelValidation="True" GridLines="None"
	PageSize="15" EmptyDataText="查無資料">
	<FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
	<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
	<PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
	<RowStyle BackColor="#DEDFDE" ForeColor="Black" />
	<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
</asp:GridView>

<br/>

<asp:Label ID="lab_Msg" runat="server" EnableViewState="False"></asp:Label>

</div>
    </form>
</body>
</html>
