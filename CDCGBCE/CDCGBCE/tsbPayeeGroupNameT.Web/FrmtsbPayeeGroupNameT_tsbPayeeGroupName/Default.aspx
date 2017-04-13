<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbPayeeGroupNameT.Web.FrmtsbPayeeGroupNameT_tsbPayeeGroupName.Default" %>

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
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
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
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">委辦/補(捐)助群組查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: right; width: 15%;">
                            <asp:Label ID="lbltsbPayeeGroupName" runat="server" Text="群組名稱"></asp:Label>
                        </td>
                        <td style="text-align: left; width: 85%;">
                            <asp:TextBox ID="qrytsbPayeeGroupName" runat="server" Width="70%"></asp:TextBox>
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
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <h1 class="h1Class">委辦/補(捐)助群組資料明細</h1>
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
                                    <asp:TemplateField ShowHeader="False" HeaderText="功能">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlkSelect" runat="server">選取</asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="40" />
                                        <ItemStyle HorizontalAlign="Center" Width="40" />
                                    </asp:TemplateField>
                                    <%-- ↓↓開始資料行↓↓ --%>
                                    <asp:TemplateField HeaderText="群組編號">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayeeGroupNo" runat="server" Text='<%# Eval("tsbPayeeGroupNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                                        <ItemStyle HorizontalAlign="Center" Width="70" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="群組名稱">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayeeGroupName" runat="server" Text='<%# Eval("tsbPayeeGroupName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="260" />
                                        <ItemStyle HorizontalAlign="Left" Width="260" />
                                    </asp:TemplateField>
                                    <%-- ↑↑開始資料行↑↑ --%>
                                </Columns>
                                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                            </asp:GridView>
                            <br style="clear: both;" />
                            <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                            <br style="clear: both;" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

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
                            .click(function (e) {
                                e.stopPropagation();
                            });
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
                            width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                            height: document.documentElement.offsetHeight * 0.7
                        });
                });
                //#endregion


                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbPayeeGroupNo = selectedTr.prop("title");
                        var keys = { tsbPayeeGroupNo: tsbPayeeGroupNo };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "修改資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.7
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

                        var tsbPayeeGroupNo = selectedTr.prop("title");
                        var keys = { tsbPayeeGroupNo: tsbPayeeGroupNo };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "檢視資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.7
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

                        var tsbPayeeGroupNo = selectedTr.prop("title");
                        var keys = { tsbPayeeGroupNo: tsbPayeeGroupNo };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View&formStatus1=Delete"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "刪除資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.7
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
