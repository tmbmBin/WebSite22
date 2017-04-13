function fnOpenActPayeeDtlForGrid(parAceYear, parAceNo, parAcdNo) {

    var strParams = "";
    strParams = "&workstatus=edit&aceYear=" + parAceYear.toString() + "&aceNo=" + parAceNo.toString() + "&acdNo=" + parAcdNo.toString() + "&SessionID=" + document.all("TBSessionID").value.toString() + "&tablename=" + document.all("ctl_TableName").value.toString();
    response.write("參數：" + strParams)
    debugger;
    var strReturnVal = showModalDialog("FrmActPayeeDtlEdit.aspx?" + strParams, window, "dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

    }
}


//=============================================================

function fnOpenActPayeeDtl(parParams) {

    var strReturnVal = showModalDialog("FrmActPayeeDtlEdit.aspx?" + parParams, window, "dialogWidth:950px;dialogHeight:650px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

    }

}

function fnOpenATDImport(parParams) {

    var strReturnVal = showModalDialog("../UI.OTDataImport.Web/FrmATDImport.aspx?" + parParams, window, "dialogWidth:950px;dialogHeight:650px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

    }

}

function fnOpenExcelImport(parParams) {

    var strReturnVal = showModalDialog("FrmExcelImport.aspx?" + parParams, window, "dialogWidth:950px;dialogHeight:650px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

    }

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
    window.open("../UI.ActPayeeRpt.Web/FrmPrintMenu.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

}

function check_Num() {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
        return true;
    }
    else { event.keyCode = 0; false; }
}


