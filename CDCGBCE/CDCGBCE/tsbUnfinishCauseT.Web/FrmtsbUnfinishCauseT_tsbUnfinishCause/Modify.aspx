<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbUnfinishCauseT.Web.FrmtsbUnfinishCauseT_tsbUnfinishCause.Modify" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%-- Style專區 --%>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/jqueryui") %>
    <%: Styles.Render("~/Content/jqueryval") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
    <%-- JavaScript專區 --%>
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/basic") %>
    <%: Scripts.Render("~/bundles/jqueryui") %>
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
            <h1 class="h1Class">未完成原因資料維護</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server" OnDataBound="FormView1_DataBound">
                <ItemTemplate>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                                <tr>
                                    <td class="qury_table_td">年度</td>
                                    <td class="qury_table_td2" colspan="3">
                                        <asp:Label ID="labtsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                                        <asp:Label ID="labtsbUfCauseNo" runat="server" Text='<%# Eval("tsbUfCauseNo") %>' Style="display: none"></asp:Label>
                                        <asp:TextBox ID="txttsbYear" runat="server" Text='<%# Eval("tsbYear") %>' Style="display: none"></asp:TextBox>
                                        <asp:TextBox ID="txttsbUfCauseNo" runat="server" Text='<%# Eval("tsbUfCauseNo") %>' Style="display: none"></asp:TextBox>
                                        <asp:TextBox ID="txttsbCreateDTime" runat="server" Text='<%# Eval("tsbCreateDTime") %>' Style="display: none"></asp:TextBox>
                                        <asp:TextBox ID="txttsbCreateUser" runat="server" Text='<%# Eval("tsbCreateUser") %>' Style="display: none"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="qury_table_td">原因號碼</td>
                                    <td class="qury_table_td2">
                                        <asp:TextBox ID="txttsbAliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %>' CssClass="Width70p"></asp:TextBox>
                                    </td>
                                    <td class="qury_table_td">類別</td>
                                    <td class="qury_table_td2">
                                        <asp:DropDownList ID="ddltsbType" runat="server">
                                            <asp:ListItem Text="委辦" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="補捐助" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="qury_table_td">原因名稱</td>
                                    <td class="qury_table_td2" colspan="3">
                                        <asp:TextBox ID="txttsbUfCauseName" runat="server" Text='<%# Eval("tsbUfCauseName") %>' TextMode="MultiLine" CssClass="Width95p" Height="50px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ItemTemplate>
            </asp:FormView>

            <div style="margin-top: 10px; text-align: center;">
                <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
                    <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDel_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
                </asp:Panel>
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
                fnPageInit();
            });


            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href;
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: '資料處理中，請稍後...' });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    $.blockUI({ message: '資料處理中，請稍後...' });
                    return true;
                } else {
                    alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                }
                return false;
            });
            //#endregion


            function fnPageInit() {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
                $("#form1").validate({
                    onsubmit: false, ignore: ""
                });

                //預設驗證規則
                $("[datepicker='datepicker']").each(function () {
                    $(this).rules("add", {
                        date: true
                    });
                });

                $(":input").bind("focusout keyup change", function () {
                    $(this).valid();
                });

                //#endregion 基本           
            }

        </script>
    </form>
</body>
</html>
