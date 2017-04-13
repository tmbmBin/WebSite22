<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="UI.TrlBudgetTransfer.Web.FrmTrlBudgetTransfer.Modify" %>

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
        <div>
            <div>
                <h1 class="h1Class">
                    <asp:Label ID="lbltitle" runat="server" Text="出國預算流用新增作業"></asp:Label></h1>
                <asp:FormView ID="FormView1" runat="server" Width="100%" OnDataBound="FormView1_DataBound">
                    <ItemTemplate>

                        <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>序號</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtbgsNo" runat="server" Width="60px" Text='<%# Eval("AbgsNo") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>經費年度</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtbgsYear" runat="server" Text='<%# Eval("AbgsYear") %>' Width="60px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>核定日期</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtbgsDate" runat="server" Width="130px" MyKendoDatePicker="MyKendoDatePicker" Text='<%# shareFunction01.fun01.Converto_ROCstring(Convert.ToDateTime(Eval("AbgsDate"))) %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>流出出國計畫案</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlOutbgtTrlPlanCode" runat="server" Width="650px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>

                                <td class="qury_table_td">流出會議</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlOutbgtTrlAppCode" runat="server" Width="650px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>流入出國計劃案</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlInbgtTrlPlanCode" runat="server" Width="650px">
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>流入會議</td>
                                <td class="qury_table_td3">
                                    <asp:DropDownList ID="ddlInbgtTrlAppCode" runat="server" Width="650px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td"><span style="color: Red;">＊</span>流用金額</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtIn_bgtMoney" runat="server" Text='<%# Eval("In_bgtMoney").ToInt() %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="qury_table_td">備註</td>
                                <td class="qury_table_td3">
                                    <asp:TextBox ID="txtbgsMemo" runat="server" Text='<%# Eval("AbgsMemo") %>'></asp:TextBox>
                                </td>
                            </tr>

                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>

        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn04" OnClick="btnDelete_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" CssClass="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" CssClass="Btn04" />
        </asp:Panel>

        <%-- JavaScript專區 Start --%>
        <script type="text/javascript">

            $(function () {

                fnPageInit();

                // 會議記錄
                GetbgtTrlAppCodeStart();

                // 選擇科目變化用途別
                GetbgtTrlAppCode();
                ViewStatusControl();
            });



            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href + encodeURI('&WIN=0');
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: '<h1>資料刪除中，請耐心等候...</h1>' });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    

                    if (checkTransferByPlanCode()) //判斷是否可以留用
                    {
                        //alert('OK');
                        $.blockUI({ message: '<h1>資料儲存中，請耐心等候...</h1>' });
                        return true;
                    }

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


            //編輯區檢查
            function btn_AddEdit_check() {
                var tmpMoney = parseInt($('#txtEtsbMoney').val(), 10); //金額
                var tmptsbContractMoney = parseInt($('#txtEtsbContractMoney').val(), 10); // 合約金額
                //alert(tmpMoney );
                //alert(tmptsbContractMoney);

                if (tmpMoney > tmptsbContractMoney) {
                    alert('合約金額不可小於核定金額');
                    return false;
                }
            }

            //
            $("#btnPayee").click(function () {

                //判斷是否存在
                if (!$("#win1").data("kendoWindow")) {

                    OpenPayeeWindow();
                    //加入loading

                    var $load = $("<div id='load' style='position: absolute; top: 50%; left: 42%; '><h3 style='color:#0000AA;'><img src='../../Images/ajax-loader.gif' />&nbsp;載入受款人資料...</h3></div>");
                    $("#win1").data("kendoWindow").open().center()
                        .wrapper.find(".k-window-content").append($load);
                    //載畢隱藏
                    $("#win1").find(".k-content-frame").load(function () {
                        $("#win1").find("#load").hide();
                    });

                }
                else {
                    $("#win1").data("kendoWindow").open().center();
                }
            });

            ///會議記錄



            //#region  起始載入
            function GetbgtTrlAppCodeStart() {

                var ddlOut_TrlPlanCode = $("#<%=  this.FormView1.FindControl("ddlOutbgtTrlPlanCode").ClientID %>");
                var ddlOut_TrlAppCode = $("#<%=  this.FormView1.FindControl("ddlOutbgtTrlAppCode").ClientID %>");
                var ddlIn_TrlPlanCode = $("#<%=  this.FormView1.FindControl("ddlInbgtTrlPlanCode").ClientID %>");
                var ddlIn_TrlAppCode = $("#<%=  this.FormView1.FindControl("ddlinbgtTrlAppCode").ClientID %>");

                // 載入
                var selected = ddlOut_TrlPlanCode.val();
                var selected2 = ddlIn_TrlPlanCode.val();
                var selected3 = ddlOut_TrlAppCode.val(); // 後端顯示值
                var selected4 = ddlIn_TrlAppCode.val();



                if (selected.length > 0) {
                    getData(ddlOut_TrlAppCode, ddlOut_TrlPlanCode);

                }
                if (selected2.length > 0) {
                    getData(ddlIn_TrlAppCode, ddlIn_TrlPlanCode);

                }

                //重新指定後端險是值
                if (selected3.length > 0)
                    $('#<%= this.FormView1.FindControl("ddlOutbgtTrlAppCode").ClientID %> option[value=' + selected3 + ']').attr('selected', true);
                if (selected4.length > 0)
                    $('#<%= this.FormView1.FindControl("ddlinbgtTrlAppCode").ClientID %> option[value=' + selected4 + ']').attr('selected', true);

            }
            //



            //註冊事件
            function GetbgtTrlAppCode() {
                var ddlOut_TrlPlanCode = $("#<%=  this.FormView1.FindControl("ddlOutbgtTrlPlanCode").ClientID %>");
                var ddlOut_TrlAppCode = $("#<%=  this.FormView1.FindControl("ddlOutbgtTrlAppCode").ClientID %>");

                var ddlIn_TrlPlanCode = $("#<%=  this.FormView1.FindControl("ddlInbgtTrlPlanCode").ClientID %>");
                var ddlIn_TrlAppCode = $("#<%=  this.FormView1.FindControl("ddlinbgtTrlAppCode").ClientID %>");
                //變更
                ddlOut_TrlPlanCode.change(function () {
                    getData(ddlOut_TrlAppCode, ddlOut_TrlPlanCode);
                });

                ddlIn_TrlPlanCode.change(function () {
                    getData(ddlIn_TrlAppCode, ddlIn_TrlPlanCode);
                });
            };

            function getData(bgtTrlAppCode, bgtTrlPlanCode) {

                var tmpacmYear = $("#<%=  FormView1.FindControl("txtbgsYear").ClientID %>").val();

                var ddl2 = bgtTrlAppCode;
                var tmpselected = bgtTrlPlanCode.val();
                //alert(tmpselected);

                $.ajax({
                    type: "POST",
                    url: "ajax01",
                    async: false,
                    dataType: "JSON",
                    data: { 'acmYear': tmpacmYear, 'plnTrlPlanCode': tmpselected },
                    success: function (result) {

                        ddl2.empty();
                        //空值
                        ddl2.append("<option value=\"" + '' + "\" label=\"" + '....................' + "\"></option>");

                        if (result.success) {
                            $.each(result._ddlbgtTrlAppCodeItem, function (i, value) {

                                var Ivalue = decodeURIComponent(value.Ivalue);
                                var IText = decodeURIComponent(value.IText);

                                ddl2.append("<option value=\"" + Ivalue + "\" label=\"" + IText + "\"></option>")
                            });
                        }

                    },
                    error: function () { alert("下拉選單發生錯誤！"); }
                });
                return false;
            }





            function checkTransferByPlanCode() {
               // alert('777');
             
                var tmpValue1 = $('#<%=  this.FormView1.FindControl("ddlOutbgtTrlPlanCode").ClientID %>  option:selected').attr('title');
                var tmpValue2 = $('#<%=  this.FormView1.FindControl("ddlInbgtTrlPlanCode").ClientID %>  option:selected').attr('title');

              // alert(tmpValue1);
              // alert(tmpValue2);
                // return;
               var tmpTF;
                $.ajax({
                    type: "POST",
                    url: "ajax_checkTransferByPlanCode",
                    async: false,
                    dataType: "JSON",
                    data: { 'selectValue1': tmpValue1, 'selectValue2': tmpValue2 },
                    success: function (result) {

                        if (result.success)
                        {
                           // alert('ok');
                            tmpTF= true;
                        }else
                        {
                            alert(result.msg);
                            return false;
                        }

                    },
                    error: function () {
                        alert("發生錯誤！");
                        tmpTF= false;
                    }
                });
                return tmpTF;
            }




            //元件啟用顯示


            function ViewStatusControl()  
            {
                   
                var FormStatus = "<% = this.FormStatus %>"
              

                if (FormStatus == "View")
                {
                   disableForm( "form1" , true )
                }
            }


            //檢視禁止
            function disableForm(formId, TrueOrFalse)
            {
                
                    $( "form[id='" + formId + "'] :text" ).attr( "readonly", "readonly" );
                    $( "form[id='" + formId + "'] textarea" ).attr( "readonly", "readonly" );
                    //$("form[id='" + formId + "'] select option:not(:selected)").attr("disabled", true);
                    $( "form[id='" + formId + "'] select option:not(:selected)" ).remove();
                    $( "form[id='" + formId + "'] :radio" ).attr( "readonly", "readonly" );
                    $( "form[id='" + formId + "'] :checkbox" ).attr( "disabled", true );
                    // $('[MyKendoDatePicker=MyKendoDatePicker]').data("kendoDatePicker").enable(false);
                    $( "form[id='" + formId + "'] [MyKendoDatePicker=MyKendoDatePicker]").data("kendoDatePicker").enable(false);

            }









        </script>
        <%-- JavaScript專區 End --%>
    </form>
</body>
</html>
