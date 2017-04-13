<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSysBaseUserPicker.aspx.vb" Inherits="UI.SystemData.Web.FrmSysBaseUserPicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <meta http-equiv="Pragma" content="No-cache" />
    	<base target="_self" />
		<script lang="javascript">
 
    function fnGetInfo(bnkSubNo) {
      
        returnValue = bnkSubNo;
 
    }


    returnValue = "Cancel";
    function fnCancel() {
      
    }

 
		</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
	    <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse; width:600px" cellPadding="5" bgColor="#dadee9">
				<tr>
					<td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid; border-color:#666668; width:600px">
						<table border="1" cellpadding="1" style="border-collapse: collapse; border-color:#ffffff; width:100%; padding:1px">
							<tr>
								<td>
									<table style="table-layout: fixed; padding:1px; width:100%; border:0px">
                                        <tr>
											<td style="text-align:right; width:100px">姓名：</td>
                                            <td><asp:TextBox ID="ctl_usrName" runat="server"></asp:TextBox></td>
                                            <td style="text-align:right; width:100px">登錄帳號：</td>
                                            <td><asp:TextBox ID="ctl_usrAlias" runat="server"></asp:TextBox></td>
										</tr>
                                        <tr>
											<td style="text-align:right; width:100px">部門名稱：</td>
                                            <td colspan="3"><asp:DropDownList ID="ctl_DepCode" runat="server"></asp:DropDownList></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
                                    <asp:Button ID="btnList" runat="server" Text="列出資料" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="background-color:#ffffff; height:5px"></td>
				</tr>
				<tr >
					<td style="border-right: #666668 1pt solid;border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid; border-collapse: collapse; border-bottom-color:#666668">
					    <table style="border-collapse: collapse; border-color:#ffffff; width:100%; padding:1px">
							<tr>
								<td>
								    <asp:DataList ID="DataList1" runat="server" BorderWidth="2px" CellPadding="3" BackColor="White" CellSpacing="1" BorderStyle="Ridge" BorderColor="White" RepeatColumns="3" RepeatDirection="Horizontal">
                                        <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE"></SelectedItemStyle>
								<FooterStyle ForeColor="Black" BackColor="#C6C3C6"></FooterStyle>
								<ItemStyle ForeColor="Black" BackColor="#DEDFDE"></ItemStyle>
                                        <ItemTemplate>
                                            <a style="cursor:hand;" onclick='fnGetInfo("<%# Container.DataItem("PK_usrNo") & "│" & Container.DataItem("usrAlias") & " " & Container.DataItem("usrName")%>");window.close();'>
										<%#Container.DataItem("usrAlias") & " " & Container.DataItem("usrName")%>
									</a>

                                        </ItemTemplate>
                                    </asp:DataList>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
