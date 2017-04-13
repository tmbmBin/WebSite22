<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayVisa1.ascx.vb" Inherits="AppCtrlOffSet.UCActPayVisa1" %>
<script language="javascript">
<!--

	function GetTotalAcvMoney()
	{
			var e=document.forms[0].elements[i];
			if  ( e.getAttribute("MyName")=="TBdgProdQry"  )
			{

			}

	}

	function check_Num(){
			if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
				return true;}
			else{event.keyCode=0;false;}
	}




	function GetAutoAdjMoney(parObj, parIndex)
	{

			var dblTotal
			dblTotal=0;

			//紀錄簽證金額剩於數
			var objDG
			var bolFlag
			bolFlag=0;


			//紀錄調整數，找到調整數物件，並記錄起來
			var objAdj
			var bolAdjFlag
			bolAdjFlag=0;

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
					var e=document.forms[0].elements[i];

					//找簽證數
					if (bolFlag== 0)
					{
							//objDG =document.forms[0].elements[i];

							if ( e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parIndex)
							{
									objDG=e;
									bolFlag=1;
							}
					 }

					//找調整數
					if (bolAdjFlag== 0)
					{
							//objAdj =document.forms[0].elements[i];

							if ( e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parIndex)
							{
									 objAdj=e;
									bolAdjFlag=1;
							}
					}

					//找出明細總和
					if ( e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parIndex)
					{
							if (e.value !="" )
							{
								dblTotal += parseFloat(replaceString(e.value,",",""));
							}
					}
			} // next i


			if (parObj.checked==true)
			{

					objAdj.value=parseFloat(replaceString(objDG.value,",","")) - dblTotal;
					parObj.checked=true;
			}
			else
			{
					objAdj.value=0;
					//parObj.checked=true;
			}
	}








	function replaceString(sString, sReplaceThis, sWithThis)
		{
			if (sReplaceThis != "" && sReplaceThis != sWithThis)
			{
				var counter = 0;
				var start = 0;
				var before = "";
				var after = "";

				while (counter<sString.length)
				{
					start = sString.indexOf(sReplaceThis, counter);
					if (start == -1)
					{
						break;
					}
					 else
					 {
						before = sString.substr(0, start);
						after = sString.substr(start + sReplaceThis.length, sString.length);
						sString = before + sWithThis + after;
						counter = before.length + sWithThis.length;
					}
				}
			}

			return sString;
		}



	function GetTotalPayMoney(parObj)
	{
		var dblTotal = 0;
			var objPayMoney;
		   // dblTotal = 0;
			var bolTarge = false;

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
					var e=document.forms[0].elements[i];

					if ( e.getAttribute("MyName") == "TBdlAcvMoney")
					{
							if (e.value !="" )
							{
									dblTotal += parseFloat(replaceString(e.value,",",""));

							}
					}

					if (e.getAttribute("MyName")=="TBPayMoney" && bolTarge ==false)
					{

						bolTarge = true;
						objPayMoney = e;

					}
			} // next i


			objPayMoney.value = dblTotal;

	}




	function CheckUpLevlMoney(parObj)
	{
			var dblTotal
			dblTotal=0;
			var objDG
			var bolFlag
			bolFlag=0;
			var bolFlag1=0;
			var objBtnSplit;

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
					var e=document.forms[0].elements[i];
					if (bolFlag== 0)
					{
							objDG =document.forms[0].elements[i];

							if ( e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parObj.MyParentIndex)
							{
									bolFlag=1;
							}
					}

					if (e.getAttribute("MyName")=="BtnSplit" && bolFlag1==0 && e.getAttribute("MyIndex")== parObj.MyParentIndex)
					{
						objBtnSplit=e;
					}

					if ( e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parObj.MyParentIndex)
					{
							if (e.value !="" )
							{
									dblTotal += parseFloat(replaceString(e.value,",",""));
							}
					}
			} // next i

		   if (parseFloat(replaceString(objDG.value,",","")) - dblTotal < 0)
			{
					var tmpNo
					tmpNo= parseFloat(parObj.MyParentIndex) + 1;
					alert("簽證序號為 " + tmpNo  + " 報支金額總數大於原簽證金額。請重新修改。");
					objBtnSplit.disabled=true;
					parObj.onfocus;
			}
			else
			{
					if (parseFloat(replaceString(objDG.value,",","")) - dblTotal==0)
				 {
					objBtnSplit.disabled=true;
				 }
				 else
				 {
					objBtnSplit.disabled=false;
				 }

				 //objBtnSplit.disabled=false;
			}
			//document.all("TBacmMoney1").value=dblTotal;

	}

//-->
</script>

<table _ondblclick="alert('18:UCActPayVisa1.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
	<tr>
		<td>
		<!-- ↓折疊項目(1) -->
		<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
					    <td width="1%" align="right"><img id="img_FoldTitle_18" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_18', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
					    <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_18')">預算動支項目<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_18" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 5px">

				<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
					<tr>
						<td width="150" align="right"><img id="img18" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img18.fireEvent("onclick")'>預算動支項目</span></td>
						<td width="440" align="right" style="padding-right: 0px">
						<table border="0" cellpadding="0" style="border-collapse: collapse">
							<tr>
								<td style="display:none"><font size="2">經費所屬單位｜</font></td>
								<td style="display:none">&nbsp;</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
						<div id="div_UCActPayVisa1" class="DIV1_width" style="BEHAVIOR: url(<%= resolveurl(scrollposurl)%>)" alt="DIV1" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>"><input type="hidden" id="savescrollpos" name="savescrollpos" runat="server">
							<asp:datagrid id="DataGrid2" runat="server" AutoGenerateColumns="False">
								<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
								<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
								<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
								<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
								<Columns>
									<asp:TemplateColumn>
										<HeaderStyle Width="15px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:Label id="LBdgAcvNo" MyName ="LBdgAcvNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center" Width="15px" text='<%# Container.ItemIndex + 1  %>' ></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="年度">
										<HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgBgtYear" runat="server" Width="30px" Style="TEXT-ALIGN: Center" onfocus="this.blur();">095</asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<table  style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 >
												<tr>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; COLOR: #ffffff; TEXT-ALIGN: center">月</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 65px; COLOR: #ffffff; TEXT-ALIGN: center">門別</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 70px; COLOR: #ffffff; TEXT-ALIGN: center">預算來源</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 132px; COLOR: #ffffff; TEXT-ALIGN: center;">經費單位</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 132px; COLOR: #ffffff; TEXT-ALIGN: center;">控帳業務</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 290px; COLOR: #ffffff; TEXT-ALIGN: center">計畫科目</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 190px; COLOR: #ffffff; TEXT-ALIGN: center">用途別科目</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 90px; COLOR: #ffffff; TEXT-ALIGN: center">簽證金額</td>
													<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 156px; COLOR: #ffffff; TEXT-ALIGN: center;display:none">用途說明</td>
                                                    <%--20160115 [mdf]:因配合105年CGBA上線GBC系統之調整,暫付改預付--%>
													<%--<td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 40px; COLOR: #ffffff; TEXT-ALIGN: center">暫付</td>--%>
                                                    <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 40px; COLOR: #ffffff; TEXT-ALIGN: center">預付</td>
													<td style="FONT-SIZE: 10pt; WIDTH: 80px; COLOR: #ffffff; TEXT-ALIGN: center" >就地審計</td>
												</tr>
											</table>
										</HeaderTemplate>
										<ItemStyle VerticalAlign="Top" />
										<ItemTemplate>
											<table style="margin-left: 0px" border=0 cellpadding=0 cellspacing=0 >
												<tr>
													<td align=left>
													<table style="margin-left: 0px" border=0 cellpadding=0 cellspacing=0>
														<tr>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgBgtMonth" runat="server" Width="30px" onfocus="this.blur();" Style="text-align:center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtMonth"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgAccKindName" runat="server" Width="64px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAccKindName"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgBgtSourName" runat="server" Width="67px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBgtSourName"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgBgtDepName" runat="server" Width="130px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBgtDepName"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgBizName" runat="server" Width="130px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBizName"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgPlanName" runat="server" Width="290px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgPlanName"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgOulName" runat="server" Width="190px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgOulName"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdgAcvMoney" runat="server" Width="90px" onfocus="this.blur();" style="text-align:right" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAcvMoney"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid;display:none"><asp:TextBox ID="TBdgAcvMemo" runat="server" Width="150px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAcvMemo"></asp:TextBox></td>
															<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 40px;text-align:center"><asp:CheckBox ID="CBdgPrePayFlag" runat="server" Enabled="false" ToolTip="暫付"  /></td>
															<td style="WIDTH: 80px;text-align:center"><asp:CheckBox ID="CBdgInpsect" runat="server" Enabled="false" ToolTip="就地審計" /></td>
														</tr>
														<tr>
															<td colspan="11" align="left">
															<asp:DataList ID="DataList1" runat="server" style="MARGIN-RIGHT: 0px" OnItemCreated="DataList1_ItemCreated"  OnItemDataBound="DataList1_ItemDataBound"  >
																<ItemTemplate>
																	<table style="MARGIN-left: 5px" border=0 cellpadding=0 cellspacing=0>
																		 <tr>
																			<td style="BORDER-RIGHT: #ffffff 1px solid; TEXT-ALIGN: center" width="26px" nowrap> <asp:Image ID="IMdlacvExchNo" runat="server" ImageUrl="~/Images/034.gif"/><asp:Label ID="LBdlNo" runat="server" widht="26px" style="text-align:center; cursor: help" onclick="setShowBudget(this)" ><%# Container.ItemIndex +1 %></asp:Label></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList ID="DDLdlAccKind" runat="server" Width="65px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlAccKind"><asp:ListItem Value=1 Text="資本門"> </asp:ListItem></asp:DropDownList></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList ID="DDLdlBgtSour" runat="server" Width="65px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBgtSour"></asp:DropDownList></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList ID="DLLdlBgtDepName" runat="server" Width="130px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DLLdlBgtDepName" AutoPostBack="true"></asp:DropDownList></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList ID="DLLdlBizName" runat="server" Width="130px" style="background-color: #FFFFE0"  MyIndex="<%# Container.ItemIndex %>" MyName="DLLdlBizName"></asp:DropDownList></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList ID="DDLdlPlanName" runat="server" Width="290px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlPlanName" AutoPostBack="true"  onmousedown="tranSeleGroup(this, '*');"></asp:DropDownList></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList ID="DDLdlOulName" runat="server" Width="190px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlOulName" ></asp:DropDownList></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:TextBox ID="TBdlAcvMoney"   runat="server"  Width="90px"  onblur="CheckUpLevlMoney(this);GetTotalPayMoney();"  onfocus="this.select();" style="background-color: #FFFFE0;text-align:right"  onkeypress="return check_Num()"   MyName="TBdlAcvMoney"  ></asp:TextBox></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid;display:none"><asp:TextBox ID="TBdlAcvMemo" runat="server"  Width="150px"  style="background-color: #FFFFE0"  ></asp:TextBox></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 34px; background-color: #FFFFE0;text-align:center"><asp:CheckBox ID="CBdlPrePayFlag" Visible="false" runat="server"  ToolTip="暫付" /></td>
																			<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 41px; FONT-SIZE: 10pt; background-color: #FFFFE0;text-align:right" align="left"><asp:CheckBox ID="CBdlInspect" runat="server" style="MARGIN-left: 0px"   ToolTip="就地審計"/>
																				<asp:Label id="LBdlExchNo" runat="server" MyName ="LBdlExchNo" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
																				<asp:Label id="LBdlTranID" runat="server" MyName ="LBdlTranID" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
																				<asp:Label id="LBdlTranBNo" runat="server" MyName ="LBdlTranBNo" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
																				<asp:Label id="LBdlTranDTime" runat="server" MyName ="LBdlTranDTime" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
																				<asp:Label id="LBdlTranUser" runat="server" MyName ="LBdlTranUser" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
																				<asp:Label id="LBdlExchNo1" runat="server" MyName ="LBdlExchNo1" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
																				<asp:Label id="LBdlTranID1" runat="server" MyName ="LBdlTranID1" MyIndex='<%# Container.ItemIndex %>' Visible=False ></asp:Label>
																			</td>
																			<td style="TEXT-ALIGN: left;display:none"><asp:Button id="BtnGBA" runat="server" Text="GBA" OnClick="BtnGBA_Click" Height="21px"></asp:Button></td>
																		</tr>
																		<tr>
																			<td colspan="12">
																			<asp:DataList id="DataList2" style="MARGIN-RIGHT: 0px" runat="server">
																				<ItemTemplate>
																					<table style="MARGIN-left: 0px" border=0 cellpadding=0 cellspacing=0>
																						<tr>
																							<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 300px;">&nbsp;</td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 136px;">&nbsp;</td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 26px; TEXT-ALIGN: right" valign=middle ><asp:Label id="LBdl2No" runat="server" style="TEXT-ALIGN: center" font-size="X-Small" Width="15px" Text='<%# Container.ItemIndex+1 %>' MyName ="LBdl2No" MyIndex='<%# Container.ItemIndex %>' ></asp:Label></td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList id="DDLdl2Plan" runat="server" Style="background-color: #ccffff" width="296" MyName ="DDLdl2Plan" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList id="DDLdl2Oul" style="background-color: #ccffff" runat="server" Width="196" MyName ="DDLdl2Oul" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList id="DDLdl2Kind" runat="server" Width="96" Style="background-color: #ccffff" MyName ="DDLdl2Kind" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid;"><asp:DropDownList id="DDLdl2bgtSource" runat="server" Width="156" Style="background-color: #ccffff" MyName ="DDLdl2bgtSource" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 20px; background-color: #ccffff"><asp:CheckBox id="CBdl2PayKind" runat="server" BackColor="#ccffff"></asp:CheckBox></td>
																							<td style="BORDER-RIGHT: #ffffff 1px solid; WIDTH: 20px;">&nbsp;</td>
																							<td>&nbsp;</td>
																						</tr>
																					</table>
																				</ItemTemplate>
																			</asp:DataList>
																			</td>
																		</tr>
																	</table>
																</ItemTemplate>
															</asp:DataList>
															</td>
														</tr>
													</table>
													</td>
													<td style="WIDTH: 20px" valign=bottom><asp:Button id=BtnSplit runat="server" style="margin-bottom: 4px" Text="+" CssClass="<%# Container.ItemIndex %>" MyName="BtnSplit" MyIndex="<%# Container.ItemIndex %>" OnClick="BtnSplit_Click" Height="22px"></asp:Button></td>
												</tr>
											</table>
										</ItemTemplate>
									</asp:TemplateColumn>

									<asp:TemplateColumn HeaderText="結案">
										<HeaderStyle Width="100px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="False" />
										<ItemTemplate>
											<table border=0 cellpadding=0 cellspacing=0>
												<tr>
													<td align=center ><asp:CheckBox ID="CBdgClose" runat="server"  Enabled=false /></td>
												</tr>
												<tr>
													<td style="vertical-align:bottom">
													    <asp:TextBox ID="TBdgAdjustMoney"  ToolTip="繳回款" runat="server" style="margin-bottom: 2px; text-align:right" MyName="TBdgAdjustMoney" MyIndex="<%# Container.ItemIndex %>" Width="80px" Enabled=false ></asp:TextBox>
													    <asp:TextBox id="TBPayBackNo" ToolTip="繳回號" style="Text-align:Right" runat="server" Width="80px"></asp:TextBox>
												    </td>
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
		<!-- 折疊項目(18)↑ -->
		</td>
	</tr>
</table>