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
