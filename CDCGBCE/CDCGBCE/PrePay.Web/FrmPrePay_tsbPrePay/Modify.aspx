<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="PrePay.Web.FrmPrePay_tsbPrePay.Modify" EnableEventValidation="true" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>    <%: Styles.Render("~/Content/jqueryui") %>    <%: Styles.Render("~/Content/jqueryval") %>    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
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
            <h1 class="h1Class">
                <asp:Label ID="lbltitle" runat="server" Text="預撥資料新增作業"></asp:Label>
            </h1>
            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">預撥號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbPrePayNo" runat="server" Width="150px" Text='<%# Eval("CtsbPrePayNo") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請業務單位</td>
                            <td class="qury_table_td4">
                                <asp:DropDownList ID="ddlCtsbWorkUnitNo" runat="server" Width="150px"></asp:DropDownList>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請人</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbWorkUserNo" runat="server" Width="150px" Text='<%# Eval("CtsbWorkUserNo") %>' CssClass="Width40p"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">會簽編號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtAtsbApplyWordNum" runat="server" Width="150px" Text='<%# Eval("AtsbApplyWordNum") %>'></asp:TextBox>
                                <asp:TextBox ID="txtAtsbApplyNo" runat="server" Enabled="false" Style="display: none" Text='<%# Eval("AtsbApplyNo") %>'></asp:TextBox>
                                <asp:TextBox ID="txtBtsbDecideNo" runat="server" Enabled="false" Style="display: none" Text='<%# Eval("BtsbDecideNo") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td">核定日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtBtsbDecideDate" runat="server" Width="150px" MyKendoDatePicker="MyKendoDatePicker" Text='<% #ConverDate_ADtoROC(Convert.ToDateTime(Eval("BtsbDecideDate")).ToString("yyyy/MM/dd"))%>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td">核定金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtBtsbMoney" runat="server" Width="150px" Text='<%# string.Format( "{0:N0}",Eval("BtsbMoney")) %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">付款方式</td>
                            <td class="qury_table_td4">
                              <%--  <asp:DropDownList ID="ddlCPayKind" runat="server">
                                    <asp:ListItem Value="0">無</asp:ListItem>
                                    <asp:ListItem Value="1">零用金</asp:ListItem>
                                    <asp:ListItem Value="2">電子支付</asp:ListItem>
                                </asp:DropDownList>--%>


                                <asp:RadioButtonList ID="RdbCPayKind" runat="server" RepeatDirection="Horizontal">
                                     <asp:ListItem Value="0" Selected="True">無</asp:ListItem>
                                    <asp:ListItem Value="1">零用金</asp:ListItem>
                                    <asp:ListItem Value="2">電子支付</asp:ListItem>
                                </asp:RadioButtonList>

                            </td>
                            <td class="qury_table_td">群組編號</td>
                            <td class="qury_table_td4"><asp:TextBox ID="txtCtsbGroupNo" runat="server"  Text='<%# Eval("CtsbGroupNo ") %>'></asp:TextBox></td>
                            <td class="qury_table_td">電支付號</td>
                            <td class="qury_table_td4"><asp:TextBox ID="txtCtsbEtcPayWordNum" runat="server"  Text='<%# Eval("CtsbEtcPayWordNum") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>預撥日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbMarkDate" runat="server" Width="150px" Text='<% #ConverDate_ADtoROC(Convert.ToDateTime(Eval("CtsbMarkDate")).ToString("yyyy/MM/dd"))%>' MyKendoDatePicker="MyKendoDatePicker" ></asp:TextBox></td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>預撥金額</td>
                            <td class="qury_table_td4" colspan="3">
                                <asp:TextBox ID="txtCtsbMoney" runat="server" Width="150px" Text='<%# string.Format( "{0:N0}",Eval("CtsbMoney")) %>' onfocus="blur()"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="qury_table_td">用途說明</td>
                            <td colspan="5" class="qury_table_td4">
                                <asp:TextBox ID="txtAtsbTrustSubsidyName" runat="server" Text='<%# Eval("AtsbTrustSubsidyName") %>' Width="650px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>事由</td>
                            <td colspan="5" class="qury_table_td4">
                                <span style="color: Red;">＊最大輸入字數：120 個中文字。</span><br />
                                <asp:TextBox ID="txtCtsbMemo" runat="server" Rows="3" TextMode="MultiLine" Width="650px" Text='<%# Eval("CtsbMemo") %>'></asp:TextBox>
                                <input id="btnChoosePhrase" type="button" value="..." onclick="fnCallPhraseDialog();" />
                            </td>
                        </tr>
                    </table>
                    <!----------------------->

                </ItemTemplate>
            </asp:FormView>
        </div>
        <br />
        <asp:Panel ID="Panel2" runat="server">
            <!--核定明細號-->
            <asp:TextBox ID="txttsbDecideSeq" runat="server" Style="display: none"></asp:TextBox>
            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>

            <table style="width: 100%;" border="1">
                <tr class="DtleditTd">
                    <td style="width: 18%"><span style="color: Red;">＊</span>核定明細資料選取</td>
                    <td style="width: 8%">經資門別<br />
                        預算來源</td>
                    <td style="width: 8%">經費單位<br />
                        控帳業務</td>
                    <td style="width: 14%">計畫科目/用途別</td>
                    <td style="width: 14%"><span style="color: Red;">＊</span>受款人</td>
                    <td style="width: 8%">群組編號</td>
                    <td style="width: 7%">核定明細金額</td>
                    <td style="width: 7%"><span style="color: Red;">＊</span>預撥金額</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtEtsbApplySeq" runat="server" Style="display: none" onfocus="blur()"></asp:TextBox>
                        <asp:DropDownList ID="ddlApplyDtlData" runat="server" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEcodAccKindName" runat="server" onfocus="this.blur()" Width="100%"></asp:DropDownList>
                        <br />
                        <asp:DropDownList ID="ddlEcodBgtOrigin" runat="server" onfocus="this.blur()" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEcodDepartName" runat="server" onfocus="this.blur()" Width="100%"></asp:DropDownList>
                        <asp:DropDownList ID="ddlcodBiz" runat="server" onfocus="blur()"></asp:DropDownList>
                        <!-- 控帳業務 -->
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAtsbPlanCode" runat="server" Width="100%" onfocus="this.blur()">
                        </asp:DropDownList>
                        <br />
                        <asp:DropDownList ID="ddloulOutlayCode" runat="server" Width="100%" onfocus="this.blur()">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEtsbPayeeName" runat="server" onfocus="blur()" Width="98%"></asp:TextBox>
                        <asp:TextBox ID="txtEtsbPayeeNo" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                        <asp:TextBox ID="txtEtsbtemp" runat="server"  Width="98%" Style="display: none"></asp:TextBox><!--暫存用(目前沒用到但開啟隱藏可以用)--->
                    </td>
                    <td>
                        <asp:TextBox ID="txtEtsbGroupNo" runat="server" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" Width="98%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txttsbMoney" runat="server" Width="96%" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" onfocus="alert('禁止修改');blur()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txttsbMoney1" runat="server" OnKeyPress="if(((event.keyCode&gt;=48)&amp;&amp;(event.keyCode &lt;=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" Width="97%"></asp:TextBox>
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
        </asp:Panel>
        <br />
        <!------------>
        <div>
            <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                CssClass="GridViewStyle" Width="100%" OnRowCreated="GridView1_RowCreated">
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
                        <HeaderStyle HorizontalAlign="Center" Width="30" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <!--會簽明細號-->
                            <asp:Label ID="lblBtsbApplySeq" runat="server" Text='<%# Eval("BtsbApplySeq") %>' Style="display: none"></asp:Label>
                            <!--核定明細號-->
                            <asp:Label ID="lblBtsbDecideSeq" runat="server" Text='<%# Eval("BtsbDecideSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="40" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="40" />
                    </asp:TemplateField>





                    <asp:TemplateField HeaderText="經資門別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblCtsbAccKind" runat="server" Text='<%#    CodeFormat( Eval("BtsbAccKind").ToString(),"ddlEcodAccKindName")%> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="預算來源" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblCtsbBgtSourceCode" runat="server" Text='<%#  CodeFormat( Eval("BtsbBgtSourceCode").ToString(),"ddlEcodBgtOrigin") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經費單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblCtsbBgtDepCode" runat="server" Text='<%#  CodeFormat( Eval("BtsbBgtDepCode").ToString(),"ddlEcodDepartName") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="控帳業務" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBizCode" runat="server" Text='<%# CodeFormat( Eval("BtsbBizCode").ToString(),"ddlcodBiz") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>




                    <asp:TemplateField HeaderText="計畫科目" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblCtsbPlanCode" runat="server" Text='<%#  CodeFormat( Eval("BtsbPlanCode").ToString(),"ddlAtsbPlanCode") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="180" />
                        <ItemStyle HorizontalAlign="Center" Width="180" />
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="用途別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbOutlayCodeName" runat="server" Text='<%#   OutlayFormat( Eval("BtsbOutlayCode").ToString())%>'></asp:Label>
                            <asp:Label ID="lblBtsbOutlayCode" runat="server" Text='<%# Eval("BtsbOutlayCode") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="120" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="120" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="受款人名稱" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbPayeeName" runat="server" Text='<%# Eval("BtsbPayeeName") %>'></asp:Label>
                            <asp:Label ID="lblBtsbPayeeNo" runat="server" Text='<%# Eval("BtsbPayeeNo") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="160" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="160" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="群組編號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbGroupNo" runat="server" Text='<%#   Eval("BtsbGroupNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="65" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="65" />
                    </asp:TemplateField>



                      <asp:TemplateField HeaderText="暫存用" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbtemp" runat="server" Text='<%#   Eval("Btsbtemp") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>



                

                    <asp:TemplateField HeaderText="核定明細金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblCtsbMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("CtsbMoney")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="預撥金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("BtsbMoney")) %>'    ToolTip='<%#   "傳票號碼：" + Eval("BtsbExchNo") %>'  ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="65" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="65" />
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
            <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" CssClass="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" CssClass="Btn04" />
        </asp:Panel>
        <div id="win1"></div>
        <%# GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>

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
                Getoulcode();//選擇科目變化用途別
                GetoulcodeStart();
                getSelectDtlData();
                disabledControl();//禁止點選

            });

            ///
            function disabledControl() {

                //  $('#ddlEcodAccKindName').attr("disabled", "disabled");
                //  $('#ddlEcodBgtOrigin').attr("disabled", "disabled");
                // $('#ddlEcodDepartName').attr("disabled", "disabled");
                //  $('#ddlAtsbPlanCode').attr("disabled", "disabled");

                $('#ddlEcodDepartName').click(function () {
                    alert('禁止選取');
                    return false;
                });
                $('#ddlEcodAccKindName').click(function () {
                    alert('禁止選取');
                    return false;
                });
                $('#ddlEcodBgtOrigin').click(function () {
                    alert('禁止選取');
                    return false;
                });
                $('#ddlAtsbPlanCode').click(function () {
                    alert('禁止選取');
                    return false;
                });

                $('#ddlcodBiz').click(function () {
                    alert('禁止選取');
                    return false;
                });


                $('#ddloulOutlayCode').click(function () {
                    alert('禁止選取');
                    return false;
                });

            }
            ///

            //事由_片語
            function fnCallPhraseDialog() {

                var thisName = "FormView1_txtCtsbMemo";
                var strReturnVal = showModalDialog("../../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
                //alert(thisName);
                if (strReturnVal != "Cancel") {
                    document.all(thisName).value = document.all(thisName).value + strReturnVal;
                }
            }
            //




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


            ////
            function GetoulcodeStart() {

                //載入
                var selected = $("#<%= ddlApplyDtlData.ClientID %>").val();

                //檢視或刪除時
                if (selected == null) {
                    return;
                }


                if (selected.length > 0) {
                    $("#ddlApplyDtlData").change();
                }

            }
            /////


            /////
            function Getoulcode() {
                var ddl = $("#<%= ddlApplyDtlData.ClientID %>");

                //變更
                ddl.change(function () {
                    getSetEditData("");
                });

            }
            //////

            function getSelectDtlData() {


                $('#GridView1 tr').not(':first').click(function () {

                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        $(this).css({ "background-color": "white" });
                    });

                    var tmpIndex = $.trim($(this).find("td:first").text());
                    if (parseInt(tmpIndex, 10) > 0) {
                        $(this).css({ "background-color": "yellow" });
                    }
                    var tmptsbApplySeq = $.trim($(this).find("[id$=BtsbApplySeq]").text()); //會簽明細號
                    var tmptsbDecideSeq = $(this).find("[id$=lblBtsbDecideSeq]").text();//核定明細號
                    var tmptsbOutlayCodeName = $.trim($(this).find("[id$=lblBtsbOutlayCode]").text()); //用途別
                    var tmpBtsbMoney = $(this).find("[id$=lblBtsbMoney]").text();//預撥金額
                    var tmpBtsbtemp = $(this).find("[id$=lblBtsbtemp]").text();//暫存用
                    var tmpBtsbGroupNo = $(this).find("[id$=lblBtsbGroupNo]").text();//群組編號




                    $('#ddlApplyDtlData option[value=' + tmptsbDecideSeq + ']').attr('selected', true);
                    getSetEditData(tmptsbOutlayCodeName.split(" ")[0]);

                    $('#txttsbMoney1').val($.trim(tmpBtsbMoney));//預撥金額
                    $('#txtEtsbGroupNo').val($.trim(tmpBtsbGroupNo));//群組編號


                    $('#txtEtsbtemp').val($.trim(tmpBtsbtemp));//暫存用

                    return false;
                });

            }



            function getSetEditData(tmptsbOutlayCode) {


                //檢視刪除不執行撈取資料
                var tmpTitle = $("#<%= lbltitle.ClientID %>").text();
                if (tmpTitle.indexOf("檢視") >= 0 | tmpTitle.indexOf("刪除") >= 0) {
                    // alert("123");
                    return;
                }


                var tmpApplyNo = $("#<%=  FormView1.FindControl("txtAtsbApplyNo").ClientID %>").val();
                var tmpDecideNo = $("#<%=  FormView1.FindControl("txtBtsbDecideNo").ClientID %>").val();

                var ddl2 = $("#<%= ddloulOutlayCode.ClientID %>");
                var selected = $("#<%= ddlApplyDtlData.ClientID %>").val();

                $("#<%= txtEtsbPayeeName.ClientID %>").val('');
                $("#<%= txtEtsbPayeeNo.ClientID %>").val('');
                $("#<%= txttsbMoney.ClientID %>").val('');

                //預撥金額清空
                $("#<%= txttsbMoney1.ClientID %>").val('');
                //暫存用
                $("#<%= txtEtsbtemp.ClientID %>").val('');




                $.ajax({
                    type: "POST",
                    url: "ajax01.aspx",
                    async: false,
                    dataType: "JSON",
                    data: { 'ApplyNo': tmpApplyNo, 'DecideNo': tmpDecideNo, 'DecideSeq': selected },
                    success: function (result) {
                        ddl2.empty();
                        $.each(result.oulayCoedeItem, function (i, value) {
                            if (value.IsCannSelect)
                                ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>")
                            else
                                ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\" style=\"color:Navy\" disabled=\"true\" ></option>")

                        });

                        //用途別設定
                        if (tmptsbOutlayCode.length > 0) {
                            //選擇結果
                            $('#ddloulOutlayCode option[value=' + tmptsbOutlayCode + ']').attr('selected', true);
                        }
                        else {
                            //預設值
                            $('#ddloulOutlayCode option[value=' + result.tsbDecideDtlDTO.tsbOutlayCode + ']').attr('selected', true);
                        }

                        if (result.tsbDecideDtlDTO.tsbPayeeName != null)
                        { $("#<%= txtEtsbPayeeName.ClientID %>").val(result.tsbDecideDtlDTO.tsbPayeeName); }
                        if (result.tsbDecideDtlDTO.tsbPayeeNo != null)
                        { $("#<%= txtEtsbPayeeNo.ClientID %>").val(result.tsbDecideDtlDTO.tsbPayeeNo); }
                        if (result.tsbDecideDtlDTO.tsbMoney != null)
                        { $("#<%= txttsbMoney.ClientID %>").val(result.tsbDecideDtlDTO.tsbMoney); }
                        if (result.tsbDecideDtlDTO.tsbApplySeq != null)
                            $("#<%= txtEtsbApplySeq.ClientID %>").val(result.tsbDecideDtlDTO.tsbApplySeq);



                        $('#ddlEcodAccKindName option[value=' + result.tsbDecideDtlDTO.tsbAccKind + ']').attr('selected', true);
                        $('#ddlEcodBgtOrigin option[value=' + result.tsbDecideDtlDTO.tsbBgtSourceCode + ']').attr('selected', true);
                        $('#ddlEcodDepartName option[value=' + result.tsbDecideDtlDTO.tsbBgtDepCode + ']').attr('selected', true);
                        $('#ddlAtsbPlanCode option[value=' + result.tsbDecideDtlDTO.tsbPlanCode + ']').attr('selected', true);
                        $('#ddlcodBiz option[value=' + result.tsbDecideDtlDTO.tsbBizCode + ']').attr('selected', true);



                    },
                    error: function () { alert("資料讀取發生錯誤！，請檢查 經資門別/預算來源/經費單位/控帳業務/計畫科目/用途別科目 表單資料是否含有此筆資料"); }
                });
                return false;
            }

        </script>
    </form>
</body>
</html>
