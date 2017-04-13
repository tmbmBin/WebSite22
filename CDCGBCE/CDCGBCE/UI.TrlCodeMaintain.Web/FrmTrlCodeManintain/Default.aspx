<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.TrlCodeMaintain.Web.FrmTrlCodeManintain.Default" %>

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
                <h1 class="h1Class">核定出國計畫案查詢</h1>
                <table style="width: 100%" border="0">
                    <tr>
                        <td class="qury_table_td">核定出國計畫號</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtplnTrlPlanCode" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">核定出國計畫名稱</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtplnTrlPlanName" runat="server" Width="650px"></asp:TextBox>
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
                <asp:Button ID="btnSearch2" runat="server" Text="Button" OnClick="btnSearch2_Click" Style="display: none;" />
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
                <h1 class="h1Class">核定出國計畫案資料</h1>
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
                                <HeaderStyle HorizontalAlign="Center" Width="25" />
                                <ItemStyle HorizontalAlign="Center" Width="25" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="年度" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblcodCodeVer" runat="server" Text='<%# Eval("AcodCodeVer") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="30" />
                                <ItemStyle HorizontalAlign="Center" Width="30" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核定出國計畫號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblplnTrlPlanCode" runat="server" Text='<%# Eval("AplnTrlPlanCode") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="75" />
                                <ItemStyle HorizontalAlign="Center" Width="75" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核定出國計畫名稱" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblplnTrlPlanName" runat="server" Text='<%# Eval("AplnTrlPlanName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="300" />
                                <ItemStyle HorizontalAlign="Center" Width="300" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="案件種類" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblAplnTrlKindName" runat="server" Text='<%#   GetplnTrlKindName( Eval("AplnTrlKind").ToString()) %>'></asp:Label>
                                    <asp:Label ID="lblAplnTrlKind" runat="server" Text='<%# Eval("AplnTrlKind") %>' style="display:none"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="55" />
                                <ItemStyle HorizontalAlign="Center" Width="55" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="預算數" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblbgtMoney" runat="server" Text='<%#  Eval("BbgtMoney").ToMoney()  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>


                             <asp:TemplateField HeaderText="流用數" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblTransferMoneyOld" runat="server" Text='<%#  Eval("bgtTransferMoneyOld").ToMoney()  %>' Style="display:none"></asp:Label> <!--- Debug用--->
                                    <asp:Label ID="lblTransferMoney" runat="server" Text='<%#  Eval("bgtTransferMoney").ToMoney()  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="會簽數" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblApplyPayMoney" runat="server" Text='<%#  Eval("ApplyPayMoney").ToMoney()  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="餘額數" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBalanceMoney" runat="server" Text='<%#  Eval("BalanceMoney").ToMoney()  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="70" />
                                <ItemStyle HorizontalAlign="Center" Width="70" />
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

                    link_to = decodeURIComponent(link_to); // 後端有編碼才需要加

                    /* 初始值 */
                    var defaults = {
                        callback: function (new_page_index, pagination_container) {  return true;  },
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
            });

            // 按鈕事件-Start
            function btnClick($type, $titleName) {

                var menuID = $("#hdfMenuID").val();
                var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=" + $type;
                var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();

                // 非檢視時，要傳 Key 值。
                if (selectedTr.length > 0 && $type != "New") {

                    var AcodCodeVer = selectedTr.prop("title").split("_")[0];
                    var AplnTrlPlanCode = selectedTr.prop("title").split("_")[1];
                    var BbgtYear = selectedTr.prop("title").split("_")[2];
                    var BbgtNo = selectedTr.prop("title").split("_")[3];

                    var keys = { AcodCodeVer: AcodCodeVer, AplnTrlPlanCode: AplnTrlPlanCode, BbgtYear: BbgtYear, BbgtNo: BbgtNo };

                    src = src + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                }

                // 彈出視窗的寬度
                var val_width = document.documentElement.offsetWidth * 0.95;
                if (val_width < 900) val_width = 900

                // 彈出視窗的高度
                var val_height = document.documentElement.offsetHeight * 0.85;
                if (val_height < 650) val_height = 650

                if ((selectedTr.length > 0 && $type != "New") || $type == "New") {
                    MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                    {
                        title: $titleName,
                        width: val_width,
                        height: val_height
                    });
                } else alert("請先選取一筆資料！");
            }
            // 按鈕事件-End

            function Searchbtnclick() {
                var btn = $("#<%= btnSearch2.ClientID %>");
                btn.click();
            }




           



        </script>


    </form>
</body>
</html>
