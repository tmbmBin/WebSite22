<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbPayeeT.Web.FrmtsbPayeeT_tsbPayee.Default" %>

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
                <h1 class="h1Class">委辦/補(捐)助對象查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">名稱</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="qrytsbPayeeName" runat="server" CssClass="queryStyle" Width="95%"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">統一編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="qrytsbPayeeNo" runat="server" CssClass="queryStyle" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">身分別</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPayeeRoleNo" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">縣市</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbCityID" runat="server" Width="150px">
                            </asp:DropDownList>
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
                        <h1 class="h1Class">委辦/補(捐)助對象資料明細</h1>
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
                                        <HeaderStyle HorizontalAlign="Center" Width="50" />
                                        <ItemStyle HorizontalAlign="Center" Width="50" />
                                    </asp:TemplateField>
                                    <%-- ↓↓開始資料行↓↓ --%>
                                    <asp:TemplateField HeaderText="年度" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="40" />
                                        <ItemStyle HorizontalAlign="Center" Width="40" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="統一編號">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayee_No" runat="server" Text='<%# Eval("tsbPayeeNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                                        <ItemStyle HorizontalAlign="Center" Width="60" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="名稱">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayee_Name" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="300" />
                                        <ItemStyle HorizontalAlign="Left" Width="300" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="縣市">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbCityID" runat="server" Text='<%# Eval("tsbCityID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                                        <ItemStyle HorizontalAlign="Center" Width="60" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="鄉鎮市區">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbCityAreaNo" runat="server" Text='<%# Eval("tsbCityAreaNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                                        <ItemStyle HorizontalAlign="Center" Width="60" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="身分別">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayeeRoleNo" runat="server" Text='<%# Eval("tsbPayeeRoleNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                                        <ItemStyle HorizontalAlign="Center" Width="60" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="屬性">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayeePropertyNo" runat="server" Text='<%# Eval("tsbPayeePropertyNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="45" />
                                        <ItemStyle HorizontalAlign="Center" Width="45" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="類別" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_tsbPayeeKind" runat="server" Text='<%# ChangeKindName(Eval("tsbPayeeKind").ToInt()) %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                                        <ItemStyle HorizontalAlign="Center" Width="80" />
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
                            height: document.documentElement.offsetHeight * 0.5
                        });
                });
                //#endregion

                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbPayeeNo = selectedTr.prop("title").split("_")[0];
                        var tsbPayeeKind = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbPayeeNo: tsbPayeeNo, tsbPayeeKind: tsbPayeeKind };

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

                //#region $("#btnView").click
                $("#btnView").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbPayeeNo = selectedTr.prop("title").split("_")[0];
                        var tsbPayeeKind = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbPayeeNo: tsbPayeeNo, tsbPayeeKind: tsbPayeeKind };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "檢視資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.5
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

                        var tsbPayeeNo = selectedTr.prop("title").split("_")[0];
                        var tsbPayeeKind = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbPayeeNo: tsbPayeeNo, tsbPayeeKind: tsbPayeeKind };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View&formStatus1=Delete"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "刪除資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.5
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
