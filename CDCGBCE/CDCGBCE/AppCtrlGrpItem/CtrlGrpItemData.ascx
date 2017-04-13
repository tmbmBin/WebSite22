<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CtrlGrpItemData.ascx.vb" Inherits="AppCtrlGrpItem.CtrlGrpItemData" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<table _ondblclick="alert('40:CtrlPayGrpItemData.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
	<tr>
		<td>
		<!-- ↓折疊項目(40) -->
		<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
						<td width="1%" align="right"><img id="img_FoldTitle_40" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_40', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
						<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_40')">附記事項<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_40" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 5px">

				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>

						<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False">
							<Columns>
								<asp:TemplateField>
									<ItemStyle Width="25px" HorizontalAlign="Center" Wrap="True" />
									<ItemTemplate>
										<asp:Label ID="LBdgAtkName" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("atkName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(Eval("atkCode").ToString()) %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField  >
									<ItemStyle VerticalAlign="Top" />
									<ItemTemplate>
										<asp:DataList ID="DataList1" runat="server" width="100%" OnItemCreated="DataList1_ItemCreated" OnItemDataBound="DataList1_ItemDataBound" RepeatLayout="Table">
											<ItemStyle Wrap="False" />
											<ItemTemplate>
												<table cellpadding="3" style="border-collapse: collapse; border: 1pt solid; font-size: 10pt" width="100%">
													<tr>
														<td style="padding-top: 9px; font-size: 11pt" width="65" valign="top" align="center" nowrap><asp:Label ID="LBdlName" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("atmName").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.atmCode").ToString()) %>'></asp:Label></td>
														<td>
															<asp:DataList ID="DataList2" runat="server" width="480" OnItemCreated="DataList2_ItemCreated" OnItemDataBound="DataList2_ItemDataBound" RepeatDirection="Horizontal" RepeatColumns="3" RepeatLayout="Flow">
																<ItemStyle Wrap="False" />
																<ItemTemplate>
																	<asp:Label ID="LBdl2Name" runat="server" Text='<%# AntiXss.HtmlEncode(Eval("atdNo").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.atdNo").ToString()) %>' Visible="false"></asp:Label>
																	<asp:Literal id="Literal1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.atdNameHtml").Replace(null, null)  %>' ></asp:Literal>
																</ItemTemplate>
															</asp:DataList>
														</td>
													</tr>
												</table>
											</ItemTemplate>
										</asp:DataList>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>

						</td>
					</tr>
				</table>

				<table cellpadding="3" style="border-collapse: collapse; margin-bottom: -2px; width: 100%" border="0">
					<tr>
						<td>
							<asp:Button ID="BtnLoadItem" runat="server" Width="100px" Height="22px" Text="載入可用事項" Enabled="False" />
						</td>
						<td align="right"> </td>
					</tr>
				</table>
				<!-- Insert 項目內容 here -->
				</td>
			</tr>
		</table>
		<!-- 折疊項目(40)↑ -->
		</td>
	</tr>
</table>