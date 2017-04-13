<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPlanBgtAdj.aspx.vb" Inherits="UI.Budget.Web.FrmPlanBgtAdj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        	<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet"/>
		<script language="javascript" src="../ScriptFiles/PlanBgtAdj.js" type="text/javascript"></script>
    
        <script language="javascript" type="text/javascript">
        	
		function fnCallSearchDialog() {
		  
		    var strmod;
		    strmod="<%=strModFlag %>";
		    var strReturnVal = showModalDialog("FrmSearchPlanBgtAdj.aspx?mod=" + strmod ,  window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		    if (strReturnVal != "Cancel") {
		        document.all("TBFindSql").value = strReturnVal;
		    }

		   
		}
		
		
	function check_Num(){
				if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
					return true;}
				else{event.keyCode=0;false;}
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


        </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="820" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="600" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				<tr>
					<td>
					    <table border=0 cellpadding=2 cellspacing=0 width=100% style="table-layout:fixed">
							<tr style="display:none"  >
								<td  style="font-size:10pt"></td>
								<td  style="font-size:10pt"> </td>
								<td  style="font-size:10pt"> &nbsp;</td>
								<td  style="font-size:10pt"> 
                                    &nbsp;</td>
								<td  style="font-size:10pt">  
                                    <asp:CheckBox ID="CBAcmUnitPassFlag" runat="server"  
                                        Text="主管審核"  TextAlign="Left" /></td>
								<td style="font-size:10pt"><asp:CheckBox ID="CBAccPassFlag" runat="server" Text="會計室審核" TextAlign="Left" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr  style="display:none">
				    <td> <asp:Label ID="LBBgtNoIn" runat="server"></asp:Label> &nbsp; &nbsp;<asp:Label ID="LBBgtNoOut" runat="server"></asp:Label> &nbsp; &nbsp;<asp:Label ID="LBBgsNo" runat="server"></asp:Label></td>				     
				</tr>
				<tr >
					<td>
						<table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
						    <tr>
								<td align="right" style="width: 75px">經費年度</td>
								<td style="width: 110px">
								    <asp:TextBox ID="TBBgtYear" runat="server" Width="70px" BackColor="Transparent" 
                                        onfocus="this.blur();"  ></asp:TextBox>
								    </td>
								<td align="right" style="width: 70px"> 預算來源</td>
								<td style="width: 150px"><asp:DropDownList ID="DDLBgtSour" runat="server"></asp:DropDownList></td>
								<td align="right" style="width: 60px">門別</td>
								<td><asp:DropDownList ID="DDLAccKind" runat="server"></asp:DropDownList></td>
							</tr>
							<tr>
								<td align="right" style="width: 75px">核定日期</td>
								<td style="width: 110px"><asp:TextBox ID="TBBgtDate" 
                                        style="BACKGROUND-COLOR: #ffffe0" runat="server" Width="70px"  
                                        ondblclick="JavaScript: UCDate.Show();"  ></asp:TextBox></td>
								<td align="right" style="width: 70px"> 經費單位</td>
								<td style="width: 150px"><asp:DropDownList ID="DDLBgtDep" runat="server" AutoPostBack="True"></asp:DropDownList></td>
								<td align="right" style="width: 60px">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr >
								<td align="right">計畫科目</td>
								<td colspan=5><asp:DropDownList ID="DDLPlanName" runat="server" Width="500px" 
                                        AutoPostBack="True" ></asp:DropDownList></td>
							</tr>
							<tr >
								<td align="right">一級用途</td>
								<td><asp:DropDownList ID="DDLOulName" runat="server" AutoPostBack="True"></asp:DropDownList></td>
								 <td></td>
								 <td></td>
								 <td></td>
								  <td></td>
								 
							</tr>
							<tr style="display:none">
							    <td>預算金額</td>
							    <td><asp:TextBox ID="TBBgsMoney" runat="server" Width="100px" Style="TEXT-ALIGN: right;background-color: #FFFFE0"   onFocus="this.select()" onkeypress="return check_Num()" ></asp:TextBox></td>
							    <td></td>
							    <td></td>
							     <td></td>
								 <td></td>
							</tr>
							<tr>
							    <td style="width: 75px; text-align: right;">備&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;註</td>
							    <td colspan="5">
                                    <asp:TextBox ID="TBBgsMemo" style="BACKGROUND-COLOR: #ffffe0" 
                                        runat="server" Width="475px"></asp:TextBox><input id="BtnPhrase" runat="server" type="button" value="..." onclick="fnCallPhraseDialog('TBAcmMemo');"/></td>
							</tr>
						</table>
					</td>
				</tr>   
				<tr>
				    <td>
				        <table>
                            <tr>
                                <td style="font-size:small">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
				            <tr>
				                <td style="text-align:right">月份</td><td><asp:dropdownlist id="DDLBgtMonth" runat="server" Width="50px" AutoPostBack="True">                                                                   
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
                                                            </asp:dropdownlist>
                                </td><td>該月分配數</td>
				            </tr>
				            <tr>
				                <td  style="text-align:right"><asp:Label ID="LBOulOut" runat="server" Text="流出用途別"></asp:Label>
                                </td><td>
                                    <asp:DropDownList ID="DDLOulOut" runat="server" Width="390px" 
                                        MyName="DDLOulOut"  AutoPostBack="True"></asp:DropDownList>
                                </td><td>
                                    <asp:Label ID="LBMonthOut" runat="server"></asp:Label></td>
				            </tr>
				            <tr >
				                <td  style="text-align:right"><asp:Label ID="LBOulIn" runat="server" Text="流入用途別"></asp:Label>
                                    </td>
				                <td>
                                    <asp:DropDownList ID="DDLOulIn" runat="server" Width="390px"  
                                        MyName="DDLOulIn"  AutoPostBack="True"></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="LBMonthIn" runat="server"></asp:Label></td>
				            </tr>
				            <tr>
				                <td  style="text-align:right">流入金額</td>
				                <td>
                                    <asp:TextBox ID="TBBgtMoney" runat="server" Width=120px 
                                        Style="TEXT-ALIGN: right;background-color: #FFFFE0"   onFocus="this.select()" 
                                        onkeypress="return check_Num()"></asp:TextBox>
                                    <asp:label id="LBUnitName" runat="server" Font-Size="X-Small" ForeColor="Red">(單位：千元)</asp:label>
                                </td>
                                <td>&nbsp;</td>
				            </tr>
				        </table>
				    </td>
				</tr>
				</table>
		</td>
		<td valign="top" bgcolor="#ffffff" rowspan="3" style="width: 200px"><iframe id="iFrame" border="0" name="iFrame" frameborder="0" width="200" scrolling="no" height="450"></iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="5"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
				<tr>
					<td valign="bottom" align="left">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Height="22"  Visible=false ></asp:button></td>
								<td valign="bottom" align="center"><input id="Hidden1" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql" runat="server" /></td>
								<td valign="bottom" align="center">
                                    &nbsp;</td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找序號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找序號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="width: 576px"><asp:datagrid id="DataGrid1" runat="server" Width="600px" AutoGenerateColumns="False" AllowSorting="True"
										AllowPaging="True" PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
												<HeaderStyle Width="30px" />
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="bgsYear" HeaderText="年度">
												<HeaderStyle Width="30px" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsNo" HeaderText="序號">
												<HeaderStyle Width="30px" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsDate" HeaderText="核定日期">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgtMoneyIn" HeaderText="流入金額"  DataFormatString="{0:#,#}">
												<HeaderStyle Width="60px"></HeaderStyle>
											    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" 
                                                    VerticalAlign="Middle" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bgsMemo" HeaderText="備註">
											</asp:BoundColumn>											
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
				</tr>
				<tr>
					<td align="right" >
					<table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                                    <tr>
                                    <td><font size="2">只列出｜</font></td>
                                    <td>&nbsp;</td>
                                    <td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
                                    </tr>
                            </table>
                            </td>
				</tr>
			</table>
		</td>
	</tr>
</table><script language="javascript"> setShowBudget();</script>
 </form>
</body>
</html>
