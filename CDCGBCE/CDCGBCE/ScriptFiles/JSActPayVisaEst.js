function CheckUpLevlMoney(parObj) {

   // ctl04_DataGrid2_ctl03_DataList1_ctl00_TBdlAcvMoney
    var dblTotal
    dblTotal = 0;
    var objDG
    var bolFlag
    bolFlag = 0;
    var bolFlag1 = 0;
    var objBtnSplit;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];
        if (bolFlag == 0) {
            objDG = document.forms[0].elements[i];

            if (e.MyName == "TBdgAcvMoney" && e.MyIndex == parObj.MyParentIndex) {
                bolFlag = 1;
            }
        }

        if (e.MyName == "BtnSplit" && bolFlag1 == 0 && e.MyIndex == parObj.MyParentIndex) {
            objBtnSplit = e;
        }

        if (e.MyName == "TBdlAcvMoney" && e.MyParentIndex == parObj.MyParentIndex) {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));
            }
        }
    } // next i

    if (parseFloat(replaceString(objDG.value, ",", "")) - dblTotal < 0) {
        var tmpNo
        tmpNo = parseFloat(parObj.MyParentIndex) + 1;
        alert("動支序號為 " + tmpNo + " 報支金額總數大於原動支金額。請重新修改。");
        objBtnSplit.disabled = true;
        parObj.onfocus;
    }
    else {
        if (parseFloat(replaceString(objDG.value, ",", "")) - dblTotal == 0) {
            objBtnSplit.disabled = true;
        }
        else {
            objBtnSplit.disabled = false;
        }

        //objBtnSplit.disabled=false;
    }
    //document.all("TBacmMoney1").value=dblTotal;

}

function GetTotalPayMoney() {
    var dblTotal = 0;
    var objPayMoney;
    
    var bolTarge = false;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        if (e.MyName == "TBdlAcvMoney") {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));

            }
        }

        if (e.MyName == "TBacpMoney" && bolTarge == false) {

            bolTarge = true;
            objPayMoney = e;

        }
    } // next i


    objPayMoney.value = dblTotal;
}


function GetTotalAcvMoney(parObj, replaceName) {

    var tmpVal = 0;
    var objTarget;
    var objTargetName = "TBAcpMoney";
    //var strKid = "<%=strCtrlAcmKidNum %>";

    //    alert(strBName);
    //    alert(strEName);
    // var strBName = parObj.id.split(replaceName)[0];
    // var strEName = parObj.id.split(replaceName)[1];
    //    alert(strBName);
    //    alert(strEName);

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];
        //if ( e.MyName == "TBPayMoney")
        if (e.MyName == objTargetName) {
            objTarget = e;
        }
        if (e.MyName == "TBdgAcvMoney") {

            
            var objName;
            var intRecNo;

            var strBName = parObj.id.split(replaceName)[0];
            var strEName = parObj.id.split(replaceName)[1];
  
            objName = strBName + "CBdgDel"
            if (document.all(objName).checked == false) {

                tmpVal += parseFloat(replaceString(e.value, ",", ""));
            }


        }
       
    }

        document.all("TBAcpMoney").value = tmpVal;

}
 