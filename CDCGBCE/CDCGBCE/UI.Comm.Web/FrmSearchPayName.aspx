<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchPayName.aspx.vb" Inherits="UI.Comm.Web.FrmSearchPayName" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    	<meta HTTP-EQUIV="Pragma" CONTENT="No-cache" />
		<base target="_self" />
		<script language="javascript">
<!--

function fnGetInfo(bnkSubNo){
//var sData = dialogArguments;
//sData.sUserName = bnkSubNo;
//sData.fnUpdate();
returnValue=bnkSubNo;

 //returnValue=bnkSubNo;
}


 returnValue="Cancel";
function fnCancel(){
//var sData = dialogArguments;
//sData.sUserName = "";
//sData.fnUpdate();
}

//-->
		</script>
</head>
<body>
    <form id="form1" runat="server">
        <table bgcolor="#dadee9" cellpadding="5" style="margin-top: 10px; margin-left: 10px; border-collapse: collapse; width: 700px;">
            <tr>
                <td bordercolor="#666668" style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid">
                    <table border="1" bordercolor="#ffffff" cellpadding="1" style="border-collapse: collapse"
                        width="100%">
                        <tr>
                            <td>
                                <table border="0" cellpadding="1" style="border-collapse: collapse" width="100%">
                                    <tr>
                                        <td align="right" style="width: 120px">
                                            <font face="新細明體">受款人</font></td>
                                        <td align="left" style="font-family: Times New Roman">
                                            <asp:TextBox ID="TBacnPayName" runat="server" Width="170px"></asp:TextBox></td>
                                    </tr>
                                    <tr style="font-family: Times New Roman">
                                        <td align="right" style="width: 120px">
                                            金融機構代號</td>
                                        <td align="left">
                                            <font face="新細明體">
                                                <asp:TextBox ID="TBacnBankNo" runat="server" Width="168px"></asp:TextBox></font></td>
                                    </tr>
                                    <tr style="font-family: Times New Roman">
                                        <td align="right" style="height: 18px; width: 120px;">
                                            <font face="新細明體">金融機構名稱</font></td>
                                        <td align="left" colspan="1" style="height: 18px; font-family: Times New Roman;">
                                            <asp:TextBox ID="TBacnBank" runat="server" Width="168px"></asp:TextBox></td>
                                    </tr>
                                    <tr style="font-family: Times New Roman">
                                        <td align="right" style="width: 120px">
                                            <font face="新細明體">戶 名</font></td>
                                        <td align="left" colspan="1">
                                            <asp:TextBox ID="TBacnDepositor" runat="server" Width="168px"></asp:TextBox></td>
                                    </tr>
                                    <tr style="font-family: Times New Roman">
                                        <td align="right" style="width: 120px">
                                            <font face="新細明體">帳 號</font></td>
                                        <td align="left">
                                            <asp:TextBox ID="TBacnDepositorNo" runat="server" Width="168px"></asp:TextBox></td>
                                    </tr>
                                </table>
                                <asp:Button ID="BtnShow" runat="server" Text="列出資料" /></td>
                        </tr>
                        <tr style="font-family: Times New Roman">
                            <td>
<asp:datagrid id="DataGrid1" runat="server" Width="700px" AutoGenerateColumns="False" AllowPaging="True"
										PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
										<Columns>
                                            <asp:TemplateColumn HeaderText="選取">
                                                <ItemTemplate>
                                                    <a style="CURSOR: hand;" onclick='fnGetInfo("<%#container.dataitem("acnPayName") &"|" & container.dataitem("acnBankNo") &"|"&container.dataitem("acnBankName") &"|"& container.dataitem("acnDepositor") &"|" & container.dataitem("acnDepositorNo") %>");window.close();'>選取</a>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateColumn>
											<asp:BoundColumn DataField="acnPayName"   HeaderText="受款人">
											 
												 
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acnBankNo"  HeaderText="金融機構代號" >
												<HeaderStyle Width="80px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acnBankName"  HeaderText="金融機構名稱">
												<HeaderStyle Width="150px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acnDepositor"  HeaderText="戶  名">
												 
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acnDepositorNo" HeaderText="帳 號">
												<HeaderStyle Width="80px"></HeaderStyle>
											</asp:BoundColumn>										
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
