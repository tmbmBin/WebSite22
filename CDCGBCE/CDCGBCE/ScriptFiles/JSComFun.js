function EnableCtrl(parObj, parVal) {
    parObj.disabled = parVal;
}

function ShowCtrl(parObj, parVal) {
    parObj.Visible = parVal;
}

function CtrlTmpPayObj(parCB) {
    //alert(document.all("CBAutoTempPay").checked);
    if (document.all("CBAutoTempPay").checked == true) {
        document.all("TBAcpPayHour").visibled = true;
        document.all("TBAcpReturnDate").visibled = true;
    } else {
        document.all("TBAcpPayHour").value = "";
        document.all("TBAcpReturnDate").value = "";
        document.all("TBAcpPayHour").visibled = true;
        document.all("TBAcpReturnDate").visibled = true;
    }


}



function chkTmpPayAndCash() {
    var objTmpPay;
    var objCash;
    var objEPay;
    var objAutoBid;

	    
    objTmpPay = document.all("CBAutoTempPay");
    objCash = document.all("CBAllowanceFlag");
    objEPay = document.all("CBEPayment");
    objAutoBid = document.all("CBAutoBid");
 
         
    //零用金、逕行暫付，不得同時勾選
    if (objTmpPay.checked == true && objCash.checked == true) {
        objTmpPay.checked = false;
        alert("勾選零用金，則不允許逕行暫付。如需跟零用金借錢，則請自行向零用金借錢。");
    }

    //零用金、電子支付，不得同時勾選
    if (objCash.checked == true && objEPay.checked == true) {
        objCash.checked = false;
        objEPay.checked = false;
        alert("勾選零用金，則不允許電子支付。");
    }


    //電子支付、逕行暫付，不得同時勾選
    if (objTmpPay.checked == true && objEPay.checked == true) {
        objTmpPay.checked = false;
        objEPay.checked = false;
        alert("電子支付、逕行暫付，不得同時勾選。");
    }


    //零用金、自動決標，不得同時勾選
    try {        
        if (objAutoBid.checked == true && objCash.checked == true) {
            objAutoBid.checked = false;
            alert("勾選零用金，則不允許自動決標。因為零用金的執行率是由會計撥還後，才計入執行率。");
        }
    }
    catch (e)  {;}




    if (objTmpPay.checked == true) {
        try
        {
        document.all("TRTmpPayData").style.display = "block";
        document.all("TRTmpPayData1").style.display = "block";
    }
    catch (e) { ; }
}
        else 
    {
        try
        {
        document.all("TRTmpPayData").style.display = "none";
        document.all("TRTmpPayData1").style.display = "none";
        }
    catch (e) { ; }
    }
    

}