<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RptInputData.Web.FrmRptInputData_tsbRptInputDataM.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>

    <style type="text/css">
        .hidden {
            display: none;
        }
    </style>
    <script type="text/javascript">
        //var onClose = function (e) {
        //    var tmpDateStr = window.frames[0].document.getElementById("FormView1_txttsbStartDate").value
        //    var tmpDateEnd = window.frames[0].document.getElementById("FormView1_txttsbEndDate").value


        //    if (tmpDateStr.length == 0 | tmpDateEnd == 0)
        //        if (!confirm('資料尚未儲存，確定離開?'))
        //            e.preventDefault();
        //}


        function OpenModifyWindow(Status, key) {
            var src = "Modify.aspx?formStatus=" + Status + "&" + key;

            MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                {
                    title: "修改資料",
                    width: document.getElementsByTagName('body')[0].clientWidth * 0.9,
                    height: document.documentElement.offsetHeight * 0.9,
                    close: function (e) {

                        var tmpDateStr = window.frames[0].document.getElementById("FormView1_txttsbStartDate").value
                        var tmpDateEnd = window.frames[0].document.getElementById("FormView1_txttsbEndDate").value

                        if (tmpDateStr.length == 0 | tmpDateEnd == 0)
                            if (!confirm('資料尚未儲存，確定離開?'))
                                e.preventDefault();
                    }
                });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">對國內團體補助(含公益支出)情形季報表/CGSS資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2">至
                                <asp:TextBox ID="txttsbDecideDate_RPID" runat="server" Width="150px" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbWorkUserNo_RPID" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbApplyWordNum_RPID" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">申請單位</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbWorkUnitNo_RPID" runat="server" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td class="qury_table_td">分項計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode_RPID" runat="server" Width="650px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途說明</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txttsbTrustSubsidyName_RPID" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">受款人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txttsbPayeeName_RPID" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">設定狀態</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlSetupStatus_RPID" runat="server" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnList" runat="server" Text="開始過濾" class="Btn08" OnClick="btnList_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnClear" runat="server" Text="清除條件" class="Btn08" OnClick="btnClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnEdit" value="編修" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnDelete" value="刪除" class="Btn02" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">對國內團體補助(含公益支出)情形季報表/CGSS資料設定</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle" Width="100%" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
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
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="會簽編號">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>' ToolTip='<%# Eval("tsbApplyNo") %>'></asp:Label>
                                    <asp:Label ID="lbltsbYear" runat="server" Text='<%# Eval("tsbYear") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbltsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbltsbApplySeq" runat="server" Text='<%# Eval("tsbApplySeq") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbltsbDecideNo" runat="server" Text='<%# Eval("tsbDecideNo") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核定明細號">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="50" />
                                <ItemStyle HorizontalAlign="Center" Width="50" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="受款人">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="120" />
                                <ItemStyle HorizontalAlign="Center" Width="120" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="業務計畫" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblParent_plnPlanName" runat="server" Text='<%# Eval("Parent_plnPlanName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="分項計畫名稱">
                                <ItemTemplate>
                                    <asp:Label ID="lblPlanName" runat="server" Text='<%# Eval("PlanName")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="170" />
                                <ItemStyle HorizontalAlign="Center" Width="170" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="用途說明">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="170" />
                                <ItemStyle HorizontalAlign="Center" Width="170" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="用途別">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("oulOutlayName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="120" />
                                <ItemStyle HorizontalAlign="Center" Width="120" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核定金額">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMoney" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("tsbMoney")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="他機關捐助數">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbOtherNumTot" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("tsbOtherNumTot")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="團體自付數">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbSelfNum" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("tsbSelfNum")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="活動期間">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbStartDate" runat="server" Text='<%#  Eval("tsbStartDate").ToRocDate() + "<br/>" + Eval("tsbEndDate").ToRocDate()  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>

<%--                            <asp:TemplateField HeaderText="活動結束日(必填)">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbEndDate" runat="server" Text='<%#  ADtoToTaiwan(   (Eval("tsbEndDate")??"").ToString())  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>--%>


                            <asp:TemplateField HeaderText="設定狀態">
                                <ItemTemplate>
                                    <asp:Label ID="lblSetupStats" runat="server" Text='<%# ( (Eval("SetupStatus")??"0").ToString().Equals("1")? "O":"X" )  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="30" />
                                <ItemStyle HorizontalAlign="Center" Width="30" />
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

        <%: Scripts.Render("~/bundles/jquery") %>
        <%: Scripts.Render("~/bundles/basic") %>
        <%: Scripts.Render("~/bundles/jqueryval") %>
        <%: Scripts.Render("~/bundles/kendo") %>
        <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
        <%: Scripts.Render("~/bundles/MyLibraryJs") %>
        <%: Scripts.Render("~/bundles/jquery.pagination") %>
        <%: Scripts.Render("~/bundles/URI") %>

        <script type="text/javascript">
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                fnPaginationInit($$("##divPagination"));
                setplanCode() // 分項計畫列表樣式變更

                getSelectDtlData();

            });

            $("#btnEdit").click(function () {

                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                if (selectedTr.length > 0) {
                    var status = selectedTr.prop("title").split("_")[5];
                    Run_Click(status);
                }
                else {
                    alert("請先選取一筆資料！");
                }
            });

            $("#btnDelete").click(function () {

                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                Run_Click("Del");
            });

            function Run_Click(status) {
                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                if (selectedTr.length > 0) {
                    var menuID = $("#hdfMenuID").val();

                    var tsbYear = selectedTr.prop("title").split("_")[0];
                    var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                    var tsbApplySeq = selectedTr.prop("title").split("_")[2];
                    var tsbDecideNo = selectedTr.prop("title").split("_")[3];
                    var tsbDecideSeq = selectedTr.prop("title").split("_")[4];
                    var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo, tsbApplySeq: tsbApplySeq, tsbDecideNo: tsbDecideNo, tsbDecideSeq: tsbDecideSeq };
                    var key = "tsbYear=" + tsbYear + "&tsbApplyNo=" + tsbApplyNo + "&tsbApplySeq=" + tsbApplySeq + "&tsbDecideNo=" + tsbDecideNo + "&tsbDecideSeq=" + tsbDecideSeq;

                    OpenModifyWindow(status, key);

                } else {
                    alert("請先選取一筆資料！");
                }
            }

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
                    callback: function (new_page_index, pagination_container) {

                        return true;
                    },
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
                        .click(function (e) {
                            e.stopPropagation();
                        })
                    ;
                }
            }
            //#endregion


            function getSelectDtlData() {
                $('#GridView1 tr').click(function () {
                    $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });

                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        $(this).css({ "background-color": "white" });
                    });

                    var tmpIndex = $.trim($(this).find("td:first").text());
                    if (parseInt(tmpIndex, 10) > 0) {
                        $(this).css({ "background-color": "yellow" });
                    }

                    $.unblockUI();
                });
            }

            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode_RPID.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>
</html>
