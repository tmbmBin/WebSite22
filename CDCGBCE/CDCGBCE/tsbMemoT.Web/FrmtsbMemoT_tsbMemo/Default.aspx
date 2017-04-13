<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tsbMemoT.Web.FrmtsbMemoT_tsbMemo.Default" %>

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
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">備註查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">備註號碼：</td>
                        <td class="qury_table_td2">註&nbsp;
                            <asp:TextBox ID="qrytsbAliasNo" runat="server" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">委辦/補(捐)助區分：</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="qrytsbType" runat="server">
                                <asp:ListItem Text="..............." Value=""></asp:ListItem>
                                <asp:ListItem Text="委辦" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="補捐助" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">備註名稱：</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="qrytsbMemoName" runat="server" Width="650px"></asp:TextBox>
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
                &nbsp;&nbsp;
                <asp:Button ID="btnImport" runat="server" Text="匯入" class="Btn02" OnClick="btnImport_Click" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">備註資料明細</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <input type="hidden" id="hdfType" runat="server" />
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
                            <asp:TemplateField HeaderText="年度" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_tsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                                    <asp:Label ID="lbl_tsbMemo_No" runat="server" Text='<%# Eval("tsbMemoNo") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="備註名稱" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_tsbMemo_Name" runat="server" Text='<%# Eval("tsbMemoName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="450" />
                                <ItemStyle HorizontalAlign="Left" Width="450" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="備註號碼" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_tsbMemo_AliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="區分" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbType" runat="server" Text='<%# Eval("tsbType").ToString() == "1" ? "委辦" : "補捐助" %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
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
                            });
                    }
                }
                //#endregion


                //#region $("#btnNew").click
                $("#btnNew").click(function () {
                    var menuID = $("#hdfMenuID").val();
                    var type = $("#hdfType").val();

                    var src = "Modify.aspx?menuID=" + menuID + "&formStatus=New&type=" + type
                        + "&PageMod=" + "<%=this.PageMod%>";
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                        {
                            title: "新增資料",
                            width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                            height: document.documentElement.offsetHeight * 0.8
                        });
                });
                //#endregion

                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {

                        var menuID = $("#hdfMenuID").val();
                        var type = $("#hdfType").val();
                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbMemoNo = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbYear: tsbYear, tsbMemoNo: tsbMemoNo };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit&type=" + type
                            + "&PageMod=" + "<%=this.PageMod%>"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "修改資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.8
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
                        var type = $("#hdfType").val();
                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbMemoNo = selectedTr.prop("title").split("_")[1];

                        var keys = { tsbYear: tsbYear, tsbMemoNo: tsbMemoNo };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=View&type=" + type
                            + "&PageMod=" + "<%=this.PageMod%>"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                                MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                                    {
                                        title: "檢視資料",
                                        width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                        height: document.documentElement.offsetHeight * 0.8
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
                        var type = $("#hdfType").val();
                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbMemoNo = selectedTr.prop("title").split("_")[1];

                        var keys = { tsbYear: tsbYear, tsbMemoNo: tsbMemoNo };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=View&formStatus1=Delete&type=" + type
                            + "&PageMod=" + "<%=this.PageMod%>"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                                            {
                                                title: "刪除資料",
                                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                                height: document.documentElement.offsetHeight * 0.8
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
