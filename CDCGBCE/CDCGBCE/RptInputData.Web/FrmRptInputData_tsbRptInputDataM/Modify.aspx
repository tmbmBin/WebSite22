<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="RptInputData.Web.FrmRptInputData_tsbRptInputDataM.Modify" %>

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

    <style type="text/css">
        .hidden {
            display: none;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h1Class">報表資料輸入</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server">
                <ItemTemplate>
                    <!----------------------->
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">分項計畫名稱</td>
                            <td class="qury_table_td2" colspan="3">
                                <asp:TextBox ID="txtPlanName" runat="server" Text='<%# Eval("PlanName") %>' Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">用途說明</td>
                            <td class="qury_table_td2" colspan="3">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>' Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">用途別</td>
                            <td colspan="3" style="text-align: left;">
                                <asp:TextBox ID="txtoulOutlayName" runat="server" Text='<%# Eval("oulOutlayName") %>' Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">受款人</td>
                            <td class="qury_table_td2" colspan="3">
                                <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>活動起始日<br/><span style="color: blue;">(格式範例103/01/01)</span></td>
                            <td class="qury_table_td2" colspan="3">
                                   <asp:TextBox ID="txttsbStartDate" runat="server" MyKendoDatePicker="MyKendoDatePicker"  Text='<% #ConverDate_ADtoROC(Convert.ToDateTime(Eval("tsbStartDate")).ToString("yyyy/MM/dd"))%>' Width="150px" ></asp:TextBox> 
                            </td>
                           
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>活動結束日<br/><span style="color: blue;">(格式範例103/12/31)</span></td>
                            <td class="qury_table_td2" colspan="3">
                                   <asp:TextBox ID="txttsbEndDate" runat="server" MyKendoDatePicker="MyKendoDatePicker"  Text='<% #ConverDate_ADtoROC(Convert.ToDateTime(Eval("tsbEndDate")).ToString("yyyy/MM/dd"))%>' Width="150px" ></asp:TextBox> 
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="qury_table_td">他機關捐助數合計</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbOtherNumTot" runat="server" Text='<%# string.Format( "{0:N0}",Eval("tsbOtherNumTot")) %>' Width="200px"></asp:TextBox>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>團體自付數 </td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbSelfNum" runat="server" Text='<%# string.Format( "{0:N0}",Eval("tsbSelfNum")) %>' Width="200px" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <!----------------------->
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:Panel ID="Panel2" runat="server" Width="100%">
            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>
            <table style="width: 100%;" border="0">
                <tr>
                    <td class="DtleditTd" style="width: 15%; display:none;">核定明細號</td>
                    <td class="DtleditTd" style="width: 40%;"><span style="color: Red;">＊</span>分攤捐助款機關名稱</td>
                    <td class="DtleditTd" style="width: 25%;"><span style="color: Red;">＊</span>他機關捐助數</td>
                </tr>
                <tr>
                    <td style="display:none;">
                        <asp:TextBox ID="txttsbDecideSeq" runat="server" Width="98%" Height="23px" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txttsbShareOrgNameEdit" runat="server" Width="99%" Height="23px"></asp:TextBox>
                        <asp:TextBox ID="txttsbShareOrgName" runat="server" Width="98%" Height="23px" Style="display: none"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txttsbOtherNum" runat="server" Width="99%" Height="23px" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="text-align: center;">
                <asp:Button ID="btnAddRptInputDataDtl" runat="server" Text="增加明細" OnClick="btnAddRptInputDataDtl_Click" CssClass="Btn12" />
                &nbsp;&nbsp;
                <asp:Button ID="btnModifyRptInputDataDtl" runat="server" Text="確認修改" OnClick="btnModifyRptInputDataDtl_Click" CssClass="Btn12" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDeleteRptInputDataDtl" runat="server" Text="刪除明細" OnClick="btnDeleteRptInputDataDtl_Click" CssClass="Btn12" />
            </div>
        </asp:Panel>
        <br />

        <!------------>
        <div>
            <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                CssClass="GridViewStyle" Width="100%">
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <Columns>
                    <asp:TemplateField HeaderText="序號" Visible="True">
                        <ItemTemplate>
                            <%# GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="40" />
                        <ItemStyle HorizontalAlign="Center" Width="40" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbDecideSeq" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="計畫案分攤捐助款機關名稱">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbShareOrgNameEdit" runat="server" Text='<%# Eval("tsbShareOrgName") %>'></asp:Label>
                            <asp:Label ID="lbltsbShareOrgName" runat="server" Text='<%# Eval("tsbShareOrgName") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150" />
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="他機關捐助數">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbOtherNum" runat="server" Text='<%#   string.Format("{0:N0}", Eval("tsbOtherNum")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
            </asp:GridView>
            <br style="clear: both;" />
            <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
            <br style="clear: both;" />
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDelete_Click"  />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" OnClick="btnClose_Click1" />
        </asp:Panel>

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

                getSelectDtlData();

            });

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href + encodeURI('&WIN=0');
                return false;
            });
            //#endregion

            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    return true;
                }
                return false;
            });

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

            function getSelectDtlData() {


                $('#GridView1 tr').click(function () {
                    $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });

                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        $(this).css({ "background-color": "white" });
                    });

                    var tmpIndex = $.trim($(this).find("td:first").text());
                    if (parseInt(tmpIndex, 10) > 0) {
                        $(this).css({ "background-color": "yellow" });
                    }

                    var tmptsbDecideSeq = $(this).find("[id$=lbltsbDecideSeq]").text();//核定明細號
                    var tmptsbShareOrgNameEdit = $.trim($(this).find("[id$=lbltsbShareOrgNameEdit]").text());//機關名稱
                    var tmptsbShareOrgName = $.trim($(this).find("[id$=lbltsbShareOrgName]").text());//機關名稱
                    var tmptsbOtherNum = $(this).find("[id$=lbltsbOtherNum]").text();//他機關捐助數

                    $('#txttsbDecideSeq').val($.trim(tmptsbDecideSeq)); //核定明細號
                    $('#txttsbShareOrgNameEdit').val($.trim(tmptsbShareOrgNameEdit));//機關名稱
                    $('#txttsbShareOrgName').val($.trim(tmptsbShareOrgName));//機關名稱
                    $('#txttsbOtherNum').val($.trim(tmptsbOtherNum));//他機關捐助數

                    $.unblockUI();

                });
            }
        </script>

    </form>
</body>
</html>
