<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameSpace.Web.Default" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayPrintoffset.aspx.cs" Inherits="Pay.Web.FrmPay_tsbPay.PayPrintoffset" EnableEventValidation="true" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %><%: Styles.Render("~/Content/jqueryui") %><%: Styles.Render("~/Content/jqueryval") %><%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="h1Class">
            <asp:Label ID="lbltitle" runat="server" Text="支出憑證黏存單列印(轉正)"></asp:Label>  
        </h1>
          <div style="display:none">
                            <asp:Label ID="lbltsbYear" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbApplyNo" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbDecideNo" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbPayNo" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lbltsbPayYear" runat="server" Text="Label"></asp:Label>

          </div>


        <asp:FormView ID="FormView1" runat="server" Width="100%">
            <ItemTemplate>
                <!------------------->
                <table style="width: 100%; vertical-align: top;" border="1">
                    <tr>
                        <td class="qury_table_td">會簽編號：</td>
                        <td class="qury_table_td2">
                            <asp:Label ID="lbltsbApplyWordNum" runat="server" Text="沒有會簽編號"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td">核定明細號/沖抵預撥號：</td>
                        <td class="qury_table_td2">
                            <asp:DropDownList ID="ddlPayoffset" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <!----------------------->
            </ItemTemplate>
        </asp:FormView>
        <div style="text-align: center; margin: 10px;">
               <input type="button" id="btnpPayoff" value="列印轉正" class="Btn03" />
        </div>
              
          <!-- 顯示列印區塊-->
        <div id="divP" style="display:none">
             
             <table>
                 <tr>
                     <td style="text-align:center">
                          <input type="button" id="btnPayinstructions" value="【開啟】黏存單付款說明" />
                     </td>
                 </tr>
            
            </table>

             <!--黏存單付款說明-->
             <div id="divPX" style="display:none">
             <iframe id="Payinstructions" name="Payinstructions" style=" height:170px; width:100%; VISIBILITY: inherit; Z-INDEX: 2" scrolling="no" frameborder="0" src=""></iframe>
             </div>

             <!--列印資料-->
             <iframe id="PayPrintoffset" name="PayPrintoffset" style=" height:650px; width:100%; VISIBILITY: inherit; Z-INDEX: 2" scrolling="yes" frameborder="1" src=""></iframe>
        </div>





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
            });


            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href;
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />刪除中...</b></h1>" });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    $.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />儲存中...</b></h1>" });
                    return true;
                } else {
                    alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                }


                return false;
            });
            //#endregion


            //#region $("#btnView").click
            $("#btnpPayoff").click(function () {
              
                    // var menuID = $("#hdfMenuID").val();


                    var tsbYear = $('#lbltsbYear').html();
                    var tsbApplyNo =$('#lbltsbApplyNo').html();
                    var tsbDecideNo = $('#lbltsbDecideNo').html();
                    var tsbPayNo = $('#lbltsbPayNo').html();
                    var tsbPayYear = $('#lbltsbPayYear').html();
                    var tsbApplyWordNum = $("#<%=  FormView1.FindControl("lbltsbApplyWordNum").ClientID %>").html();


                    var tmpValue = $("#<%=  FormView1.FindControl("ddlPayoffset").ClientID %>").val();
                    var tsbDecideSeq =tmpValue.split("_")[0];
                    var tsbPrePayNo=tmpValue.split("_")[1];
                    var acpPayNo=tmpValue.split("_")[2];
                    var tsbPayNo=tmpValue.split("_")[3];
                    var acpPayNo1 = tmpValue.split("_")[4];

                    //alert(tmpValue); 偵錯用

                    if (tsbPayNo == "0") {
                        alert("尚未新增核銷資料，請先點選新增按鈕進行新增資料")
                        return;
                    }


                    var src = "../../UI.ActReports.Web/FrmRptMenu.aspx?"

                        + "visastage=P1"
                        + "&acmYear=" + tsbYear
                        + "&acmNo=" + tsbApplyNo
                        + "&acmwordnum=" + tsbApplyWordNum
                        + "&acmNo1=" + tsbDecideSeq  //再簽號
                        + "&acpPayYear=" + tsbPayYear
                        + "&acpPayNo=" + acpPayNo  //核銷從20000開始
                        + "&acpPayNo1=" + acpPayNo1  //預撥從10000開始
                        + "&acmkidnum=TCase"
                        + "&page1qty=6"
                        + "&page2qty=43"

                    //偵錯用
                    //alert(src);
                    $('#divP').show();
                    document.getElementById("PayPrintoffset").src = src;

                  
                //黏存單付款說明
                    var src2 = "../../AppCtrlCustom/FrmPayMethod.aspx?"

                    + "datastage=P1"
                    + "&acmYear=" + tsbYear
                    + "&acmNo=" + tsbApplyNo
                    + "&acmwordnum=" + tsbApplyWordNum
                    + "&acmNo1=" + tsbDecideSeq                    //再簽號及決標號等於核定明細號
                    + "&acpPayYear=" + tsbPayYear
                    + "&acpPayNo=" + acpPayNo   //預撥對應
                    + "&acpPayNo1=" + acpPayNo1  //核銷對應
                    + "&acmkidnum=TCase"
                    + "&page1qty=7"
                    + "&page2qty=43"
                    + "&SessID=undefined"

                //$('#divPX').show();
                    document.getElementById("Payinstructions").src = src2;


                    var tmpOpenFlag = 1;

                    $("#btnPayinstructions").bind("click", function () {
                        if (tmpOpenFlag) {
                            tmpOpenFlag = 0
                            $('#divPX').show();
                            $("#btnPayinstructions").prop('value', '【關閉】黏存單付款說明');

                        }
                        else {
                            $('#divPX').hide();
                            tmpOpenFlag = 1;
                            $("#btnPayinstructions").prop('value', '【開啟】黏存單付款說明');
                        }
                    });








                
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


        </script>
    </form>
</body>
</html>
