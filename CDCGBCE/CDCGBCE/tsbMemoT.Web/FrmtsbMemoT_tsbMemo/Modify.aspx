<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbMemoT.Web.FrmtsbMemoT_tsbMemo.Modify" %>

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
        <div class="MainCon">
            <h1 class="h1Class">備註資料維護作業</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server" OnDataBound="FormView1_DataBound">
                <ItemTemplate>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                                <tr>
                                    <td class="qury_table_td">年度</td>
                                    <td class="qury_table_td2" colspan="3">
                                        <asp:Label ID="lab_tsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                                        <asp:Label ID="lab_tsbMemoNo" runat="server" Text='<%# Eval("tsbMemoNo") %>' Style="display: none"></asp:Label>
                                        <asp:TextBox ID="txt_tsbCreateDTime" runat="server" Text='<%# Eval("tsbCreateDTime") %>' Style="display: none"></asp:TextBox>
                                        <asp:TextBox ID="txt_tsbCreateUser" runat="server" Text='<%# Eval("tsbCreateUser") %>' Style="display: none"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="qury_table_td">備註號碼</td>
                                    <td class="qury_table_td2">註&nbsp;<asp:TextBox ID="txt_tsbAliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %>' Width="50px" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                                        <span style="color: Red;">＊號碼請填三碼，例如：001。</span>
                                    </td>
                                    <td class="qury_table_td">類別</td>
                                    <td class="qury_table_td2">
                                        <asp:DropDownList ID="ddltsbType" runat="server">
                                            <asp:ListItem Text="委辦" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="補捐助" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField runat="server" ID="hdf_tsbKind" Value='<%# Eval("tsbKind") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="qury_table_td" rowspan="2">備註名稱</td>
                                    <td class="qury_table_td2" colspan="3">
                                        <asp:TextBox ID="txt_tsbMemoName" runat="server" Text='<%# Eval("tsbMemoName") %>' TextMode="MultiLine" CssClass="Width95p" Height="50px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="showMod2" runat="server" class="qury_table_td2" colspan="3">
                                        <span style="color: Red;">＊不可挑選的『通用性』備註，前面請加上 # 符號。</span>
                                        <br />
                                        <span style="color: Red;">＊不可挑選的『範例型』備註，前面請加上 @ 符號。</span>
                                    </td>
                                    <td id="showMod9" runat="server" class="qury_table_td2" colspan="3">
                                        <span style="color: Red;">＊可參考範本：</span>
                                        <asp:DropDownList ID="ddlExample" runat="server" Width="500px" onclick="setMemoValue()"></asp:DropDownList>
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
                <br />
            </div>
        </div>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
            });

            //#region 自動帶入範本
            function setMemoValue() {
                var tmpddlExample = $.trim($(this).find("[id$=ddlExample]").text());
                var tt = $.trim($(this).find("[id$=ddlExample]").val());

                var ddlExample = '<%= this.ddlExample.ClientID %>';

                if (document.getElementById(ddlExample).selectedIndex >= 0) {
                    var selectedIndex = document.getElementById(ddlExample).selectedIndex;
                    var selectedValue = document.getElementById(ddlExample).options[selectedIndex].value;
  
                    $("#<%= txt_tsbMemoName.ClientID %>").val(selectedValue);
                }
            }
            //#endregion

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
