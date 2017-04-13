<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Apply.Web.FrmApply_Apply.Modify" EnableEventValidation="true" %>

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
            <h1 class="h1Class">
                <asp:Label ID="lbltitle" runat="server" Text="會簽資料新增作業"></asp:Label>
            </h1>
            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">會簽編號 </td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="150px" Text='<%# Eval("tsbApplyWordNum") %>'></asp:TextBox>
                                <asp:TextBox ID="txttsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' Enabled="false" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="txttsbYear" runat="server" Text='<%# Eval("tsbYear") %>' Enabled="false" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="txttsbBgtYear" runat="server" Text='<%# Eval("tsbBgtYear") %>' Enabled="false" Style="display: none"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">會簽金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbMoney" runat="server" Width="150px" Text='<%# string.Format( "{0:N0}" ,Eval("tsbMoney")) %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td">會簽日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbMarkDate" runat="server" Width="150px" Text='<%# Eval("tsbMarkDate").ToRocDate() %>' MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請業務單位</td>
                            <td class="qury_table_td4">
                                <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" Width="150px"></asp:DropDownList>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請人</td>
                            <td class="qury_table_td4" colspan="3">
                                <asp:TextBox ID="txttsbWorkUserNo" runat="server" Width="150px" Text='<%# Eval("tsbWorkUserNo") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">
                                <span style="color: Red;">＊</span>用途說明
                            </td>
                            <td colspan="5" class="qury_table_td4">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Width="650px" Text='<%# Eval("tsbTrustSubsidyName") %>'></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <br />
        <!----編輯區S------>
        <div runat="server" id="div_Edit">
            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>
            <table style="width: 100%;" border="1">
                <tr class="DtleditTd">
                    <td style="width: 33%;">計畫科目</td>
                    <td style="width: 6%;">經資門別<br />
                        預算來源</td>
                    <td style="width: 19%;">經費單位<br />
                        控帳業務</td>
                    <td style="width: 21%;">用途別科目</td>
                    <td style="width: 10%;"><span style="color: Red;">＊</span>金額</td>
                    <td style="width: 11%;">案件所屬立委</td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddltsbPlanCode" runat="server" Width="100%">
                        </asp:DropDownList>
                        <!-- Width="650px"  -->
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlcodAccKindName" runat="server" Width="120px">
                        </asp:DropDownList>
                        <!-- 經資門別 -->
                        <asp:DropDownList ID="ddlcodBgtOrigin" runat="server" Width="120px">
                        </asp:DropDownList>
                        <!-- 預算來源 -->
                    </td>
                    <td>

                        <asp:DropDownList ID="ddlcodDepartName" runat="server" Width="100%">
                        </asp:DropDownList>
                        <!-- 經費單位 -->
                        <asp:DropDownList ID="ddlcodBiz" runat="server" Width="100%"></asp:DropDownList>
                        <!-- 控帳業務 -->

                    </td>
                    <td>
                        <asp:DropDownList ID="ddloulOutlayCode" runat="server" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEtsbMoney" runat="server" Width="96%" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                        <asp:TextBox ID="txtEtsbApplySeq" runat="server" Style="display: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEtsbMoney1" runat="server" Width="96%" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" Style="display: none"></asp:TextBox>
                        <asp:TextBox ID="txtEtsbBgtDepCode" runat="server" Width="96%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <!----編輯區E------>
        <div style="text-align: center;">
            <asp:Button ID="btnAddApplyDtl" runat="server" Text="增加明細" OnClick="btnAddApplyDtl_Click" CssClass="Btn12" />
            &nbsp;&nbsp;
            <asp:Button ID="btnModifyApplyDtl" runat="server" Text="確認修改" OnClick="btnModifyApplyDtl_Click" CssClass="Btn12" />
            &nbsp;&nbsp;
            <asp:Button ID="btnDeleteApplyDtl" runat="server" Text="刪除明細" OnClick="btnDeleteApplyDtl_Click" CssClass="Btn12" />
        </div>
        <br />
        <!------------>
        <div>
            <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False" CssClass="GridViewStyle" Width="100%">
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <Columns>
                    <%-- ↓↓開始資料行↓↓ --%>
                    <asp:TemplateField HeaderText="序號" Visible="True">
                        <ItemTemplate>
                            <%# GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="30" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="會簽明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbApplySeq" runat="server" Text='<%# Eval("tsbApplySeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="年度" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbYear" runat="server" Text='<%# Eval("tsbYear") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="50" />
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經資門別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbAccKind" runat="server" Text='<%#    CodeFormat( Eval("tsbAccKind").ToString(),"ddlcodAccKindName")%> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Left" Width="100" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="預算來源" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtSourceCode" runat="server" Text='<%#  CodeFormat( Eval("tsbBgtSourceCode").ToString(),"ddlcodBgtOrigin") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Left" Width="100" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經費單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtDepCode" runat="server" Text='<%# CodeFormat( Eval("tsbBgtDepCode").ToString(),"ddlcodDepartName") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Left" Width="100" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="控帳業務" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBizCode" runat="server" Text='<%# CodeFormat( Eval("tsbBizCode").ToString(),"ddlcodBiz") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Left" Width="100" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="計畫科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%#  CodeFormat( Eval("tsbPlanCode").ToString(),"ddltsbPlanCode") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Left" Width="200" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="用途別科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbOutlayCode" runat="server" Text='<%#  OutlayFormat((Eval("tsbOutlayCode" )).ToString()) %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Left" Width="200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本年度金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbMoney" runat="server" Text='<%#   Eval("tsbMoney").ToMoney() %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="案件所屬立委" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbMemOfLegislative" runat="server" Text='<%#   Eval("tsbMemOfLegislative") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>




                    <asp:TemplateField HeaderText="次年度金額" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbMoney1" runat="server" Text='<%#  Eval("tsbMoney1").ToMoney()  %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="tsbApplyNo" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbBgtYear" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtYear" runat="server" Text='<%# Eval("tsbBgtYear") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbBgtMonth" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtMonth" runat="server" Text='<%# Eval("tsbBgtMonth") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbOutlayYear" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbOutlayYear" runat="server" Text='<%# Eval("tsbOutlayYear") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbBgtSourceCode" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBgtSourceCode" runat="server" Text='<%# Eval("tsbBgtSourceCode") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbAccKind" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbAccKind" runat="server" Text='<%# Eval("tsbAccKind") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbBizCode" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBizCode" runat="server" Text='<%# Eval("tsbBizCode") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbMemo" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbMemo" runat="server" Text='<%#  Eval("tsbMemo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tsbPlanCode" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbPlanCode" runat="server" Text='<%# Eval("tsbPlanCode") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>
                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
            </asp:GridView>
            <br style="clear: both;" />
            <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
            <br style="clear: both;" />
        </div>

        <!----------------->
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
            &nbsp;&nbsp;
            <asp:Button ID="btnWindow" runat="server" Text="預算控制視窗" CssClass="Btn01" />
            <!-- ButtonWindow -->
        </asp:Panel>

        <script type="text/javascript">

            $(function () {
                fnPageInit();
                setplanCode(); //計畫科目

                GetoulcodeStart();//初始用途別
                // PlanCodeChange();  

                getSelectDtlData();//點選gv的tr

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

            //#region $("#btnSave").click
            $("#btnWindow").click(function () {

                var tmpplancode = $("#<%= this.form1.FindControl("ddltsbPlanCode").ClientID %>").val();
                var src = "../../GBCWindow.Web/FrmGBCWindow_GBCWindow/Default.aspx?plancode=" + tmpplancode;
                MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                    {
                        title: "預控小視窗",
                        width: 450,
                        height: 500
                    });

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



            function GetoulcodeStart() {

                var ddl2 = $("#<%= ddloulOutlayCode.ClientID %>");
                var year = document.getElementById("FormView1_txttsbBgtYear").value;

                //載入
                $.ajax({
                    type: "POST",
                    url: "AJAXoulApply.ashx",
                    dataType: "JSON",
                    error: function () { alert('載入變更資料時發生錯誤！') },
                    data: { 'q': '3', 'tsbYear': year }, // 設定要 0.一般 , 1.委辦 , 2.捐補助  3,全部
                    success: function (result) {
                        ddl2.empty();
                        var select_type = 0;
                        $.each(result.oulayCoedeItem, function (i, value) {
                            if (parseInt(value.ILevel, 10) < 3)
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


            //先註解
         <%--   function PlanCodeChange() {
                var ddl = $("#<%= ddltsbPlanCode.ClientID %>");
                 
                //變更
                ddl.change(function () {

                    var selected = $(this).val();
                    $.ajax({
                        type: "POST",
                        url: "ajax03",
                        async: false,
                        dataType: "JSON",
                        data: { 'seqNo': selected, 'applyNo': applyNo },
                        success: function (result) {
                            ddl2.empty();
                            $.each(result.oulayCoedeItem, function (i, value) {
                                ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>")
                            });

                            //設定並選取該明細資料
                            $('#ddloulOutlayCode option').each(function (i, item) {
                                if ($(item).val() == result.selectoulaycode) {
                                    $(item).attr('selected', true);
                                }
                            });
                        },
                        beforeSend: function () {
                            //$.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });
                        },
                        complete: function () {
                            //$.unblockUI();
                        },
                        error: function () { alert("error"); }
                    });
                    return false;
                });

            }--%>




            function getSelectDtlData() {
                $('#GridView1 tr').not(':first').click(function () {


                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        $(this).css({ "background-color": "white" });
                    });

                    var tmpIndex = $.trim($(this).find("td:first").text()); //找序號
                    if (parseInt(tmpIndex, 10) > 0) {
                        $(this).css({ "background-color": "yellow" });
                    }
                    var tmptsbMoney = $.trim($(this).find("[id$=lbltsbMoney]").text());
                    var tmptsbMoney1 = $.trim($(this).find("[id$=lbltsbMoney1]").text());
                    var tmptsbOutlayCodeName = $.trim($(this).find("[id$=lbltsbOutlayCode]").text());



                    $('#ddloulOutlayCode option[value=' + tmptsbOutlayCodeName.split(" ")[0] + ']').attr('selected', true);




                    var tmptsbApplySeq = $.trim($(this).find("[id$=lbltsbApplySeq]").text())

                    //
                    var tmptsbAccKindName = $.trim($(this).find("[id$=lbltsbAccKind]").text());
                    var tmptsbBgtSourceCodeName = $.trim($(this).find("[id$=lbltsbBgtSourceCode]").text());
                    var tmptsbBgtDepCodeName = $.trim($(this).find("[id$=lbltsbBgtDepCode]").text());
                    var tmptsbPlanCodeName = $.trim($(this).find("[id$=lbltsbPlanCode]").text());
                    var tmptsbBizCodeName = $.trim($(this).find("[id$=lbltsbBizCode]").text());
                    //alert(tmptsbBizCodeName);
                    //
                    $('#ddlcodAccKindName :contains(' + tmptsbAccKindName + ')').attr('selected', true);
                    $('#ddlcodBgtOrigin :contains(' + tmptsbBgtSourceCodeName + ')').attr('selected', true);


                    //$('#ddlcodDepartName :contains(' + tmptsbBgtDepCodeName + ')').attr('selected', true); 會比對到兩個相同的

                    //經費單位
                    $('#ddlcodDepartName option').each(function (i, item) {
                        if ($(item).text() == $.trim(tmptsbBgtDepCodeName)) {
                            $(item).attr('selected', true);
                        }
                    });


                    $('#ddltsbPlanCode option[value=' + tmptsbPlanCodeName.split(" ")[0] + ']').attr('selected', true);

                    //控帳業務
                    $('#ddlcodBiz option').each(function (i, item) {
                        if ($(item).text() == $.trim(tmptsbBizCodeName)) {
                            $(item).attr('selected', true);
                        }
                    });


                    $('#txtEtsbMoney').val($.trim(tmptsbMoney));
                    $('#txtEtsbMoney1').val($.trim(tmptsbMoney1));
                    $('#txtEtsbApplySeq').val($.trim(tmptsbApplySeq));
                });

            }


            //分項計畫_部分選項禁止點選
            function setplanCode() {
                var tmpstop = "0";
                var tmpflag = 0;
                $('#<%= this.form1.FindControl("ddltsbPlanCode").ClientID%> option[value=' + tmpstop + ']').attr('style', "color:red").attr("disabled", "true");


                $('#<%= this.form1.FindControl("ddltsbPlanCode").ClientID%>  option[value !=0]:first').attr('selected', true);


            }


        </script>
    </form>
</body>
</html>
