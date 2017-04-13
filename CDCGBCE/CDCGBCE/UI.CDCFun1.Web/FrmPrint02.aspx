<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPrint02.aspx.vb" Inherits="UI.CDCFun1.Web.FrmPrint02" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    	<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<script language="javascript">
		function UCSDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBSDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}
		function UCEDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
}
			
		function ChangeOpt(Opt1, Opt2) {
			    var Tmp_value = Opt1.value;
			    var Tmp_text = Opt1.text;
			    var Tmp_selected = Opt1.selected;
			    Opt1.value = Opt2.value;
			    Opt1.text = Opt2.text;
			    Opt1.selected = Opt2.selected;
			    Opt2.value = Tmp_value;
			    Opt2.text = Tmp_text;
			    Opt2.selected = Tmp_selected;
			}
			function putUp(setObj) {
			    var ChgCnt = 0;
			    for (var i = 0; i < setObj.options.length; i++)
			        if (setObj.options[i].selected && i > 0) {
			        ChangeOpt(setObj.options[i], setObj.options[i - 1]);
			        ChgCnt++;
			    }
			    return ChgCnt;
			}
			function putDn(setObj) {
			    var ChgCnt = 0;
			    for (var i = setObj.options.length - 1; i >= 0; i--)
			        if (setObj.options[i].selected && i < setObj.options.length - 1) {
			        ChangeOpt(setObj.options[i], setObj.options[i + 1]);
			        ChgCnt++;
			    }
			    return ChgCnt;
			}
			function putUpEnd(setObj) {
			    var ChgCnt = 0;
			    var Cnt;
			    if (setObj.options.length > 0)
			        while (!setObj.options[0].selected)
			        if ((Cnt = putUp(setObj)) <= 0) break;
			    else ChgCnt += Cnt;
			    return ChgCnt;
			}
			function putDnEnd(setObj) {
			    var ChgCnt = 0;
			    var Cnt;
			    if (setObj.options.length > 0)
			        while (!setObj.options[setObj.options.length - 1].selected)
			        if ((Cnt = putDn(setObj)) <= 0) break;
			    else ChgCnt += Cnt;
			    return ChgCnt;
			}
			function moveOpt(setObj, setObjDest, AllFlag) {
			    var MovCnt = 0;
			    var MovFirstIdx = -1;
			    for (var i = 0; i < setObj.options.length; i++)
			        if (setObj.options[i].selected || AllFlag) {
			        if (MovFirstIdx == -1) {
			            for (var j = 0; j < setObjDest.options.length; j++)
			                setObjDest.options[j].selected = false;
			            MovFirstIdx = i;
			        }
			        setObjDest.options.add(new Option(setObj.options[i].text, setObj.options[i].value));
			        setObjDest.options[setObjDest.options.length - 1].selected = setObj.options[i].selected;
			        setObj.options.remove(i);
			        MovCnt++;
			        i--;
			    }
			    if (!AllFlag) {
			        if (MovFirstIdx < 0) MovFirstIdx = 0;
			        if (MovFirstIdx >= setObj.options.length) MovFirstIdx = setObj.options.length - 1;
			        if (MovFirstIdx >= 0) setObj.options[MovFirstIdx].selected = true;
			    }
			    return MovCnt;
			}
			function getSeleOptVal(setObj, AllFlag, Spc) {
			    var OptVal = "";
			    for (var i = 0; i < setObj.options.length; i++)
			        if (setObj.options[i].selected || AllFlag) {
			        if (Spc && OptVal != "") OptVal += Spc + setObj.options[i].value;
			        else OptVal += setObj.options[i].value;
			    }

			    return OptVal;
			}
		</script>
</head>
<body>
    <form id="form1" runat="server">
			<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellPadding="5" width="840" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table id="myTable" runat=server  style="table-layout:fixed" cellSpacing="0" cellPadding="5" width="100%" border="0">
									    <tr style="display:none">
									        <td align="right" width="90"></td>
									        <td align="right" width="160"></td>
									        <td align="right" width="90"></td>
									        <td align="right" width="160"></td>
									        <td><INPUT id="TBGroupFiled" type="hidden" runat="server"></td>
									    </tr>
										<tr>
											<td align="right" width="90">日期區間</td>
											<td colSpan="3"><asp:textbox id="TBSDate" ondblclick="JavaScript: UCSDate.Show();" 
                                                    runat="server" Width="80px"></asp:textbox>至
													<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
													<asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>　</td>
													<td rowspan="6">
													<table id="TABLE1" style="BORDER-COLLAPSE: collapse" borderColor="#cc9999" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server" >
													<tr>
														<td></td>
														<td vAlign="middle" align="center"><font size="2">已選項目</font></td>
														<td></td>
														<td vAlign="middle" align="center"><font size="2">待選項目</td>
													</tr>
													<tr>
														<td><input title="置頂" onclick="if(putUpEnd(document.all.ListBox1)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="╤"><br>
															<br>
															<input title="上移" onclick="if(putUp(document.all.ListBox1)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="↑"><br>
															<br>
															<input title="下移" onclick="if(putDn(document.all.ListBox1)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="↓"><br>
															<br>
															<input title="置底" onclick="if(putDnEnd(document.all.ListBox1)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="╧">
														</td>
														<td><asp:listbox id="ListBox1" runat="server" Width="110px" Height="150px" 
                                                                SelectionMode="Multiple"></asp:listbox></td>
														<td><input title="全部左移" onclick="if(moveOpt(document.all.ListBox2,document.all.ListBox1,true)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="<<"><br>
															<br>
															<input title="左移" onclick="if(moveOpt(document.all.ListBox2,document.all.ListBox1)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="＜"><br>
															<br>
															<input title="右移" onclick="if(moveOpt(document.all.ListBox1,document.all.ListBox2)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value="＞"><br>
															<br>
															<input title="全部右移" onclick="if(moveOpt(document.all.ListBox1,document.all.ListBox2,true)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.ListBox1,true);"
																type="button" value=">>">
														</td>
														<td><asp:listbox id="ListBox2" runat="server" Width="110px" Height="150px" 
                                                                SelectionMode="Multiple">																
																<asp:ListItem Value="門">門別</asp:ListItem>
																<asp:ListItem Value="預">經費單位</asp:ListItem>
																<asp:ListItem Value="申">執行單位</asp:ListItem>
																<asp:ListItem Value="承">承辦業務</asp:ListItem>
																<asp:ListItem Value="計">計畫科目</asp:ListItem>
																<asp:ListItem Value="用">用途別科目</asp:ListItem>
															</asp:listbox></td>
													</tr>
												</table>
													
													</td>
										</tr>
										<tr  >
											<td align="right" width="90">經資門別</td>
											<td width="150" ><asp:dropdownlist id="DDLAccKind" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" >　</td>
											<td style="WIDTH: 150px" align="left" >　</td>
										</tr>
										<tr>
											<td align="right" width="90" >經費單位</td>
											<td width="150" ><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" ></asp:dropdownlist></td>
											<td align="right" width="90">執行單位</td>
											<td style="WIDTH: 150px" align="left">
											<asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px" ></asp:dropdownlist></td>
										</tr>
										<tr >
											<td align="right" width="90" valign="top">計畫科目</td>
											<td colspan="3" valign="top"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90" valign="top">用途別科目</td>
											<td colspan="2" valign="top" width="120"><asp:dropdownlist id="DDLOul" runat="server"></asp:dropdownlist></td>
											<td align="left" width="150" valign="top">　</td>
										</tr>
										<tr>
											<td align="right" width="90" valign="top">
											預算來源</td>
											<td width="120"  ><asp:dropdownlist id="DDLBgtSource" runat="server" Width="144px" 
                                                    AutoPostBack="True"></asp:dropdownlist></td>
											<td width="90" align="right">承辦業務別</td>
											<td align="left" width="150" valign="top"><asp:dropdownlist id="DDLBizName" 
                                                    runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
										</tr>
<tr>
											<td align="right" width="90" valign="top">承辦人員</td>
											<td width="120"  ><asp:TextBox ID="TBUserName" runat="server" Width="150px"></asp:TextBox>
                                            </td>
											<td width="90" align="right">廠商名稱</td>
											<td align="left"   colspan="2">
                                                <asp:TextBox ID="TBPayName" 
                                                    runat="server" Width="300px"></asp:TextBox></td>
										</tr>
<tr>
											<td align="right" width="90" valign="top">
											動支編號</td>
											<td width="120"  ><asp:TextBox ID="TBAcmWordNum" runat="server" Width="150px"></asp:TextBox>
                                            </td>
											<td width="90" align="right">備註事由</td>
											<td align="left" width="150" colspan="2"  >
                                                <asp:TextBox ID="TBMemo" runat="server" 
                                                    Width="300px"></asp:TextBox></td>
											 
										</tr>
<tr>
											<td align="right" width="90" valign="top">
											傳票號碼</td>
											<td width="120"  ><asp:TextBox ID="TBAcvExchNo" runat="server" Width="150px"></asp:TextBox></td>
											<td width="90" align="right">傳票狀態</td>
											<td align="left" width="150" valign="top"><asp:dropdownlist id="DDLAcvExchNoStatus" 
                                                    runat="server" Width="144px">
                                                <asp:ListItem>......</asp:ListItem>
                                                <asp:ListItem Value="0">未開傳票</asp:ListItem>
                                                <asp:ListItem Value="1">已開傳票</asp:ListItem>
                                                </asp:dropdownlist></td>
											<td align="left" valign="top">　</td>
										</tr>

										<tr>
											<td align="right" width="90" valign="top">金額種類</td>
											<td colspan="3"  ><asp:dropdownlist id="DDLMoneyKind" runat="server" Width="144px">
                                                <asp:ListItem Value="">------</asp:ListItem>
                                                <asp:ListItem Value="0">實支金額</asp:ListItem>
                                                <asp:ListItem Value="1">暫付金額</asp:ListItem>
                                                </asp:dropdownlist></td>
											<td align="left" valign="top">&nbsp;</td>
										</tr>

										<tr>
											<td align="right" width="90" valign="top">報表種類</td>
											<td colspan="3"  ><asp:dropdownlist id="DDLRpt" runat="server">
                                                <asp:ListItem Value="Report32">未開傳票明細表</asp:ListItem>
                                                <asp:ListItem Value="Report31-1">GBC報支科目差異明細表</asp:ListItem>
                                                <asp:ListItem Value="Report31-2">GBA報支科目差異明細表</asp:ListItem>
                                                <asp:ListItem Value="Report33">預算明細分類帳(GBC)報表</asp:ListItem>
                                                <asp:ListItem Value="Report34">預算簽證執行未完成明細資料</asp:ListItem>
                                                </asp:dropdownlist></td>
											<td align="left" valign="top">　</td>
										</tr>

										<tr>
											<td align="right" width="90">　</td>
											<td   width="150" ><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:button></td>
											<td align="left" width="90">　</td>
											<td width="150">　</td>
											<td>　</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCSDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBSDate" PopUp="Custom" ClientSideOnSelectionChanged="UCSDate_Change"></COMPONENTART:CALENDAR>

		    <asp:DataGrid ID="DataGrid1" runat="server">
            </asp:DataGrid>
            
            
            </form>
</body>
</html>
