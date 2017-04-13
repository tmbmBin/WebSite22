<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarryOver.Web.FrmCarryOver_CarryOver.Default" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%-- Style專區 --%>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <%: Styles.Render("~/Content/jquery.pagination") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
    <%-- JavaScript專區 --%>
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
            setPlanCode();
            $.MyKendoComboBox();
            $.MyKendoDatePicker();
            $.MyKendoMultiSelect();
        });

        //分項計畫_部分選項禁止點選
        function setPlanCode() {
            var tmpstop = "0";
            $('#<%= ddltsbPlanCode.ClientID %> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
        }

        //  全選、取消全選
        function GV1_checkAll(header) {
            $('#<%= GridView1.ClientID %> input[type=checkbox]').prop("checked", header.checked);
        }
        function GV2_checkAll(header) {
            $('#<%= GridView2.ClientID %> input[type=checkbox]').prop("checked", header.checked);
        }

        // 使用 Block 效果 -> 後端 button 事件要加入『取消效果』。
        function startBlockUI() {
            $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ObjectDataSource ID="ODS_codDepartName" runat="server" TypeName="ShareTable.DAO.codDepartNameDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ODS_GridView2" runat="server" TypeName="ShareTable.DAO.CarryOverDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="get_List2" SelectCountMethod="get_List2Count">
            <SelectParameters>
                <asp:SessionParameter Name="tsbYear" SessionField="default_Year" Type="Int16" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Panel ID="pnlSearch" runat="server" class="MainCon3">
            <h1 class="h1Class">估列應付結轉作業查詢</h1>
            <table style="width: 100%">
                <tr>
                    <td class="qury_table_td">日期區間</td>
                    <td class="qury_table_td2">&nbsp;&nbsp;至&nbsp;&nbsp;
                            <asp:TextBox ID="txttsbDate" runat="server" Width="200px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                    </td>
                    <td class="qury_table_td">會簽編號</td>
                    <td class="qury_table_td2">
                        <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="240px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="qury_table_td">申請人</td>
                    <td class="qury_table_td2">
                        <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="240px"></asp:TextBox>
                    </td>
                    <td class="qury_table_td">申請單位</td>
                    <td class="qury_table_td2">
                        <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" AppendDataBoundItems="True" DataSourceID="ODS_codDepartName" DataTextField="dptName" DataValueField="dptCode">
                            <asp:ListItem Value="">.............</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="qury_table_td">分項計畫名稱</td>
                    <td class="qury_table_td2" colspan="3">
                        <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="70%"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="qury_table_td">用途說明</td>
                    <td class="qury_table_td2" colspan="3">
                        <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="70%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="qury_table_td">受款人</td>
                    <td class="qury_table_td2" colspan="3">
                        <asp:TextBox ID="txttsbPayeeName" runat="server" Width="70%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div style="text-align: center; margin: 10px;">
            <asp:Button ID="btnSearch" runat="server" Text="開始過濾" CssClass="Btn08" OnClick="btnSearch_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSearchClear" runat="server" Text="清除條件" CssClass="Btn08" OnClick="btnSearchClear_Click" />
        </div>
        <br />
        <div class="MainCon2">
            <table style="width: 100%; border: 0; background-color: black;">
                <tr>
                    <td style="text-align: left; width: 10%">
                        <asp:Button ID="btnCarryOver" runat="server" Text="結轉" CssClass="Btn09" OnClientClick="startBlockUI()" OnClick="btnCarryOver_Click" />
                    </td>
                    <td style="text-align: center;">
                        <asp:Label ID="lab_title" Text="可結轉資料明細" runat="server" ForeColor="White" />
                    </td>
                    <td style="text-align: left; width: 10%"></td>
                </tr>
            </table>
            <input type="hidden" id="hdfMenuID" runat="server" />
            <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                CssClass="GridViewStyle" Width="100%" EmptyDataText="目前無資料">
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
                            <asp:CheckBox ID="chkHeaderselect" runat="server" onclick="GV1_checkAll(this);" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="30" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="會簽編號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:Label>
                            <asp:HiddenField ID="hdftsbYear" runat="server" Value='<%# Eval("tsbYear") %>'></asp:HiddenField>
                            <asp:HiddenField ID="hdftsbApplyNo" runat="server" Value='<%# Eval("tsbApplyNo") %>'></asp:HiddenField>
                            <asp:HiddenField ID="hdftsbApplySeq" runat="server" Value='<%# Eval("tsbApplySeq") %>'></asp:HiddenField>
                            <asp:HiddenField ID="hdftsbDecideNo" runat="server" Value='<%# Eval("tsbDecideNo") %>'></asp:HiddenField>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="65" />
                        <ItemStyle HorizontalAlign="Center" Width="65" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="50" />
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="申請人" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbWorkUserNo" runat="server" Text='<%#  Eval("tsbWorkUnitName")+"<br/>"+ Eval("tsbWorkUserNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="受款人" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="120" />
                        <ItemStyle HorizontalAlign="Center" Width="120" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分項計畫" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName")  %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="180" />
                        <ItemStyle HorizontalAlign="Center" Width="180" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName")  %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="120" />
                        <ItemStyle HorizontalAlign="Center" Width="120" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途說明" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="180" />
                        <ItemStyle HorizontalAlign="Center" Width="180" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預撥餘額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPreMoney" runat="server" Text='<%#  Eval("tsbPreMoney").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="核定餘額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbCash" runat="server" Text='<%#  Eval("tsbCash").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
            </asp:GridView>
        </div>
        <br />
        <div class="MainCon2">
            <div style="background-color: black;">
                <table style="width: 100%; border: 0">
                    <tr>
                        <td style="text-align: left; width: 10%">
                            <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn09" OnClientClick="startBlockUI()" OnClick="btnDelete_Click" />
                        </td>
                        <td style="text-align: center;">
                            <asp:Label ID="Label1" Text="已結轉資料明細" runat="server" ForeColor="White" />
                        </td>
                        <td style="text-align: left; width: 10%"></td>
                    </tr>
                </table>
            </div>
            <asp:GridView ID="GridView2" runat="server" MyName="gvList" AutoGenerateColumns="False"
                CssClass="GridViewStyle" Width="100%" EmptyDataText="目前無資料" DataSourceID="ODS_GridView2">
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
                            <asp:CheckBox ID="chkHeaderselect" runat="server" onclick="GV2_checkAll(this);" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="35" />
                        <ItemStyle HorizontalAlign="Center" Width="35" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="會簽編號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:Label>
                            <asp:HiddenField ID="hdftsbYear" runat="server" Value='<%# Eval("tsbYear") %>'></asp:HiddenField>
                            <asp:HiddenField ID="hdftsbApplyNo" runat="server" Value='<%# Eval("tsbApplyNo") %>'></asp:HiddenField>
                            <asp:HiddenField ID="hdftsbApplySeq" runat="server" Value='<%# Eval("tsbApplySeq") %>'></asp:HiddenField>
                            <asp:HiddenField ID="hdftsbDecideNo" runat="server" Value='<%# Eval("tsbDecideNo") %>'></asp:HiddenField>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="65" />
                        <ItemStyle HorizontalAlign="Center" Width="65" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="55" />
                        <ItemStyle HorizontalAlign="Center" Width="55" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="申請單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbWorkUnitNo" runat="server" Text='<%#  Eval("tsbWorkUnitName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="75" />
                        <ItemStyle HorizontalAlign="Center" Width="75" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="申請人" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbWorkUserNo" runat="server" Text='<%# Eval("tsbWorkUserNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="65" />
                        <ItemStyle HorizontalAlign="Center" Width="65" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="受款人" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分項計畫" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName")  %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Center" Width="200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%# Eval("tsbOutlayName")  %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途說明" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Center" Width="200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預撥餘額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPreMoney" runat="server" Text='<%#  Eval("tsbPreMoney").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="估列餘額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbEstimateMoney" runat="server" Text='<%#  Eval("tsbEstimateMoney").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
