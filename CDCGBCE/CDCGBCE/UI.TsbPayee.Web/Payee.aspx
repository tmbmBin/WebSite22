<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payee.aspx.cs" Inherits="UI.TsbPayee.Web.Payee" %>

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
            <asp:TextBox ID="txtReturnName" runat="server" Height="150px" Width="100%" Style="display: none"></asp:TextBox>
            <asp:TextBox ID="txtReturnNo" runat="server" Style="display: none"></asp:TextBox>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3" Width="90%">
                <h1 class="h1Class">受款人查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">統一編號</td>
                        <td class="qury_table_td2" colspan="4">
                            <asp:TextBox ID="txttsbPayeeNo" runat="server" Width="90%">
                            </asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">名稱</td>
                        <td class="qury_table_td2" colspan="4">
                            <asp:TextBox ID="txttsbPayeeName" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">類別</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbPayeeRole" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="qury_table_td">縣市</td>
                        <td class="qury_table_td2" colspan="2">
                            <asp:DropDownList ID="ddlCity" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">群組名稱</td>
                        <td class="qury_table_td2" colspan="4">
                            <asp:DropDownList ID="ddltsbPayeeGroupName" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"></td>
                        <td class="qury_table_td2" colspan="3" style="text-align: center">
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="開始過濾" class="Btn06" />
                        </td>
                        <td class="qury_table_td"></td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="text-align: center; margin: 10px;">
                &nbsp;&nbsp;
                <asp:Button ID="btnReturnSelectData" runat="server" Text="傳回選定資料" OnClientClick="returnData()" class="Btn08" />
            </div>
            <br />
            <div class="MainCon2" style="width: 90%">
                <h1 class="h1Class">受款人查詢結果</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" Width="100%">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False" HeaderText="選取">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkHeaderselect" runat="server" onclick="checkAll(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="25" />
                            <ItemStyle HorizontalAlign="Center" Width="25" />
                        </asp:TemplateField>
                        <%-- ↓↓開始資料行↓↓ --%>
                        <asp:TemplateField HeaderText="統一編號" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblAtsbPayeeNo" runat="server" Text='<%# Eval("AtsbPayeeNo") %>'></asp:Label>
                                <asp:TextBox ID="txtAtsbPayeeNo" runat="server" Text='<%# Eval("AtsbPayeeNo") %>' Style="display: none;"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="名稱" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblAtsbPayeeName" runat="server" Text='<%# Eval("AtsbPayeeName") %>'></asp:Label>
                                <asp:TextBox ID="txtAtsbPayeeName" runat="server" Text='<%# Eval("AtsbPayeeName") %>' Style="display: none;"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="200" />
                            <ItemStyle HorizontalAlign="Center" Width="200" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="縣市" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblGtsbCityName" runat="server" Text='<%# Eval("GtsbCityName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="鄉鎮市區" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblFtsbCityAreaName" runat="server" Text='<%# Eval("FtsbCityAreaName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="身分別" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblEtsbPayeeRoleName" runat="server" Text='<%# Eval("EtsbPayeeRoleName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="屬性" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblDtsbPayeePropertyName" runat="server" Text='<%# Eval("DtsbPayeePropertyName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="60" />
                            <ItemStyle HorizontalAlign="Center" Width="60" />
                        </asp:TemplateField>

                        <%-- ↑↑開始資料行↑↑ --%>
                    </Columns>
                    <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
                </asp:GridView>
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
            });

            function checkAll(header) {
                $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
            }

            function returnData() {
                // 宣告
                var checkFlag = "";
                var txtReturnNo = "";
                var txtReturnName = "";
                var num = "";

                $("#<%= GridView1.ClientID%> tr").each(function () {
                    checkFlag = $(this).find("[id$=chkSelect]").prop("checked");

                    if (checkFlag == true) {
                        txtReturnNo = $.trim($(this).find("[id$=txtAtsbPayeeNo]").val());      // 受款人代碼
                        txtReturnName = $.trim($(this).find("[id$=txtAtsbPayeeName]").val());  // 受款人名稱

                        num = num + 1;
                    }
                });

                if (num > 1)
                    alert("只可選取一個廠商！");
                else if (num < 1)
                    alert("請勾選廠商才可以回傳資料唷！");
                else {
                    window.opener.document.getElementById("ctl09_TBPayeeNo").value = txtReturnNo;
                    window.opener.document.getElementById("ctl09_TBPayName").value = txtReturnName;
                    window.close();
                }
            }

        </script>
    </form>
</body>

</html>
