<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbPayeeT.Web.FrmtsbPayeeT_tsbPayee.Modify" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>

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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h1Class">委辦/補(捐)助對象維護</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server" OnDataBound="FormView1_DataBound">
                <ItemTemplate>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                                <tr>
                                    <td style="text-align: right; width: 10%;"><span style="color: Red;">＊</span>統一編號</td>
                                    <td style="text-align: left; width: 23%;">
                                        <asp:TextBox ID="txttsbPayeeNo" runat="server" Text='<%# Eval("tsbPayeeNo") %>' MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right; width: 10%;">身分別</td>
                                    <td style="text-align: left; width: 23%;">
                                        <asp:DropDownList ID="ddltsbPayeeRoleNo" runat="server" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;display:none">類別</td>
                                    <td style="text-align: left;display:none">
                                        <asp:DropDownList ID="ddltsbPayeeKind" runat="server" AppendDataBoundItems="True">
                                            <asp:ListItem Value="1" Selected="True">受補助單位</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">屬性</td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="ddltsbPayeePropertyNo" runat="server" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;"><span style="color: Red;">＊</span>對象名稱</td>
                                    <td style="text-align: left;" colspan="3">
                                        <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' CssClass="Width70p"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">縣市
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="ddltsbCityID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddltsbCityID_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;">鄉鎮市區
                                    </td>
                                    <td style="text-align: left;" colspan="3">
                                        <asp:DropDownList ID="ddltsbCityAreaNo" runat="server" AutoPostBack="True">
                                        </asp:DropDownList>
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
                parent.location.href = parent.location.href + "&WIN=0";
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
