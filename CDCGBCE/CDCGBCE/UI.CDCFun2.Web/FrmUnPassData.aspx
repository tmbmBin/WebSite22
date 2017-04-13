<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmUnPassData.aspx.vb" Inherits="UI.CDCFun2.Web.FrmUnPassData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <style type="text/css">
        .FieldTitle{text-align:right; width:100px}
        .FieldCtrl{text-align:left; width:120px}
    </style>
</head>
<body>
    <form id="form1" runat="server">
<table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="600" bgcolor="#dadee9" border="1">
				<tr>
					<td>
						<table style=" border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
									<table style="table-layout:fixed; width:100%" cellspacing="0" cellpadding="2" border="0">
										<tr>
											<td class="FieldTitle" >　預算來源：</td>
                                            <td class="FieldCtrl" >
                                                <asp:DropDownList ID="ctl_acvBgtSourceCode" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="FieldTitle" >經資門別：</td>
                                            <td class="FieldCtrl">
                                                <asp:DropDownList ID="ctl_AcvAccKind" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td></td>
										</tr>
										<tr>
											<td class="FieldTitle">部門名稱：</td>
											<td class="FieldCtrl">
                                                <asp:DropDownList ID="ctl_acvBgtDepCode" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="FieldTitle">執行單位：</td>
                                            <td  class="FieldCtrl">
                                                <asp:DropDownList ID="ctl_acmWorkUnitNo" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="FieldTitle"></td>
										</tr>
										<tr>
											<td class="FieldTitle" >動支編號：</td>
											<td class="FieldCtrl">
                                                <asp:TextBox ID="ctl_acmWordNum" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td class="FieldTitle" >承辦人員：</td>
                                            <td class="FieldCtrl">
                                                <asp:TextBox ID="ctl_acmWorkUserNo" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td></td>
										</tr>
										<tr>
											<td class="FieldTitle" >計畫名稱：</td>
											<td colspan="4" >
                                                <asp:DropDownList ID="ctl_acvPlanCode" runat="server" Width="450">
                                                </asp:DropDownList>
                                            </td>
										</tr>
										<tr>
											<td class="FieldTitle" >用途別名稱：</td>
											<td colspan="4" >
                                                <asp:DropDownList ID="ctl_acvOutlayCode" runat="server">
                                                </asp:DropDownList>
                                            </td>
										</tr>
										<tr>
											<td class="FieldTitle" >備註：</td>
											<td colspan="4" >
                                                <asp:TextBox ID="ctl_acmMemo" runat="server" Width="350px"></asp:TextBox>
                                            </td>
										</tr>
										<tr>
											<td class="FieldTitle" >資料類型：</td>
											<td>
                                                <asp:DropDownList ID="ddlDataKind" runat="server">
                                                    <asp:ListItem Value="">不區分</asp:ListItem>
                                                    <asp:ListItem>未報支完畢</asp:ListItem>
                                                    <asp:ListItem>請示</asp:ListItem>
                                                    <asp:ListItem>再簽</asp:ListItem>
                                                    <asp:ListItem>決標</asp:ListItem>
                                                    <asp:ListItem>報支</asp:ListItem>
                                                    <asp:ListItem>轉正</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="FieldTitle">金額類型：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlMoneyType" runat="server">
                                                    <asp:ListItem Value="">不區分</asp:ListItem>
                                                    <asp:ListItem Value="0">調整數</asp:ListItem>
                                                    <asp:ListItem Value="1">動支金額</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                               <div style="float:left"><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Small" 
                                                    ForeColor="#990000" Text="動支金額：<br>如果是在請示階段則為請示金額，如果是核銷階段則為何銷金額或是轉正金額。<br>調整數：<br>在轉正單元則為繳回款，其它階段則為釋放金額。"></asp:Label>
                                                    </div> 
                                            </td>
										</tr>
										<tr>
											<td></td>
											<td>
                                                <asp:button id="btn_List" runat="server" Width="75px" Text="列出資料" Height="22px"></asp:button>
                                            </td>
                                            <td></td>
                                            <td>
                                                <asp:button id="btn_Print" runat="server" Width="75px" Text="列印報表" Height="22px"></asp:button>
                                            </td>
                                            <td></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    <br />
    <font style="color:Blue">註：「審核狀態」如顯示空白，代表已審核。</font>
    <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" 
        EnableModelValidation="True" EmptyDataText="無資料!" BorderColor="Gray">
        <HeaderStyle BackColor="#003366" ForeColor="White" />
        <RowStyle BackColor="WhiteSmoke" />
        <AlternatingRowStyle BackColor="#E0E0E0" />
        <Columns>
            <asp:BoundField DataField="acmDate" HeaderText="動支日期">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DataKind" HeaderText="資料類型" />
            <asp:BoundField DataField="動支編號" HeaderText="動支編號" />
            <asp:BoundField DataField="執行單位" HeaderText="執行單位" />
            <asp:BoundField DataField="acmWorkUserNo" HeaderText="承辦人員" />
            <asp:BoundField DataField="acmMemo" HeaderText="說明" />
            <asp:BoundField DataField="acmMoney" DataFormatString="{0:#,#}" 
                HeaderText="動支金額">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="acvAdjustMoney" DataFormatString="{0:#,#}" 
                HeaderText="調整數">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalUnPay" DataFormatString="{0:#,#}" 
                HeaderText="未報支金額">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="審核狀態" HeaderText="審核狀態" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
