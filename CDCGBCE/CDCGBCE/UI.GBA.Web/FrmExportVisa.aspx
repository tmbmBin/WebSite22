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
											<td style="WIDTH: 50px" vAlign="bottom" align="right">���</td>
											<td style="WIDTH: 100px" vAlign="bottom" align="left"><asp:textbox id="TBTranBNo" runat="server" Width="96px" MaxLength="7"></asp:textbox></td>
											<td style="WIDTH: 50px" vAlign="bottom" align="right">�帹</td>
											<td vAlign="bottom" align="left"><asp:textbox id="TBBNo1" runat="server" Width="40px" MaxLength="1"></asp:textbox><asp:label id="Label1" runat="server" ForeColor="Blue" Font-Size="X-Small">�������J�ɡA�t�η|�H���Ѫ�����۰ʲ��ͷ|�X�s���C</asp:label></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:DropDownList id="DDLAcmYear" runat="server" Width="100px"></asp:DropDownList><asp:button id="BtnFilter" runat="server" Text="�L�o���" Height="22px"></asp:button></td>
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
											<ItemStyle Font-Size="X-Small" Font-Names="�s�ө���" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Font-Names="�s�ө���" Font-Bold="True" ForeColor="#F7F7F7" CssClass="Freezing"
												BackColor="#4A3C8C"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="���">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect',this.checked);" runat="server"
															ToolTip="���ĥ���" visible="false"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="acmYear" HeaderText="�~��">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="30px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acpGroupNo" SortExpression="acpGroupNo" HeaderText="�ץX�帹">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="�ʤ�s��">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="accKindName" SortExpression="acvAccKind" HeaderText="�g��O">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="50px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="orgName" SortExpression="acvBgtSourceCode" HeaderText="�w��ӷ�">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="trnEntryNo" HeaderText="�|�p����">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="WorkPlanName" SortExpression="WorkPlanCode" HeaderText="�u�@�p�e">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="SubPlanName" SortExpression="SubPlanCode" HeaderText="����p�e">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="oulOutlayName" SortExpression="acvOutlayCode" HeaderText="�γ~�O�W��">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMoney" HeaderText="���B" DataFormatString="{0:#,0}">
													<HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="acvMemo" HeaderText="�Ƶ�">
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
												<asp:BoundColumn Visible="true" DataField="acpPayNo" HeaderText="���丹"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvSubNo" HeaderText="acvSubNo-20"></asp:BoundColumn>
												<asp:BoundColumn Visible="true" DataField="acpPayNo1" HeaderText="�ॿ��"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvSubNo1" HeaderText="acvSubNo1-22"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acpGroupNo" HeaderText="acpGroupNo-23"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvOutlayCode" HeaderText="�γ~�O�N�X-24"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvPlanCode" HeaderText="�p�e�N�X-25"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvOutlayYear" HeaderText="��ئ~�קO-26"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvTranID" HeaderText="�פJ�Ǹ�-27"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="acvTranBNo" HeaderText="�帹-28"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="SelectFlag" HeaderText="SeectlFlag-29"></asp:BoundColumn>
												<asp:BoundColumn DataField="acvExchNo" HeaderText="�ǲ����X"></asp:BoundColumn>
												<asp:BoundColumn DataField="acvExchNo1" HeaderText="ú�^�ǲ����X"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="��m" Visible=false >
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
											<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="�s�W" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="�ק�" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="�R��" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="�x�s" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="����" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="�d��" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><input type="button" id="BtnPrint1" runat="server" style="width: 50px; height: 22px" value="�C�L"  onclick="fnCallReportMenu();"  /><asp:button id="BtnPrint" runat="server" Text="�C�L" Height="22" Visible=false></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Text="���}" Height="22" Visible="False"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExport" runat="server" Text="�ץX" Height="22"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
													id="TBSearchSql" onblur='if(this.value==""){this.value="�M��ץX�s��";}' style="TEXT-ALIGN: center" onfocus="this.select()" onclick='this.value=""'
													runat="server" Width="100px" AutoPostBack="True">�M��ץX�s��</asp:textbox><input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button"
													value="s"></td>
											<td><INPUT id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="Hidden1"
													runat="server"><INPUT id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="Hidden1"
													runat="server">
											</td>
											<td vAlign="bottom" align="center"><asp:button id="BtnImport" runat="server" Text="�ǲ����X�פJ"></asp:button></td>
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
											<asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="acvTranBNo" SortExpression="acvTranBNo" HeaderText="�ץX�s��">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acvTranIDCnt" SortExpression="acvTranIDCnt" HeaderText="���}�ǲ���">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acvExchNoCnt" SortExpression="acvExchNoCnt" HeaderText="�w�}�ǲ���">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="OutputCnt" SortExpression="OutputCnt" HeaderText="�w�ץX">
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
											<td><font size="2">�u�C�X�U</font></td>
											<td>&nbsp;
												<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
													<asp:ListItem Value=""></asp:ListItem>
													<asp:ListItem Value="1">&#160;&#160;1��</asp:ListItem>
													<asp:ListItem Value="2">&#160;&#160;2��</asp:ListItem>
													<asp:ListItem Value="3">&#160;&#160;3��</asp:ListItem>
													<asp:ListItem Value="4">&#160;&#160;4��</asp:ListItem>
													<asp:ListItem Value="5">&#160;&#160;5��</asp:ListItem>
													<asp:ListItem Value="6">&#160;&#160;6��</asp:ListItem>
													<asp:ListItem Value="7">&#160;&#160;7��</asp:ListItem>
													<asp:ListItem Value="8">&#160;&#160;8��</asp:ListItem>
													<asp:ListItem Value="9">&#160;&#160;9��</asp:ListItem>
													<asp:ListItem Value="10">10��</asp:ListItem>
													<asp:ListItem Value="11">11��</asp:ListItem>
													<asp:ListItem Value="12">12��</asp:ListItem>
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
