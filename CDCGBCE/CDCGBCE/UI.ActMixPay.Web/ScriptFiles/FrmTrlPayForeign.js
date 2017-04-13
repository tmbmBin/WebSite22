
function fnCallPhraseDialog(thisName) {
    var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        document.all(thisName).value = document.all(thisName).value + strReturnVal;
        //Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}

function fnCallPhraseDialog(thisName, parID ) {
    var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        document.all(thisName).value = document.all(thisName).value + strReturnVal;
        //Form1.TBMemo.value=Form1.TBMemo.value+strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}

function fnCallSearchDialog() {
    var strReturnVal = showModalDialog("FrmSearchPay.aspx?showtype=1&mod=" + "<%=strModFlag %>", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    if (strReturnVal != "Cancel") {
        //				Form1.TBFindSql.value=strReturnVal;
        document.all("TBFindSql").value = strReturnVal;
    }
    //Form1.TBFindSql.value=strReturnVal;
}

function DisableAfterSubmit() {
    var obj = event.srcElement;
    var objs = document.getElementsByTagName('INPUT');
    for (var i = 0; i < objs.length; i++) {
        if (objs[i].type.toLowerCase() == 'submit') {
            objs[i].disabled = true;
        }
    }
}


function fnCallReportMenu(parParams) {

    var strParams;
    strParams = parParams;
    window.open("../UI.CDCTrlRpt.Web/FrmPrintMenu.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

}

//20150313 [add]:增加 傳入參數
function fnOpenTrlDataChoose(params) {
    var strParams = "";
    //    strParams = "mailYear=" + parMailYear + "&mailNo=" + parMailNo;

    strParams = strParams + params;

    var strReturnVal = showModalDialog("../UI.CDCAtd.Web/FrmSearchTrlData.aspx?" + strParams, window, "dialogWidth:800px;dialogHeight:500px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {
        document.all("TBAbsenceNo").value = strReturnVal;
    }
}


function check_Num() {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
        return true;
    }
    else { event.keyCode = 0; false; }
}