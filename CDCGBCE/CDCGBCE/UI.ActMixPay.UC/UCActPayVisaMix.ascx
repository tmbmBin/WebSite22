<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayVisaMix.ascx.vb" Inherits="UI.ActMixPay.UC.UCActPayVisaMix" %>

<table _ondblclick="alert('15:UCActPayVisaMix.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0" >
	<tr>
		<td>
		<!-- ↓折疊項目(15) -->
		<table cellpadding="0" style="border-collapse: collapse;  border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
						<td width="1%" align="right"><img id="img_FoldTitle_15" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_15', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
						<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_15')">預算動支項目<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_15" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 5px">
				<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
					<tr>
						<td width="150" align="right"><img id="img15" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img15.fireEvent("onclick")'>預算動支項目</span></td>
						<td width="440" align="right" style="padding-right: 0px">
						    &nbsp;</td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
                      
						<div id="div_UCActPayVisaMix" class="DIV4_width" alt="DIV1" ><input type="hidden" id="savescrollpos" name="savescrollpos" runat="server" />
						<asp:datagrid id="DataGrid2" runat="server" AutoGenerateColumns="False" Width="1050px" >
							<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
							<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
							<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
							<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
							<Columns>
								<asp:TemplateColumn>
									<HeaderStyle Width="15px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="LBdgAcvNo" MyName ="LBdgAcvNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center" Width="15px" text='<%# Container.ItemIndex + 1  %>'  onclick="setShowBudget(this)" ></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText ="預付">
									<FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                        Font-Strikeout="False" Font-Underline="False" Wrap="False" />
									<HeaderStyle Width="40px" Wrap="False" Font-Size="X-Small" ></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" 
                                        Font-Italic="False" Font-Overline="False" 
                                        Font-Strikeout="False" Font-Underline="False" Wrap="False"></ItemStyle>
									<ItemTemplate>
                                        <input id="TBAcPrePayFlag"       runat="server" type="hidden" MyName ="TBAcPrePayFlag"        MyIndex='<%# Container.ItemIndex %>' />                                                                          
										<asp:Image ID="IMdAcvPrePayFlag" runat="server" ImageUrl="~/UI.ActMixPay.UC/images/PrePayFlag.png" ToolTip ="本筆資料為預付"/>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>                                
									<HeaderTemplate>
										<table  style="table-layout:fixed" border="0" cellpadding="0" cellspacing="0">
											<tr>
											    <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 32px; COLOR: #ffffff; TEXT-ALIGN: center">年</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 27px; COLOR: #ffffff; TEXT-ALIGN: center">月</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 67px; COLOR: #ffffff; TEXT-ALIGN: center">門別</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 66px; COLOR: #ffffff; TEXT-ALIGN: center;">預算來源</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 110px; COLOR: #ffffff; TEXT-ALIGN: center">經費單位</td>
                                                <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 110px; COLOR: #ffffff; TEXT-ALIGN: center">控帳業別</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 200px; COLOR: #ffffff; TEXT-ALIGN: center">計畫科目</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 150px; COLOR: #ffffff; TEXT-ALIGN: center">用途別科目</td>
												<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 90px; COLOR: #ffffff; TEXT-ALIGN: center">動支金額</td>
												<td style="FONT-SIZE: 10pt; WIDTH: 60px; COLOR: #ffffff; TEXT-ALIGN: center">新增移除</td>
											</tr>
										</table>
									</HeaderTemplate>
									<HeaderStyle HorizontalAlign="Left" />
									<ItemStyle VerticalAlign="Top" />
									<ItemTemplate>
										<table style="margin-left: 0px;table-layout:fixed" border="0" cellpadding="0" cellspacing="0" >
											<tr>
												<td align="left">
												<table style="margin-left: 0px;table-layout:fixed" border="0" cellpadding="0" cellspacing="0">
													<tr>
													    <td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 31px;"><asp:TextBox ID="TBdgBgtYear" runat="server" Width="30px" onfocus="this.blur();" Style="text-align:center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtYear"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 26px;"><asp:TextBox ID="TBdgBgtMonth" runat="server" Width="25px" onfocus="this.blur();" Style="text-align:center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtMonth"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 66px;"><asp:TextBox ID="TBdgAccKindName" runat="server" Width="65px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAccKindName"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 66px;"><asp:TextBox ID="TBdgBgtSourName" runat="server" Width="65px" onfocus="this.blur()" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBgtSourName"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 110px;"><asp:TextBox ID="TBdgBgtDepName" runat="server" Width="109px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBgtDepName"></asp:TextBox></td>
                                                        <td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 110px;"><asp:TextBox ID="TBdgBizName" runat="server" Width="109px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBizName"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 200px;"><asp:TextBox ID="TBdgPlanName" runat="server" Width="197px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgPalnName"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 150px;"><asp:TextBox ID="TBdgOulName" runat="server" Width="150px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgOulName"></asp:TextBox></td>
														<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 90px;"><asp:TextBox ID="TBdgAcvMoney" runat="server" Width="90px" onfocus="this.blur();" style="text-align:right" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAcvMoney"></asp:TextBox></td>
                                                        <td style="FONT-SIZE: 10pt; WIDTH:40px; COLOR: #ffffff; TEXT-ALIGN: center">&nbsp;</td>
													</tr>
													<tr>
														<td colspan="10" align="left">
														<asp:DataList ID="DataList1" runat="server" style="MARGIN-RIGHT: 0px" OnItemCreated="DataList1_ItemCreated"  OnItemDataBound="DataList1_ItemDataBound"  >
															<ItemTemplate>
																<table style="MARGIN-left:0px;table-layout:fixed" border="0" cellpadding="0" cellspacing="0">
																	 <tr>
																	    <td style="BORDER-RIGHT: #ffffff 1px solid; text-align:right; width:30px" nowrap><asp:Image ID="IMdlacvExchNo" runat="server" ImageUrl="~/Images/034.gif"/></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; TEXT-ALIGN: center" width="26px" nowrap><asp:Label ID="LBdlNo" runat="server" widht="25px" style="text-align:center; cursor: help" onclick="setShowBudget(this)" ><%# Container.ItemIndex +1 %></asp:Label>&nbsp;&nbsp;</td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 66px;"><asp:DropDownList ID="DDLdlAccKind" runat="server" Width="65px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlAccKind"></asp:DropDownList></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 66px;"><asp:DropDownList ID="DDLdlBgtSour" runat="server" Width="65px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBgtSour"></asp:DropDownList></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 110px;"><asp:DropDownList ID="DDLdlBgtDepName" runat="server" Width="109px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBgtDepName"></asp:DropDownList></td>
                                                                        <td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 110px;"><asp:DropDownList ID="DDLdlBizName" runat="server" Width="109px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBizName"></asp:DropDownList></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 200px;"><asp:DropDownList ID="DDLdlPlanName" runat="server" Width="197px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlPlanName" AutoPostBack ="true" onmousedown="tranSeleGroup(this, '*');" ></asp:DropDownList></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 150px;"><asp:DropDownList ID="DDLdlOulName" runat="server" Width="150px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlOulName" onmousedown="tranSeleGroup(this, '*');"  ></asp:DropDownList></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 90px;"><asp:TextBox ID="TBdlAcvMoney"   runat="server"  Width="90px"    onfocus="this.value=replaceString(this.value,',','');this.select()" style="background-color: #FFFFE0;text-align:right"  onkeypress="javascript:MoneyOnly();"    MyName="TBdlAcvMoney" onblur="CheckUpLevlMoney(this);GetTotalPayMoney(); if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};" ></asp:TextBox></td>
																		<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 30px; background-color: #FFFFE0"><asp:CheckBox ID="CBdlDel" runat="server" ToolTip="移除本列資料" Enabled="false"  />
                                                                            <input id="TBdlExchNo"          runat="server" type="hidden" MyName ="TBdlExchNo"           MyIndex='<%# Container.ItemIndex %>' />
                                                                            <input id="TBdlTranID"          runat="server" type="hidden" MyName ="TBdlTranID"           MyIndex='<%# Container.ItemIndex %>' />
                                                                            <input id="TBdlTranBNo"         runat="server" type="hidden" MyName ="TBdlTranBNo"          MyIndex='<%# Container.ItemIndex %>' />
                                                                            <input id="TBdlTranDTime"       runat="server" type="hidden" MyName ="TBdlTranDTime"        MyIndex='<%# Container.ItemIndex %>' />
                                                                            <input id="TBdlTranUser"        runat="server" type="hidden" MyName ="TBdlTranUser"         MyIndex='<%# Container.ItemIndex %>' />
                                                                            <input id="TBdlAcvMixPayGrpNo"  runat="server" type="hidden" MyName ="TBdlAcvMixPayGrpNo"   MyIndex='<%# Container.ItemIndex %>' />
                                                                        </td>
																	</tr>
																</table>
															</ItemTemplate>
														</asp:DataList>
														</td>
													</tr>
												</table>
												</td>
												<td style="WIDTH: 20px" valign="bottom"><asp:Button id=BtnSplit runat="server" style="margin-bottom: 4px" Text="+" CssClass="<%# Container.ItemIndex %>" MyName="BtnSplit" MyIndex="<%# Container.ItemIndex %>" OnClick="BtnSplit_Click" Height="21px"></asp:Button></td>
											</tr>
										</table>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="結案">
									<HeaderStyle Width="80px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
									<ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="False" />
									<ItemTemplate>
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td align="center" ><asp:CheckBox ID="CBdgClose" runat="server"  Enabled="false" MyName="BtnClose" MyIndex="<%# Container.ItemIndex %>" /></td>
											</tr>
											<tr>
												<td valign="bottom"><asp:TextBox ID="TBdgAdjustMoney" runat="server" style="margin-bottom: 2px; text-align:right" MyName="TBdgAdjustMoney" MyIndex="<%# Container.ItemIndex %>" Width="80px" Enabled="false" ToolTip="繳回金額" ></asp:TextBox></td>
											</tr>
                                            <tr>
                                                <td valign="bottom"><asp:TextBox ID="TBdgRePayNo"     runat="server" style="margin-bottom: 2px; text-align:center" MyName="TBdgRePayNo" MyIndex="<%# Container.ItemIndex %>" Width="80px" Enabled="false" ToolTip="繳回號碼" ></asp:TextBox></td>
                                            </tr>
										</table>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						</div>
						</td>
					</tr>
				</table>
				<!-- Insert 項目內容 here -->
				</td>
			</tr>
		</table>
		<!-- 折疊項目(15)↑ -->
		</td>
	</tr>
</table>
