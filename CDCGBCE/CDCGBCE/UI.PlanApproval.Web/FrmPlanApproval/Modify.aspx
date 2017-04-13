<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="UI.PlanApproval.Web.FrmPlanApprovalT_PlanApproval.Modify" EnableEventValidation="true" %>

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
            <h1 class="h1Class">實際出國計畫資料編輯作業</h1>
        </div>
        <div runat="server" id="editDiv">
            <asp:Panel ID="panInput" runat="server">
                <table style="width: 100%;" border="1">
                    <tr>
                        <td class="qury_table_td"><span style="color:red;">*</span>實際出國計畫號</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtplnTrlAppCode" ReadOnly="true" runat="server" Style="width: 100px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color:red;">*</span>核定出國計畫案</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:DropDownList ID="ddlplnTrlPlanCode" runat="server" AppendDataBoundItems="True"
                                defaultValue=""
                                DataTextField="plnTrlPlanName" DataValueField="plnTrlPlanCode" Style="width: 650px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color:red;">*</span>實際出國計畫名稱</td>
                        <td class="qury_table_td2" colspan="3">
                            <asp:TextBox ID="txtplnTrlAppName" runat="server" Style="width: 645px;" MaxLength="230"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color:red;">*</span>國家</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlCountry" runat="server" Style="width: 150px;"  MaxLength="20"></asp:TextBox>
                        </td>
                        <td class="qury_table_td"><span style="color:red;">*</span>城市</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlCity" runat="server" Style="width: 150px;"  MaxLength="25"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td"><span style="color:red;">*</span>出國期間(起)</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlSDate" runat="server" Style="width: 120px;" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                        <td class="qury_table_td"><span style="color:red;">*</span>出國期間(迄)</td>
                        <td class="qury_table_td2">
                            <asp:TextBox ID="txtappTrlEDate" runat="server" Style="width: 120px;" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Panel id="panplnModify" runat="server" Visible="false">
                    <table style="width: 100%;" border="1">
                        <tr id="trplnModify" >
                            <td class="qury_table_td">變更核准文號</td>
                            <td class="qury_table_td2">
                                變更：<asp:CheckBox id="chkplnModifyFlag" runat="server" />
                                <asp:TextBox ID="txtplnModifyPrjNo" runat="server" Style="width: 150px;"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">變更日期</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txtplnModifyDate" runat="server" Style="width: 120px;" MyKendoDatePicker="MyKendoDatePicker"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtplnTrlAppName" 
                    ErrorMessage="實際出國計畫名稱不可空白"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtappTrlCountry" 
                    ErrorMessage="國家不可空白"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtappTrlCity"
                     ErrorMessage="城市不可空白"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtappTrlSDate" 
                    ErrorMessage="出國期間(起)不可空白"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtappTrlEDate"
                     ErrorMessage="出國期間(迄)不可空白"></asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ClientValidationFunction="client_Validate" Display="None"
                    ErrorMessage="出國期間(迄)不可以小於出國期間(起)" ></asp:CustomValidator>

                <asp:ValidationSummary runat="server" ShowMessageBox="true" DisplayMode="List" ShowSummary="false" />
            </asp:Panel>
            <br />
            <!--儲存時傳到後台，後台判斷錯誤前台恢復用-->
            <asp:HiddenField ID="hdfTrlMember" runat="server" />
            <!--目前狀態，只是不用FormStatus而寫到前台而已沒為什麼...-->
            <asp:HiddenField ID="hdfFormStatus" runat="server" />
            <!--出國人員新增的資料，在最後會存成JSON格式到後台處理-->
            <input type="hidden" id="hdfTrlMember_insert" name="hdfTrlMember_insert" />
            <!--出國人員更新的資料，在最後會存成JSON格式到後台處理，目前沒用到這裏是全刪再新增-->
            <input type="hidden" id="hdfTrlMember_update" name="hdfTrlMember_update" />
            <!--出國人員刪除的資料，在最後會存成JSON格式到後台處理，目前沒用到這裏是全刪再新增-->
            <input type="hidden" id="hdfTrlMember_delete" name="hdfTrlMember_delete" />
            <div id="divMemberPanel" style="display: none;">
                <div id="divEditTrlMember">
                    <%--出國人員--%>
                    代核銷人員單位：
                    <select id="selcodDepartName">
                        <option value="">...</option>
                    </select>
                    代核銷人員：
                    <input type="text" id="txtsusrName" style="width: 150px;" />
                    <input type="hidden" id="hdrusrUserID" />
                    <%--人員下拉選項--%>
                    <div id="divsysBaseUser" style="position: absolute; display: none;">
                        <select id="selsysBaseUser" multiple="multiple" size="8" style="width: 154px;"></select>
                    </div>
                    <br />
                    出國人員單位：
                    <input type="text" id="txtctmUnitName" style="width: 150px;" />
                    出國人員：
                    <input type="text" id="txtctmUserName" style="width: 150px;" />
                    <input type="button" id="btnDitto" class="Btn11" value="同上" />
                    <br />
                    職稱：
                    <input type="text" id="txtctmUserTitle" />
                    <%--職稱下拉選項--%>
                    <div id="divcodRankName" style="position: absolute; display: none;">
                        <select id="selcodRankName" multiple="multiple" size="8" style="width: 154px;"></select>
                    </div>
                    <%--編輯的ID--%>
                    <input type="hidden" id="hrnEditRowIdx" />
                    <br />
                    <span style="color:red;">附註：若出國人員未填寫則自動代入代核銷人員及單位</span>
                    <br />
                    <div style="width: 100%; text-align: center;">
                        <input type="button" id="btnEdit_Save" class="Btn12 _btnAddDtl" value="儲存" />
                        <input type="button" id="btnEdit_Cancel" class="Btn12 _btnAddDtl" value="取消" />
                    </div>
                </div>
            </div>
            <h2 class="h1Class" style="height: 30px; line-height: 30px;">出國人員</h2>
            <div style="border: #808080 1px solid; padding: 10px;">
                <input type="button" id="btnAddRow" class="Btn12 _btnAddDtl" value="增加列數" />
                <table id="gridTrlMember" style="width: 100%; border-spacing: 0px;" border="1">
                    <thead>
                        <tr style="background-color: #3067d9; color: white;">
                            <th style="padding: 0px; width: 80px;">&nbsp;</th>
                            <th style="padding: 0px;">代核銷人員單位</th>
                            <th style="padding: 0px;">代核銷人員</th>
                            <th style="padding: 0px;">出國人員單位</th>
                            <th style="padding: 0px;">出國人員職稱</th>
                            <th style="padding: 0px;">出國人員</th>
                            <th style="padding: 0px; width: 50px;">代表</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <br />
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" CausesValidation="false" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" CausesValidation="false" />
        </asp:Panel>
        <script type="text/javascript">
            var _TrlMember = [];
            var _TrlMember_Del = [];
            var FLAG_EDIT = "edit";
            var FLAG_INSERT = "insert";
            var FLAG_DELETE = "delete";


            function client_Validate(sender, args) {
                sender.errormessage = "";
                var isValid = true;
                if (0 < _TrlMember.length) {
                    var n = 0;
                    for (; n < _TrlMember.length; n++) {
                        if ("1" == _TrlMember[n].nowData.ctmDelegateFlag)
                            break;
                    }
                    if (n == _TrlMember.length) { 
                        isValid = false;
                        sender.errormessage += "代表人未勾選\n";
                    }

                    for (; n < _TrlMember.length; n++) {
                        if ("" == _TrlMember[n].nowData.ctmUserTitle)
                            break;
                    }
                    if (n < _TrlMember.length) { 
                        isValid = false;
                        sender.errormessage += "職稱未填寫\n";
                    }

                }
                else {
                    isValid = false;
                    sender.errormessage += "出國人員最少1人\n";
                }

                var sdateStr = $("#txtappTrlSDate").val();
                var edateStr = $("#txtappTrlEDate").val();
                //空白不判斷
                if ("" != sdateStr && "" != edateStr){
                    sdateStr = MyLibraryJs.StringExt.fnGetDate(sdateStr);
                    edateStr = MyLibraryJs.StringExt.fnGetDate(edateStr);

                    var sdate = new Date(sdateStr);
                    var edate = new Date(edateStr);

                    if (edate >= sdate) {
                        if (edate.getYear() != sdate.getYear()) {
                            isValid = false;
                            sender.errormessage += "出國期間不可跨年度!";
                        }
                    }
                    else {
                        isValid = false;
                        sender.errormessage += "出國期間(迄)不可以小於出國期間(起)!";
                    }
                }
                args.IsValid = isValid;
            }

            
            function getEmptyMemberModel() {
                //var model = {
                //    "ctmDelegateFlag": "0",
                //    "ctmPayUnitNo": "", "ctmPayUnitName": "", "ctmUserTitle": "", "ctmPayUserNo": "", "ctmPayUserName": ""
                //};
                var model = {
                    "ctmNo": 0,
                    "ctmDelegateFlag": "0",
                    "ctmPayUnitNo": "", "ctmPayUnitName": "", "ctmPayUserNo": "", "ctmPayUserName": "", "ctmUnitName": "",
                    "ctmUserName": "", "ctmUserTitle": ""
                };
                return model;
            }
            function createTrlMemberModel(idx)
            {
                var model = {
                    "idx": idx,
                    "flagold": "", //<%--edit, 可用在暫存判斷: insert, update, delete--%>
                    "flagnow": FLAG_INSERT, //update, delete
                    "nowData": getEmptyMemberModel(),
                    "oldData": getEmptyMemberModel(),
                };
                return model;
            }

            function getTrlMemberModel(idx) {
                for (var n = 0; n < _TrlMember.length; n++) {
                    if (_TrlMember[n].idx == idx) {
                        return _TrlMember[n];
                    }
                }
                return null;
            }

            $(function () {
                fnPageInit();
                initEl();
                initElEvent();
                initInstance();
            });
            function initElEvent()
            {
                //<%--同上--%>
                $("#btnDitto").click(function(){
                    if ("" != $("#txtsusrName").val()){
                        //<%--部門--%>
                        $("#txtctmUnitName").val($("#selcodDepartName option:selected").text());
                        //<%--核定人員,姓名--%>
                        $("#txtctmUserName").val($("#txtsusrName").val());
                    }
                });
                $("#btnClose").click(function () {
                    parent.closeDlg();
                    return false;
                });
            
                $("#btnDelete").click(function () {
                    if (confirm('是否真的要刪除此筆資料？')) {
                        $("#hdfTrlMember").val(JSON.stringify(_TrlMember));
                        $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                        return true;
                    }
                    return false;
                });
                //<%----最後再判斷代表人--%>
                $("#btnSave").click(function () {
                    //if (!Page_ClientValidate()){
                    if (!Page_IsValid){
                        return false;
                    }
                    if ($("#form1").valid()) {
                        //<%--為了在後台判斷錯誤要回復到修改中的狀態資料--%>
                        $("#hdfTrlMember").val(JSON.stringify(_TrlMember));

                        var hdrData = getGrid2JsonString();
                        $("#hdfTrlMember_insert").val(hdrData.insertData);
                        $("#hdfTrlMember_delete").val(hdrData.deleteData);
                        $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                        return true;
                    } else {
                        alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                    }
                    return false;
                });
            }
            function initEl(){
                var status = $("#hdfFormStatus").val();
                //<%--顯示及刪除的動作--%>
                if ("<%=PageFormStatus.View.ToString()%>" == status || "<%=PageFormStatus.Delete.ToString()%>" == status){
                    var datepickerSDate = $("#txtappTrlSDate").data("kendoDatePicker");
                    var datepickerEDate = $("#txtappTrlEDate").data("kendoDatePicker");
                    if (1 == $("#txtplnModifyDate").length)
                    {
                        var datepickerplnModifyDate = $("#txtplnModifyDate").data("kendoDatePicker");
                        datepickerplnModifyDate.readonly();
                    }
                    datepickerSDate.readonly();
                    datepickerEDate.readonly();

                    $("#panInput input:checkbox").prop("disabled", true);

                    $("#panInput input").prop("readonly", true);
                    $("#panInput select").focus(function (){
                        $(this).attr("defaultValue", $(this).val());
                    })
                    .change(function(){
                        $(this).val($(this).attr("defaultValue"));
                    });

                    $("#btnAddRow").css("display", "none");

                    $("#gridTrlMember input").prop("readonly", true);
                    $("#gridTrlMember thead tr th").eq(0).remove();
                }
                if ("<%=PageFormStatus.New.ToString()%>" != status){
                    loadTrlMember(<%=base.DefYear%>, $("#txtplnTrlAppCode").val());
                }
                else {
                    if (""  != $("#hdfTrlMember").val())
                        loadTrlMember("", "1");
                }

                if ("<%=PageFormStatus.New.ToString()%>" == status || "<%=PageFormStatus.Edit.ToString()%>" == status){
                    //<%--載入部門--%>
                    loadDepart();
                    loadRanKName();
                }
            }
            var tmp = "";
            //讀取人員
            function initInstance() {

                $("#btnAddRow").click(function () {
                    btnAddRow();
                    $("#btnAddRow").prop("disabled", true);
                });
                //<%--編輯--%>
                $("#gridTrlMember").on("click", "img[name='imgEditRow']", function () {
                    var rowidx = $(this).attr("rowidx");
                    $("#hrnEditRowIdx").val(rowidx);
                    //<%--建立暫存編輯區，並把自己隱藏--%>
                    $("#trEdit_" + rowidx).after('<tr id="trEdit_Edit_' + rowidx + '"><td></td><td id="tdEdit_Edit_' + rowidx + '" colspan="5"></td><td></td></tr>');
                    $("#tdEdit_Edit_" + rowidx).append($("#divEditTrlMember"));
                    $("#trEdit_" + rowidx).hide();

                    var m = getTrlMemberModel(rowidx);
                    setEdit2El(m.nowData);
                });
                //<%--刪除一列--%>
                $("#gridTrlMember").on("click", "img[name='imgDeleteRow']", function () {
                    var rowidx = parseInt($(this).attr("rowidx"), 10);
                    $("#gridTrlMember tbody tr[rowidx='" + rowidx + "']").remove();

                    for (var n = 0; n < _TrlMember.length; n++) {
                        if (_TrlMember[n].idx == rowidx) {
                            //<%--記錄刪除內容--%>
                            if (FLAG_EDIT == _TrlMember[n].flagold){
                                _TrlMember_Del.push(_TrlMember[n]);
                            }
                            _TrlMember.splice(n, 1);
                            return;
                        }
                    }
                });
                //<%--設定代表--%>
                $("#gridTrlMember").on("click", "input:radio[name='rdoctmDelegateFlag']", function () {
                    var rowidx = $(this).attr("rowidx");
                    for (var n = 0; n < _TrlMember.length; n++) {
                        if (_TrlMember[n].idx == rowidx)
                            _TrlMember[n].nowData.ctmDelegateFlag = "1";
                        else if ("1" == _TrlMember[n].nowData.ctmDelegateFlag) {
                            _TrlMember[n].nowData.ctmDelegateFlag = "0";
                        }
                    }
                });
                //<%--儲存，判斷人員是否符合--%>
                $("#btnEdit_Save").click(function () {
                    btnEdit_Save_Click();
                    $("#btnAddRow").prop("disabled", false);
                });
                //<%--取消編輯--%>
                $("#btnEdit_Cancel").click(function () {
                    var rowidx = $("#hrnEditRowIdx").val();
                    $("#trEdit_" + rowidx).show();
                    deleteEdit_EditRow(rowidx);
                    $("#btnAddRow").prop("disabled", false);
                });
                //<%--部門變動取得人員--%>
                $("#selcodDepartName").change(function () {
                    $("#txtsusrName").val("");
                    var s = $(this).find(":selected").val();
                    if ("" == s)
                        return;
                    $("#txtsusrName").val("");
                    loadUser(s);
                });
                //<%--選擇了人員--%>
                $("#selsysBaseUser").click(function () {
                    var obj = $(this).find(":selected");
                    var name = obj.text();
                    $("#txtsusrName").val(name);
                    $("#hdrusrUserID").val(name);

                    if ("" == $("#txtctmUserName").val() || "" == tmp){
                        tmp = name;
                        $("#txtctmUserName").val(name);
                        $("#txtctmUnitName").val($("#selcodDepartName option:selected").text());
                    }
                    $("#divsysBaseUser").hide();
                })  //<%--點到select列表時不能消失--%>
                .focus(function() {
                    $("#divsysBaseUser").show();
                });
                //<%--選擇了職稱--%>
                $("#selcodRankName").click(function () {
                    var obj = $(this).find(":selected");
                    $("#txtctmUserTitle").val(obj.val());
                    $("#divcodRankName").hide();
                })
                .focus(function() {
                    $("#divcodRankName").show();
                });
                //<%--點選人員，顯示List--%>
                $("#txtsusrName").focus(function () {
                    var offset = $("#txtsusrName").offset();
                    $("#divsysBaseUser").css({ top: offset.top + $("#txtsusrName").height() + 6, left: offset.left });
                    if (0 < $("#divsysBaseUser option").length)
                        $("#divsysBaseUser").show();
                })
                .blur(function() {
                    $("#divsysBaseUser").hide();
                    tmp = $("#txtctmUserName").val();
                    if ("" == $("#txtctmUserName").val()) {
                        $("#txtctmUserName").val($("#txtsusrName").val());
                        $("#txtctmUnitName").val($("#selcodDepartName option:selected").text());
                    }
                })
                .keyup(function (event) {
                    var s = $(this).val();
                    $("#selsysBaseUser")[0].selectedIndex = -1;
                    var obj = $("#selsysBaseUser option");
                    for (var n = 0; n < obj.length; n++) {
                        if (-1 < $(obj[n]).text().indexOf(s)) {
                            $("#selsysBaseUser")[0].selectedIndex = n;
                            return false;
                        }
                    }
                });
                //<%--點選職稱，顯示List--%>
                $("#txtctmUserTitle").focus(function () {
                    var offset = $(this).offset();
                    $("#divcodRankName").css({ top: offset.top + $(this).height() + 6, left: offset.left });
                    $("#divcodRankName").show();
                })
                .blur(function() { //<%--離開隱藏DIV--%>
                    $("#divcodRankName").hide();
                    if ("" == $(this).val()) {
                        $(this).val($("#selcodRankName option:selected").text());
                    }
                })
                .keyup(function () {
                    var s = $(this).val();
                    $("#selcodRankName")[0].selectedIndex = -1;
                    var obj = $("#selcodRankName option");
                    for (var n = 0; n < obj.length; n++) {
                        if (-1 < $(obj[n]).text().indexOf(s)) {
                            $("#selcodRankName")[0].selectedIndex = n;
                            return false;
                        }
                    }
                });

                //<%--日期防止輸入--%>
                $("#txtappTrlSDate, #txtappTrlEDate").keypress(function () { return false; });
            }
            //<%--載入出國人員--%>
            function loadTrlMember(defYear, plnTrlAppCode) {
                if("" == plnTrlAppCode)
                    return;

                var status = $("#hdfFormStatus").val();
                var s = $("#hdfTrlMember").val();
                if ("" == s) {
                    var params = JSON.stringify({ "codCodeVer": defYear, "plnTrlAppCode": plnTrlAppCode });
                    //ajaxPost("../WSPlanApproval/WService.asmx/LoadTrlMember", {
                    ajaxPost("Modify.aspx/LoadTrlMember", {
                        data: params,
                        success: function (data) {
                            fnGetMode = function (inM) {
                                var m = getEmptyMemberModel();
                                m.ctmNo = inM.ctmNo;
                                m.ctmDelegateFlag = inM.ctmDelegateFlag;
                                m.ctmPayUnitNo = inM.ctmPayUnitNo;
                                m.ctmPayUnitName = inM.ctmPayUnitName;
                                m.ctmPayUserNo = inM.ctmPayUserNo;
                                m.ctmPayUserName = inM.ctmPayUserName;

                                m.ctmUnitName = inM.ctmUnitName;
                                m.ctmUserName = inM.ctmUserName;
                                m.ctmUserTitle = (null == inM.ctmUserTitle ? "" : inM.ctmUserTitle);
                                return m;
                            };
                            
                            for (var n = 0; n < data.d.length; n++) {
                                var model = createTrlMemberModel((1 + n).toString());
                                model.flagold = FLAG_EDIT;
                                model.flagnow = "";
                                model.nowData = fnGetMode(data.d[n]);
                                model.oldData = fnGetMode(data.d[n]);
                                _TrlMember.push(model);
                                insertRow(status, model.nowData, model.idx);
                            }
                        }
                    });
                }
                else {
                    _TrlMember = JSON.parse(s);
                    for (var n = 0; n < _TrlMember.length; n++) {
                        insertRow(status, _TrlMember[n].nowData, _TrlMember[n].idx);
                    }
                }
            }
            //<%--載入部門--%>
            function loadDepart(defYear, plnTrlAppCode) {
                //ajaxPost("../WSPlanApproval/WService.asmx/LoadcodDepartName", {
                ajaxPost("Modify.aspx/LoadcodDepartName", {
                        success: function (data) {
                        for (var n = 0; n < data.d.length; n++) {
                            var s = '<option value="' + data.d[n].dptCode + '">' + data.d[n].dptName + "</option>";
                            $("#selcodDepartName").append(s);
                        }
                    }
                });
            }
            //<%--載入職稱--%>
            function loadRanKName(defYear, plnTrlAppCode) {
                ajaxPost("Modify.aspx/LoadRankName", {
                    success: function (data) {
                        for (var n = 0; n < data.d.length; n++) {
                            var s = '<option value="' + data.d[n].ranName + '">' + data.d[n].ranName + "</option>";
                            $("#selcodRankName").append(s);
                        }
                    }
                });
            }
            //<%--設定編輯時的欄位--%>
            function setEdit2El(model) {
                if (model.ctmPayUnitNo != $("#selcodDepartName").val()) {
                    $("#selcodDepartName").val(model.ctmPayUnitNo);
                    loadUser(model.ctmPayUnitNo);
                }
                $("#txtsusrName").val(model.ctmPayUserName);
                $("#txtctmUnitName").val(model.ctmUnitName);
                $("#txtctmUserName").val(model.ctmUserName);
                $("#txtctmUserTitle").val(model.ctmUserTitle);
            }
            //<%--依部門載入人員--%>
            function loadUser(depCode) {
                //ajaxPost("../WSPlanApproval/WService.asmx/LoadDepUser", {
                ajaxPost("Modify.aspx/LoadDepUser", {
                    data: '{ depCode: "' + depCode + '" }',
                    success: function (data) {
                        $("#selsysBaseUser option").remove();
                        for (var n = 0; n < data.d.length; n++) {
                            var s = '<option value="' + data.d[n].PK_usrNo + '">' + data.d[n].usrName + "</option>";
                            $("#selsysBaseUser").append(s);
                        }
                    }
                });
            }
            //<%--儲存時的驗證--%>
            function btnEdit_Save_validate() {
                if ("" == $("#selcodDepartName").val()) {
                    alert("代核銷人員單位未選擇!");
                    return false;
                }
                if ("" == $("#txtsusrName").val()){
                    alert("代核銷人員未填寫");
                    return false;
                }
                var userId = getusrUserID($("#txtsusrName").val());
                if ("" == userId) {
                    alert("代核銷人員未在單位內，請重新選擇!");
                    return false;
                }

                if ("" == $("#txtctmUnitName").val()){
                    alert("出國人員單位未填寫!");
                    return false;
                }
                if ("" == $("#txtctmUserName").val()){
                    alert("出國人員未填寫!!");
                    return false;
                }
                if ("" == $("#txtctmUserTitle").val()){
                    alert("職稱未填寫!");
                    return false;
                }
                return true;
            }

            function btnEdit_Save_Click() {
                if (!btnEdit_Save_validate())
                    return;
                var rowidx = $("#hrnEditRowIdx").val();

                var oldModel = getTrlMemberModel(rowidx);
                var m = getEmptyMemberModel();
                //<%--部門--%>
                m.ctmPayUnitNo = $("#selcodDepartName").val();
                m.ctmPayUnitName = $("#selcodDepartName option:selected").text();
                //<%--核定人員,姓名--%>
                m.ctmPayUserName = $("#txtsusrName").val();
                //<%--核定人員,員工編號--%>
                m.ctmPayUserNo = getusrUserID($("#txtsusrName").val());
                //<%--出國人員部門--%>
                m.ctmUnitName = $("#txtctmUnitName").val();
                //<%--職稱--%>
                m.ctmUserTitle = $("#txtctmUserTitle").val();
                //<%--出國人員姓名--%>
                m.ctmUserName = $("#txtctmUserName").val();

                if (null == oldModel) {//<%--新增及新增後修改--%>
                    var model = createTrlMemberModel(rowidx);
                    model.nowData = m;

                    //_TrlMember.push(model);
                    _TrlMember.unshift(model);
                    var status = $("#hdfFormStatus").val();
                    insertRow(status, m, rowidx);
                }
                else {
                    oldModel.nowData = m;
                    $("#spnUnitName_" + rowidx).text(m.ctmPayUnitName);
                    $("#spnUserName_" + rowidx).text(m.ctmPayUserName);

                    $("#spnctmUnitName_" + rowidx).text(m.ctmUnitName);
                    $("#spnctmUserTitle_" + rowidx).text(m.ctmUserTitle);
                    $("#spnctmUserName_" + rowidx).text(m.ctmUserName);

                    $("#trEdit_" + rowidx).show();
                }
                deleteEdit_EditRow(rowidx);
            }
            function btnAddRow() {
                $("#txtsusrName").val("");
                $("#txtctmUnitName").val("");
                $("#txtctmUserTitle").val("");
                $("#txtctmUserName").val("");
                //<%--新增一筆資料 1.產生編號並記錄到hrnEditRowIdx 2.加入divEditTrlMember--%>
                var rowidx = 1;
                if (0 < _TrlMember.length){
                    var max = 0;
                    for (var n = 0; n < _TrlMember.length; n++) {
                        var idx = parseInt(_TrlMember[n].idx, 10);
                        if (0 == n)
                            max = idx;
                        else if (idx > max)
                            max = idx;
                    }
                    rowidx += max;
                }

                $("#hrnEditRowIdx").val(rowidx);
                //<%--建立暫存的編輯區--%>
                $("#gridTrlMember tbody").prepend('<tr id="trEdit_Edit_' + rowidx + '"><td></td><td id="tdEdit_Edit_' + rowidx + '" colspan="5"></td><td></td></tr>');
                $("#tdEdit_Edit_" + rowidx).append($("#divEditTrlMember"));
            }

            function insertRow(status, model, rowidx) {

                var s = "";
                if ("<%=PageFormStatus.View.ToString()%>" != status && "<%=PageFormStatus.Delete.ToString()%>" != status){
                    s =  '<td style="text-align:center; padding:3px;" >'
                        + '<img name="imgEditRow" src="<%: ResolveUrl("~/Images/UserOperation/Edit_32xMD.png") %>" title="編輯" alt="" rowidx="' + rowidx + '" />'
                        + '&nbsp;'
                        + '<img name="imgDeleteRow" src="<%: ResolveUrl("~/Images/UserOperation/Cancel_32x.png") %>" title="刪除" alt="" rowidx="' + rowidx + '" />'
                    + '</td>';
                }

                $("#gridTrlMember tbody").prepend(
                   '<tr id="trEdit_' + rowidx + '" rowidx="' + rowidx + '">'
                    + s
                    + '<td><span id="spnUnitName_' + rowidx + '">' + model.ctmPayUnitName + '</span></td>'
                    + '<td><span id="spnUserName_' + rowidx + '">' + model.ctmPayUserName + '</span></td>'

                    + '<td><span id="spnctmUnitName_' + rowidx + '">' + model.ctmUnitName + '</span></td>'
                    + '<td><span id="spnctmUserTitle_' + rowidx + '">' + model.ctmUserTitle + '</span></td>'
                    + '<td><span id="spnctmUserName_' + rowidx + '">' + model.ctmUserName + '</span></td>'

                    + '<td style="text-align:center;" >' 
                        + '<input type="radio" name="rdoctmDelegateFlag"' + ("" == s ? ' disabled="disabled" ' : '')
                        + ' rowidx="' + rowidx + '"' + ("1" == model.ctmDelegateFlag ? 'checked="checked"' : '') + '/>' 
                    + '</td>'
                    + '</tr>'
               );
            }
            function deleteEdit_EditRow(idx) {
                $("#divMemberPanel").append($("#divEditTrlMember"));
                $("#trEdit_Edit_" + idx).remove();
            }
            //<%--取得人員ID--%>
            function getusrUserID(name) {
                var obj = $("#selsysBaseUser option");
                var userId = "";
                for (var n = 0; n < obj.length; n++) {
                    if ($(obj[n]).text() == name) {
                        userId = $(obj[n]).val();
                        break;
                    }
                }
                return userId;
            }
            // 頁面初始化
            function fnPageInit() {
                // 使用套件
                $.MyKendoDatePicker();

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
            //<%--全傳回去，刪除的資料就是全部的資料--%>
            function getGrid2JsonString() {
                var insertData = [];
                for (var n = 0; n < _TrlMember.length; n++) {
                    insertData.push(_TrlMember[n].nowData);
                }
                var deleteData = [];
                /*
                for (var n = 0; n < _TrlMember.length; n++){
                    if (FLAG_EDIT == _TrlMember[n].flagold)
                        deleteData.push(_TrlMember[n].oldData);
                }
                for (var n = 0; n < _TrlMember_Del.length; n++)
                    deleteData.push(_TrlMember_Del[n].oldData);
                */
                return {
                    "insertData": JSON.stringify(insertData),
                    "deleteData": JSON.stringify(deleteData)
                };
            }
        </script>
    </form>

    <script type="text/javascript">
        function ajaxPost(url, params) {
            var def = {
                type: 'POST',
                url: url,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) { },
                error: function (e) {
                    alert("連線錯誤!");
                }
            };
            if ("undefined" != params && null != params)
                def = $.extend(def, params);
            $.ajax(def);
        }
    </script>
</body>
</html>
