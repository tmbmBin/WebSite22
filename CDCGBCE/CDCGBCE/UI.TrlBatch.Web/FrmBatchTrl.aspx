<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmBatchTrl.aspx.vb" Inherits="UI.TrlBatch.Web.FrmBatchTrl" %>
<%@ Register src="~/UI.TrlBatch.UC/UCCashMain2.ascx" tagname="UCCashMain2" tagprefix="uc1" %>
<%@ Register src="~/UI.TrlBatch.UC/UCCashDtl2.ascx" tagname="UCCashDtl2" tagprefix="uc2" %>

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
    <script language="javascript" type="text/javascript" src="../ScriptFiles/ShowBgtWeb/ShowBudget.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSPlanPicker.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/setSeleGroup.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/SearchNum.js"></script>
    <script language="javascript" type="text/javascript" src="../ScriptFiles/JSComFun.js"></script>
    <script language="javascript" type="text/javascript" src="../UI.TrlBatch.Web/ScriptFiles/FrmBatchTrl.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="MyCalendar" style="behavior: url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                    border-bottom: #666668 1pt solid" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="600"
                        border="1">
                        <tr>
                            <td>
                                <table border="0" cellpadding="2" cellspacing="0" width="600" style="table-layout:fixed">
							        <tr>
								        <td style="font-size:10pt"></td>
								        <td style="font-size:10pt"></td>
								        <td style="font-size:10pt; text-align:right"> 審核日期</td>
								        <td style="font-size:10pt"><asp:TextBox ID="ctl_csmPassDate" runat="server" Width="80px" BackColor="Pink" Style="text-align: center"
                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "></asp:TextBox></td>
								        <td style="font-size:10pt">&nbsp;</td>
								        <td style="font-size:10pt"><asp:CheckBox ID="CBAccPassFlag" runat="server" Text="會計室審核" TextAlign="Left" AutoPostBack="True" /></td>
							        </tr>
						        </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <uc1:UCCashMain2 ID="UCCashMain21" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="TBSessionID" runat="server" type="hidden" />
                                <asp:Button ID="btnEditDetail" runat="server" Text="開啟過濾資料頁面" />
                                <uc2:UCCashDtl2 ID="UCCashDtl21" runat="server" />
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" height="10">
                </td>
            </tr>
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid;
                    border-bottom: #666668 1pt solid" bordercolor="#666668">
                    <table style="table-layout: fixed; border-collapse: collapse" bordercolor="#ffffff"
                        cellpadding="5" width="100%" border="1">
                        <tr>
                            <td valign="bottom" align="left">
                                <table cellpadding="1" border="0">
                                    <tr>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnAdd" runat="server" Text="新增" Height="22"></asp:Button>
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnEdit" runat="server" Text="修改" Height="22"></asp:Button>
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnDelete" runat="server" Text="刪除" Height="22"></asp:Button>
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSave" runat="server" Text="儲存" Height="22"></asp:Button>
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnCancel" runat="server" Text="取消" Height="22"></asp:Button>
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSearch" runat="server" Text="查詢" Height="22" Visible="False">
                                            </asp:Button>
                                        </td>
                                        <td valign="bottom" align="center">
                                            <input type="button" id="BtnPrint" runat="server" style="width: 50px; height: 22px" value="列印" />                                           
                                        </td>
                                        <td valign="bottom" align="center">
                                            </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="btnDetailPass" runat="server" Text="明細退件" />
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:TextBox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
                                                ID="TBSearchSql" onblur="if(this.value==''){this.value='尋找批號';}" Style="text-align: center"
                                                onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px"
                                                AutoPostBack="True">尋找批號</asp:TextBox>
                                            <input style="font-size: 8pt; width: 16px; font-family: Webdings; height: 22px" type="button"
                                                value="s">
                                        </td>
                                        <td>
                                            <input id="ctl_WhereSql" style="width: 23px; height: 22px" type="hidden" size="1"
                                                name="ctl_WhereSql" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="ctl_OrderSql" style="width: 23px; height: 22px" type="hidden" size="1"
                                                name="ctl_OrderSql" runat="server"/>
                                            <input id="ctl_DtlPassFlag" style="width: 23px; height: 22px" type="hidden" size="1"
                                                name="ctl_DtlPassFlag" runat="server" />
                                            <asp:Button ID="btnReLoad" runat="server" Text="重載清單" BackColor="#009933" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" PageSize="5" Width="600px">
                                    <SelectedItemStyle BackColor="DarkOrange" Font-Bold="True" />
                                    <AlternatingItemStyle BackColor="#E0E0E0" />
                                    <ItemStyle BackColor="WhiteSmoke" Font-Size="X-Small" />
                                    <HeaderStyle BackColor="#003366" Font-Bold="True" Font-Size="X-Small" ForeColor="White"
                                        HorizontalAlign="Center" Wrap="False" />
                                    <Columns>
                                        <asp:ButtonColumn CommandName="Select" HeaderText="選取" Text="□">
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle Width="30px" />
                                        </asp:ButtonColumn>
                                        <asp:TemplateColumn HeaderText="年度">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="日期">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmSDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmSDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="系統編號">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="差旅批號">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmBatchNo" runat="server" style="text-align:center" Text='<%# DataBinder.Eval(Container, "DataItem.csmBatchNo") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="資料數量">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmCnt" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmCnt") %>'></asp:Label>
                                            </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="差旅金額">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmMoney", "{0:#,0}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="備註">
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_csmMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmMemo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="設定控帳事由">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "FrmUpdateAcpMemo.aspx?csmYear=" & DataBinder.Eval(Container, "DataItem.csmYear") &"&csmNo="& DataBinder.Eval(Container, "DataItem.csmNo") &"&csmBatchNo=" & DataBinder.Eval(Container, "DataItem.csmBatchNo")  %>'
                                                    Target="_blank">設定控帳事由</asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <PagerStyle BackColor="#666668" ForeColor="DarkOrange" HorizontalAlign="Center" Mode="NumericPages" />
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <table style="border-collapse: collapse" cellpadding="0" border="0">
                                    <tr>
                                        <td>
                                            <font size="2">只列出｜</font>
                                        </td>
                                        <td>
                                            &nbsp;<asp:DropDownList ID="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
                                                <asp:ListItem Value="">......</asp:ListItem>
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
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:DropDownList ID="DDLSortPassFlag" runat="server" AutoPostBack="true">
                                                <asp:ListItem Value="">不區分</asp:ListItem>
                                                <asp:ListItem Value="0">未審核</asp:ListItem>
                                                <asp:ListItem Value="1">已審核</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
