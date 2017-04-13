<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashVerifyList.aspx.vb" Inherits="UI.Cash.Web.FrmCashVerifyList" %>

<html>
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script type="text/javascript">
        function checkAll(alt) {

            var a = document.getElementsByTagName("input");
            var n = a.length;
            for (var i = 0; i < n; i++)
                if (a[i].type == "checkbox" && a[i].parentNode.alt == alt && a[i].parentNode.disabled != true) {
                a[i].checked = window.event.srcElement.checked;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5" width="800" bgColor="#dadee9">
		<tr>
			<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" borderColor="#666668">
			    <table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
			        <tr>
			            <td>
			                <table>
			                    <tr>
			                        <td><asp:Label ID="Label2" runat="server" Text="審核日期"></asp:Label></td>
			                        <td><asp:TextBox ID="txt_PassDate" runat="server" Width="70px" style="text-align:center"></asp:TextBox></td>
			                        <td><asp:Button ID="btn_Save" runat="server" Text="審核存檔" /></td>
			                        <td></td>
			                        <td></td>
			                        <td><asp:label id="Label1" runat="server" ForeColor="Red">請存檔後再換頁。</asp:label></td>
			                    </tr>
			                </table>
			            </td>
			        </tr>
					<tr>
						<td>
						    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF"  BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="800px">
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <AlternatingItemStyle BackColor="#F7F7F7" />
                                <ItemStyle BackColor="#E7E7FF" Font-Names="新細明體" Font-Size="X-Small"  ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True"  Font-Names="新細明體" Font-Size="9pt" ForeColor="#F7F7F7" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="審核選取">
                                        <HeaderStyle Width="20px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="CBdgSelectAll1" runat="server" name="C1"
                                                onclick="checkAll('C1');" ToolTip="打勾全選" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CBdgSelect" runat="server" alt="C1" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>                                            
                                    <asp:TemplateColumn HeaderText="序號">
                                        <ItemTemplate>
                                            <asp:Label ID="lab_ItemNum" runat="server" Text='<%# Container.ItemIndex + 1  %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="20px" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="核退原因">
                                        <HeaderStyle Width="70px" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txt_RejectCause" runat="server" Width="70px" Text='<%# DataBinder.Eval(Container, "DataItem.csmRejectCause") %>' ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="csmYear" HeaderText="年度">
                                        <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="csmSDate" HeaderText="領用日期" 
                                        DataFormatString="{0:yyyy/MM/dd}">
										<HeaderStyle Width="60px" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" />
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="撥還批號">
									    <HeaderStyle Width="60px" Wrap="False" />
									    <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="LBBatchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmBatchNo") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
									<asp:BoundColumn DataField="csmCnt" HeaderText="領用數量">
										<HeaderStyle Width="60px"></HeaderStyle>
                                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
									</asp:BoundColumn>
									<asp:BoundColumn DataField="csmMoney" HeaderText="領用金額" DataFormatString="{0:#,0}">
										<HeaderStyle Width="70px"></HeaderStyle>
                                        <ItemStyle  HorizontalAlign="Right" Wrap="False" />
									</asp:BoundColumn>
									<asp:BoundColumn DataField="csmMemo" HeaderText="備註"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="申請人">
									    <HeaderStyle Width="60px" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="LBCreateUser" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CreateUser") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.UnitPassFlag") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>                                            
                                    <asp:TemplateColumn HeaderText="單位審核否">
									    <HeaderStyle Width="70px" />
									    <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="LBcsmUnitPassFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmUnitPassFlag") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csmUnitPassUser") & "｜" & DataBinder.Eval(Container, "DataItem.csmUnitPassDate")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="會計審核否">
									    <HeaderStyle Width="70px" />
									    <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="LBcsmPassFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmPassFlag") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csmPassUser") & "｜" & DataBinder.Eval(Container, "DataItem.csmPassDate")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="帳別">
									    <HeaderStyle Width="70px" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="labSort" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csName") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" 
                                    Mode="NumericPages" />
                            </asp:DataGrid>
						</td>
					</tr>
					<tr>
					    <td>
					        <table style="font-size:x-small">
					            <tr>
					                <td>每頁顯示<asp:TextBox ID="TBPageQty" runat="server" Width="50px" AutoPostBack="True" style="text-align:center">10</asp:TextBox>筆資料｜</td>
					                <td valign="bottom">共 <asp:Label ID="lab_Count" runat="server" Text=""></asp:Label> 筆待審資料</td>
					            </tr>
					        </table>
					    </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
    </form>
</body>
</html>
