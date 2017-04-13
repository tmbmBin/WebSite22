<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActMainList.aspx.vb" Inherits="UI.AssignDep.Web.FrmActMainList" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <base target="_self"/>
</head>
<body>
    <form id="form1" runat="server">
    <iframe id="myFrame" border="0" name="myFrame" frameBorder="0" width="100%" scrolling="no" height="<%=strFrameHeight%>"   src="<%=strFrameSrc%>"></iframe>                             </td>
	    <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
		    <tr>
			    <td>
			        <table cellpadding="2" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
			            <tr>
			                <td>
			                    <table border="0" cellpadding="1" style="border-collapse: collapse" width="100%">
			                        <tr>
			                            <td style="width:90px; text-align:right">每頁顯示：</td>
			                            <td><asp:TextBox ID="TBQty" runat="server" Text="10"  style="text-align:center; width:50px"></asp:TextBox></td>
			                            <td></td>
			                        </tr>			                        
			                    </table>
			                </td>
			            </tr>
				        <tr>
					        <td>
						        <asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
							        <HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
							        <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
							        <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
							        <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
							        <Columns>
								        <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
									        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Small"></ItemStyle>
									        <HeaderStyle Width="30px" />
								        </asp:ButtonColumn>
								        <asp:BoundColumn DataField="acmYear" HeaderText="年度">
									        <HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
									        <ItemStyle HorizontalAlign="Center"></ItemStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="簽證系統號" SortExpression="acmNo">
									        <HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
									        <ItemStyle HorizontalAlign="Left" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></ItemStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate">
									        <HeaderStyle Width="60px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
								            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" Wrap="False" />
								        </asp:BoundColumn>
								        <asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
									        <HeaderStyle Width="80px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
									        <ItemTemplate>
										        <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'  ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
									        </ItemTemplate>
								            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" Wrap="False" />
								        </asp:TemplateColumn>
								        <asp:BoundColumn DataField="DepName" HeaderText="承辦單位" SortExpression="DepName">
                                            <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                        </asp:BoundColumn>
								        <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="承辦人員" SortExpression="acmWorkUserNo">
									        <HeaderStyle Width="60px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn DataField="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,#}" SortExpression="acmMoney">
									        <HeaderStyle Width="70px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
									        <ItemStyle HorizontalAlign="Right"></ItemStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn DataField="acmMemo" HeaderText="控帳事由" SortExpression="acmMemo">
                                            <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                        </asp:BoundColumn>
								        <asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動" SortExpression="acmModifyUser">
									        <HeaderStyle Width="60px" Font-Bold="False" Font-Italic="False" 
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                Wrap="False"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn Visible="False" DataField="M1Counter" HeaderText="M1Counter-10">
									        <HeaderStyle Width="60px"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn Visible="False" DataField="M2Counter" HeaderText="M2Counter-11">
									        <HeaderStyle Width="60px"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn Visible="False" DataField="PCounter" HeaderText="PCounter-12">
									        <HeaderStyle Width="60px"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn Visible="False" DataField="acmBgtKind" HeaderText="結轉-13">
									        <HeaderStyle Width="60px"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn  Visible="False" DataField="acmWordNum" HeaderText="動支編號-14">
									        <HeaderStyle Width="60px"></HeaderStyle>
								        </asp:BoundColumn>
								        <asp:BoundColumn  Visible="False" DataField="P1Counter" HeaderText="P1Counter-15">
									        <HeaderStyle Width="60px"></HeaderStyle>
								        </asp:BoundColumn>
							        </Columns>
							        <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
						        </asp:datagrid>
					        </td>
				        </tr>
				        <tr>
					        <td>
					            <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
						            <tr>
							            <td><font size="2">共 <asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label> 筆資料</font>
							            <input runat="server" id="TBOrderTxt" type="hidden" /></td>
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
