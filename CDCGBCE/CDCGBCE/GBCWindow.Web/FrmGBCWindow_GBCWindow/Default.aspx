<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GBCWindow.Web.FrmGBCWindow_GBCWindow.Default" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="ODS_oulOutlayCode" runat="server" TypeName="ShareTable.DAO.codOutlayCodeDAO" OldValuesParameterFormatString="original_{0}" SelectMethod="getList" SelectCountMethod="getListCount">
                <SelectParameters>
                    <asp:SessionParameter Name="codCodeVer" SessionField="default_Year" Type="Int16" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Panel ID="pnlSearch" runat="server" CssClass="MainCon3" Width="370px">
                <h1 class="h1Class" style="width: 97%">預算控制小視窗</h1>
                <input type="hidden" id="hdfMenuID" runat="server" />
                <table style="width: 100%; background-color: #99ccff;">
                    <tr>
                        <td>分　項　計　畫</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="100%"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>用　　途　　別</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddloulOutlayCode" runat="server" Width="100%" AppendDataBoundItems="True" DataSourceID="ODS_oulOutlayCode" DataTextField="oulOutlayName" DataValueField="oulOutlayCode" OnDataBound="ddloulOutlayCode_DataBound">
                                <asp:ListItem Value="">..........................</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>實　際　計　畫</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="100%"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
                <div style="text-align: center;">
                    <asp:Button ID="btnSearch" runat="server" Text="開始計算" CssClass="Button1" Width="370px" Height="35px" OnClick="btnSearch_Click" OnClientClick="startBlockUI()" />
                    <br />
                </div>
                <table style="width: 100%; background-color: #ccffcc">
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">預算數A：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label1" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC">計畫核定金額B：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label2" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC">累計撥付數C：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label3" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC">未撥數D=(B-C)：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label4" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC">合計E=(C+D)：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label5" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC">實際支用金額F：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label6" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC">計畫完成結餘款G=(E-F)：</td>
                        <td class="qury_table_td5">
                            <asp:Label ID="Label7" Text="0" runat="server" Width="99%" BackColor="White"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>

        <script type="text/javascript">

            $(function () {
                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();
                setPlanCode();
            });

            // 使用 Block 效果 -> 後端 button 事件要加入『取消效果』。
            function startBlockUI() {
                $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料計算中，請稍後...</b>" });
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
