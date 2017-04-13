function OpenSendMailPage(parMailYear, parMailNo) {
    var strParams = "";
    strParams = "mailYear=" + parMailYear + "&mailNo=" + parMailNo;

    var strReturnVal = showModalDialog("FrmSendMail.aspx?" + strParams, window, "dialogWidth:400px;dialogHeight:300px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

    }
}


function OpenReSendMailPage(parMailSentNo) {
    var strParams = "";
    strParams = "mailSentNo=" + parMailSentNo;

    var strReturnVal = showModalDialog("FrmReSendMail.aspx?" + strParams, window, "dialogWidth:400px;dialogHeight:300px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

    }
}