<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="UI.TrlCodeMaintain.Web.FrmTrlCodeManintain.Modify" %>

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
            <div>
                <h1 class="h1Class">
                    <asp:Label ID="lbltitle" runat="server" Text="出國計畫代碼名稱新增作業"></asp:Label></h1>
                <asp:FormView ID="FormView1" runat="server" Width="100%" OnDataBound="FormView1_DataBound">
                    <ItemTemplate>

                        <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>出國計畫代碼</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtplnTrlPlanCode" runat="server" Width="100px" Text='<%# Eval("AplnTrlPlanCode") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>分支計畫</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlPlanCode" runat="server" Width="700px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>出國計畫案</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtplnTrlPlanName" runat="server" Text='<%# Eval("AplnTrlPlanName") %>' Width="700px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>預算數</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtbgtMoney" runat="server" Text='<%#  Eval("BbgtMoney").ToInt() %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>出國類別</td>
                                <td class="qury_table_td3">
                                    <asp:RadioButtonList ID="chkcodTrlKind" runat="server" RepeatDirection="Horizontal">
                                    </asp:RadioButtonList>
                                    <%--
                                    <asp:CheckBoxList ID="chkcodTrlKind" runat="server" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                    --%>
                                </td>
                            </tr>
                            <tr>

                                <td class="qury_table_td"><span style="color: Red;">＊</span>案件種類</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlplnTrlKind" runat="server">
                                        <asp:ListItem Value="029201">029201 大陸旅費</asp:ListItem>
                                        <asp:ListItem Value="029301">029301 國外旅費</asp:ListItem>
                                        <asp:ListItem Value="020102">020102 訓練費</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>經費單位</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlbgtDepCode" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td">案件號(簡稱)</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtcodPrjNo" runat="server" Text='<%# Eval("AcodPrjNo") %>'></asp:TextBox>
                                    <asp:TextBox ID="txtplnLevel" runat="server" Text='<%# Eval("AplnLevel") %>' Style="display: none"></asp:TextBox>
                                    <!--級別  -->
                                    <asp:TextBox ID="txtplnLevelEnd" runat="server" Text='<%# Eval("AplnLevelEnd") %>' Style="display: none"></asp:TextBox>
                                    <!--結尾級別  -->

                                </td>
                            </tr>

                            <tr>
                                <td class="qury_table_td">變更日期</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtplnModifyDate" runat="server" Width="130px" MyKendoDatePicker="MyKendoDatePicker" Text='<%# shareFunction01.fun01.Converto_ROCstring(Convert.ToDateTime(Eval("AplnModifyDate"))) %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td">變更核准文號</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtplnModifyPrjNo" runat="server" Text='<%# Eval("AplnModifyPrjNo") %>' ></asp:TextBox>
                                </td>
                            </tr>

                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>

        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn04" OnClick="btnDelete_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" CssClass="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" CssClass="Btn04" />
        </asp:Panel>

        <%-- JavaScript專區 Start --%>
        <script type="text/javascript">

            $(function () {
                fnPageInit();
                setplanCode();
                ViewStatusControl();

            });

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href + "&WIN=0";
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: '<h1>資料刪除中，請耐心等候...</h1>' });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    $.blockUI({ message: '<h1>資料儲存中，請耐心等候...</h1>' });
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


            //編輯區檢查
            function btn_AddEdit_check() {
                var tmpMoney = parseInt($('#txtEtsbMoney').val(), 10); //金額
                var tmptsbContractMoney = parseInt($('#txtEtsbContractMoney').val(), 10); // 合約金額
                //alert(tmpMoney );
                //alert(tmptsbContractMoney);

                if (tmpMoney > tmptsbContractMoney) {
                    alert('合約金額不可小於核定金額');
                    return false;

                }
            }
            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";


                $('#<%=  this.FormView1.FindControl("ddlPlanCode").ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");

            }

            //元件啟用顯示
            function ViewStatusControl() {
                var FormStatus = "<%= this.FormStatus %>"
                if (FormStatus == "View" || FormStatus == "Delete") {
                    disableForm("form1", true)
                }
            }


            //檢視禁止
            function disableForm(formId, TrueOrFalse) {

                $("form[id='" + formId + "'] :text").attr("readonly", "readonly");
                $("form[id='" + formId + "'] textarea").attr("readonly", "readonly");
                //$("form[id='" + formId + "'] select option:not(:selected)").attr("disabled", true);
                $("form[id='" + formId + "'] select option:not(:selected)").remove();
                $("form[id='" + formId + "'] :radio").attr("readonly", "readonly");
                $("form[id='" + formId + "'] :checkbox").attr("disabled", true);
                // $('[MyKendoDatePicker=MyKendoDatePicker]').data("kendoDatePicker").enable(false);
                $("form[id='" + formId + "'] [MyKendoDatePicker=MyKendoDatePicker]").data("kendoDatePicker").enable(false);

            }


        </script>
        <%-- JavaScript專區 End --%>
    </form>
</body>
</html>
