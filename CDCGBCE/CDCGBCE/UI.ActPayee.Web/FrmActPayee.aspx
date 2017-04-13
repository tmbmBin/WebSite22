<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActPayee.aspx.vb" Inherits="UI.ActPayee.Web.FrmActPayee" %>

<%@ Import Namespace="Microsoft.Security.Application" %>

<%@ Register Src="~/UI.ActPayee.UC/UCActPayeeMain.ascx" TagPrefix="uc" TagName="UCActPayeeMain" %>
<%@ Register Src="~/UI.ActPayee.UC/UCActPayeeDtl.ascx" TagPrefix="uc" TagName="UCActPayeeDtl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSDateFun.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSComFun.js"></script>
    <script language="javascript" type="text/javascript" src="ScriptFiles/FrmActPayee.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
        <table id="TablePass" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                                <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                    <tr>
                                        <td style="color: #FF0000; width: 75px;" align="right">
                                            <asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label>
                                        </td>
                                        <td style="width: 110px;">
                                            <asp:TextBox ID="ctl_AcePassDate" runat="server" MyName="TBAcmPassDate" Style="text-align: center; background-color: #FFE0C0"
                                                Width="90px"
                                                ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox>
                                        </td>
                                        <td style="color: #FF0000; width: 85px;" align="right"></td>
                                        <td style="width: 110px;">&nbsp;
                                        </td>
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
                                            <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 595px" border="1" bordercolor="#FFFFFF">
                                                <tr>
                                                    <td style="padding: 5px; width: 595px">
                                                        <table cellpadding="0" style="border-collapse: collapse; width: 587px"
                                                            border="0">
                                                            <tr>
                                                                <td align="right">
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr>
                                                                            <td align="right" style="padding-left: 5px" nowrap>&nbsp;</td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>&nbsp;</td>
                                                                            <td align="right" style="padding-left: 5px" nowrap>
                                                                                <asp:CheckBox ID="ctl_AcePassFlag" runat="server" Font-Size="X-Small" TextAlign="Left"
                                                                                    Text="會計室審核" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <uc:UCActPayeeMain runat="server" ID="ucUCActPayeeMain" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table style="table-layout: fixed; width: 100%" border="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnAddDtl" runat="server" Text="手動輸入資料" />
                                                                </td>
                                                                <!-- 因改用『差勤系統匯入』，因此不需要此功能
                                                                <td style="display: none;">
                                                                    <asp:Button ID="btnExcelImport" runat="server" Text="Excel匯入" />
                                                                </td>
                                                                -->
                                                                <td>
                                                                    <asp:Button ID="btnATDImport" runat="server" Text="差勤系統匯入" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <uc:UCActPayeeDtl runat="server" ID="ucUCActPayeeDtl" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- ↑審核↑ -->
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
                    <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9" width="600px">
                        <tr>
                            <td>
                                <table cellpadding="5" style="border-collapse: collapse" border="1" bordercolor="#FFFFFF">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"
                                                            Visible="False"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <input type="button" id="BtnPrint" runat="server" style="width: 50px; height: 22px"
                                                            value="列印" />
                                                    </td>
                                                    <td>&nbsp;
                                                        <input id="ctl_DtlPassFlag" style="width: 23px; height: 22px" type="hidden" size="1" name="ctl_DtlPassFlag" runat="server" /></td>
                                                    <td style="display:none">
                                                        <asp:Button ID="btnDetailPass" runat="server" Text="明細退件" />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:TextBox ID="TBSearchSql" runat="server" Style="text-align: center; width: 90px"
                                                            onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
                                                            onblur="if(this.value==''){this.value='尋找批號';}" onfocus="this.select()" onclick="this.value=''"
                                                            AutoPostBack="True">尋找批號</asp:TextBox><input type="button" style="height: 22px; width: 16px; font-family: Webdings; font-size: 8pt"
                                                                value="s" />
                                                    </td>
                                                    <td>
                                                        <input type="hidden" id="ctl_WhereSql" runat="server" name="ctl_WhereSql" />
                                                        <input type="hidden" id="TBSessionID" runat="server" name="TBSessionID" />
                                                        <input type="hidden" id="ctl_TableName" runat="server" name="ctl_TableName" />
                                                    </td>
                                                    <td>
                                                        <input type="hidden" id="ctl_OrderSql" runat="server" name="ctl_OrderSql" /><input type="hidden"
                                                            id="TBModFlag" runat="server" name="TBModFlag" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="_freezingDiv" class="DIV0_width">
                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                                    AutoGenerateColumns="False" PageSize="5" Width="100%">
                                                    <HeaderStyle BackColor="#003366" Font-Bold="True" Font-Size="X-Small" ForeColor="White"
                                                        HorizontalAlign="Center" Wrap="False" />
                                                    <ItemStyle BackColor="WhiteSmoke" Font-Size="X-Small" />
                                                    <AlternatingItemStyle BackColor="#E0E0E0" />
                                                    <SelectedItemStyle BackColor="DarkOrange" Font-Bold="True" />
                                                    <Columns>
                                                        <asp:ButtonColumn CommandName="Select" HeaderText="選取" Text="□">
                                                            <HeaderStyle Width="30px" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="年度">
                                                            <ItemTemplate>
                                                                <input id="ctl_AceNo" type="hidden" runat="server" value='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.aceNo").ToString()) %>' />
                                                                <asp:Label ID="ctl_AceYear" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.aceYear").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="日期" SortExpression="aceSDate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ctl_AceSDate" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.aceSDate").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="批號" SortExpression="aceWordNum">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ctl_AceWordNum" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.aceWordNum").ToString()) %>'
                                                                    ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.aceNo").ToString()) %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="aceMoney" DataFormatString="{0:#,#}" HeaderText="金額"
                                                            SortExpression="aceMoney">
                                                            <HeaderStyle Width="70px" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="aceMemo" HeaderText="控帳事由" SortExpression="aceMemo"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="aceModifyUser" HeaderText="最後異動" SortExpression="aceModifyUser">
                                                            <HeaderStyle Width="60px" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <PagerStyle BackColor="#666668" ForeColor="DarkOrange" HorizontalAlign="Center" Mode="NumericPages" />
                                                </asp:DataGrid>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
                                                <tr>
                                                    <td>
                                                        <font size="2">共
                                                        <asp:Label ID="LBRecordCnt" runat="server" Style="text-align: center"></asp:Label>
                                                        筆資料</font>
                                                    </td>
                                                    <td align="right">
                                                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                                                            <tr>
                                                                <td>
                                                                    <font size="2">只列出｜</font>
                                                                </td>
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
                                                                <td>&nbsp;</td>
                                                                <td>
                                                                    <asp:DropDownList ID="DDLSortPassFlag" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">未審核</asp:ListItem>
                                                                        <asp:ListItem Value="1">已審核</asp:ListItem>
                                                                        <asp:ListItem Value="">不區分</asp:ListItem>
                                                                    </asp:DropDownList>
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
