<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ShowBudget1.aspx.vb" Inherits="UI.ActSum.WEB.ShowBudget1" %>

<html>
<head runat="server">
<title>支用情形統計表</title>
<META http-equiv="Pragma" content="No-cache">
</head>
<body>
    <form id="form1" runat="server">
	<TABLE id="Table1" style="FONT-SIZE: 11px; Z-INDEX: 101; LEFT: 0px; WIDTH: 190px; POSITION: absolute; TOP: 0px; HEIGHT: 416px; TEXT-ALIGN: right"
					cellSpacing="0" cellPadding="0" width="190" border="1" runat="server">
					<TR style="WIDTH: 160px; COLOR: green; HEIGHT: 19px" bgColor="#ff9966">
						<TD style="FONT-SIZE: 12px; WIDTH: 80px" noWrap>總經費數A</TD>
						<TD style="WIDTH: 85px">
							<DIV id="Val_1" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
						<TD style="FONT-SIZE: 10px; WIDTH: 35px; COLOR: blue" noWrap>比率%</TD>
					</TR>
					<TR style="COLOR: blue; HEIGHT: 19px" bgColor="#ff9966">
						<TD style="WIDTH: 80px" noWrap>預備金或追加減預算B</TD>
						<TD width="85">
							<DIV id="Val_2" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">1,234,567,890</DIV>
						</TD>
						<TD width="35">
							<DIV id="Per_2" style="FONT-SIZE: 12px; OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: maroon; HEIGHT: 19px;display:block" bgColor="#99cc99">
						<TD style="WIDTH: 80px" noWrap>流入(+)流出(-)C</TD>
						<TD title="" width="85">
							<DIV id="Val_3" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_3" title=" 佔預算比" style="FONT-SIZE: 12px; OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: maroon; HEIGHT: 19px;display:none" bgColor="#99cc99">
						<TD style="WIDTH: 80px" noWrap>計畫勻支</TD>
						<TD title="計畫勻支" width="85">
						<DIV id="Val_15" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
								</TD>
						<TD style="FONT-SIZE: 12px" width="35">
						<DIV id="Per_15" title=" 佔預算比" style="FONT-SIZE: 12px; OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
								</TD>
					</TR>
					<TR style="COLOR: green; HEIGHT: 19px" bgColor="#ddff99">
						<TD style="WIDTH: 80px" noWrap>累計分配數D</TD>
						<TD title="" width="85">
							<DIV id="Val_4" style="OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_4" style="FONT-SIZE: 12px; OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: blue; HEIGHT: 19px" bgColor="#ddff99">
						<TD style="WIDTH: 80px" noWrap>實支數E</TD>
						<TD title="實支數" width="85">
							<DIV id="Val_5" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_5" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: red; HEIGHT: 19px" bgColor="#99cc99">
                        <%--20160115 [mdf]:因配合105年CGBA上線GBC系統之調整,暫付改預付--%>
                        <%--<TD style="WIDTH: 80px" noWrap>暫付數F</TD>--%>
						<TD style="WIDTH: 80px" noWrap>預付數F</TD>
						<TD title="暫付數" width="85">
							<DIV id="Val_6" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_6" title=" 佔預算比" style="FONT-SIZE: 12px; OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: green; HEIGHT: 19px" bgColor="#ddff99">
						<TD style="WIDTH: 80px" noWrap>未核銷會簽數G</TD>
						<TD title="G=H-E-F" width="85">
							<DIV id="Val_7" style="OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_7" style="FONT-SIZE: 12px; OVERFLOW: hidden; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: blue; HEIGHT: 19px" bgColor="#ddff99">
						<TD style="WIDTH: 80px" noWrap>會簽數H</TD>
						<TD title="H=B-F" width="85">
							<DIV id="Val_8" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_8" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: maroon; HEIGHT: 19px" bgColor="#00cc99">
						<TD style="WIDTH: 80px" noWrap>執行率%I</TD>
						<TD title="(E+F+I-K)/(A+B+C)" width="85">
							<DIV id="Val_9" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_9" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: green; HEIGHT: 19px" bgColor="#ffff99">
						<TD style="WIDTH: 80px; height: 19px;" noWrap>可動支餘額J</TD>
						<TD title="A+B+C-H-L" width="85" style="height: 19px">
							<DIV id="Val_10" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px; height: 19px;" width="35">
							<DIV id="Per_10" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: blue; HEIGHT: 19px" bgColor="#ffff99">
						<TD style="WIDTH: 80px" noWrap>決標未執行數K</TD>
						<TD title="" width="85">
							<DIV id="Val_11" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px" width="35">
							<DIV id="Per_11" style="FONT-SIZE: 12px; OVERFLOW: hidden; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: red; HEIGHT: 19px" bgColor="#00cc99">
						<TD style="WIDTH: 80px; height: 19px;" noWrap>標餘款L</TD>
						<TD title="標餘款" width="85" style="height: 19px">
							<DIV id="Val_12" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px; height: 19px;" width="35">
							<DIV id="Per_12" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="COLOR: green; HEIGHT: 19px" bgColor="#ffff99">
						<TD style="WIDTH: 80px; HEIGHT: 19px" noWrap>繳回款M</TD>
						<TD title="" width="85">
							<DIV id="Val_13" style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout" >0</DIV>
						</TD>
						<TD style="FONT-SIZE: 12px; HEIGHT: 19px" width="35">
							<DIV id="Per_13" style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 100%; BACKGROUND-COLOR: transparent; TEXT-ALIGN: right"
								runat="server" ms_positioning="FlowLayout">0</DIV>
						</TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="FONT-SIZE: 10px; WIDTH: 80px; COLOR: maroon; HEIGHT: 18px" noWrap><INPUT id="Submit1" style="FONT-SIZE: 9px; WIDTH: 30px; HEIGHT: 19px" type="submit"    value="計算"
								name="Submit1" runat="server">經費單位</TD>
						<TD style="HEIGHT: 18px" colSpan="2"><asp:dropdownlist id="DDLBgtDep" style="FONT-SIZE: 12px" runat="server" Width="100%"></asp:dropdownlist></TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="WIDTH: 80px; COLOR: blue" noWrap><table border="0" cellpadding="0" style="border-collapse: collapse">
							<tr>
								<td><asp:textbox id="TBEDate" runat="server" Width="50px" ToolTip="指定統計日期" style="height: 22px" Visible=false  ></asp:textbox></td>
								<td width="3px"></td>
								<td width="20px"><font style="font-size: 6pt">需求<br>單位</font></td>
							</tr>
						</table></TD>
						<TD colSpan="2"><asp:dropdownlist id="DDLWorkDep" style="FONT-SIZE: 12px" runat="server" Width="100%"></asp:dropdownlist></TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="HEIGHT: 15px" noWrap colSpan="3"><asp:dropdownlist id="DDLBgtSource" style="FONT-SIZE: 10px" runat="server" Width="100%"></asp:dropdownlist></TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="HEIGHT: 13px" noWrap colSpan="3"><asp:dropdownlist id="DDLPlanName" style="FONT-SIZE: 10px" runat="server" Width="100%" AutoPostBack=true ></asp:dropdownlist></TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="HEIGHT: 16px" noWrap colSpan="3"><asp:dropdownlist id="DDLBizName" style="FONT-SIZE: 10px" runat="server" Width="100%"></asp:dropdownlist></TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="FONT-SIZE: 10px; HEIGHT: 18px" vAlign="middle" noWrap colSpan="3"><asp:dropdownlist id="DDLAccKind" style="FONT-SIZE: 10px" runat="server" Width="100%"></asp:dropdownlist></TD>
					</TR>
					<TR style="HEIGHT: 19px" bgColor="#ccccff">
						<TD style="FONT-SIZE: 10px; HEIGHT: 9px" vAlign="middle" noWrap colSpan="2"><asp:dropdownlist id="DDLOulName" style="FONT-SIZE: 10px" runat="server" Width="100%"></asp:dropdownlist></TD>
						<td style="FONT-SIZE: 10px; HEIGHT: 9px" vAlign="middle" noWrap align="left"><INPUT id="CBBgt" title="自動找尋有預算者" style="WIDTH: 14px; HEIGHT: 14px" type="checkbox" CHECKED
								name="ckBgt" runat="server"></td>
					</TR>
					<tr style="HEIGHT: 19px; background-color:#ccccff">
						<td style="FONT-SIZE: 10px; WIDTH: 80px; HEIGHT: 18px" noWrap>簽證狀態</TD>
						<td style="HEIGHT: 18px" colSpan="2"><asp:dropdownlist id="DDLVisa" style="FONT-SIZE: 12px" runat="server" Width="100%">
                            <asp:ListItem Value="">不區分</asp:ListItem>
                            <asp:ListItem Value="1">已審核</asp:ListItem>
                            <asp:ListItem Value="0">未審核</asp:ListItem>
                            </asp:dropdownlist></TD>
					</tr>
					<tr style="HEIGHT: 19px; background-color:#ccccff">
						<td style="FONT-SIZE: 10px; WIDTH: 80px;HEIGHT: 18px" noWrap>報支狀態</TD>
						<td style="HEIGHT: 18px" colSpan="2"><asp:dropdownlist id="DDLPay" style="FONT-SIZE: 12px" runat="server" Width="100%"><asp:ListItem Value="">不區分</asp:ListItem>
                            <asp:ListItem Value="1">已審核</asp:ListItem>
                            <asp:ListItem Value="0">未審核</asp:ListItem></asp:dropdownlist></TD>
					</tr>
					<tr style="DISPLAY: none">
						<TD align="center"><INPUT id="CB" title="僅統計本類別之資料" style="WIDTH: 14px; HEIGHT: 14px" type="checkbox" name="ckKid" runat="server" /></TD>
					</tr>
					<tr style="DISPLAY: none">
					    <td></td>
					    <td><asp:dropdownlist id="DDLTeamName" runat="server" Visible="False"></asp:dropdownlist></td>
					</tr>
				</TABLE>
    </form>
</body>
</html>
