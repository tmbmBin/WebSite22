<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmTrlPayForeignV1.aspx.vb" Inherits="UI.ActMixPay.Web.FrmTrlPayForeignV1" %>

<%@ Import Namespace="Microsoft.Security.Application" %>
<%@ Register Src="../UI.ActMixPay.UC/UCAcpPayNoPrv.ascx" TagName="UCAcpPayNoPrv" TagPrefix="uc1" %>
<%@ Register Src="../UI.ActMixPay.UC/UCActWordNum.ascx" TagName="UCActWordNum" TagPrefix="uc2" %>


<%@ Register Src="../UI.ActMixPay.UC/UCActPayMix.ascx" TagName="UCActPayMix" TagPrefix="uc3" %>
<%@ Register Src="../UI.ActMixPay.UC/UCActPayVisaMix.ascx" TagName="UCActPayVisaMix" TagPrefix="uc4" %>



<%@ Register Src="../UI.TrlMixPay.UC/UCActPayTrl.ascx" TagName="UCActPayTrl" TagPrefix="uc5" %>
<%@ Register Src="../UI.TrlMixPay.UC/UCActPayTrlDtl.ascx" TagName="UCActPayTrlDtl" TagPrefix="uc6" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script type="text/javascript" src="ScriptFiles/JSCollapse.js"></script>
    <link type="text/css" rel="stylesheet" href="CSSFiles/JSCollapse.css" />
    <script type="text/javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script type="text/javascript" src="../ScriptFiles/JSDateFun.js"></script>


    <script src="../ScriptFiles/ShowBgtWeb/ShowBudget.js" type="text/javascript"></script>
    <script src="../ScriptFiles/setSeleGroup.js" type="text/javascript"></script>
    <script src="../ScriptFiles/SearchNum.js" type="text/javascript"></script>
    <script src="../ScriptFiles/JSComFun.js" type="text/javascript"></script>
    <script src="../UI.ActMixPay.UC/ScriptFiles/UCActPayVisaMix.js" type="text/javascript"></script>
    <script src="../UI.TrlMixPay.UC/ScriptFiles/UCActPayDtlTrlMix.js" type="text/javascript"></script>
    <script src="../UI.ActMixPay.Web/ScriptFiles/FrmTrlPayForeign.js" type="text/javascript"></script>
</head>

   <%--20160713 [add]:呼叫查詢視窗--%>
    <script type="text/javascript">
        function fnCallSearchDialog() {
            var strReturnVal = showModalDialog("FrmSearchPay.aspx?showtype=1&mod=" + "<%=strModFlag %>", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            if (strReturnVal != "Cancel") {
                //				Form1.TBFindSql.value=strReturnVal;
                document.all("TBFindSql").value = strReturnVal;
            }
            //Form1.TBFindSql.value=strReturnVal;
        }
    </script>

<body onload='get_cookies();' onunload='set_cookies()'>
    <form id="form1" runat="server">
        <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
        <table id="TablePass" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse;"
            cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    bordercolor="#666668" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                                bordercolor="#666668">
                                <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                    <tr>
                                        <td style="color: #FF0000; width: 75px;" align="right">
                                            <asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label>
                                        </td>
                                        <td style="width: 110px;">
                                            <asp:TextBox ID="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" Style="text-align: center; background-color: #FFE0C0"
                                                Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox>
                                        </td>
                                        <td style="color: #FF0000; width: 85px;" align="right"></td>
                                        <td style="width: 110px;">&nbsp;</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td style="height: 10px"></td>
            </tr>
        </table>
        <table border="0" cellpadding="0" style="border-collapse: collapse">
            <tr>
                <td valign="top">
                    <!-- 左框架START -->
                    <table cellpadding="0" style="border-collapse: collapse" border="0">
                        <tr>
                            <td valign="top">
                                <table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668"
                                    bgcolor="#DADEE9">
                                    <tr>
                                        <td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
                                            <!-- ↓審核原因 -->
                                            <!-- 審核原因↑ -->
                                            <!-- ↓審核 -->
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 600px" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 5px">

                                                        <table cellpadding="0" style="border-collapse: collapse; width: 590px" border="0">
                                                            <tr>

                                                                <td align="right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAcpUnitPassFlag" runat="server" Font-Size="X-Small"
                                                                                    TextAlign="Left" Text="單位審核" Visible="False" /></td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBSecrearyFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="秘書室審核" Visible="False" /></td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="CBAccPassFlag" runat="server" Font-Size="X-Small" TextAlign="Left" Text="會計室審核" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- ↑審核↑ -->

                                            <uc1:ucacppaynoprv id="UCAcpPayNoPrv1" runat="server" />
                                            <uc2:ucactwordnum id="UCActWordNum1" runat="server" />
                                            <uc3:ucactpaymix id="UCActPayMix1" runat="server" />
                                            <uc4:ucactpayvisamix id="UCActPayVisaMix1" runat="server" />


                                            <uc5:ucactpaytrl id="UCActPayTrl1" runat="server" />
                                            <uc6:ucactpaytrldtl id="UCActPayTrlDtl1" runat="server" />


                                            <!-- ↓區塊(1) -->
                                            <!-- 區塊(1)↑ -->
                                            <!-- ↓區塊(2) -->
                                            <!-- ↓區塊(2) -->
                                            <!-- 區塊(2)↑ -->
                                            <!-- ↓區塊(3) -->
                                            <!-- 區塊(3)↑ -->
                                            <!-- ↓區塊(4) -->
                                            <!-- 區塊(4)↑ -->
                                            <!-- ↓區塊(5) -->
                                            <!-- 區塊(5)↑ -->
                                            <!-- Insert 區塊 here -->
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <!-- ↓歷史資料 -->
                    <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1"
                        bordercolor="#666668" bgcolor="#DADEE9">
                        <tr>
                            <td>
                                <table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                        <asp:Button ID="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
                                                    <td>
                                                       <%--20160713 [mdf]:顯示查詢按鈕--%>
                                                       <%-- <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"
                                                            Visible="False"></asp:Button></td>--%>
                                                       <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"
                                                            Visible="True"></asp:Button></td>
                                                    <td>
                                                        <input type="button" id="BtnPrint" runat="server" style="width: 50px; height: 22px" value="列印" /></td>
                                                    <td style="display: none">&nbsp;</td>
                                                    <td>
                                                        <asp:TextBox ID="TBSearchSql" runat="server" Style="text-align: center; width: 90px" onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" onblur="if(this.value==''){this.value='尋找動支編號';}" onfocus="this.select()" onclick="this.value=''" AutoPostBack="True">尋找動支編號</asp:TextBox><input type="button" style="height: 22px; width: 16px; font-family: Webdings; font-size: 8pt" value="s"></td>
                                                    <td>
                                                        <input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" /></td>
                                                    <td>
                                                        <input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" />
                                                        <input id="TBAbsenceNo" runat="server" type="hidden" name="TBAbsenceNo" /><asp:Button ID="btnChooseTrlData" runat="server" Text="選取出差資料"
                                                            BackColor="#00CC00" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="_freezingDiv" class="DIV0_width">
                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True"
                                                    AllowSorting="True" AutoGenerateColumns="False" PageSize="5" Width="100%">
                                                    <HeaderStyle BackColor="#003366" Font-Bold="True" Font-Size="X-Small"
                                                        ForeColor="White" HorizontalAlign="Center" Wrap="False" />
                                                    <ItemStyle BackColor="WhiteSmoke" Font-Size="X-Small" />
                                                    <AlternatingItemStyle BackColor="#E0E0E0" />
                                                    <SelectedItemStyle BackColor="DarkOrange" Font-Bold="True" />
                                                    <Columns>
                                                        <asp:ButtonColumn CommandName="Select" HeaderText="選取" Text="□">
                                                            <HeaderStyle Width="30px" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="acmYear" HeaderText="年度">
                                                            <HeaderStyle Width="30px" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="動支系統號" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmNo" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期"
                                                            SortExpression="acmMarkDate">
                                                            <HeaderStyle Width="60px" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="動支編號" SortExpression="acmWordNum">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>'
                                                                    ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="承辦單位">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgWorkDepName" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.DepName").ToString()) %>'
                                                                    ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkUnitNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="承辦人員" SortExpression="acmWorkUserNo">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server"
                                                                    ondblclick="clipboardData.setData('text', this.title)"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWorkUserNo").ToString()) %>'
                                                                    ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmEmpNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="acmMoney" DataFormatString="{0:#,#}"
                                                            HeaderText="動支金額" SortExpression="acmMoney">
                                                            <HeaderStyle Width="70px" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmMemo" HeaderText="控帳事由" SortExpression="acmMemo"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="acmModifyUser" HeaderText="最後異動"
                                                            SortExpression="acmModifyUser">
                                                            <HeaderStyle Width="60px" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="P1Counter" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgP1Cnt" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtKind").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="結轉-11" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmBgtKind" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtKind").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="再簽次號">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmNo1" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="分局旗標" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgAcmCateGrpFlag" runat="server"
                                                                    Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmCateGrpFlag").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <PagerStyle BackColor="#666668" ForeColor="DarkOrange" HorizontalAlign="Center"
                                                        Mode="NumericPages" />
                                                </asp:DataGrid>
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
                                                                    <asp:DropDownList ID="DDLSortMonth" runat="server" AutoPostBack="True">
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
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortDep" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortPassFlag" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                        <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                        <asp:ListItem Value="">不區分</asp:ListItem>
                                                                    </asp:DropDownList></td>
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
                <td width="5"></td>
                <td valign="top" width="200">
                    <iframe id="iFrame" name="iFrame" border="0" frameborder="0" scrolling="no" width="200"
                        height="520"></iframe>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>

