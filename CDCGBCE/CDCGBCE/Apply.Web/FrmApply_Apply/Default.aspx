<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Apply.Web.FrmApply_Apply.Default" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
                <h1 class="h1Class">會簽資料查詢作業</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">動支編號</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="650px" Style="display: none">
                            </asp:DropDownList><!--這邊用不到先註解--->
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">捐助事項或用途</td>
                        <td class="qury_table_td3">

                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="650px"></asp:TextBox>

                        </td>
                    </tr>
                    <tr class="qury_table_tr">
                        <td colspan="2"><span style="color: white">只列出</span>

                            <asp:DropDownList ID="ddltsbMarkDate" runat="server">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="">.....</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddltsbPassFlag" runat="server">
                                <asp:ListItem Value="">不區分</asp:ListItem>
                                <asp:ListItem Value="0">未審核</asp:ListItem>
                                <asp:ListItem Value="1">已審核</asp:ListItem>
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
                <input type="button" id="btnNew" value="新增" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnEdit" value="編修" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnDelete" value="刪除" class="Btn02" />
                &nbsp;&nbsp;
                <input type="button" id="btnView" value="檢視" class="Btn02" />
            </div>

            <div class="MainCon2">
                <table style="width: 100%; border: 0; background-color: black;">
                    <tr>
                        <td style="text-align: right; width: 100px"></td>
                        <td style="text-align: center;">
                            <asp:Label ID="Label1" Text="會簽資料明細(請依單一頁次進行審核)" runat="server" ForeColor="White" />
                        </td>
                        <td style="text-align: right; width: 100px">
                            <asp:Button ID="btnsetPass" class="Btn09" runat="server" Text="審核" OnClientClick="return false;" />
                        </td>
                    </tr>
                </table>
                <input type="hidden" id="hdfMenuID" runat="server" />

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
                        <asp:TemplateField HeaderText="年度">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                                <asp:Label ID="lbltsbBgtYear" runat="server" Text='<%# Eval("tsbBgtYear") %>' Style="display: none"></asp:Label>
                                <asp:HiddenField ID="hdftsbApplyNo" runat="server" Value='<%# Eval("tsbApplyNo") %>'></asp:HiddenField>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" Width="30" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="會簽日期">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbMarkDate" runat="server" Text='<%# Eval("tsbMarkDate").ToRocDate() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="會簽編號">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum")+"<br/>" %>'></asp:Label>
                                <asp:Label ID="lbltsbLastApplyWordNum" runat="server" Text='<%# "("+Eval("tsbLastApplyWordNum")+")" %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="申請人">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbWorkUserNo" runat="server" Text='<%#  DepParNameFormat( (Eval("tsbWorkUnitNo")).ToString() ) +"<br/>"+ Eval("tsbWorkUserNo") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="80" />
                            <ItemStyle HorizontalAlign="Center" Width="80" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="會簽金額">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbMoney" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("tsbMoney")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="75" />
                            <ItemStyle HorizontalAlign="Center" Width="75" />
                        </asp:TemplateField>


                        <%--    <asp:TemplateField HeaderText="分項計畫">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# PlanCodeFormat((Eval("tsbPlanCode")).ToString(), (Eval("tsbBgtYear")).ToString() )  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="240" />
                            <ItemStyle HorizontalAlign="Center" Width="240" />
                        </asp:TemplateField>--%>


                        <asp:TemplateField HeaderText="用途說明" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="200" />
                            <ItemStyle HorizontalAlign="Center" Width="200" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="審核狀態">
                            <ItemTemplate>
                                <asp:Label ID="lblPassFlagStats" runat="server" ToolTip='<%# Eval("tsbPassDTime").ToRocDate() %>' Text='<%# ( (Eval("tsbPassFlag")??"0").ToString().Equals("1")? "已審核":"未審核" )  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="是否審核">
                            <ItemTemplate>
                                <asp:CheckBox ID="chktsbPassFlag" runat="server" Checked='<% #Eval("tsbPassFlag").ToString().Equals("1")%> ' Width="40px" Enabled="true" />
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
                            height: document.documentElement.offsetHeight * 0.85
                        });
                });
                //#endregion


                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();


                    var tmpStatus = $.trim($$("##hlkSelect:contains('V')").parentsUntil("tr").parent().find("[id$=lblPassFlagStats]").text()); //目前審核狀態
                    if (tmpStatus == "已審核") {
                        alert("已審核！禁止編輯及刪除資料");
                        return;
                    }



                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbApplyNo = selectedTr.prop("title").split("_")[1];

                        var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=Edit"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "修改資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.85
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

                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "檢視資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.85
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

                //#region $("#btnDelete").click
                $("#btnDelete").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();


                    //已審禁止刪除
                    var tmpStatus = $.trim($$("##hlkSelect:contains('V')").parentsUntil("tr").parent().find("[id$=lblPassFlagStats]").text()); //目前審核狀態
                    if (tmpStatus == "已審核") {
                        alert("已審核！禁止編輯及刪除資料");
                        return;
                    }


                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var tsbYear = selectedTr.prop("title").split("_")[0];
                        var tsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var keys = { tsbYear: tsbYear, tsbApplyNo: tsbApplyNo };

                        var src = "Modify.aspx?menuID=" + menuID + "&formStatus=View&formStatus1=Delete"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "刪除資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.85
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

                //#region  審核
                $("#btnsetPass").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {

                        var menuID = $("#hdfMenuID").val();
                        var ArrayData = new Array();

                        $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                            var tmpStatus = $.trim($(this).find("[id$=lblPassFlagStats]").text()); //目前審核狀態
                            var tmpCheck = $(this).find("[id$=chktsbPassFlag]").is(':checked'); //勾選否
                            var tmpCheckEnable = $(this).find("[id$=chktsbPassFlag]").prop("disabled");//是否可以勾選
                            var tsbYear = $.trim($(this).find("[id$=lbltsbYear]").text()); //年度
                            var tsbApplyNo = $.trim($(this).find("[id$=hdftsbApplyNo]").val()); //編號
                            if (tmpCheckEnable.toString() == "false") {

                                if (tmpStatus == "已審核" && tmpCheck.toString() == "false") {
                                    var tsbApply = new Object()
                                    tsbApply.Year = tsbYear;
                                    tsbApply.ApplyNo = tsbApplyNo;
                                    tsbApply.IsCheck = tmpCheck;
                                    ArrayData.push(tsbApply);
                                } else if (tmpStatus == "未審核" && tmpCheck.toString() == "true") {
                                    var tsbApply = new Object()
                                    tsbApply.Year = tsbYear;
                                    tsbApply.ApplyNo = tsbApplyNo;
                                    tsbApply.IsCheck = tmpCheck;
                                    ArrayData.push(tsbApply);
                                }
                            }

                        });
                        $.ajax({
                            type: "POST",
                            url: "AJAXsetPass.ashx",
                            dataType: "JSON",
                            data: { 'Array': JSON.stringify(ArrayData) },
                            error: function () { alert("審核時發生錯誤！"); },
                            success: function (result) {
                                alert(result.msg);
                                location.href = location.href + '&WIN=0';
                            }
                        });

                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion

                $("#<%= ddltsbMarkDate.ClientID %>").change(function () {
                    Searchbtnclick();
                });
                $("#<%= ddltsbWorkUnitNo.ClientID %>").change(function () {
                    Searchbtnclick();
                });
                $("#<%= ddltsbPassFlag.ClientID %>").change(function () {
                    Searchbtnclick();
                });

            });
            function Searchbtnclick() {


                var btn = $("#<%= btnSearch2.ClientID %>");
                btn.click();
            }


            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>
</html>
