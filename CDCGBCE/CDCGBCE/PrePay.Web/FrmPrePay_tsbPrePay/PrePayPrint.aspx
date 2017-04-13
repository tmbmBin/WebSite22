<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrePayPrint.aspx.cs" Inherits="PrePay.Web.FrmPrePay_tsbPrePay.PrePayPrint" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %><%: Styles.Render("~/Content/jqueryui") %><%: Styles.Render("~/Content/jqueryval") %><%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
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
            <h1 class="h1Class">
                <asp:Label ID="lbltitle" runat="server" Text="支出憑證黏存單列印"></asp:Label>
            </h1>
            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%">
                <ItemTemplate>
                    <!------------------->
                    <table style="width: 100%; vertical-align: top;" border="0">
                        <tr>
                            <td class="qury_table_td">會簽編號：</td>
                            <td class="qury_table_td2">
                                <asp:Label ID="lbltsbApplyWordNum" runat="server" Text="沒有會簽編號"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">可列印報表：</td>
                            <td class="qury_table_td2">
                                <asp:RadioButtonList ID="RdbSelect" runat="server">
                                    <asp:ListItem>支出憑證黏存單</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                    <!----------------------->
                </ItemTemplate>
            </asp:FormView>
            <div style="text-align: center; margin: 10px;">
               <%-- <asp:Button ID="btnExcel" runat="server" OnClick="btnExcel_Click" Text="匯出Excel檔" class="Btn04" />--%>

                  <asp:Button ID="btnExcel" runat="server" OnClick="btnExcel_Click" Text="列印Excel" class="Btn04" Visible="False"  />
                &nbsp;<asp:Button ID="btnPDF" runat="server" OnClick="btnExcel_Click" Text="列印PDF" class="Btn03" />
            </div>
            <%: Scripts.Render("~/bundles/jquery") %>
            <%: Scripts.Render("~/bundles/basic") %>
            <%: Scripts.Render("~/bundles/jqueryui") %>
            <%: Scripts.Render("~/bundles/jqueryval") %>
            <%: Scripts.Render("~/bundles/kendo") %>
            <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
            <%: Scripts.Render("~/bundles/MyLibraryJs") %>
            <%: Scripts.Render("~/bundles/jquery.pagination") %>
            <%: Scripts.Render("~/bundles/URI") %>


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
                        //$.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />刪除中...</b></h1>" });
                        return true;
                    }
                    return false;
                });
                //#endregion


                //#region $("#btnSave").click
                $("#btnSave").click(function () {
                    if ($("#form1").valid()) {
                        //$.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />儲存中...</b></h1>" });
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
