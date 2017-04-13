<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmATDImport.aspx.cs" Inherits="UI.OTDataImport.Web.FrmATDImport" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <base target="_self" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="ODS_codDepartName" runat="server" TypeName="ShareTable.DAO.codDepartNameDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount"></asp:ObjectDataSource>
            <asp:Panel ID="pnlSearch" runat="server" class="MainCon3" Width="90%">
                <h1 class="h1Class">加班資料查詢</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">日期區間</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtOTSDate" runat="server" Width="150px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                            ～
                            <asp:TextBox ID="txtOTEDate" runat="server" Width="150px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">員工代碼</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtPayCode" runat="server" Width="240px"></asp:TextBox>
                        </td>
                        <td class="qury_table_td">員工姓名</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtPayName" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td2" colspan="4" style="text-align: center">
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="開始過濾" class="Btn03" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlReturn" runat="server" class="MainCon3" Width="90%">
                <h1 class="h1Class">加班資料輸入</h1>
                <table style="width: 100%">
                    <tr>
                        <td class="qury_table_td">計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="560px"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">用途別</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddltsbOutlayCode" Width="180px" runat="server"></asp:DropDownList>
                        </td>
                        <td class="qury_table_td">費用種類</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlActPayeeKind" Width="130px" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td2" colspan="4" style="text-align: center">
                            <asp:Button ID="btnReturnSelectData" runat="server" Text="傳回資料" class="Btn04" OnClick="btnReturnSelectData_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <div class="MainCon2" style="width: 90%">
                <h1 class="h1Class">加班資料查詢結果</h1>
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
                        <asp:TemplateField HeaderText="加班單號" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblOTDataKey" runat="server" Text='<%# Eval("OTDataKey") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="45" />
                            <ItemStyle HorizontalAlign="Center" Width="45" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部門名稱" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblDepName" runat="server" Text='<%# Eval("DepName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="員工代碼" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblPayCode" runat="server" Text='<%# Eval("PayCode")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="員工姓名" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblPayName" runat="server" Text='<%# Eval("PayName")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="加班年月" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblOTDate" runat="server" Text='<%# Eval("OTDate") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="50" />
                            <ItemStyle HorizontalAlign="Center" Width="50" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="加班時數" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblOTHour" runat="server" Text='<%# Eval("OTHour")  %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" Width="30" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="加班費總額" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblOTMoney" runat="server" Text='<%# Eval("OTMoney").ToMoney() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="55" />
                            <ItemStyle HorizontalAlign="Center" Width="55" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="加班事由" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="lblOTMemo" runat="server" Text='<%# Eval("OTMemo") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="220" />
                            <ItemStyle HorizontalAlign="Center" Width="220" />
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
                setPlanCode();

            });

            function checkAll(header) {
                $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
            }

            //分項計畫_部分選項禁止點選
            function setPlanCode() {
                var tmpstop = "0";
                $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }

        </script>
    </form>
</body>

</html>
