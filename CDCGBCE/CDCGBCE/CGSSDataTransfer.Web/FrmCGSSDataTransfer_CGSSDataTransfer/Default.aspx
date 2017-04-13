<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CGSSDataTransfer.Web.FrmCGSSDataTransfer_CGSSDataTransfer.Default" ValidateRequest="true" %>

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
                <h1 class="h1Class">CGSS上傳查詢作業</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">工作計畫名稱</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtFundName" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">民間團體</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtOrganization" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">補(捐)助資料或用途</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtSubject" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">上傳結果</td>
                        <td class="qury_table_td3">
                            <asp:DropDownList ID="ddlSearchUpdateStatus" runat="server">
                                <asp:ListItem Value="0">不區分</asp:ListItem>
                                <asp:ListItem>尚未上傳</asp:ListItem>
                                <asp:ListItem>待回應</asp:ListItem>
                                <asp:ListItem>成功</asp:ListItem>
                                <asp:ListItem>失敗</asp:ListItem>
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
                <asp:Button ID="btnSendXml" runat="server" Text="上傳" class="Btn02" OnClick="btnSendXml_Click" />
                <asp:Button ID="btnSearchXml" runat="server" Text="更新上傳結果" class="Btn02" OnClick="btnSearchXml_Click" />
                <asp:Button ID="btnSendXmlDelete" runat="server" Text="刪除" class="Btn02" OnClick="btnSendXmlDelete_Click" Style="display: none" />
            </div>

            <div class="MainCon2">
                <table style="width: 100%; border: 0; background-color: black;">
                    <tr>
                        <td style="text-align: right; width: 100px"></td>
                        <td style="text-align: center;">
                            <asp:Label ID="Label1" Text="CGSS上傳結果" runat="server" ForeColor="White" />
                        </td>
                        <td style="text-align: right; width: 100px">
                            <asp:CheckBoxList ID="chkIscheck" runat="server" RepeatDirection="Horizontal" Width="100%" Font-Strikeout="False" ForeColor="White">
                                <asp:ListItem>比對資料</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False" CssClass="GridViewStyle" Width="100%">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <%-- ↓↓開始資料行↓↓ --%>
                        <asp:TemplateField ShowHeader="False" HeaderText="選取">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkHeaderselect" runat="server" onclick="checkAll(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="20" />
                            <ItemStyle HorizontalAlign="Center" Width="20" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="動支編號">
                            <ItemTemplate>
                                <asp:Label ID="lblCustomID" runat="server" Text='<%# Eval("CustomID") %>'></asp:Label>
                                <asp:TextBox ID="txtCustomID" runat="server" Text='<%# Eval("CustomID") %>' Style="display: none"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="申請日期">
                            <ItemTemplate>
                                <asp:Label ID="lblApplyDate" runat="server" Text='<%#  Convert.ToDateTime(Eval("ApplyDate")).ToRocDate() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="工作計畫/(非)營業基金">
                            <ItemTemplate>
                                <asp:Label ID="lblFund" runat="server" Text='<%# "("+ Eval("Fund_Year").ToString()+")"+Eval("Fund_Name").ToString() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="120" />
                            <ItemStyle HorizontalAlign="Center" Width="120" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="民間團體">
                            <ItemTemplate>
                                <asp:Label ID="lblOrganization" runat="server" Text='<%# Eval("Organization_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="120" />
                            <ItemStyle HorizontalAlign="Center" Width="120" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="補(捐)助資料或用途">
                            <ItemTemplate>
                                <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("Subject") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="150" />
                            <ItemStyle HorizontalAlign="Center" Width="150" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="活動期間">
                            <ItemTemplate>
                                <asp:Label ID="lblStartDate" runat="server" Text='<%#  Eval("StartDate").ToRocDate() + "<br/>" + Eval("EndDate").ToRocDate()  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>

                        <%--                        <asp:TemplateField HeaderText="活動期間(結束)">
                            <ItemTemplate>
                                <asp:Label ID="lblEndDate" runat="server" Text='<%# ADtoToTaiwan( (Eval("EndDate")??"").ToString())%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="階段">
                            <ItemTemplate>
                                <asp:Label ID="lblRunStatus" runat="server" Text='<%# Eval("階段") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" Width="30" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="上傳日期">
                            <ItemTemplate>
                                <asp:Label ID="lblUploadDateTime" runat="server" Text='<%# Eval("UploadDateTime").ToRocDate() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="是否上傳">
                            <ItemTemplate>
                                <asp:Label ID="lblGV_ISUpload" runat="server" Text='<%# Eval("GV_ISUpload") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="上傳結果">
                            <ItemTemplate>
                                <asp:Label ID="lblGV_UploadStauus" runat="server" Text='<%# Eval("GV_UploadStauus") %>' EnableViewState="True" ToolTip='<%# Eval("GV_CanUploadStatusErrorMessage") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
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


            });
            function Searchbtnclick() {
                var btn = $("#<%= btnSearch2.ClientID %>");
                btn.click();
            }

            function checkAll(header) {
                $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
            }

        </script>
    </form>
</body>
</html>
