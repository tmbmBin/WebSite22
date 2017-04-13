<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmExportVisa.aspx.vb" Inherits="UI.GBA.Web.FrmExportVisa"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmExportVisa</title>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
		<style type="text/css">
            .Freezing11 { z-index: 10; position: relative;table-layout:fixed ; top: expression(this.offsetParent.scrollTop+0); height: 24px }
            .Freezing {position:relative ;  table-layout:fixed;top:expression(this.offsetParent.scrollTop);z-index: 10;} 
            .Freezing th{text-overflow:ellipsis;overflow:hidden;white-space: nowrap;padding:2px;} 
            .FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
            .FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
            .FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
        </style>
        <script language="javascript">
            function fnCallFilterDialog()
            {
                var strReturnVal=showModalDialog("FrmFilterSql.aspx?showtype=1",window,"dialogWidth:630px;dialogHeight:350px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

                if (strReturnVal != "Cancel")
                {
                    Form1.TBFilterSql.value=strReturnVal;
                    //document.all("TextBox1").value=strReturnVal;
                }
            }


            function fnCallSearchDialog()
            {

                var strReturnVal=showModalDialog("FrmSearchExportVisa.aspx?showtype=1",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

                if (strReturnVal != "Cancel")
                {
                    Form1.TBFindSql.value=strReturnVal;
                }
 

            }
function  fnCallReportMenu(){
	var strParams="";
	 strParams = "&acmyear=" + <%=Session("default_Year") %> + "&TranBNo=" + document.all("TBTranBNo").value + "&TranSubNo=" + document.all("TBBNo1").value + "&page1qty=6&page2qty=43" ;
	 window.open("../UI.GBARpt.Web/FrmRptMenu.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;


  }

		</script>
	</HEAD>
	<body >
		<form id="Form1" method="post" runat="server">
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="950" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td style="WIDTH: 50px" vAlign="bottom" align="right">日期</td>
											<td style="WIDTH: 100px" vAlign="bottom" align="left"><asp:textbox id="TBTranBNo" runat="server" Width="96px" MaxLength="7"></asp:textbox></td>
											<td style="WIDTH: 50px" vAlign="bottom" align="right">批號</td>
											<td vAlign="bottom" align="left"><asp:textbox id="TBBNo1" runat="server" Width="40px" MaxLength="1"></asp:textbox><asp:label id="Label1" runat="server" ForeColor="Blue" Font-Size="X-Small">日期不輸入時，系統會以今天的日期自動產生會出編號。</asp:label></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:DropDownList id="DDLAcmYear" runat="server" Width="100px"></asp:DropDownList><asp:button id="BtnFilter" runat="server" Text="過濾資料" Height="22px"></asp:button></td>
							</tr>
							<tr>
								<td style="height: 418px"><% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
									<DIV id=MyDiv style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 950px; BORDER-BOTTOM: 1px groove; HEIGHT: 400px"  persistid="<%= savescrollpos.uniqueid %>"  scrollpos="<%= savescrollpos.value %>"><input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
										<INPUT id="TBFilterSql" type="hidden" name="Hidden1" runat="server">
										<asp:datagrid id="DataGrid2" runat="server" Width="100%" AutoGenerateColumns="False"  
											GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#E7E7FF">
											<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
											<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
											<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7" CssClass="Freezing"
												BackColor="#4A3C8C"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect',this.checked);" runat="server"
															ToolTip="打勾全選" visible="false"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="acmYear" HeaderText="年度">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acpGroupNo" SortExpression="acpGroupNo" HeaderText="匯出批號">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="accKindName" SortExpression="acvAccKind" HeaderText="經資別">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="50px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="orgName" SortExpression="acvBgtSourceCode" HeaderText="預算來源">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="trnEntryNo" HeaderText="會計分錄">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="WorkPlanName" SortExpression="WorkPlanCode" HeaderText="工作計畫">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="SubPlanName" SortExpression="SubPlanCode" HeaderText="分支計畫">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="oulOutlayName" SortExpression="acvOutlayCode" HeaderText="用途別名稱">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" HeaderText="金額" DataFormatString="{0:#,0}">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMemo" HeaderText="備註">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="acmNo-12"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo1" HeaderText="acmNo1-13"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acmNo2" HeaderText="acmNo2-14"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo" HeaderText="acvNo-15"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo1" HeaderText="acvNo1-16"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvNo2" HeaderText="acvNo2-17"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpPayYear" HeaderText="acpPayYear-18"></asp:BoundColumn>
												<asp:BoundColumn Visible="true" DataField="acpPayNo" HeaderText="報支號"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvSubNo" HeaderText="acvSubNo-20"></asp:BoundColumn>
												<asp:BoundColumn Visible="true" DataField="acpPayNo1" HeaderText="轉正號"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvSubNo1" HeaderText="acvSubNo1-22"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpGroupNo" HeaderText="acpGroupNo-23"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvOutlayCode" HeaderText="用途別代碼-24"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvPlanCode" HeaderText="計畫代碼-25"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvOutlayYear" HeaderText="科目年度別-26"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvTranID" HeaderText="匯入序號-27"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvTranBNo" HeaderText="批號-28"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="SelectFlag" HeaderText="SeectlFlag-29"></asp:BoundColumn>
												<asp:BoundColumn DataField="acvExchNo" HeaderText="傳票號碼"></asp:BoundColumn>
												<asp:BoundColumn DataField="acvExchNo1" HeaderText="繳回傳票號碼"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="位置" Visible=false >
													<ItemTemplate>
														<asp:Label id="LBLocatoin" runat="server"></asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></DIV>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgColor="#ffffff" height="10"></td>
				</tr>
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
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
											<td vAlign="bottom" align="center"><input type="button" id="BtnPrint1" runat="server" style="width: 50px; height: 22px" value="列印"  onclick="fnCallReportMenu();"  /><asp:button id="BtnPrint" runat="server" Text="列印" Height="22" Visible=false></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Text="離開" Height="22" Visible="False"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExport" runat="server" Text="匯出" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
													id="TBSearchSql" onblur='if(this.value==""){this.value="尋找匯出編號";}' style="TEXT-ALIGN: center" onfocus="this.select()" onclick='this.value=""'
													runat="server" Width="100px" AutoPostBack="True">尋找匯出編號</asp:textbox><input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
													value="s"></td>
											<td><INPUT id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="Hidden1"
													runat="server"><INPUT id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="Hidden1"
													runat="server">
											</td>
											<td vAlign="bottom" align="center"><asp:button id="BtnImport" runat="server" Text="傳票號碼匯入"></asp:button></td>
											<td vAlign="bottom" align="center"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True"
										PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="acvTranBNo" SortExpression="acvTranBNo" HeaderText="匯出編號">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acvTranIDCnt" SortExpression="acvTranIDCnt" HeaderText="應開傳票數">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acvExchNoCnt" SortExpression="acvExchNoCnt" HeaderText="已開傳票數">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="OutputCnt" SortExpression="OutputCnt" HeaderText="已匯出">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="right">
									<table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
										<tr>
											<td><font size="2">只列出｜</font></td>
											<td>&nbsp;
												<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
													<asp:ListItem Value=""></asp:ListItem>
													<asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
													<asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
													<asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
													<asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
													<asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
													<asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
													<asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
													<asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
													<asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
													<asp:ListItem Value="10">10月</asp:ListItem>
													<asp:ListItem Value="11">11月</asp:ListItem>
													<asp:ListItem Value="12">12月</asp:ListItem>
												</asp:dropdownlist></td>
											<td><asp:dropdownlist id="DDLSortDep" runat="server" Visible="False" AutoPostBack="True"></asp:dropdownlist></td>
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
</HTML>
