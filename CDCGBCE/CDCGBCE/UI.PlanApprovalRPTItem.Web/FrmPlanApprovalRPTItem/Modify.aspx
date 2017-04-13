<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="UI.PlanApprovalRPTItem.Web.FrmPlanApprovalRPTItem.Modify" %>

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
            <h1 class="h1Class">出國計畫執行情形維護編輯作業</h1>
        </div>
        <div runat="server" id="editDiv">
            <asp:Panel ID="panInput" runat="server">
                <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                    <tr>
                        <td class="qury_table_td">實際出國計畫號</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtplnTrlAppCode" ReadOnly="true" runat="server" Style="width: 100px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">核定出國計畫案</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddlplnTrlPlanCode" runat="server" AppendDataBoundItems="True"
                                defaultValue=""
                                DataTextField="plnTrlPlanName" DataValueField="plnTrlPlanCode" Style="width: 650px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">實際出國計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtplnTrlAppName" runat="server" Style="width: 645px;"></asp:TextBox>
                        </td>
                    </tr>
                    <%-- <tr >
                        <td class="qury_table_td"><span style="color:red;"></span>內容簡述</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtappTrlContent" runat="server" Style="width: 645px;"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td">國家</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlCountry" runat="server" Style="width: 150px;"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">城市</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlCity" runat="server" Style="width: 150px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">出國期間(起)</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlSDate" runat="server" Style="width: 120px;" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">出國期間(迄)</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlEDate" runat="server" Style="width: 120px;" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <div id="tabETitle" class="editTitle">出 國 報 告 資 料 登 打</div>
            <asp:Panel ID="panInputRPTItem" runat="server">
                <table class="MainCon3-1" style="width: 100%; vertical-align: top" border="1">
                    <tr>
                        <td class="qury_table_td"><span style="color: red;"></span>報告提出日期</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtptdTrlRPTDate" runat="server" Style="width: 120px;" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                        <td class="qury_table_td"><span style="color: red;"></span>報告未填寫原因</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtptdTrlCause" runat="server" Style="width: 200px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color: red;"></span>建議項數</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtptdTrlRecomItemIn" runat="server" Style="width: 150px;"></asp:TextBox>
                            <asp:HiddenField ID="txtptdTrlRecomItem" runat="server"></asp:HiddenField>
                        </td>
                        <td class="qury_table_td"><span style="color: red;"></span>已採行項數</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtptdTrlAdoptionItem" runat="server" Style="width: 150px;" onblur="GetTotalRPTItem();"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color: red;"></span>未採行項數</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtptdTrlNoAdoptionItemIn" runat="server" Style="width: 150px;"></asp:TextBox>
                            <asp:HiddenField ID="txtptdTrlNoAdoptionItem" runat="server"></asp:HiddenField>
                        </td>
                        <td class="qury_table_td"><span style="color: red;"></span>研議中項數</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtptdTrlDiscussItem" runat="server" Style="width: 150px;" onblur="GetTotalRPTItem();"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color: red;"></span>報告逾期原因</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtptdOverdueCause" runat="server" Style="width: 645px;" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color: red;"></span>備註</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtptdTrlMemo" runat="server" Style="width: 645px;"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <!--目前狀態，只是不用FormStatus而寫到前台而已沒為什麼...-->
            <asp:HiddenField ID="hdfFormStatus" runat="server" />
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" CssClass="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" CssClass="Btn04" />
        </asp:Panel>
        <script type="text/javascript">

            $(function () {
                fnPageInit();
            });

            // 頁面初始化
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
            }

            $("#btnClose").click(function () {
                parent.closeDlg();
                return false;
            });

            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                    return true;
                }
                return false;
            });

            function GetTotalRPTItem() {
                var ptdTrlNoAdoptionItem_text = $("#txtptdTrlAdoptionItem").val();
                var ptdTrlDiscussItem_text = $("#txtptdTrlDiscussItem").val();

                var ptdTrlNoAdoptionItem = parseInt(ptdTrlNoAdoptionItem_text, 10);
                var ptdTrlDiscussItem = parseInt(ptdTrlDiscussItem_text, 10);

                if (isNaN(ptdTrlNoAdoptionItem))
                    ptdTrlNoAdoptionItem = 0;
                if (isNaN(ptdTrlDiscussItem))
                    ptdTrlDiscussItem = 0;

                $("#txtptdTrlRecomItem, #txtptdTrlRecomItemIn").val(ptdTrlNoAdoptionItem + ptdTrlDiscussItem);

            }
        </script>
    </form>
</body>
</html>
