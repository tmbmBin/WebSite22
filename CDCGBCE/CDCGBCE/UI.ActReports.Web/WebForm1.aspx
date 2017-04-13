<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="UI.ActReports.Web.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script  language="javascript" type="text/javascript" >
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
        <table style=" table-layout:fixed; margin-top:10px;margin-left:10px; border-collapse:collapse" borderColor="#666668" cellPadding="5" width="800" bgColor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="BORDER-COLLAPSE: collapse; table-layout:fixed" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="BORDER-COLLAPSE: collapse" width="100%" border="0" cellpadding="1" cellspacing="0" >
                                    <tr>
                                        <td style="width:90px; text-align:right">日期區間：</td>
                                        <td style="width:390px; text-align:left" colspan="3">
                                            <asp:textbox id="TBBDate" style="text-align:center" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px" Visible=false></asp:textbox>
                                            至
                                            <asp:textbox id="TBEDate" style="text-align:center" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
                                            <asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label>
                                        </td>
                                        <td rowspan="6">
                                            <table>
                                                <tr>
													<td></td>
													<td valign="middle" align="center"><font size="2">已選項目</font></td>
													<td></td>
													<td valign="middle" align="center"><font size="2">待選項目</font></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input title="置頂" onclick="if(putUpEnd(document.all.LBSelect)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="╤" />
                                                        <br><br>
													    <input title="上移" onclick="if(putUp(document.all.LBSelect)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="↑" />
													    <br><br>
													    <input title="下移" onclick="if(putDn(document.all.LBSelect)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="↓" />
													    <br><br>
													    <input title="置底" onclick="if(putDnEnd(document.all.LBSelect)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="╧" />
												    </td>
                                                    <td>
                                                        <asp:listbox id="LBSelect" runat="server" Width="110px" Height="200px" SelectionMode="Multiple"></asp:listbox>
                                                    </td>
                                                    <td>
                                                        <input title="全部左移" onclick="if(moveOpt(document.all.LBUnSelect,document.all.LBSelect,true)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="<<" />
                                                        <br/><br/>
                                                        <input title="左移" onclick="if(moveOpt(document.all.LBUnSelect,document.all.LBSelect)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="＜" />
                                                        <br/><br/>
                                                        <input title="右移" onclick="if(moveOpt(document.all.LBSelect,document.all.LBUnSelect)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value="＞" />
                                                        <br/><br/>
                                                        <input title="全部右移" onclick="if(moveOpt(document.all.LBSelect,document.all.LBUnSelect,true)>0) document.all.TBGroupFiled.value=getSeleOptVal(document.all.LBSelect,true);" type="button" value=">>" />
                                                    </td>
                                                    <td>
                                                        <asp:listbox id="LBUnSelect" runat="server" Width="110px" Height="200px" SelectionMode="Multiple">
																<asp:ListItem Value="來">來源(預算)</asp:ListItem>
																<asp:ListItem Value="門">門別</asp:ListItem>
																<asp:ListItem Value="預">經費單位</asp:ListItem>
																<asp:ListItem Value="申">執行單位</asp:ListItem>
																<asp:ListItem Value="承">承辦業務</asp:ListItem>
																<asp:ListItem Value="計">計畫科目</asp:ListItem>
																<asp:ListItem Value="用">用途別科目</asp:ListItem>
																<asp:ListItem Value="版">預算年度</asp:ListItem>
																<asp:ListItem Value="總">總計(項目)</asp:ListItem>
																<asp:ListItem Value="辦">[承辦業務欄位]</asp:ListItem>
																<asp:ListItem Value="全">[顯示完整名稱]</asp:ListItem>
														</asp:listbox>
                                                    </td>
                                                </tr>                                              
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">預算年度：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBgtYear" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">帳別名稱：</td>
                                        <td><asp:dropdownlist id="DDLTeamName" runat="server" Width="150px"></asp:dropdownlist></td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">預算來源：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">經資門別：</td>
                                        <td><asp:dropdownlist id="DDLAccKind" runat="server" Width="150px"></asp:dropdownlist></td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">經費單位：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBgtDep" 
                                                runat="server" Width="150px" AutoPostBack="True"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">執行單位：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="150px"></asp:dropdownlist></td>
                                    </tr>
                                    <tr style="display:none">
                                        <td style="width:90px; text-align:right">承辦業務：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLBizName" runat="server" Width="150px"></asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right">審核狀態：</td>
                                        <td style="width:150px; text-align:left"><asp:dropdownlist id="DDLPassFlag" runat="server" Width="150px">
                                            <asp:ListItem Value="">......</asp:ListItem>
                                            <asp:ListItem Value="1">已審核</asp:ListItem>
                                            <asp:ListItem Value="0">未審核</asp:ListItem>
                                            </asp:dropdownlist></td>
                                        <td style="width:90px; text-align:right">保留狀態：</td>
                                        <td><asp:dropdownlist id="DDLBgtKindSet" runat="server" Width="150px">
                                            <asp:ListItem Value="">......</asp:ListItem>
                                            <asp:ListItem Value="0">本年度預算</asp:ListItem>
                                            <asp:ListItem Value="1">應付歲出款</asp:ListItem>
                                            <asp:ListItem Value="2">保留準備數</asp:ListItem>
                                            </asp:dropdownlist></td>
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right; vertical-align:top">計畫名稱：</td>
                                        <td  style="vertical-align:top" colspan="3"><asp:dropdownlist id="DDLPlan" 
                                                runat="server" Width="395px" AutoPostBack="True"></asp:dropdownlist></td>                                        
                                        <td><asp:CheckBoxList ID="CBLPlanLevel" runat="server" RepeatColumns="2" 
                                                RepeatDirection="Horizontal" Visible="False"></asp:CheckBoxList></td>                                        
                                    </tr>
                                    <tr>
                                        <td style="width:90px; text-align:right; vertical-align:top">用途別：</td>
                                        <td style="vertical-align:top" colspan="3"><asp:dropdownlist id="DDLOul" runat="server" Width="395px"></asp:dropdownlist></td>                                        
                                        <td><asp:CheckBoxList ID="CBLOulLevel" runat="server" RepeatColumns="2" 
                                                RepeatDirection="Horizontal" Visible="False"></asp:CheckBoxList></td>                                        
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table  style="BORDER-COLLAPSE: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnList" runat="server" Text="列出資料" />
                                            <asp:Button ID="BtnPrint" runat="server" Text="列印報表" />
                                            <asp:checkbox id="CBExcel" runat="server" Text="轉製成EXCEL" Checked="True"></asp:checkbox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>    </form>
</body>
</html>
