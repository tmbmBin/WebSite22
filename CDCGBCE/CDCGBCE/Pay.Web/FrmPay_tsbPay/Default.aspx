<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pay.Web.FrmPay_tsbPay.Default" %>

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
                <h1 class="h1Class">核銷案件資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">會簽編號</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtAtsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                           
                        </td>

                     
                     
                    </tr>

                      <tr>
                            <td class="qury_table_td">分項計畫名稱</td>
                            <td class="qury_table_td3">
                                <asp:DropDownList ID="ddlAtsbPlanCode" runat="server" Width="650px" Style="display: 1none">
                                </asp:DropDownList><!--這邊用不到先註解--->
                            </td>
                        </tr>


                    <tr>
                       <td class="qury_table_td">申請人</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtCtsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td class="qury_table_td">受款人</td>
                        <td class="qury_table_td3">
                            <asp:TextBox ID="txtDtsbPayeeName" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>



                    <tr>
                        <td class="qury_table_td">事由</td>
                        <td class="qury_table_td2" colspan="3">
                            <%-- <asp:TextBox ID="txtAtsbTrustSubsidyName" runat="server" Width="650px"></asp:TextBox>--%>
                            <asp:TextBox ID="txtCtsbMemo" runat="server" Width="650px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="qury_table_tr">
                        <td colspan="4"><span style="color: white">只列出</span>
                            <asp:DropDownList ID="ddlCtsbMarkDate" runat="server">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlCtsbWorkUnitNo" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="">.....</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlCtsbPassFlag" runat="server">
                                <asp:ListItem Value="">不區分</asp:ListItem>
                                <asp:ListItem Value="0">未審核</asp:ListItem>
                                <asp:ListItem Value="1">已審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                <asp:Button ID="btnSearch" runat="server" Text="開始過濾" class="Btn08" OnClick="btnSearch_Click" />
                <asp:Button ID="btnSearch2" runat="server" Text="Button" OnClick="btnSearch2_Click" Style="display: none;" />
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
                <input type="button" id="btnPrint" value="列印黏存單" class="Btn02" />
                <%--                &nbsp;&nbsp;
                <input type="button" id="btnDataInput" value="季報設定" class="Btn02" />--%>
                &nbsp;&nbsp;
                <input type="button" id="btnPrint2" value="列印轉正單" class="Btn02" />

            </div>
            <div class="MainCon2">
                <table style="width: 100%; border: 0; background-color: black;">
                    <tr>
                        <td style="text-align: right; width: 100px"></td>
                        <td style="text-align: center;">
                            <asp:Label ID="Label1" Text="核銷案件登錄資料明細(請依單一頁次進行審核)" runat="server" ForeColor="White" />
                        </td>
                        <td style="text-align: right; width: 100px">
                            <asp:Button ID="btnsetPass" class="Btn09" runat="server" Text="審核" OnClientClick="return false;" />
                        </td>
                    </tr>
                </table>
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
                                <HeaderStyle HorizontalAlign="Center" Width="30" />
                                <ItemStyle HorizontalAlign="Center" Width="30" />
                            </asp:TemplateField>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="年度" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBtsbYear" runat="server" Text='<%# Eval("BtsbYear") %>'></asp:Label>
                                    <asp:Label ID="lblCtsbPayYear" runat="server" Text='<%# Eval("CtsbPayYear")??0 %>' Style="display: none"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="30" />
                                <ItemStyle HorizontalAlign="Center" Width="30" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="會簽編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblAtsbApplyWordNum" runat="server" Text='<%# Eval("AtsbApplyWordNum") %>'></asp:Label>
                                    <asp:Label ID="lblAtsbLastApplyWordNum" runat="server" Text='<%# "("+Eval("AtsbLastApplyWordNum")+")" %>'></asp:Label>
                                    <asp:Label ID="lblBtsbApplyNo" runat="server" Text='<%# Eval("BtsbApplyNo") %>' Style="display: none"></asp:Label>
                                    <!--會簽系統號--->
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核定號" Visible="True">
                                <ItemTemplate>

                                    <asp:Label ID="lblBtsbDecideNo" runat="server" Text='<%# Eval("BtsbDecideNo")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核銷號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblCtsbPayNo" runat="server" Text='<%# Eval("CtsbPayNo")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="40" />
                                <ItemStyle HorizontalAlign="Center" Width="40" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="申請人" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBtsbWorkUserNo" runat="server" Text='<%#  DepParNameFormat( (Eval("CtsbWorkUnitNo")??"").ToString() ) +"<br/>"+ Eval("CtsbWorkUserNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="75" />
                                <ItemStyle HorizontalAlign="Center" Width="75" />
                            </asp:TemplateField>
                            <%--  <asp:TemplateField HeaderText="分項計畫" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblAtsbPlanCode" runat="server" Text='<%# PlanCodeFormat( (Eval("AtsbPlanCode")).ToString()  ,  (Eval("AtsbBgtYear")??"").ToString())  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="200" />
                                <ItemStyle HorizontalAlign="Center" Width="200" />
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="用途說明" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblAtsbTrustSubsidyName" runat="server" Text='<%# Eval("AtsbTrustSubsidyName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="200" />
                                <ItemStyle HorizontalAlign="Center" Width="200" />
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="事由" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblCtsbMemo" runat="server" Text='<%# Eval("CtsbMemo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="180" />
                                <ItemStyle HorizontalAlign="Center" Width="180" />
                            </asp:TemplateField>




                            <asp:TemplateField HeaderText="核定金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblBtsbMoney" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("BtsbMoney")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="核銷金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblCtsbMoney" runat="server" Text='<%#  string.Format( "{0:N0}" ,Eval("CtsbMoney")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="60" />
                                <ItemStyle HorizontalAlign="Center" Width="60" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="審核狀態" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassFlagStats" runat="server" Text='<%# ( (Eval("CtsbPassFlag")??"0").ToString().Equals("1")? "已審核":"未審核" )  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="55" />
                                <ItemStyle HorizontalAlign="Center" Width="55" />
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="審核日期" Visible="True">
                                <ItemTemplate>
                                  <asp:TextBox ID="txttsbPassDTime" runat="server" MyKendoDatePicker="MyKendoDatePicker"  Width="150px" Text='<% # PassDateFormat( (Eval("CtsbPassDTime")??"").ToString() , (Eval("CtsbPassFlag")??"0").ToString()  )%>'   Enabled='<%# (Eval("CtsbPayNo").ToString()=="0")? false:true  %>' ></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="55" />
                                <ItemStyle HorizontalAlign="Center" Width="55" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="是否審核" Visible="True">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkCtsbPassFlag" runat="server" Checked='<%#  (Eval("CtsbPassFlag")??"0").ToString().Equals("1")%> ' Width="40px" Enabled='<%# (Eval("CtsbPayNo").ToString()=="0")? false:true  %>' />
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
                setplanCode();

                fnPaginationInit($$("##divPagination"));

                function fnPaginationInit($jq, options) {

                    var PageIndex = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageIndex"));
                    var PageSize = MyLibraryJs.StringExt.fnGetInt($jq.attr("PageSize"));
                    var ItemsCount = MyLibraryJs.StringExt.fnGetInt($jq.attr("ItemsCount"));

                    //var link_to = URI(location.href)
                    //    .setSearch("pageIndex", "__id__")
                    //    .removeSearch("selectedIndex").toString();


                    var link_to3 = (decodeURIComponent(location.href)).replace('amp;', "").replace("amp;", "")
                    var link_to2 = removeURLParam("selectedIndex", link_to3)
                    var link_to = URI(link_to2)
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

                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();


                        var BtsbYear = selectedTr.prop("title").split("_")[0];
                        var BtsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var BtsbDecideNo = selectedTr.prop("title").split("_")[2];
                        var CtsbPayNo = selectedTr.prop("title").split("_")[3];
                        var CtsbPayYear = selectedTr.prop("title").split("_")[4];
                        //if (CtsbPayNo != "0") {
                        //    alert("預撥號已存在，禁止新增核定資料")
                        //    return;
                        //}

                        var keys = { BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo, CtsbPayNo: CtsbPayNo, CtsbPayYear: CtsbPayYear };

                        var src = "Modify.aspx?MenuID=" + menuID + "&formStatus=New"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "新增資料",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.85
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion


                //#region $("#btnEdit").click
                $("#btnEdit").click(function () {


                    //已審禁止刪除
                    var tmpStatus = $.trim($$("##hlkSelect:contains('V')").parentsUntil("tr").parent().find("[id$=lblPassFlagStats]").text()); //目前審核狀態
                    if (tmpStatus == "已審核") {
                        alert("已審核！禁止編輯及刪除資料");
                        return;
                    }

                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();


                        var BtsbYear = selectedTr.prop("title").split("_")[0];
                        var BtsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var BtsbDecideNo = selectedTr.prop("title").split("_")[2];
                        var CtsbPayNo = selectedTr.prop("title").split("_")[3];
                        var CtsbPayYear = selectedTr.prop("title").split("_")[4];

                        if (CtsbPayNo == "0") {
                            alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                            return;
                        }

                        var keys = { BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo, CtsbPayNo: CtsbPayNo, CtsbPayYear: CtsbPayYear };

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

                        var BtsbYear = selectedTr.prop("title").split("_")[0];
                        var BtsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var BtsbDecideNo = selectedTr.prop("title").split("_")[2];
                        var CtsbPayNo = selectedTr.prop("title").split("_")[3];
                        var CtsbPayYear = selectedTr.prop("title").split("_")[4];

                        if (CtsbPayNo == "0") {
                            alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                            return;
                        }

                        var keys = { BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo, CtsbPayNo: CtsbPayNo, CtsbPayYear: CtsbPayYear };


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



                //#region $("#btnView").click
                $("#btnDelete").click(function () {

                    //已審禁止刪除
                    var tmpStatus = $.trim($$("##hlkSelect:contains('V')").parentsUntil("tr").parent().find("[id$=lblPassFlagStats]").text()); //目前審核狀態
                    if (tmpStatus == "已審核") {
                        alert("已審核！禁止編輯及刪除資料");
                        return;
                    }

                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();

                        var BtsbYear = selectedTr.prop("title").split("_")[0];
                        var BtsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var BtsbDecideNo = selectedTr.prop("title").split("_")[2];
                        var CtsbPayNo = selectedTr.prop("title").split("_")[3];
                        var CtsbPayYear = selectedTr.prop("title").split("_")[4];

                        if (CtsbPayNo == "0") {
                            alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                            return;
                        }

                        var keys = { BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo, CtsbPayNo: CtsbPayNo, CtsbPayYear: CtsbPayYear };


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


                //#region $("#btnView").click
                $("#btnPrint").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {

                        var menuID = $("#hdfMenuID").val();
                        var BtsbYear = selectedTr.prop("title").split("_")[0];
                        var BtsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var BtsbDecideNo = selectedTr.prop("title").split("_")[2];
                        var CtsbPayNo = selectedTr.prop("title").split("_")[3];
                        var CtsbPayYear = selectedTr.prop("title").split("_")[4];
                        var tsbApplyWordNum = selectedTr.find("[id$=lblAtsbApplyWordNum]").text();
                        if (CtsbPayNo == "0") {
                            alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                            return;
                        }

                        var keys = { BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo, CtsbPayNo: CtsbPayNo, CtsbPayYear: CtsbPayYear };



                        //alert(keys);


                        var src = "PayPrint2.aspx?menuID=" + menuID + "&formStatus=View"
                           + "&Keys=" + encodeURIComponent(JSON.stringify(keys));

                        //alert(src);

                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "列印資料",
                                width: 1050,
                                height: 750
                            });



                    } else {
                        alert("請先選取一筆資料！");
                    }

                    return false;
                });
                //#endregion



                //#region $("#btnView").click(轉正用)
                $("#btnPrint2").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        var menuID = $("#hdfMenuID").val();


                        var BtsbYear = selectedTr.prop("title").split("_")[0];
                        var BtsbApplyNo = selectedTr.prop("title").split("_")[1];
                        var BtsbDecideNo = selectedTr.prop("title").split("_")[2];
                        var CtsbPayNo = selectedTr.prop("title").split("_")[3];
                        var CtsbPayYear = selectedTr.prop("title").split("_")[4];

                        if (CtsbPayNo == "0") {
                            alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                            return;
                        }

                        var keys = { BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo, CtsbPayNo: CtsbPayNo, CtsbPayYear: CtsbPayYear };

                        var src = "PayPrintoffset.aspx?menuID=" + menuID + "&formStatus=View"
                            + "&Keys=" + encodeURIComponent(JSON.stringify(keys));
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "列印資料",
                                width: 1050,
                                height: 750
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion












                //#region $("#btnView").click 季報設定
                $("#btnDataInput").click(function () {
                    var selectedTr = $$("##hlkSelect:contains('V')").parentsUntil("tr").parent();
                    if (selectedTr.length > 0) {
                        // var menuID = $("#hdfMenuID").val();
                        var menuID = '149A'

                        var tsbApplyWordNum = selectedTr.find("[id$=lblAtsbApplyWordNum]").text();


                        var src = "../../RptInputData.Web/FrmRptInputData_tsbRptInputDataM/Default.aspx?menuID=" + menuID
                            + "&tsbApplyWordNum=" + tsbApplyWordNum;
                        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                            {
                                title: "季報設定",
                                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                                height: document.documentElement.offsetHeight * 0.85
                            });
                    } else {
                        alert("請先選取一筆資料！");
                    }
                });
                //#endregion





                //審核
                $("#btnsetPass").click(function () {

                    var tsbPassFlag = "";
                    var ArrayData = new Array();
                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        var tmpStatus = $.trim($(this).find("[id$=lblPassFlagStats]").text()); //目前審核狀態
                        var tmpCheck = $(this).find("[id$=chkCtsbPassFlag]").is(':checked'); //勾選否
                        var tmpCheckEnable = $(this).find("[id$=chkCtsbPassFlag]").prop("disabled");//是否可以勾選
                        var tmptsbApplyNo = $.trim($(this).find("[id$=lblBtsbApplyNo]").text()); //會簽號                                          
                        var tmpDecideNo = $.trim($(this).find("[id$=lblBtsbDecideNo]").text()); //核定號
                        var tmptsbPayNo = $.trim($(this).find("[id$=lblCtsbPayNo]").text()); // 核銷號
                        var tmptsbPayYear = $.trim($(this).find("[id$=lblCtsbPayYear]").text()); //核銷年度
                        var tmptsbPassDTime = $.trim($(this).find("[id$=txttsbPassDTime]").val()); //核銷日期
                        //alert(tmptsbPassDTime);
                        if (tmpCheckEnable.toString() == "false") {


                            if (tmpStatus == "已審核" && tmpCheck.toString() == "false") {
                                var tsbPay = new Object()
                                tsbPay.ApplyNo = tmptsbApplyNo;
                                tsbPay.DecideNo = tmpDecideNo;
                                tsbPay.PayNo = tmptsbPayNo;
                                tsbPay.IsCheck = tmpCheck;
                                tsbPay.tsbPayYear = tmptsbPayYear; //核銷年度
                                tsbPay.tsbPassDTime = tmptsbPassDTime; //核銷日期
                                ArrayData.push(tsbPay);
                            } else if (tmpStatus == "未審核" && tmpCheck.toString() == "true") {
                                var tsbPay = new Object()
                                tsbPay.ApplyNo = tmptsbApplyNo;
                                tsbPay.DecideNo = tmpDecideNo;
                                tsbPay.PayNo = tmptsbPayNo;
                                tsbPay.IsCheck = tmpCheck;
                                tsbPay.tsbPayYear = tmptsbPayYear; //核銷年度
                                tsbPay.tsbPassDTime = tmptsbPassDTime; //核銷日期
                                ArrayData.push(tsbPay);
                            }
                        }

                    });

                    $.ajax({
                        type: "POST",
                        url: "ajax02.aspx",
                        dataType: "JSON",
                        data: { 'Array': JSON.stringify(ArrayData) },
                        success: function (result) {
                            alert(result.msg);
                            location.href = location.href + '&WIN=0';
                        },
                        error: function () { alert("error"); }
                    });

                });


                $("#<%= ddlCtsbMarkDate.ClientID %>").change(function () {
                    Searchbtnclick();
                });
                $("#<%= ddlCtsbWorkUnitNo.ClientID %>").change(function () {
                    Searchbtnclick();
                });
                $("#<%= ddlCtsbPassFlag.ClientID %>").change(function () {
                    Searchbtnclick();
                });
            });

            function Searchbtnclick() {
                var btn = $("#<%= btnSearch2.ClientID %>");
                btn.click();
            }


            //移除URL 參數 2017.02.23
            function removeURLParam(key, sourceURL) {
                var rtn = sourceURL.split("?")[0],
                    param,
                    params_arr = [],
                    queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
                if (queryString !== "") {
                    params_arr = queryString.split("&");
                    for (var i = params_arr.length - 1; i >= 0; i -= 1) {
                        param = params_arr[i].split("=")[0];
                        if (param === key) {
                            params_arr.splice(i, 1);
                        }
                    }
                    rtn = rtn + "?" + params_arr.join("&");
                }
                return rtn;
            }



            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";
                $('#<%= ddlAtsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>
</html>
