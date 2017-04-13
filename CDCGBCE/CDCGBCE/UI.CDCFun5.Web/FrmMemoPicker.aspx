<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmMemoPicker.aspx.vb" Inherits="UI.CDCFun5.Web.FrmMemoPicker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
        		<base target="_self">
		<script language="javascript">
        <!--

		    function fnGetInfo(bnkSubNo) {
		        //var sData = dialogArguments;
		        //sData.sUserName = bnkSubNo;
		        //sData.fnUpdate();
		        returnValue = bnkSubNo;
//		        returnValue = document.getElementById("TBMemoKeys").value ;
		        //returnValue=bnkSubNo;
		    }


		    returnValue = "Cancel";
		    function fnCancel() {
		        //var sData = dialogArguments;
		        //sData.sUserName = "";
		        //sData.fnUpdate();
		    }

//-->
		</script>
</head>
<body>
    <form id="form1" runat="server">
 <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
				<tr>
					<td style=" border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
						valign="top" align="left">
						<table style=" border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
                                    <table style="table-layout:fixed" cellspacing="0" cellpadding="1" width="100%" border="0">
                                        <tr>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td width="150">&nbsp;</td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td width="150">&nbsp;</td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">資料類型：</td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="DDLRptName" runat="server" Width="400px">
                                                    <asp:ListItem Value="7">補、捐(獎)助其他政府機關或團體私人經費報告</asp:ListItem>
                                                    <asp:ListItem Value="6">委託辦理計畫(事項)經費報告表</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="90">備註內容：</td><td colspan=3>
                                            <asp:TextBox ID="TBAcmMemo" runat="server" Width="480px"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
							    </td>
							</tr>
							<tr>
								<td>
									<asp:button id="BtnList" runat="server" Width="75px" Text="列出資料" Height="22px"></asp:button>
						<asp:Button id="BtnAdd" runat="server" Text="新增編輯"></asp:Button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
        <br />
         <table style="margin-left: 10px;border-collapse: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
				<tr>
					<td style=" border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
						valign="top" align="left">
						<table style=" border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
                                    <table style="table-layout:fixed" cellspacing="0" cellpadding="1" width="100%" border="0">
                                        <tr>
                                            <td style="text-align:center"><b>待選區</b></td>
                                        </tr>                                        
                                        <tr>
                                            <td>
                                                
                                            
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                    CellPadding="3" EnableModelValidation="True" GridLines="Vertical">
                                                    <AlternatingRowStyle BackColor="Gainsboro" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取">
                                                            <ItemTemplate>                                                                
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" />                                                                
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註年度" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoYear") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="系統號" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註號碼">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoAliasNo" runat="server" Text='<%# "註" & DataBinder.Eval(Container, "DataItem.memoAliasNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註內容">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                
                                            
                                            </td>
                                        </tr>
                                        
                                    </table>
							    </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
            <br />
                <table style="border:0; width:800px; table-layout:fixed" >
                    <tr>
                        <td><asp:Button ID="btnRemoveAll" runat="server" Text="移除全部"  /></td>
                        <td><asp:Button ID="btnRemove" runat="server" Text="移除" /></td>
                        <td><asp:Button ID="btnSelect" runat="server" Text="選取" /></td>
                        <td><asp:Button ID="btnSelectAll" runat="server" Text="選取全部" /></td>
                        <td><asp:Button ID="btnOK" runat="server" Text="確認帶回資料" /></td>
                    </tr>
                </table>
            
            
            
            
            
            <br />
            <br />
         <table style="margin-left: 10px; border-collapse: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
				<tr>
					<td style=" border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
						valign="top" align="left">
						<table style=" border-collapse: collapse; border-color:#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
                                    <table style="table-layout:fixed" cellspacing="0" cellpadding="1" width="100%" border="0">
                                        <tr>
                                            <td style="text-align:center"><b>已選區</b></td>
                                        </tr>                                        
                                        <tr>
                                            <td>
                                                
                                            
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                    CellPadding="3" EnableModelValidation="True" GridLines="Vertical">
                                                    <AlternatingRowStyle BackColor="Gainsboro" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取">
                                                            <ItemTemplate>                                                                
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" />                                                                
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註年度" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoYear" runat="server" 
                                                                    Text='<%#  DataBinder.Eval(Container, "DataItem.memoYear") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="系統號" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoNo" runat="server" 
                                                                    Text='<%#  DataBinder.Eval(Container, "DataItem.memoNo") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註號碼">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoAliasNo" runat="server" 
                                                                    Text='<%# "註" & DataBinder.Eval(Container, "DataItem.memoAliasNo") %>' 
                                                                    ToolTip='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註內容">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemo" runat="server" 
                                                                    Text='<%# DataBinder.Eval(Container, "DataItem.memo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                
                                            
                                            </td>
                                        </tr>
                                        
                                    </table>
							    </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </form> 
    <p>
        <input id="TBMemoKeys" runat="server" type="text" visible="false" />
        <input id="TBSessionID"  runat="server" type="text" visible="false" />
    </p>
</body>
</html>
