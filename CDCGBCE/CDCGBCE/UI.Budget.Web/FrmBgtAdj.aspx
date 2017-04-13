<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmBgtAdj.aspx.vb" Inherits="UI.Budget.Web.FrmBgtAdj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
        <meta http-equiv="Pragma" content="No-cache" />
		<script language="javascript" type="text/javascript" src="../ScriptFiles/ShowBudgetForAdj.js"></script>
		<script language="javascript" type="text/javascript">

		function fnCallSearchDialog(){

		var strReturnVal=showModalDialog("FrmSearchBudget.aspx?showtype=1",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		//alert(strReturnVal);

		if (strReturnVal != "Cancel" )
			{
				document.all("TBFindSql").value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}





		function fnCallPhraseDialog(thisName){

		var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel" )
			{
				document.all(thisName).value=document.all(thisName).value + strReturnVal;
				//Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}




		function GetMonthlyTotal(parObj)
		{
		var dblTotal
		dblTotal=0;
		var bolFlag;
		var objDG
		bolFlag=0;
			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];
				if (bolFlag== 0)
				{
					objDG =document.forms[0].elements[i];

					if ( e.getAttribute("MyName") == "TBdgMoney" && e.getAttribute("MyIndex") == parObj.MyParentIndex)
					{
					bolFlag=1;
					}
				}


				if (e.getAttribute("MyParentIndex") == parObj.MyParentIndex && e.getAttribute("MyName") == "TBMonthMoney")
				{
				dblTotal += parseFloat(replaceString(e.value,",",""));
				}


			}// next i
		objDG.value=dblTotal;

		}





		function GetBudgetTotal(parObj)
		{

		var dblTotal
		dblTotal=0;

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];

				if ( e.getAttribute("MyName") == "TBdgMoney")
				{
					dblTotal += parseFloat(replaceString(e.value, ",",""));
				}


			}// next i
			document.all("TBBudget").value=dblTotal;

		}






	function replaceString(sString, sReplaceThis, sWithThis) {
    if (sReplaceThis != "" && sReplaceThis != sWithThis) {
      var counter = 0;
      var start = 0;
      var before = "";
      var after = "";
      while (counter<sString.length) {
        start = sString.indexOf(sReplaceThis, counter);
        if (start == -1){
         break;
         } else {
           before = sString.substr(0, start);
           after = sString.substr(start + sReplaceThis.length, sString.length);
           sString = before + sWithThis + after;
           counter = before.length + sWithThis.length;
          }
        }
      }
   return sString;
  }

		
		
		function CheckDelDataMoney(parObj)
		{
		    
		}
		
		function autowidth(parObj)
		{
		  //alert(this.style.width);
		 parObj._oldwidth=parObj.style.width;
		 parObj.style.width="";
		 //window.status=parObj.offsetWidth;
		 if(parObj.offsetWidth>500)
		    parObj.style.width=500;
		 //document.all("Label1").innerText=parObj.offsetWidth;
		 //parentNode.width="";
		}
		
		function defwith(parObj) 
		{
		 parObj.style.width=parObj._oldwidth;//"200";
		}
		

		</script>
</head>
<body>
    <form id="form1" runat="server">
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668"
				cellPadding="5" width="950" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						width="600">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left">&nbsp;</td>
											<td vAlign="bottom" align="left"><asp:label id="LBBudgetNo" runat="server" Width="16px" BackColor="#FFE0C0" Visible="False"></asp:label></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="right"><asp:checkbox id="CBAccPassFlag" runat="server" Width="90px" Font-Size="Small" TextAlign="Left"
													Text="會計室審核"></asp:checkbox></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="2" width="100%" border="0">
										<tr>
											<td style="WIDTH: 73px" noWrap align="right" width="73" height="25">預算來源</td>
											<td style="WIDTH: 200px" width="200" height="25"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="120"></asp:dropdownlist></td>
											<td style="DISPLAY: none;WIDTH: 74px" align="right" width="74" height="25">金額種類</td>
											<td align="right" width="100" height="25" style="DISPLAY:none"><asp:dropdownlist id="DDLKind" runat="server" Width="100">
													<asp:ListItem Value="4">經費流用</asp:ListItem>
												</asp:dropdownlist></td>
											<td style="WIDTH: 75px" align="right" width="75" height="25">核定日期</td>
											<td width="185" height="25"><asp:textbox id="TBDate" runat="server" Width="100" MaxLength="9"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 73px" noWrap align="right" width="73" height="25">總預算數</td>
											<td style="WIDTH: 200px" height="25"><asp:textbox id="TBBudget" style="TEXT-ALIGN: right" runat="server" Width="112px" MaxLength="100"></asp:textbox><asp:label id="LBUnitName" runat="server" Font-Size="Small">(單位：千元)</asp:label></td>
											<td style="WIDTH: 74px" noWrap align="right" height="25">備註</td>
											<td colSpan="3" height="25"><asp:textbox id="TBMemo" runat="server" MaxLength="100" width="323px"></asp:textbox><input id="BtnPhrase" style="WIDTH: 20px; HEIGHT: 22px" onclick="fnCallPhraseDialog('TBMemo');"
													type="button" value="..." name="GmPhrase" runat="server"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<DIV style="OVERFLOW-Y: scroll; OVERFLOW-X: scroll; WIDTH: 700px; HEIGHT: 350px"><asp:datagrid id="DataGrid2" runat="server" Width="600px" BackColor="White" GridLines="Horizontal"
											CellPadding="3" BorderWidth="1px" BorderStyle="None" BorderColor="#E7E7FF" AutoGenerateColumns="False">
											<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
											<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
											<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
											<HeaderStyle Font-Size="Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="序號">
													<HeaderStyle Width="15px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
													<ItemTemplate>
														<asp:Label id=LBdgAcvNo style="CURSOR: help; TEXT-ALIGN: center" onclick=setShowBudget(this) runat="server" Width="15px" MyIndex="<%# Container.ItemIndex %>" MyName="LBdgNo" MyParentIndex="<%# Container.ItemIndex %>" text="<%# Container.ItemIndex + 1  %>">
														</asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn Visible="False" DataField="bgtYear" HeaderText="年度"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="bgtNo" HeaderText="流水號"></asp:BoundColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="650px"></HeaderStyle>
													<HeaderTemplate>
														<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
															<TR>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; BORDER-LEFT: #ffffff 1px solid; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="120">門別/</TD>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="120">執行單位/</TD>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 200px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="200">計畫/</TD>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 90px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="90">金額</TD>
																<TD style="FONT-SIZE: 10pt; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center" width="120">備註</TD>
															</TR>
															<TR>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; BORDER-LEFT: #ffffff 1px solid; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="120">經費單位</TD>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="120">承辦業務別</TD>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 200px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="200">用途別</TD>
																<TD style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 90px; COLOR: #ffffff; TEXT-ALIGN: center"
																	width="90">&nbsp;</TD>
																<TD style="FONT-SIZE: 10pt; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center" width="120">&nbsp;</TD>
															</TR>
														</TABLE>
													</HeaderTemplate>
													<ItemTemplate>
														<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
															<TR>
																<TD>
																	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
																		<TR>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 120px" width="120">
																				<asp:DropDownList id="DDLdgKind" runat="server" Width="120" MyName="DDLdgKind" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 120px" width="120">
																				<asp:DropDownList id="DDLdgUseDepName" runat="server" Width="120" MyName="DDLdgUseDepName" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 200px" width="200">
																				<asp:DropDownList id="DDLdgPlanName" runat="server" Width="200" CssClass="<%# Container.ItemIndex %>" AutoPostBack=True OnSelectedIndexChanged="DDLdgPlan_SelectedIndexChanged" MyName="DDLdgPlanName" MyIndex='<%# Container.ItemIndex %>' >
																				</asp:DropDownList></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 90px" width="90">
																				<asp:TextBox id="TBdgMoney" style="TEXT-ALIGN: right" runat="server" onchange="GetBudgetTotal(this);" Text="" Width="90" MyName="TBdgMoney" MyIndex="<%# Container.ItemIndex %>">
																				</asp:TextBox></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 120px" width="120" rowSpan="2">
																				<asp:TextBox id="TBdgMemo" runat="server" Width="120" MaxLength="200"></asp:TextBox>
																				<asp:Button id=BtnMonthly onclick=BtnMonthly_Click runat="server" Text="月分配" CssClass="<%# Container.ItemIndex %>">
																				</asp:Button></TD>
																		</TR>
																		<TR>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 120px" width="120">
																				<asp:DropDownList id="DDLdgBgtDepName" runat="server" Width="120" AutoPostBack="True" OnSelectedIndexChanged="DDLdgBgtDep_SelectedIndexChanged"  MyName="DDLdgBgtDepName" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 120px" width="120">
																				<asp:DropDownList id="DDLdgWorkUnitName" runat="server" Width="120"  MyName="DDLdgWorkUnitName" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 200px" width="200">
																				<asp:DropDownList id="DDLdgOulName" runat="server" Width="200"  MyName="DDLdgOulName" MyIndex='<%# Container.ItemIndex %>'   onfocus="autowidth(this);" onblur="defwith(this);"></asp:DropDownList></TD>
																			<TD style="FONT-SIZE: 10pt; WIDTH: 90px" width="90"></TD>
																		</TR>
																	</TABLE>
																</TD>
															</TR>
															<TR>
																<TD>
																	<asp:DataList id="DataList1" runat="server" width="100%" cellPadding="0" cellSpacing="0" RepeatColumns="6"
																		RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound">
																		<HeaderTemplate>
																		</HeaderTemplate>
																		<ItemTemplate>
																			<TABLE style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" cellSpacing="0" cellPadding="0"
																				bgColor="#ffffff" border="1">
																				<TR>
																					<TD noWrap align="center" bgColor="#003366"><FONT color="#ffffff" size="2"><%# Container.ItemIndex +1  & "月份"%></FONT></TD>
																				</TR>
																				<TR>
																					<TD bgColor="#f5f5f5">
																						<asp:TextBox id=TBMonthMoney onblur="GetMonthlyTotal(this);" style="TEXT-ALIGN: right" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.bgtmMoney","{0:#,0}") %>' Width="95%" MyName="TBMonthMoney" MyIndex="<%# Container.ItemIndex + 1 %>">
																						</asp:TextBox></TD>
																				</TR>
																			</TABLE>
																		</ItemTemplate>
																	</asp:DataList></TD>
															</TR>
														</TABLE>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="刪除">
													<ItemTemplate>
														<asp:CheckBox id="CBdgDel" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></DIV>
									<asp:button id="BtnAddDetail" runat="server" Text="新增明細列" height="22px"
                                        Visible="False"></asp:button></td>
							</tr>
						</table>
					</td>
					<td valign="top" width="200" bgcolor="#ffffff" rowspan="2" style="BORDER-RIGHT: 0pt; BORDER-TOP: transparent 0pt; BORDER-BOTTOM-STYLE: none; border-Rgiht-color: transparent;">
                        <iframe id=iFrame border=1 name=iFrame src="<%=strShowPath%>" frameBorder=0 width="200" scrolling=no height="520" >您的瀏覽器不支援內置框架或目前的設定為不顯示內置框架。</iframe>
					</td>
				</tr>
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" width="100%"
							border="1">
							<tr>
								<td vAlign="bottom" align="left">
									<table cellPadding="1" border="0">
										<tr>
											<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Visible="False" Text="列印" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Visible="False" Text="離開" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
													runat="server"></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnImportGBA" runat="server" Visible="False" Text="匯入GBA預算資料" Height="22"></asp:button></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" BackColor="White" GridLines="Horizontal"
										CellPadding="3" BorderWidth="1px" BorderStyle="None" BorderColor="#E7E7FF" AutoGenerateColumns="False"
										AllowPaging="True">
										<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
										<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
												<HeaderStyle Width="30px"></HeaderStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="bgsYear" HeaderText="年度">
												<HeaderStyle Width="50px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsNo" HeaderText="序號">
												<HeaderStyle Width="50px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsDate" HeaderText="核定日期">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsTotal" HeaderText="總預算數" DataFormatString="{0:#,0}">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsMemo" HeaderText="備註"></asp:BoundColumn>
											<asp:BoundColumn DataField="bgsBidFlag" HeaderText="自動流用旗標" Visible="False"></asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><FONT face="新細明體"></FONT></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<script language="javascript">setShowBudget();</script>

            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
    </form>

</body>
</html>
