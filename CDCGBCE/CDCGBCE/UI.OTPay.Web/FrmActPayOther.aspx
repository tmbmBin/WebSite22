<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActPayOther.aspx.vb" Inherits="UI.OTPay.Web.FrmActPayOther" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html>
<head id="Head1" runat="server">
<title></title>
<base target="_self" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link type="text/css" rel="stylesheet" href="../CSSFiles/calendarStyle.css"/>
<link type="text/css" rel="stylesheet" href="CSSFiles/FrmActPayOther.css"/>

<script language="javascript" type="text/javascript" src="../ScriptFiles/ShowBgtWeb/ShowBudget.js"></script>
<script language="javascript" type="text/javascript" src="../ScriptFiles/JSPlanPicker.js"></script>
<script language="javascript" type="text/javascript" src="../ScriptFiles/setSeleGroup.js"></script>
<script language="javascript" type="text/javascript" src="../ScriptFiles/SearchNum.js"></script>
<script language="javascript" type="text/javascript" src="../ScriptFiles/JSComFun.js"></script>                                                     
<script language="javascript" type="text/javascript" src="ScriptFiles/FrmActPayOther.js"></script>

<style>

</style>

</head>
<body topmargin="5" leftmargin="10" rightmargin="0" bottommargin="50" onload='get_cookies();showfiled();ShowAddVisaData();' onunload='set_cookies()'>
	<form id="form1" runat="server">
	        <table  id="TablePass" runat="server" style="MARGIN-TOP: 0px; MARGIN-LEFT: 0px; BORDER-COLLAPSE: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
	        <tr>
		        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
			        <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				        <tr>
					        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			                     <table  border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout:fixed">
                                    <tr >
                                        <td style="color: #FF0000; width: 75px;" align="right"><asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label></td>
                                        <td style="width: 110px;" ><asp:TextBox id="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox></td>
                                        <td style="color: #FF0000;width: 85px;" align="right" ></td> 
                                        <td style="width: 110px;"></td>
                                        <td ></td>
                                        <td ></td>
                                    </tr>                                  
                                 </table> 
					        </td>
				        </tr>
			        </table>
		        </td>
	        </tr>
	        <tr bgcolor="#FFFFFF"><td style="height:10px"></td></tr>
        </table> 
	<table border="0" cellpadding="0" style="border-collapse: collapse">
		<tr>
			<td valign="top">
			<!-- 左框架START -->
			<table cellpadding="0" style="border-collapse: collapse" border="0">
				<tr>
					<td valign="top">
					<table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668" bgcolor="#DADEE9">
						<tr>
							<td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
							<!-- ↓審核原因 -->

							<!-- 審核原因↑ -->
								 <div id="divdatamsg" runat="server" style="position: absolute; width: auto; height:auto; z-index: 3"  >
	    <table border="0" cellpadding="0"cellspacing="0"  style="background-color: Aqua">
	        <tr>
	            <td><asp:Label ID="LBDataMsg" runat="server" Text="" ForeColor="Red" Font-Size="X-Small" ></asp:Label></td>
	        </tr>
	    </table>
	</div>

							
							<!-- ↓審核 -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 5px"><input runat="server" id="TBOtherUnitFlag" type="hidden" />
									<table cellpadding="0" style="border-collapse: collapse; width: 590px" border="0">
										<tr>
											<td align="right">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" style="padding-left: 5px; display:none" nowrap><asp:CheckBox id="CBAcmUnitPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Visible="True" Text="單位審核" /></td>
													<td align="right" style="padding-left: 5px; display:none" nowrap><asp:CheckBox id="CBSecrearyFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="秘書室審核" /></td>
													<td align="right" style="padding-left: 5px" nowrap><asp:CheckBox id="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="會計室審核" /></td>
												</tr>
											</table>
											</td>
										</tr>
									</table>

									</td>
								</tr>
							</table>
							
								<!-- 審核↑ -->
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 602px; display:none" border="1" bordercolor="#FFFFFF">
                                <tr>
	                                <td style="padding: 0px">
											   <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed; width:600px">
                                                    <tr>
                                                        <td style="text-align:left">
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBAllowanceFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="零用金" Visible="True" onclick="chkTmpPayAndCash();" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBSeparateFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="分期付款" Visible="True" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBEPayment" runat="server" Font-Size="X-Small" TextAlign="Right" Text="電子支付" Visible="True" /></td>
                                                                    <td style="padding-right: 5px" nowrap><asp:CheckBox id="CBDocFlag" runat="server" Font-Size="X-Small" TextAlign="Right" Text="簽文" Visible="True" />
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="text-align:right">
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 5px" nowrap>&nbsp;</td>
	                                                                <td style="padding-right: 5px" nowrap>&nbsp;</td>
	                                                                <td style="padding-right: 5px" nowrap><asp:CheckBox ID="CBAutoTempPay" runat="server" Font-Size="X-Small" TextAlign="Right" Text="逕行暫付" Visible="True" onclick="showfiled(this);chkTmpPayAndCash();" /><asp:CheckBox ID="CBAddVisa" runat="server" Font-Size="X-Small" TextAlign="Right" Text="加簽" Visible="True"  onclick="ShowAddVisaData(this);"  /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
	                                </td>
                                </tr>                             
                            </table>
						
							    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                            	<asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
															<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="2" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr>
										<td>
                                            <input id="BtnPayDtlData" runat="server" type="button" value="黏存單付款說明"   />
                                            <input runat="server" id="TBPayDtlData" type="hidden" />
                                            <asp:Label ID="Label1" runat="server" Text="←本功能請編輯存檔主資料後，才能繼續編輯黏存單付款說明。" 
                                                Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                            </td>
										</tr>
									</table>
									</td>
								</tr>
							</table>

							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			<!-- ↓歷史資料 -->
			<table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
				<tr>
					<td>
					<table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
						<tr>
							<td>
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td><asp:button id="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:button></td>
									<td><asp:Button id="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:Button></td>
									<td><input type="button" id="BtnPrint1" runat="server" 
                                            style="width: 50px; height: 22px" value="列印" visible="True"  /></td>
									<td style="display:none">&nbsp;</td>
									<td><asp:textbox id="TBSearchSql" runat="server" style="TEXT-ALIGN: center; width: 90px" onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" onblur="if(this.value==''){this.value='尋找動支編號';}" onfocus="this.select()" onclick="this.value=''" AutoPostBack="True">尋找動支編號</asp:textbox><input type="button" style="HEIGHT: 22px; WIDTH: 16px; font-family: Webdings; font-size:8pt" value="s"></td>
									<td><input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" /></td>
									<td><input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" /><input type="hidden" id="ctl_SessionID" runat="server" name="ctl_SessionID" />
                                            <asp:Button ID="btnOpenOTData" runat="server" Text="選取加班資料" 
                                            BackColor="#009933" />
                                            </td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<div id="_freezingDiv" class="DIV0_width">
							<asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="5">
								<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
								<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
								<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
								<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
								<Columns>
									<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
										<HeaderStyle Width="30px" />
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
									</asp:ButtonColumn>
									<asp:BoundColumn DataField="acmYear" HeaderText="年度">
										<HeaderStyle Width="30px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="簽證系統號" SortExpression="acmNo">
										<HeaderStyle Width="30px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期" SortExpression="acmMarkDate">
										<HeaderStyle Width="60px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
										<ItemTemplate>
											<asp:Label ID="Label1" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="DepName" HeaderText="承辦單位" SortExpression="DepName">
										<HeaderStyle Width="80px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="acmWorkUserNo" HeaderText="承辦人員" SortExpression="acmWorkUserNo">
										<HeaderStyle Width="60px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="acmMoney" HeaderText="動支金額" DataFormatString="{0:#,#}" SortExpression="acmMoney" >
										<HeaderStyle Width="70px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Right"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="acmMemo" HeaderText="控帳事由" SortExpression="acmMemo"></asp:BoundColumn>
									<asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動" SortExpression="acmModifyUser">
										<HeaderStyle Width="60px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="P1Counter" HeaderText="P1Counter-10">
										<HeaderStyle Width="60px"></HeaderStyle>
									</asp:BoundColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
							</div>
							</td>
						</tr>
						<tr>
							<td>
							<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
								<tr>
									<td><font size="2">共 <asp:Label ID="LBRecordCnt" runat="server" style="text-align:center"></asp:Label> 筆資料</font></td>
									<td align="right">
									<table cellpadding="0" style="border-collapse: collapse" border="0">
										<tr>
											<td><font size="2">只列出｜</font></td>
											<td>
												<asp:DropDownList id="DDLSortMonth" runat="server" AutoPostBack="True">
													<asp:ListItem Value="0">…</asp:ListItem>
													<asp:ListItem Value="1">&nbsp;&nbsp;1月</asp:ListItem>
													<asp:ListItem Value="2">&nbsp;&nbsp;2月</asp:ListItem>
													<asp:ListItem Value="3">&nbsp;&nbsp;3月</asp:ListItem>
													<asp:ListItem Value="4">&nbsp;&nbsp;4月</asp:ListItem>
													<asp:ListItem Value="5">&nbsp;&nbsp;5月</asp:ListItem>
													<asp:ListItem Value="6">&nbsp;&nbsp;6月</asp:ListItem>
													<asp:ListItem Value="7">&nbsp;&nbsp;7月</asp:ListItem>
													<asp:ListItem Value="8">&nbsp;&nbsp;8月</asp:ListItem>
													<asp:ListItem Value="9">&nbsp;&nbsp;9月</asp:ListItem>
													<asp:ListItem Value="10">10月</asp:ListItem>
													<asp:ListItem Value="11">11月</asp:ListItem>
													<asp:ListItem Value="12">12月</asp:ListItem>
												</asp:DropDownList>
											</td>
											<td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											<td><asp:DropDownList ID="DDLSortAccPassFlag" runat="server" AutoPostBack="True">
													<asp:ListItem Value="0">未審核</asp:ListItem>
													<asp:ListItem Value="1">已審核</asp:ListItem>
													<asp:ListItem Value="">不區分</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			<!--歷史資料↑ -->
			<!-- 左框架END -->
			</td>
			<td width="5">　</td>
			<td valign="top" width="200"><iframe id="iFrame" name="iFrame" border="0" frameborder="0" scrolling="no" width="200" height="520"></iframe></td>
		</tr>
	</table>

	<script language="javascript">	    if (document.all("BtnSave").disabled) setShowBudget();</script>
	</form>
</body>
</html>