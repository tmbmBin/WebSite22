<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbReceiptT.Web.FrmtsbReceiptT_tsbReceipt.Modify" EnableEventValidation="true" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel runat="server" ID="panView">  
            <h1 class="h1Class">繳回資料編輯作業</h1>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">動支編號</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbApplyNo" runat="server"  Enabled="false" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="txttsbApplyWordNum" runat="server"  CssClass="Width40p"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">
                                <asp:Label ID="labtsbFeeName" runat="server" Text="可繳回金額"></asp:Label>
                            </td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txtBalanceMoney" runat="server" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">分項計畫名稱</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txtplnPlanName" runat="server" Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">用途別</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txtoulOutlayName" runat="server" Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">用途說明</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">受款人</td>
                            <td colspan="5" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPayeeName" runat="server" Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
        </asp:panel>
        <br />
        <div runat="server" id="editDiv">
            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>
            <table style="width: 100%;" border="1">
                <tr>
                    <td class="DtleditTd"><span style="color: Red;">＊</span>繳回金額</td>
                    <td class="DtleditTd"><span style="color: Red;">＊</span>繳回日期</td>
                    <td class="DtleditTd"><span style="color: Red;">＊</span>事由</td>
                    <td class="DtleditTd">群組編號</td>
                    <td class="DtleditTd">繳回號</td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        <asp:TextBox ID="txttsbReceiveMoney" runat="server" Width="98%" OnKeyPress="checkNumber()"></asp:TextBox>
                        <asp:TextBox ID="txttsbReceiveSeq" runat="server" Width="98%" Style="display: none;"></asp:TextBox>
                        <asp:HiddenField runat="server" ID="hdfNo" />
                    </td>
                    <td style="width: 15%">
                        <asp:TextBox ID="txttsbReceiveDate" runat="server" Width="100%" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        <asp:TextBox ID="txttsbDecideSeq" runat="server" Style="display: none;"></asp:TextBox>
                    </td>
                    <td style="width: 40%">
                        <asp:TextBox ID="txttsbMemo" runat="server" Width="99%"></asp:TextBox>
                    </td>
                    <td style="width: 15%">
                        <asp:TextBox ID="txttsbGroupNo" runat="server" Width="98%" OnKeyPress="checkNumber()"></asp:TextBox>
                    </td>
                    <td style="width: 15%">
                        <asp:TextBox ID="txttsbPayBackNo" runat="server" Width="98%" OnKeyPress="checkNumber()"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="text-align: center;">
                <input type="button" id="btnAddDtl" value="增加明細" class="Btn12" />
                &nbsp;&nbsp;
                <input type="button" id="btnModifyDtl" disabled="disabled" value="確認修改" class="Btn12" />
                &nbsp;&nbsp;
                <input type="button" id="btnDeleteDtl" disabled="disabled" value="刪除明細" class="Btn12" />
                <%--使用者操作--%>
                <asp:HiddenField runat="server" ID="hdfOperation" />
            </div>
        </div>
        <br />
        <div>
            <asp:UpdatePanel runat="server" >
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False" CssClass="GridViewStyle" 
                        EnableViewState="false"
                        Width="100%">
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <Columns>
                            <%-- ↓↓開始資料行↓↓ --%>
                            <asp:TemplateField HeaderText="繳回明細號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblNo" title='<%# Eval("tsbReceiveSeq") %>' runat="server" Text='<%# Eval("No") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="繳回金額" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbReceiveMoney" runat="server" Text='<%# Eval("tsbReceiveMoney") %> '></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="150" />
                                <ItemStyle HorizontalAlign="Center" Width="150" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="繳回日期" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbReceiveDate" runat="server" Text='<%# Eval("tsbReceiveDate") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="150" />
                                <ItemStyle HorizontalAlign="Center" Width="150" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="事由" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbMemo" runat="server" Text='<%# Eval("tsbMemo")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="550" />
                                <ItemStyle HorizontalAlign="Center" Width="550" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="群組編號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbGroupNo" runat="server" Text='<%# Eval("tsbGroupNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="150" />
                                <ItemStyle HorizontalAlign="Center" Width="150" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="繳回號" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lbltsbPayBackNo" runat="server" Text='<%# Eval("tsbPayBackNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="150" />
                                <ItemStyle HorizontalAlign="Center" Width="150" />
                            </asp:TemplateField>
                            <%-- ↑↑開始資料行↑↑ --%>
                        </Columns>
                        <EmptyDataTemplate>目前沒有資料！</EmptyDataTemplate>
                    </asp:GridView>
                    <br style="clear: both;" />
                    <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
                    <br style="clear: both;" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnOperation" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Button Text="" ID="btnOperation" runat="server" style="display:none;" OnClick="btnOperation_Click" />
        </div>
        <!----------------->
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <input type="button" id="btnClose" value="關閉" class="Btn04" />
        </asp:Panel>

        <script type="text/javascript">

            $(function () {
                //初始化元素
                initEl();
            });
            function initEl(){
                $.MyKendoDatePicker();
                $("#btnClose").click(function () {
                    parent.closeDlg();
                });
                $("#btnSave").click(function () {
                    $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                });
                $("#btnDelete").click(function () {
                    if (confirm('是否真的要刪除此筆資料？')) {
                        $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                        return true;
                    }
                    return false;
                });

                $("#btnAddDtl").click(function () {
                    $("#hdfOperation").val("insert");
                    $('#btnOperation').trigger('click');
                });
                $("#btnModifyDtl").click(function () {
                    $("#hdfOperation").val("modify");
                    $('#btnOperation').trigger('click');
                });
                $("#btnDeleteDtl").click(function () {
                    $("#hdfOperation").val("delete");
                    $('#btnOperation').trigger('click');
                });
                //<%--點選GridView的Tr，注意:updatepanel裏的元件都是重新製作的所以要寫成"#GridView1 tr"--%>
                $(document).on("click", "#GridView1 tr", function () {
                    if ($(this).find("td:eq(0)").text() != "目前沒有資料！") {
                        $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });

                        // 改變顏色
                        $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                            $(this).css({ "background-color": "white" });
                        });

                        var tmpIndex = $.trim($(this).find("td:first").text());
                        if (parseInt(tmpIndex, 10) > 0) {
                            $(this).css({ "background-color": "yellow" });
                        }

                        // 將資料放入編輯區
                        $("#hdfNo").val($(this).find("td span[id$='lblNo']").text());
                        $('#txttsbReceiveSeq').val($(this).find("td span[id$='lblNo']").attr("title"));
                        $('#txttsbReceiveMoney').val($(this).find("td span[id$='lbltsbReceiveMoney']").text());
                        $('#txttsbReceiveDate').val($(this).find("td span[id$='lbltsbReceiveDate']").text());
                        $('#txttsbMemo').val($(this).find("td span[id$='lbltsbMemo']").text());
                        $('#txttsbGroupNo').val($(this).find("td span[id$='lbltsbGroupNo']").text());
                        $('#txttsbPayBackNo').val($(this).find("td span[id$='lbltsbPayBackNo']").text());

                        $.unblockUI();
                        $("#btnModifyDtl, #btnDeleteDtl").prop("disabled", false);
                    }
                });
            }

            // 檢查輸入是否為數字。
            function checkNumber() {
                if (((event.keyCode >= 48) && (event.keyCode <= 57)) || (event.keyCode == 46))
                    event.returnValue = true;
                else event.returnValue = false;
            }
            //<%--後台執行後回傳--%>
            function upCallBack(cleanData) {
                if ("1" == cleanData) {
                    $("#btnModifyDtl, #btnDeleteDtl").prop("disabled", true);
                    $("#hdfNo").val("");
                    $('#txttsbReceiveSeq').val("");
                    $('#txttsbReceiveMoney').val("");
                    $('#txttsbMemo').val("");
                    $('#txttsbGroupNo').val("");
                    $('#txttsbPayBackNo').val("");
                }
            }
        </script>
    </form>
</body>
</html>
