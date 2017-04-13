<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbUnfinishCauseT.Web.FrmtsbUnfinishCauseT_tsbUnfinishCause.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <link href="../../Content/base.css" rel="stylesheet" />
    <link href="../../Content/layout.css" rel="stylesheet" />
    <link href="../../Content/MultiViewTabs.css" rel="stylesheet" />
    <link href="../../Content/kendo/2014.1.416/kendo.common.core.min.css" rel="stylesheet" />
    <link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.min.css" rel="stylesheet" />
    <link href="../../Scripts/jquery.pagination/pagination-fix.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">未完成原因查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">原因編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="qrytsbAliasNo" runat="server" CssClass="queryStyle"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">委辦/補(捐)助區分</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="qrytsbType" runat="server">
                                <asp:ListItem Text="委辦" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="補捐助" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">原因名稱 </td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="qrytsbUfCauseName" runat="server" CssClass="queryStyle" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" class="Btn08" OnClick="btnSearch_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" class="Btn08" OnClick="btnSearchClear_Click" />
            </div>
            <div style="text-align: center; margin: 10px;">
                <br />
                <input type="button" id="btnNew" value="新增" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnEdit" value="編修" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnDelete" value="刪除" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnView" value="檢視" class="Btn02" />
            </div>

            <div class="MainCon2">
                <h1 class="h1Class">未完成原因資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <div>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                        CssClass="GridViewStyle"
                        Width="100%" OnRowDataBound="GridView1_RowDataBound">

                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False" HeaderText="功能">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlkSelect" runat="server">選取</asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="年度" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                                    <asp:Label ID="lbltsbUfCauseNo" runat="server" Text='<%# Eval("tsbUfCauseNo") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="原因名稱" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbUfCauseName" runat="server" Text='<%# Eval("tsbUfCauseName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="260" />
                                <ItemStyle HorizontalAlign="Left" Width="260" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="原因號碼" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbAliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="區分" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbType" runat="server" Text='<%# Eval("tsbType").ToString() == "1" ? "委辦" : "補捐助" %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="50" />
                                <ItemStyle HorizontalAlign="Center" Width="50" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="建立日期" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbCreateDTime" runat="server" Text='<%# Eval("tsbCreateDTime") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="建立人員" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="tsbCreateUser" runat="server" Text='<%# Eval("tsbCreateUser") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="修改日期" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbModifyDTime" runat="server" Text='<%# Eval("tsbModifyDTime") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="修改人員" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbModifyUser" runat="server" Text='<%# Eval("tsbModifyUser") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
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

        <script src="../../Scripts/jquery-1.11.1-fix.js"></script>
        <script src="../../Scripts/base.js"></script>
        <script src="../../Scripts/json2.js"></script>
        <script src="../../Scripts/jquery.blockUI.js"></script>
        <script src="../../Scripts/jquery.validate.js"></script>
        <script src="../../Scripts/jquery.validate.messages_zh_TW.js"></script>
        <script src="../../Scripts/jquery.validate.inline.js"></script>
        <script src="../../Scripts/kendo/2014.1.416/kendo.ui.core-chinese.min.js"></script>
        <script src="../../Scripts/kendo/2014.1.416/cultures/kendo.culture.zh-TW-chinese.min.js"></script>
        <script src="../../Scripts/jquery.MyKendo/jquery.MyKendoAll.js"></script>
        <script src="../../Scripts/MyLibraryJs/MyLibraryJs.js"></script>
        <script src="../../Scripts/jquery.pagination/jquery.pagination.js"></script>
        <script src="../../Scripts/URI/URI.js"></script>

        <script type="text/javascript">
            $(function () {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();

                fnPaginationInit($$("##divPagination"));

                function fnPaginationInit($jq, options) {
                    var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                    var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                    var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));

                    var link_to = URI(location.href)
                        .setSearch("pageIndex", "__id__")
                        .removeSearch("selectedIndex").toString();


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


                //#region $("#btnNew").click
                $("#btnNew").click(function () {
                    var menuID = $("#hdfMenuID").val();
                    var src = "Modify.aspx?menuID=" + menuID + "&formStatus=New";
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: "新增資料",
                            width: 1050,
                            height: 350
                        });
                });
                //#endregion


                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbUfCauseNo = selectedTr.prop("title").split("_")[0];
                        var tsbYear = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbUfCauseNo: tsbUfCauseNo, tsbYear: tsbYear };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "修改資料",
                                width: 1050,
                                height: 350
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion


                //#region $("#btnDelete").click
                $("#btnDelete").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbUfCauseNo = selectedTr.prop("title").split("_")[0];
                        var tsbYear = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbUfCauseNo: tsbUfCauseNo, tsbYear: tsbYear };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View&formStatus1=Delete"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "刪除資料",
                                width: 1050,
                                height: 350
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

                //#region $("#btnView").click
                $("#btnView").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbUfCauseNo = selectedTr.prop("title").split("_")[0];
                        var tsbYear = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbUfCauseNo: tsbUfCauseNo, tsbYear: tsbYear };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "檢視資料",
                                width: 1050,
                                height: 350
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

            });
        </script>
    </form>
</body>
</html>
