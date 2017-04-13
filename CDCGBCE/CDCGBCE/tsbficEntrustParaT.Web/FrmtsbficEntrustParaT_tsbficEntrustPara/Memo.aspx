<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Memo.aspx.cs" Inherits="tsbficEntrustParaT.Web.FrmtsbficEntrustParaT_tsbficEntrustPara.Memo" %>

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
        <asp:TextBox ID="txtReturnData" runat="server" Height="150px" Width="100%" Style="display: none"></asp:TextBox>
        <asp:ObjectDataSource ID="ODS_tsbMemo" runat="server" TypeName="ShareTable.DAO.tsbMemoDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="tsbYear" SessionField="default_Year" Type="Int16" />
                <asp:Parameter Name="tsbType" Type="String" DefaultValue="1" />
                <%--(1.委辦 2.補捐助)--%>
                <asp:QueryStringParameter Name="tsbMemoName" QueryStringField="KeyWord" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <div class="MainCon2" style="width: 90%">
            <h1 class="h1Class">備註資料選取(篩選條件：『<asp:Label ID="lblKeyWord" runat="server"></asp:Label>』)</h1>
            <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                CssClass="GridViewStyle" Width="100%" DataSourceID="ODS_tsbMemo">
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <Columns>
                    <%-- ↓↓開始資料行↓↓ --%>
                    <asp:TemplateField HeaderText="選取">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkNo" runat="server"></asp:CheckBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="50" />
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="編號">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbAliasNo" runat="server" Text='<%# Eval("tsbAliasNo") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="備註內容">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbMemoName" runat="server" Text='<%# Eval("tsbMemoName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="500" />
                        <ItemStyle HorizontalAlign="Left" Width="500" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
            </asp:GridView>
        </div>
        <div style="text-align: center; margin: 10px;">
            <asp:Button ID="btnReturnSelectData" runat="server" Text="傳回選定資料" OnClick="btnReturnSelectData_Click" class="Btn08" />
            <br />
            <br />
        </div>
    </form>
</body>

</html>
