<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="OtherApply.Web.FrmOtherApply_OtherApply.OtherApply" EnableEventValidation="true" %>

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
        <div>
            <h1 class="h1Class">其他支付編輯作業</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server" OnDataBound="FormView1_DataBound">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">會簽編號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbApplyWordNum" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:TextBox>
                                <asp:TextBox ID="txttsbYear" runat="server" Text='<%# Eval("tsbYear") %>' Enabled="false" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="txttsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' Enabled="false" Style="display: none"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">核銷金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbMoney" runat="server" Text='<%# string.Format( "{0:N0}",Eval("tsbMoney")) %>' CssClass="Width40p"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">核銷日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbMarkDate" runat="server" Text='<%# MyLibrary.DateTimeExt.ToTaiwanCalendar((DateTime)Eval("tsbMarkDate"))%>' MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請業務單位</td>
                            <td class="qury_table_td4">
                                <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server"></asp:DropDownList>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請人</td>
                            <td class="qury_table_td4" colspan="3">
                                <asp:TextBox ID="txttsbWorkUserNo" runat="server" Text='<%# Eval("tsbWorkUserNo") %>' CssClass="Width40p"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">
                                <span style="color: Red;">＊</span>用途說明
                            </td>
                            <td colspan="5" class="qury_table_td4">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <br />
        <div runat="server" id="editDiv">
            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>
            <table style="width: 100%;" border="1">
                <tr>
                    <td class="DtleditTd" style="width: 7%;">經資門別</td>
                    <td class="DtleditTd" style="width: 10%;">預算來源</td>
                    <td class="DtleditTd" style="width: 14%;">經費單位<br />
                        控帳業務</td>
                    <td class="DtleditTd" style="width: 18%;">計畫科目</td>
                    <td class="DtleditTd" style="width: 16%;"><span style="color: Red;">＊</span>用途別科目</td>
                    <td class="DtleditTd" colspan="3">受款人</td>
                    <td class="DtleditTd" style="width: 8%;"><span style="color: Red;">＊</span>金額</td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlcodAccKindName" runat="server" Width="98%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlcodBgtOrigin" runat="server" Width="98%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlcodDepartName" runat="server" Width="98%">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlcodBiz" runat="server" Width="98%">
                        </asp:DropDownList><!---控帳業務---->
                    </td>
                    <td>
                        <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="98%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddloulOutlayCode" runat="server" Width="98%">
                        </asp:DropDownList>
                    </td>
                    <!------受款人Str----->
                    <td style="width: 12%">
                        <div id="div_GVUse">
                            <asp:TextBox ID="txtEtsbPayeeName" runat="server" onfocus="blur()" Width="98%"></asp:TextBox>
                            <asp:TextBox ID="txtEtsbPayeeNo" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                            <asp:TextBox ID="txtEtsbPayeeKind" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                        </div>
                        <div id="div_PayeeUse" style="display: none">
                            <asp:Label ID="lblselectPayeeCount" runat="server" Height="23px" Text=""></asp:Label>
                        </div>
                        <asp:TextBox ID="txtPayeeReturnData" runat="server" onfocus="blur()" Style="display: none;"></asp:TextBox>

                    </td>
                    <td style="width: 4%">
                        <input id="btnPayee" runat="server" type="button" value="..." style="width: 98%" />
                    </td>
                    <td style="width: 4%">
                        <asp:Button ID="btnPayClear" runat="server" OnClick="btnPayClear_Click" Text="取消" Width="98%" />
                    </td>
                    <td>
                        <!----受款人END------>
                        <asp:TextBox ID="txttsbMoney" runat="server" Width="97%"></asp:TextBox>
                        <asp:TextBox ID="txttsbApplySeq" runat="server" Style="display: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="text-align: center;">
                <asp:Button ID="btnAddApplyDtl" runat="server" Text="增加明細" OnClick="btnAddApplyDtl_Click" CssClass="Btn12" />
                &nbsp;&nbsp;
                <asp:Button ID="btnModifyApplyDtl" runat="server" Text="確認修改" OnClick="btnModifyApplyDtl_Click" CssClass="Btn12" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDeleteApplyDtl" runat="server" Text="刪除明細" OnClick="btnDeleteApplyDtl_Click" CssClass="Btn12" />
            </div>
        </div>
        <br />
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
                    <%-- ↓↓開始資料行↓↓ --%>
                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbApplySeq" runat="server" Text='<%# Eval("tsbApplySeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="50" />
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經資門別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbAccKind" runat="server" Text='<%#    CodeFormat( Eval("tsbAccKind").ToString(),"ddlcodAccKindName")%> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="預算來源" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtSourceCode" runat="server" Text='<%#  CodeFormat( Eval("tsbBgtSourceCode").ToString(),"ddlcodBgtOrigin") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="85" />
                        <ItemStyle HorizontalAlign="Center" Width="85" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經費單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtDepCode" runat="server" Text='<%# CodeFormat( Eval("tsbBgtDepCode").ToString(),"ddlcodDepartName") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Center" Width="100" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="控帳業務" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBizCode" runat="server" Text='<%# CodeFormat( Eval("tsbBizCode").ToString(),"ddlcodBiz") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Center" Width="100" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="計畫科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%#  CodeFormat( Eval("tsbPlanCode").ToString(),"ddltsbPlanCode") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="220" />
                        <ItemStyle HorizontalAlign="Center" Width="220" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="受款人名稱" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>'></asp:Label>
                            <asp:Label ID="lbltsbPayeeNo" runat="server" Text='<%# Eval("tsbPayeeNo") %>' Style="display: none"></asp:Label>
                            <asp:Label ID="lbltsbPayeeKind" runat="server" Text='<%# Eval("tsbPayeeKind") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Center" Width="200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用途別科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%#  OutlayFormat(Eval("tsbOutlayCode" )) %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Center" Width="200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbMoney" runat="server" Text='<%#  Eval("tsbMoney").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>目前沒有資料！</EmptyDataTemplate>
            </asp:GridView>
            <br style="clear: both;" />
            <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
            <br style="clear: both;" />
        </div>

        <!----------------->
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDel_Click" OnClientClick="startBlockUI()" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" OnClientClick="startBlockUI()" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
        </asp:Panel>
        <div id="win1"></div>
        <!--受款人被開啟的頁面--->
        <script type="text/javascript">

            $(function () {
                fnPageInit();
                setplanCode();

                GetoulcodeStart();//初始用途別
                getSelectDtlData();//點選gv的tr
            });

            // 使用 Block 效果 -> 後端 button 事件要加入『取消效果』。
            function startBlockUI() {
                $.blockUI({ message: '資料處理中，請稍後...' });
            }

            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href;
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
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

            function GetoulcodeStart() {

                var ddl2 = $("#<%= ddloulOutlayCode.ClientID %>");
                var year = document.getElementById("FormView1_txttsbYear").value;

                //載入
                $.ajax({
                    type: "POST",
                    url: "AJAXoulOtherApply.ashx",
                    dataType: "JSON",
                    error: function () { alert('用途別下拉選單發生載入錯誤！') },
                    data: { 'q': '0', 'tsbYear': year }, // 設定要 0.一般 , 1.委辦 , 2.捐補助  3,全部
                    success: function (result) {
                        ddl2.empty();
                        var select_type = 0;
                        $.each(result.oulayCoedeItem, function (i, value) {
                            if (value.ILevel != "99")
                                ddl2.append("<option value=\"" + value.IValue + "\" style=\"color:Navy\" disabled=\"true\" label=\"" + value.IText + "\"></option>")
                            else {
                                if (select_type == 0) // 讓預設值跳到可選的項目上。
                                {
                                    select_type = 1;
                                    ddl2.append("<option value=\"" + value.IValue + "\" selected=\"true\" label=\"" + value.IText + "\"></option>")
                                }
                                else ddl2.append("<option value=\"" + value.IValue + "\" label=\"" + value.IText + "\"></option>")
                            }
                        });
                    }
                });
                return false;
            }
            //End


            // GridView 用途別顏色更改及取值
            function getSelectDtlData() {

                $('#GridView1 tr').click(function () {
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

                        // 抓去 GridView 的該筆資料
                        var tmptsbApplySeq = $(this).find("[id$=lbltsbApplySeq]").text();
                        var tmptsbOutlayCodeName = $.trim($(this).find("[id$=lbltsbOutlayCode]").text());
                        var tmptsbMoney = $(this).find("[id$=lbltsbMoney]").text();



                        var tmptsbAccKindName = $.trim($(this).find("[id$=lbltsbAccKind]").text());
                        var tmptsbBgtSourceCodeName = $.trim($(this).find("[id$=lbltsbBgtSourceCode]").text());
                        var tmptsbBgtDepCodeName = $.trim($(this).find("[id$=lbltsbBgtDepCode]").text());
                        var tmptsbPlanCodeName = $.trim($(this).find("[id$=lbltsbPlanCode]").text());
                        var tmptsbBizCodeName = $.trim($(this).find("[id$=lbltsbBizCode]").text());

                        var tmptsbPayeeName = $.trim($(this).find("[id$=lbltsbPayeeName]").text());//受款人名稱
                        var tmptsbPayeeNo = $.trim($(this).find("[id$=lbltsbPayeeNo]").text());//受款人代碼
                        var tmptsbPayeeKind = $.trim($(this).find("[id$=lbltsbPayeeKind]").text());//受款人代碼

                        //
                        $('#ddlcodAccKindName :contains(' + tmptsbAccKindName + ')').attr('selected', true);
                        $('#ddlcodBgtOrigin :contains(' + tmptsbBgtSourceCodeName + ')').attr('selected', true);
                        //$('#ddlcodDepartName :contains(' + tmptsbBgtDepCodeName + ')').attr('selected', true);
                        $('#ddltsbPlanCode option[value=' + tmptsbPlanCodeName.split(" ")[0] + ']').attr('selected', true);

                        //經費單位
                        $('#ddlcodDepartName option').each(function (i, item) {
                            if ($(item).text() == $.trim(tmptsbBgtDepCodeName)) {
                                $(item).attr('selected', true);
                            }
                        });

                        //控帳業務
                        $('#ddlcodBiz option').each(function (i, item) {
                            if ($(item).text() == $.trim(tmptsbBizCodeName)) {
                                $(item).attr('selected', true);
                            }
                        });




                        // 將資料放入編輯區
                        $('#ddloulOutlayCode option').each(function (i, item) {
                            if ($(item).val() == tmptsbOutlayCodeName.split(" ")[0]) {

                                $(item).attr('selected', true);
                            }
                        });
                        $('#txttsbMoney').val($.trim(tmptsbMoney));
                        $('#txttsbApplySeq').val($.trim(tmptsbApplySeq));



                        //受款人
                        $("#<%= txtEtsbPayeeNo.ClientID %>").val(tmptsbPayeeNo);//受款人代碼
                        $("#<%= txtEtsbPayeeName.ClientID %>").val(tmptsbPayeeName);//受款人代碼
                        $("#<%= txtEtsbPayeeKind.ClientID %>").val(tmptsbPayeeKind);//受款人類型
                        //清空
                        $("#<%= this.txtPayeeReturnData.ClientID %>").val('');

                        //點選該筆顯示
                        $('#div_GVUse').show();
                        $('#div_PayeeUse').hide();








                        $.unblockUI();
                    }
                });
            }

            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";
                $('#<%= this.form1.FindControl("ddltsbPlanCode").ClientID%> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");
            }



            //
            $("#btnPayee").click(function () {
                $("#win1").data("kendoWindow").open().center();
            });


            $("#win1").kendoWindow({
                visible: false,
                iframe: true,
                title: "受款人資料選取",
                width: 800,
                height: 600,
                modal: true,
                resizable: true,
                refresh: function () {
                    this.center();
                },
                close: function (e) {
                    var dialog = $("#win1").data("kendoWindow");

                    var returndata = window.frames[0].document.getElementById("txtReturnData").value
                    var returnMessage = window.frames[0].document.getElementById("txtMessage").value

                    if (returndata.length > 0 && returnMessage.length > 0) {
                        $("#<%= this.txtPayeeReturnData.ClientID %>").val(returndata);
                        $("#<%= this.lblselectPayeeCount.ClientID %>").html(returnMessage);
                        $("#<%= this.txtEtsbPayeeName.ClientID %>").val('');//要清除
                        $("#<%= this.txtEtsbPayeeNo.ClientID %>").val('');//要清除
                        $("#<%= this.txtEtsbPayeeKind.ClientID %>").val('');//受款人類型 要清除

                        $('#div_GVUse').hide();
                        $('#div_PayeeUse').show();

                    } else {

                        $("#<%= this.txtPayeeReturnData.ClientID %>").val('');
                        $("#<%= this.lblselectPayeeCount.ClientID %>").html('');

                        $('#div_GVUse').show();
                        $('#div_PayeeUse').hide();
                    }

                },
                content: "../../approved.Web/Frmapproved_approved/Payee.aspx"
            });








        </script>
    </form>
</body>
</html>
