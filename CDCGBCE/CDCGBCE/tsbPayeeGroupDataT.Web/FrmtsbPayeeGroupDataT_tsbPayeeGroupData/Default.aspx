<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbPayeeGroupDataT.Web.FrmtsbPayeeGroupDataT_tsbPayeeGroupData.Default" %>

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
        <input type="hidden" id="hdfMenuID" runat="server" />
        <input type="hidden" id="hdfListSelect" runat="server" value="-1" />

        <div>
            <asp:Panel ID="pnlSearch" runat="server" class="">
                <h1 class="h1Class">委辦/補(捐)助群組管理</h1>
                <%--20150623 [mdf]:修改為固定寬度,不使用百分比--%>
                <table style="margin-left: 20px; width: 980px; text-align: center">
                    <tr>
                        <td style="color: #0000FF; font-family: 標楷體; text-align: left; width: 100px">
                            <img border="0" height="16" src="../../Images/icon_group.gif" width="16" />群組名稱
                        </td>

                        <td style="color: #0000FF; font-family: 標楷體; text-align: left; width: 350px">
                            <img border="0" src="../../Images/icon_gmember.gif" style="height: 16px" width="16" />群組所屬對象
                            <font face="Verdana" size="1">
                                (<asp:Label id="lblGroupDataCount" runat="server" Text=""></asp:Label>)
                            </font>
                        </td>
                        <td style="width: 35px"></td>
                        <td style="color: #0000FF; font-family: 標楷體; text-align: left; width: 350px">
                            <img border="0" src="../../Images/icon_member.gif" style="height: 16px" width="16" />委辦/補(捐)助對象
                                <font face="Verdana" size="1">(<asp:Label id="lblPayeeCount" runat="server" Text=""></asp:Label>)</font>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; text-align: left; width: 100px">
                            <asp:ListBox ID="list_group_name" runat="server" AutoPostBack="true" DataTextField="tsbPayeeGroupName" DataValueField="tsbPayeeGroupNo" Rows="20" Width="175px" OnSelectedIndexChanged="list_group_name_SelectedIndexChanged"></asp:ListBox>
                        </td>
                        <td style="vertical-align: top; width: 350px; text-align: left">
                            <asp:ListBox ID="list_group_data" runat="server" Rows="20" SelectionMode="Multiple" Width="350px"></asp:ListBox>
                        </td>
                        <td style="vertical-align: middle; width: 35px; text-align: left">
                            <asp:ImageButton ID="btn_add" runat="server" ToolTip="加入指定的項目" Width="35px" StyleSpec="cursor: pointer" ImageUrl="~/Images/layout/leftAll.png" OnClick="btn_add_Click" />
                            <br />
                            <br />
                            <asp:ImageButton ID="btn_remove" runat="server" ToolTip="移除指定的項目" Width="35px" StyleSpec="cursor: pointer" ImageUrl="~/Images/layout/rightAll.png" OnClick="btn_remove_Click" />
                        </td>
                        <td style="vertical-align: top; width: 350px; text-align: left">
                            <asp:ListBox ID="list_payee" runat="server" Rows="20" SelectionMode="Multiple" Width="350px"></asp:ListBox>
                            <br />
                            <asp:TextBox ID="txtSearchKey" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="Btn09" Text="查詢" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>

            <div style="text-align: center; margin: 10px; width: 980px">
                <asp:Button ID="btnEdit" runat="server" Text="編輯" class="Btn02" OnClick="btnEdit_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn02" OnClick="btnSave_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="取消" class="Btn02" OnClick="btnCancel_Click" />
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
                            }) ;
                    }
                }
                //#endregion

            });
        </script>
    </form>
</body>
</html>
