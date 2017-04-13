<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCaseStatusByDate.aspx.vb" Inherits="UI.AdminVerify.Web.FrmCaseStatusByDate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
        <meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet"/>
		<script language="javascript" type="text/javascript">
        
        
        </script>
</head>
<body>
    <form id="form1" runat="server">
    
    <table cellpadding="5" bordercolor="#666668" bgcolor="#dadee9" border="1" width="600" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse">
	<tr>
		<td>
			<table border="1"  style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width=100%>
				<tr>
					<td>
						<table border="0" cellpadding="1" style="BORDER-COLLAPSE: collapse" width=100% >
							<tr>
								<td align="right" width="80">門別</td>
								<td><asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList>
								</td>
								<td align="right" width="80">預算來源</td>
								<td><asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td align="right" width="80">經費單位</td>
								<td><asp:DropDownList id="DDLBgtDep" runat="server" AutoPostBack="True"></asp:DropDownList>
								</td>
								<td align="right" width="80">執行單位</td>
								<td><asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td align="right" width="80">計畫</td>
								<td colspan="3"><asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="480px"></asp:DropDownList></td>
							</tr>
							<tr>
								<td align="right" width="80">用途別</td>
                                <td colspan="3">
                                    <asp:DropDownList id="DDLOul" runat="server" Width="480px"></asp:DropDownList></td>
							</tr>
							<tr>
								<td align="right" width="80">付款方式</td>
								<td>
									<asp:DropDownList id="DDLPayKind" runat="server">
										<asp:ListItem Value="">......</asp:ListItem>
										<asp:ListItem Value="0">實付款</asp:ListItem>
										<asp:ListItem Value="1">預付款</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td align="right" width="80">承辦人員</td>
								<td><asp:TextBox id="TBStaff" runat="server" Width="116px"></asp:TextBox></td>
							</tr>
                            <tr>
                                <td align="right" width="80">
                                    動支編號</td>
                                <td>
                                    <asp:TextBox ID="TBAcmWordNum" runat="server" Width="150px"></asp:TextBox></td>
                                <td align="right" width="80">
                                </td>
                                <td>
                                </td>
                            </tr>
							<tr style="display:none">
								<td align="right" width="80">主檔事由</td>
								<td><asp:TextBox id="TBMemo" runat="server" Width="150px"></asp:TextBox></td><td align="right" width="80">主檔金額</td>
								<td><asp:TextBox id="TBMoney" runat="server" Width="116px"></asp:TextBox></td>
							</tr>
							<tr style="display:none"><td align="right" width="80" style="height: 26px">用途說明</td>
								<td style="height: 26px"><asp:TextBox id="TBAcvMemo" runat="server" Width="150px"></asp:TextBox></td>
								<td align="right" width="80" style="height: 26px">動支金額</td>
								<td style="height: 26px"><asp:TextBox id="TBacvMoney" runat="server" Width="116px"></asp:TextBox></td>
							</tr>
                            <tr>
                                <td align="right" style="height: 26px" width="80">
                                    結案狀態</td>
                                <td style="height: 26px">
				        <asp:DropDownList id="DDLFinalStatus" runat="server">
				            <asp:ListItem Value="">不區分</asp:ListItem>
				            <asp:ListItem Value="1">已結案:會計付款</asp:ListItem>
				            <asp:ListItem Value="0">未結案:會計未付款</asp:ListItem>
				        </asp:DropDownList></td>
                                <td align="right" style="height: 26px" width="80">
                                </td>
                                <td style="height: 26px">
                                </td>
                            </tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Button id="BtnList" runat="server" Text="列出資料"></asp:Button>&nbsp;
                        <asp:Button ID="BtnPrint" runat="server" Text="列印資料" />
                        <asp:CheckBox ID="CBExcel" runat="server" Text="轉製成Excel" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
        <table style="MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" border=0>
        <tr>
            <td>
                <asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
										    <asp:BoundColumn DataField="簽證編號" HeaderText="簽證編號"></asp:BoundColumn>
											<asp:BoundColumn   DataField="預算單位" HeaderText="預算單位"></asp:BoundColumn>
											<asp:BoundColumn DataField="執行單位" HeaderText="執行單位"></asp:BoundColumn>
											<asp:BoundColumn DataField="承辦人員" HeaderText="承辦人員"></asp:BoundColumn>
											<asp:BoundColumn DataField="摘要" HeaderText="摘要"></asp:BoundColumn>
											<asp:BoundColumn DataField="單位審核日" HeaderText="單位審核日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="估價審核日" HeaderText="估價審核日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="會計審核日" HeaderText="會計審核日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="金額" HeaderText="金額" DataFormatString="{0:#,0}">
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
											<asp:BoundColumn DataField="黏存日期" HeaderText="黏存日期" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="會計核支日" HeaderText="會計核支日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="零用金" HeaderText="零用金"></asp:BoundColumn>
											<asp:BoundColumn DataField="會計付款日" HeaderText="會計付款日" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="憑單編號" HeaderText="憑單編號"></asp:BoundColumn>
											<asp:BoundColumn DataField="廠商" HeaderText="廠商"></asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
                </td>
        </tr>
    </table>    
    
        
    
    
    </form>
</body>
</html>
