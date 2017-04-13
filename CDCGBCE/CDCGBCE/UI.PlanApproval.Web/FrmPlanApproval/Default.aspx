<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.PlanApproval.Web.FrmPlanApproval.Default" %>
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
                <h1 class="h1Class">實際出國計畫案查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">實際出國計畫號</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtplnTrlAppCode" runat="server" Width="120px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">實際出國計畫名稱</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtplnTrlAppName" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">案件種類</td>
                        <td class="qury_table_td3">
                            <asp:DropDownList ID="ddlplnTrlKind" runat="server">
                                <asp:ListItem Value="" >...</asp:ListItem>
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
                <input type="button" id="btnNew" value="新增" class="Btn02" onclick="btnClick('New', '新增資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnEdit" value="編修" class="Btn02" onclick="btnClick('Edit', '編修資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnDelete" value="刪除" class="Btn02" onclick="btnClick('Delete', '刪除資料')" />
                &nbsp;&nbsp;
                <input type="button" id="btnView" value="檢視" class="Btn02" onclick="btnClick('View', '檢視資料')" />
            </div>
            <div class="MainCon2">
                <h1 class="h1Class">實際出國計畫案資料</h1>
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
                                    <asp:LinkButton ID="hlkSelect" runat="server" OnClick="hlkSelect_Click">選取</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="35" />
                                <ItemStyle HorizontalAlign="Center" Width="35" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="年度" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblacmYear" runat="server" Text='<%# Eval("acmYear") %>'></asp:Label>
                                    <asp:HiddenField ID="hdfacmYear" runat="server" Value='<%# Eval("acmYear") %>'></asp:HiddenField>
                                    <asp:HiddenField ID="hdfplnTrlAppCode" runat="server" Value='<%# Eval("plnTrlAppCode") %>'></asp:HiddenField>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="38" />
                                <ItemStyle HorizontalAlign="Center" Width="38" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="實際出國計畫號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblplnTrlAppCode" runat="server" Text='<%# Eval("plnTrlAppCode") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="53" />
                                <ItemStyle HorizontalAlign="Center" Width="53" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="實際出國計畫名稱" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblplnTrlAppName" runat="server" Text='<%# Eval("plnTrlAppName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="365" />
                                <ItemStyle HorizontalAlign="Center" Width="365" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="國家" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblappTrlCountry" runat="server" Text='<%# Eval("appTrlCountry") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="41" />
                                <ItemStyle HorizontalAlign="Center" Width="41" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="城市" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblappTrlCity" runat="server" Text='<%# Eval("appTrlCity")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="59" />
                                <ItemStyle HorizontalAlign="Center" Width="59" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                    </asp:GridView>
                    <br style="clear: both;" />
                    <asp:Panel ID="divPagination" PageIndex="0" PageSize="10" ItemsCount="0" SelectedIndex="0" runat="server" HorizontalAlign="Center"></asp:Panel>
                    <br style="clear: both;" />
                </div>
            </div>
        </div>
        <asp:Button runat="server" ID="btnPage" style="display:none;"  OnClick="btnPage_Click" />
        <asp:HiddenField runat="server" ID="hdfPageIndex" />
        <asp:HiddenField runat="server" ID="hdfPageSize" />
        <asp:HiddenField runat="server" ID="hdfItemsCount" />
        <asp:HiddenField runat="server" ID="hdfSelectedIndex" />
        <script type="text/javascript">

            $(function () {
                // 使用套件
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
                //#region 分頁初始化
                fnPaginationInit($$("##divPagination"));
            });

            function fnPaginationInit($jq, options) {

                var PageIndex = parseInt($("#hdfPageIndex").val(), 10);
                var PageSize = parseInt($("#hdfPageSize").val(), 10);
                var ItemsCount = parseInt($("#hdfItemsCount").val(), 10);

                var link_to = "javascript:void(0)";
                /* 初始值 */
                var defaults = {
                    callback: function (new_page_index, pagination_container) {
                        $("#hdfPageIndex").val(new_page_index);
                        $('#btnPage').trigger('click');
                        return false;
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
            function btnClick($type, $titleName) {
                var menuID = $("#hdfMenuID").val();
                var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=" + $type;
                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();

                if (selectedTr.length > 0 && $type != "New") {
                    var sa = selectedTr.prop("title").split("_");
                    var keys = { acmYear: sa[0], plnTrlAppCode: sa[1] };

                    src += "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                }


                // 彈出視窗的寬度
                var val_width = document.documentElement.offsetWidth * 0.95;
                if (val_width < 900) val_width = 900

                // 彈出視窗的高度
                var val_height = document.documentElement.offsetHeight * 0.85;
                if (val_height < 650) val_height = 650

                if ((selectedTr.length > 0 && $type != "New") || $type == "New") {
                    //<%--id = iFrameDialog--%>
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                    {
                        title: $titleName,
                        width: val_width,
                        height: val_height
                    });
                } else alert("請先選取一筆資料！");
            }
        </script>
    </form>
</body>
</html>
