<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbReceiptT.Web.FrmtsbReceiptT_tsbReceipt.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%-- Style專區 --%>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
    <%-- JavaScript專區 --%>
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/basic") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/kendo") %>
    <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
    <%: Scripts.Render("~/bundles/MyLibraryJs") %>
    <%: Scripts.Render("~/bundles/jquery.pagination") %>
    <%: Scripts.Render("~/bundles/URI") %>

    <script type="text/javascript" src="<%: ResolveUrl("~/Scripts/public.js") %>"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">繳回作業資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">動支編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" DataTextField="dptName" DataValueField="dptCode"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">繳回種類</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbKind" runat="server" >
                                <asp:ListItem Value="1" Selected="True">預撥繳回</asp:ListItem>
                                <asp:ListItem Value="2">核銷繳回(實支)</asp:ListItem>
                                 <asp:ListItem Value="3" >核銷繳回(轉正)</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="70%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途說明</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">受款人</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <input type="button" id="btnSearch" value="開始過濾" class="Btn08" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnEdit" value="編修" class="Btn02" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class"><span id="spanTitle"></span>作業資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        EnableViewState="false"
                        CssClass="GridViewStyle" Width="100%" >
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <a name="aSelect" href="javascript:void(0);" tabindex="<%# (1 + Container.DataItemIndex).ToString() %> " title="<%#
                                        Eval("tsbYear") + "_" + 
                                        Eval("tsbApplyNo") + "_" + 
                                        Eval("tsbApplySeq") + "_" + 
                                        Eval("tsbDecideNo") + "_" +
                                        Eval("tsbDecideSeq") + "_" +
                                        Eval("tsbPrePayYear") + "_" +
                                        Eval("tsbPrePayNo") + "_" +
                                        Eval("tsbPayYear") + "_" +
                                        Eval("tsbPayNo") + "_" +
                                        Eval("tsbKind") %>">選取</a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") +"<br/>"+ Eval("tsbLastApplyWordNum") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="55" />
                                <ItemStyle HorizontalAlign="Center" Width="55" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定<br/>明細號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="45" />
                                <ItemStyle HorizontalAlign="Center" Width="45" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="預撥號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblViewNo" runat="server" Text='<%# Eval("tsbPrePayNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="50" />
                                <ItemStyle HorizontalAlign="Center" Width="50" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核銷號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblViewNo" runat="server" Text='<%# Eval("tsbPayNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="50" />
                                <ItemStyle HorizontalAlign="Center" Width="50" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="受款人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' ToolTip='<%# Eval("tsbPayeeNo")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="150" />
                                <ItemStyle HorizontalAlign="Center" Width="150" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="分項計畫" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("plnPlanName")  %>' ToolTip='<%# Eval("plnPlanCode")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="200" />
                                <ItemStyle HorizontalAlign="Center" Width="200" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途別" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("oulOutlayName")  %>' ToolTip='<%# Eval("oulOutlayCode")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="120" />
                                <ItemStyle HorizontalAlign="Center" Width="120" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途說明" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="200" />
                                <ItemStyle HorizontalAlign="Center" Width="200" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="預撥餘額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrePayBalance" runat="server" Text='<%# Eval("PrePayBalance").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核銷金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblPayMoney" runat="server" Text='<%# Eval("PayMoney").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="繳回總額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbReceiveMoney" runat="server" Text='<%#  Eval("ReceiptMoney").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <%-- ↑↑開始資料行↑↑ --%>
                        </Columns>
                        <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                    </asp:GridView>
                    <%-- ↓↓分頁資訊專用↓↓ --%>
                    <asp:HiddenField runat="server" ID="hdfPageIndex" />
                    <asp:HiddenField runat="server" ID="hdfPageSize" />
                    <asp:HiddenField runat="server" ID="hdfItemsCount" Value ="0" />
                    <asp:HiddenField runat="server" ID="hdfSelectedIndex" />

                    <br style="clear: both;" />
                    <div id="divPagination"></div>
                    <br style="clear: both;" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnPage" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <asp:Button runat="server" ID="btnPage" Style="display:none;" OnClick="btnPage_Click" />
        </div>


        <script type="text/javascript">
            $(function () {

                // 使用套件
                $.MyKendoDatePicker();

                $("#spanTitle").text($("#ddltsbKind option:selected").text());

                setPlanCode();
                //#region 選取按鈕字樣變更(無需變動)
                $(document).on("click", "a[name='aSelect']", function () {
                    var idx = $(this).attr("tabindex");
                    $("a[name='aSelect']").text("選取");
                    $(this).text("V");
                    $("#hdfSelectedIndex").val(idx);
                });
                upCallBack();

                $("#btnSearch").click(function () {
                    $("#spanTitle").text($("#ddltsbKind option:selected").text());
                    $("#hdfPageIndex").val("0");
                    $("#hdfSelectedIndex").val("1");
                    $('#btnPage').trigger('click');
                });
                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    if (1 >= $("#GridView1 tr").length)
                        return;

                    var selA = $("#GridView1").find("a[name='aSelect']:contains('V')");

                    if (0 == selA.length) {
                        alert("請選擇一筆資料！");
                        return;
                    }
                    var sa = selA.attr("title").split("_");

                    var menuID = $("#hdfMenuID").val();
                    var keys = {
                        tsbYear: sa[0],
                        tsbApplyNo: sa[1],
                        tsbApplySeq: sa[2],
                        tsbDecideNo: sa[3],
                        tsbDecideSeq: sa[4],
                        tsbPrePayYear: sa[5],
                        tsbPrePayNo: sa[6],
                        tsbPayYear: sa[7],
                        tsbPayNo: sa[8],
                        tsbKind: sa[9]
                    };

                    var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit&tsbKind=" + sa[9]
                        + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: "修改資料",
                            width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                            height: document.documentElement.offsetHeight * 0.85
                        });
                });
                //#endregion

            });
            //<%--頁面跳轉相關(無需變動)--%>
            function upCallBack() {
                InitPagination($("#divPagination"));
                if (1 < $("#GridView1 tr").length) {
                    var idx = parseInt($("#hdfSelectedIndex").val(), 10);
                    $("#GridView1 tr").eq(idx).find("a[name='aSelect']").text("V");
                }
            }

            //分項計畫_部分選項禁止點選
            function setPlanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>
</html>
