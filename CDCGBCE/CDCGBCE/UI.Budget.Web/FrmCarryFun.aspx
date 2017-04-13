<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCarryFun.aspx.vb" Inherits="UI.Budget.Web.FrmCarryFun" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
    <style type="text/css">
        .Freezing {Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
        .FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
        .FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
        .FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
       
    </style>
    
    <script language="javascript" type="text/javascript">

        function check_Num() {
                            if ((event.keyCode >= 48 && event.keyCode <= 57)) { return true; }
                    else { event.keyCode = 0; false; }
                        }

                        function check_inputVal(parObj) { 
                            if ( parseFloat(replaceString(parObj.value,",","")) <0)
                            {
                                alert("不得輸入小於零數值。");
                                parObj.value = 0;
                                parObj.focus();
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



	function Setfocus(parObj) {
	    parObj.value = replaceString(parObj.value, ",", "");

	    parObj.select();
	}
		
		
		
		
    </script>
</head>
<body>
    <form id="form1" runat="server">
		<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="1000" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td vAlign="bottom" align="right" width="80">　</td>
											<td vAlign="bottom" align="left" width="80">　</td>
											<td vAlign="bottom" align="left" width="80"></td>
											<td vAlign="bottom" align="left" colspan="4">
												
												<table style="BORDER-COLLAPSE: collapse" cellSpacing="0" cellPadding="0" border="0">
													<tr>
														<td><FONT face="新細明體" color="#ff6633"><asp:label id="Label1" runat="server" Visible="False">指定類別</asp:label></FONT></td>
														<td><FONT face="新細明體" color="#ff6633"><asp:checkboxlist id="CBLOutlay" runat="server" Visible="False" ForeColor="#ff6633"></asp:checkboxlist></FONT></td>
														<td><FONT face="新細明體" color="#ff6633"><asp:label id="Label2" runat="server" Visible="False">科目年度別</asp:label></FONT></td>
														<td><FONT face="新細明體" color="#ff6633"><asp:textbox onkeypress="return check_Num()" id="TBNextYear" style="TEXT-ALIGN: center" runat="server"
																	Width="50px" Visible="False" ForeColor="#ff6633"></asp:textbox></FONT></td>
													</tr>
												</table>
												
											</td>
										</tr>
										</table>
																		</td>
							</tr>
							<tr>
								<td>

										<table  style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td align="right" width="80">年度</td>
											<td align="left" width="80"><asp:textbox onkeypress="return check_Num()" id="TBYear" style="TEXT-ALIGN: center" runat="server" onfocus="this.blur()"   Width="50px" BackColor="Transparent"></asp:textbox></td>
											<td align="right" width="80">動支編號</td>
											<td width="100"><asp:textbox id="TBacmWordNum" runat="server" Width="120px" style="TEXT-ALIGN:center"></asp:textbox></td>
											<td style="text-align:right; width:100px" >經費單位</td>
											<td  style="width:150px" ><asp:dropdownlist id="DDLBgtDep" runat="server"></asp:dropdownlist></td>
											<td style="text-align:right; width:100px" >執行單位</td>
											<td  style="width:150px" ><asp:dropdownlist id="DDLWorkDep" runat="server"></asp:dropdownlist></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" width="80">計畫</td>
											<td colspan="10"><asp:dropdownlist id="DDLPlan" runat="server" Width="550px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" width="80">用途別</td>
											<td vAlign="bottom" align="left" colspan="11"><asp:DropDownList id="DDLOul" runat="server"></asp:DropDownList></td>											
										</tr>
										<tr>
											<td width="250" colspan="2"><asp:button id="BtnList" runat="server" Text="列出資料"></asp:button></td>
											<td width="100"></td>
											<td></td>
											<td  >　</td>
											<td>　</td>
											<td>　</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="3" border="0">
										<tr>
											<td width="150"><asp:button id="BtnCarryNext" runat="server" Width="100px" Text="結轉至下年度" Height="22px"></asp:button></td>
											<td width="50"></td>
											<td style="WIDTH: 74px" width="74"><FONT face="新細明體">申請總數</FONT></td>
											<td width="100"><asp:label id="LBVisaTotal" runat="server" Width="100%"></asp:label></td>
											<td style="WIDTH: 77px" width="77"><FONT face="新細明體">剩餘總數</FONT></td>
											<td style="WIDTH: 148px" width="148"><FONT face="新細明體"><asp:label id="LBVisaLeftTotal" runat="server" Width="100%"></asp:label></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<div id="freezingDiv1" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 1500px; BORDER-BOTTOM: 1px groove; HEIGHT:'<%= strGrid1Height %>'">
									<asp:datagrid id="DataGrid1" runat="server" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False" Width="100%">
											<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" CssClass="Freezing"
												BackColor="#003366"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" runat="server"
															ToolTip="打勾全選"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="保留原因">
													<HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
													<ItemTemplate>
														<asp:TextBox id="TBReason" runat="server" Width="200px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container, "DataItem.acmReason") %>'>
														</asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="保留數準備">
													<HeaderStyle Width="80px"></HeaderStyle>
													<ItemTemplate>
														<asp:TextBox id="TBdgMoney1" onFocus="Setfocus(this)" onblur="check_inputVal(this);"  runat="server" Width="80px" style="text-align:Right" Text='<%# DataBinder.Eval(Container, "DataItem.保留數準備","{0:#,0}" ) %>'></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="應付歲出款">
													<HeaderStyle Width="80px"></HeaderStyle>
													<ItemTemplate>
														<asp:TextBox id="TBdgMoney0" onFocus="Setfocus(this)" onblur="check_inputVal(this);" runat="server" Width="80px" style="text-align:Right" Text='<%# DataBinder.Eval(Container, "DataItem.應付歲出款","{0:#,0}")  %>'  ></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="動支日期">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center" Width="60px"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Wrap="False" Width="100px"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Wrap="False" Width="60px"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right" Width="80px"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="剩餘金額" >
												<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgTotalMoneyUnPaid" style="text-align:right" runat="server"  Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.TotalMoneyUnPaid", "{0:#,0}").ToString()) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right" Width="80px"></ItemStyle>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="保留調整金額">
                                                    <HeaderStyle Width="60px" />
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvAdjustMoney" style="text-align:right" runat="server"  Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.保留調整數", "{0:#,0}").ToString()) %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="刪除">
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<HeaderTemplate>
														<asp:Label id="Label1" runat="server" BackColor="Transparent" tooltip="刪除保留資料">刪除</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBDel" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>

											    <asp:TemplateColumn Visible=false >
                                                    <ItemTemplate>
                                              <asp:Label ID="LBdgAcmYear"   runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmYear").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo1"   runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo1").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo2" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo2").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo2"   runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo2").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvPlanCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvPlanCode").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvOutlayYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayYear").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvOutlayCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayCode").ToString())%>'></asp:Label>

                                              <asp:Label ID="LBdgAcvBgtSourceCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBgtSourceCode").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBAcvAccKind" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvAccKind").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvBizCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBizCode").ToString())%>'></asp:Label>
                                                                                            
                                              <asp:Label ID="LBdgBgtDepCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtUnitNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgResPayNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.ResPayNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNoPrv" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNoPrv").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgDoneFlag" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.DoneFlag").ToString())%>'></asp:Label>
                                              </ItemTemplate>
                                                </asp:TemplateColumn>

											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
										</asp:datagrid>		
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgColor="#ffffff" height="10"><FONT face="新細明體"></FONT></td>
				</tr>
				<tr style="<%=strShowFlag %>">
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" width="100%"
							border="1">
							<tr>
								<td vAlign="bottom" align="left">
									<table cellSpacing="0" cellPadding="0" border="0">
										<tr>
											<td width="120"><asp:button id="BtnDelete" runat="server" Text="刪除已結轉" Height="22"></asp:button></td>
											<td><asp:button id="BtnPrint" runat="server" Width="75px" Visible="False" Text="列印" Height="22px"></asp:button></td>
											<td width="50"><FONT face="新細明體"></FONT></td>
											<td style="WIDTH: 70px"><FONT face="新細明體">結轉總數</FONT></td>
											<td><FONT face="新細明體"><asp:label id="LBCarryTotal" runat="server" Width="100%"></asp:label></FONT></td>
											<td><FONT face="新細明體"></FONT></td>
											<td><FONT face="新細明體"></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 1200px; BORDER-BOTTOM: 1px groove; HEIGHT: 300px"><asp:datagrid id="DataGrid2" runat="server" Width="100%" CellSpacing="1" BorderStyle="None" BackColor="White"
											CellPadding="3" GridLines="None" AutoGenerateColumns="False">
											<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle Font-Size="x-Small" BackColor="WhiteSmoke"></ItemStyle>
											<HeaderStyle Font-Size="x-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" CssClass="Freezing"
												BackColor="#003366"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect2',this.checked);" runat="server"
															ToolTip="打勾全選" Visible=false ></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect2" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="acmReason" SortExpression="acmReason" HeaderText="保留原因">
													<HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="簽證日期">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
													<HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="動支編號">                                                    
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip ='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
												<asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
													<HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvBgtKindSet" SortExpression="acvBgtKindSet" HeaderText="保留種類">
													<HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="TotalMoneyUnPaid" SortExpression="TotalMoneyUnPaid" HeaderText="剩餘金額"
													DataFormatString="{0:#,0}">
													<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
													<ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
												    <asp:TemplateColumn Visible=false >
                                                    <ItemTemplate>
                                              <asp:Label ID="LBdgAcmYear"   runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmYear").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo1"   runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo1").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo2" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo2").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo2"   runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo2").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvPlanCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvPlanCode").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvOutlayYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayYear").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvOutlayCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayCode").ToString())%>'></asp:Label>

                                              <asp:Label ID="LBdgAcvBgtSourceCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBgtSourceCode").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBAcvAccKind" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvAccKind").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvBizCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBizCode").ToString())%>'></asp:Label>
                                                                                            
                                              <asp:Label ID="LBdgBgtDepCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtUnitNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgResPayNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.ResPayNo").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNoPrv" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNoPrv").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgDoneFlag" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.DoneFlag").ToString())%>'></asp:Label>
                                              <asp:Label ID="LBdgPayCnt" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.PayCnt").ToString())%>'></asp:Label>
                                              </ItemTemplate>
                                                </asp:TemplateColumn>											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </form>
</body>
</html>
