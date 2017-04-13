
  function  fnCallEditDtlPage(parParams){
//	var strParams="";
//	 strParams = "&acmyear=" + <%=Session("default_Year") %> + "&TranBatchDate=" + document.all("TBTranBatchDate").value + "&TranBatchNum=" + document.all("TBTranBatchNum").value ;
//	 window.open("FrmChooseActData.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

      var strReturnVal = showModalDialog("FrmChooseTrlData.aspx?visastage=P" + parParams, window, "dialogWidth:1020px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

                if (strReturnVal != "Cancel")
                {
                    form1.TBSessionID.value=strReturnVal;
                }

}





function fnCallReportMenu(parParams) {

var strParams;
strParams = parParams;
window.open("../UI.TrlBatchRpt.Web/FrmPrintMenu.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');

}


function OpenActData(parObj) {
    var arrID = parObj.split("-");
    var strParams;
    strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=" + arrID[0] + "&acmno1=" + arrID[1] + "&acppayno=" + arrID[2] + "&mod=" + arrID[3];
    var strReturnVal = showModalDialog(strParams, window, "dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

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
