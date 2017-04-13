<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbficEntrustParaT.Web.FrmtsbficEntrustParaT_tsbficEntrustPara.Default" %>
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="ODS_codDepartName" runat="server" TypeName="ShareTable.DAO.codDepartNameDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount"></asp:ObjectDataSource>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">委辦參數設定作業資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2">&nbsp;&nbsp;至&nbsp;&nbsp;
                            <asp:TextBox ID="txttsbDecideDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" AppendDataBoundItems="True" DataSourceID="ODS_codDepartName" DataTextField="dptName" DataValueField="dptCode">
                                <asp:ListItem Value="">.............</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">計畫科目</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="70%"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">委辦事項</td>
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
                    <tr>
                        <td class="qury_table_td">設定狀態</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbSetFlag" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Selected="True">.............</asp:ListItem>
                                <asp:ListItem Value="0">[0].未設定</asp:ListItem>
                                <asp:ListItem Value="1">[1].已設定</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">審核狀態</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPassFlag" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="">.............</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">未審核</asp:ListItem>
                                <asp:ListItem Value="1">已審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Btn08" OnClick="btnSearch_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnEdit" value="編修" class="Btn02" onclick="btnClick('Edit', '編修資料')" />
                &nbsp;&nbsp;
<%--            <input type="button" id="btnView" value="檢視" class="Btn02" onclick="btnClick('View', '檢視資料')" />
                &nbsp;&nbsp;  --%>
                <input type="button" id="btnDelete" value="刪除" class="Btn02" onclick="btnClick('Delete', '刪除資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnExport" value="列印" class="Btn02" onclick="Print('Print', '列印資料')" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">委辦參數設定作業資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%" OnRowDataBound="GridView1_RowDataBound">
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlkSelect" runat="server">選取</asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="30" />
                                <ItemStyle HorizontalAlign="Center" Width="30" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:Label>
                                    <asp:HiddenField ID="hdftsbYear" runat="server" Value='<%# Eval("tsbYear") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbApplyNo" runat="server" Value='<%# Eval("tsbApplyNo") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbApplySeq" runat="server" Value='<%# Eval("tsbApplySeq") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdftsbDecideNo" runat="server" Value='<%# Eval("tsbDecideNo") %>'></asp:HiddenField>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="65" />
                                <ItemStyle HorizontalAlign="Center" Width="65" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定<br/>明細號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbWorkUserNo" runat="server" Text='<%#  Eval("tsbWorkUnitName")+"<br/>"+ Eval("tsbWorkUserNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="75" />
                                <ItemStyle HorizontalAlign="Center" Width="75" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="受款人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="計畫科目" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="180" />
                                <ItemStyle HorizontalAlign="Center" Width="180" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用途別" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="120" />
                                <ItemStyle HorizontalAlign="Center" Width="120" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="委辦事項" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="170" />
                                <ItemStyle HorizontalAlign="Center" Width="170" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="核定金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoney" runat="server" Text='<%# Eval("tsbMoney").ToMoney() %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="設定<br/>狀態" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbSetFlag" runat="server" Text='<%# Eval("tsbSetFlag") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核<br/>狀態" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPassFlag" runat="server" Text='<%# Eval("tsbPassFlag") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <%-- ↑↑開始資料行↑↑ --%>
                        </Columns>
                        <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                    </asp:GridView>
                    <br style="clear: both;" />
                    <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                    <br style="clear: both;" />
                </div>
            </div>
        </div>

        <script type="text/javascript">

            // 初始事件-Start
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
                setPlanCode();

                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));

                function fnPaginationInit($jq, options) {

                    var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                    var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                    var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));


                    var link_to = URI(location.href)
                        .setSearch("pageIndex", "__id__")
                        .removeSearch("selectedIndex").toString();


                    link_to = decodeURIComponent(link_to); // 後端有編碼才需要加

                    /* 初始值 */
                    var defaults = {
                        callback: function (new_page_index, pagination_container) { return true; },
                        current_page: PageIndex,
                        items_per_page: PageSize,
                        link_to: link_to,
                        next_text: "下一頁",
                        prev_text: "上一頁",
                        num_edge_entries: 1
                    };

                    var settings = $.extend(defaults, options);
                    $jq.pagination(ItemsCount, settings);

                    //依狀態啟用停用頁碼連結
                    if ($jq.is("[disabled]")) {
                        $jq.find("a").attr("disabled", "disabled")
                            .removeAttr("href")
                            .css("cursor", "default")
                            .click(function (e) { e.stopPropagation(); });
                    }
                }
                //#endregion
            });
            // 初始事件-End

            // 按鈕事件-Start
            function btnClick($type, $titleName) {
                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                if (selectedTr.length > 0) {
                    var menuID = $("#hdfMenuID").val();

                    var tsbYear = selectedTr.prop("title").split("_")[0];
                    var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                    var tsbApplySeq = selectedTr.prop("title").split("_")[2];
                    var tsbDecideNo = selectedTr.prop("title").split("_")[3];
                    var tsbDecideSeq = selectedTr.prop("title").split("_")[4];
                    var mod = selectedTr.prop("title").split("_")[5];
                    var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo, tsbApplySeq: tsbApplySeq, tsbDecideNo: tsbDecideNo, tsbDecideSeq: tsbDecideSeq };


                    var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=" + $type
                        + "&Mod=" + mod + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: $titleName,
                            width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                            height: document.documentElement.offsetHeight * 0.85
                        });
                } else alert("請先選取一筆資料！");
            }

         

            function Print($type, $titleName) {
                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                if (selectedTr.length > 0) {
                    var menuID = $("#hdfMenuID").val();

                    var tsbYear = selectedTr.prop("title").split("_")[0];
                    var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                    var tsbApplySeq = selectedTr.prop("title").split("_")[2];
                    var tsbDecideNo = selectedTr.prop("title").split("_")[3];
                    var tsbDecideSeq = selectedTr.prop("title").split("_")[4];
                    var mod = selectedTr.prop("title").split("_")[5];
                    var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo, tsbApplySeq: tsbApplySeq, tsbDecideNo: tsbDecideNo, tsbDecideSeq: tsbDecideSeq };


                    var src = "Print.aspx?MenuID=" + menuID + "&formStatus=" + $type
                        + "&Mod=" + mod + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: $titleName,
                            width: 800,
                            height: 400
                        });
                } else alert("請先選取一筆資料！");
            }

            // 按鈕事件-End

            //分項計畫_部分選項禁止點選
            function setPlanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>
</html>
