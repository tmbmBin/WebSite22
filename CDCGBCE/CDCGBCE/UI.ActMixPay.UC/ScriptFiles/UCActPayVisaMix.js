

function GetTotalPayMoney(parObj) {
    var dblTotal = 0;
    var objPayMoney;
    // dblTotal = 0;
    var bolTarge = false;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        if (e.getAttribute("MyName") == "TBdlAcvMoney" ) {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));

            }
        }

        if (e.getAttribute("MyName") == "TBPayMoney" && bolTarge == false) {

            bolTarge = true;
            objPayMoney = e;

        }
    } // next i


    objPayMoney.value = dblTotal;

}


function CheckUpLevlMoney(parObj) {
    var dblTotal = 0;
    var objDG;
    var bolFlag;
    bolFlag = 0;
    var bolFlag1 = 0;
    var objBtnSplit;
    var objBtnClose;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];
        			if (bolFlag == 0) {
        				objDG = document.forms[0].elements[i];

        				if (e.getAttribute("MyName") == "TBdgAcvMoney" && e.MyIndex == parObj.MyParentIndex) {
        					bolFlag = 1;
        				}
        			}

        			if (e.getAttribute("MyName") == "BtnSplit" && bolFlag1 == 0 && e.MyIndex == parObj.MyParentIndex) {
        				objBtnSplit = e;
        			}


        if (e.type == "checkbox" && e.parentNode.MyName == "BtnClose" && e.parentNode.MyIndex == parObj.MyParentIndex) {
            objBtnClose = e;
                }


        if (e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parObj.MyParentIndex) {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));
            }
        }

                if (e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parObj.MyParentIndex) {
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
    		        objBtnClose.checked = true;
    			}
    			else {
    				objBtnSplit.disabled = false;
//   objBtnClose.checked = true;
    			}
     
    		}


}

//function GetAutoAdjMoney3(parObj, parIndex) {
//    var dblTotal = 0;

//    //紀錄簽證金額剩於數
//    var objDG;
//    var bolFlag;
//    bolFlag = 0;


//    //紀錄調整數，找到調整數物件，並記錄起來
//    var objAdj
//    var bolAdjFlag
//    bolAdjFlag = 0;

//    for (var i = 0; i < document.forms[0].elements.length; i++) {
//        var e = document.forms[0].elements[i];

//        //找簽證數
//        if (bolFlag == 0) {
//            //objDG =document.forms[0].elements[i];

//            if (e.MyName == "TBdgAcvMoney" && e.MyIndex == parIndex) {
//                objDG = e;
//                bolFlag = 1;
//            }
//        }

//        //找調整數
//        if (bolAdjFlag == 0) {
//            //objAdj =document.forms[0].elements[i];

//            if (e.MyName == "TBdgAdjustMoney" && e.MyIndex == parIndex) {
//                objAdj = e;
//                bolAdjFlag = 1;
//            }
//        }

//        //找出明細總和
//        if (e.MyName == "TBdlAcvMoney" && e.MyParentIndex == parIndex) {
//            if (e.value != "") {
//                dblTotal += parseFloat(replaceString(e.value, ",", ""));
//            }
//        }
//    } // next i


//    //2011.06.01：sender非checkbox也可以計算結案金額
//    if (parObj.type == "checkbox") {
//        if (parObj.checked == true) {

//            objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
//            parObj.checked = true;
//        }
//        else {
//            objAdj.value = 0;
//            //parObj.checked=true;
//        }
//    } else {
//        objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
//    }
//}


function GetAutoAdjMoney(parObj, parIndex) {
    var dblTotal
    dblTotal = 0;

    //紀錄簽證金額剩於數
    var objDG
    var bolFlag
    bolFlag = 0;


    //紀錄調整數，找到調整數物件，並記錄起來
    var objAdj
    var bolAdjFlag
    bolAdjFlag = 0;

    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        //找簽證數
        if (bolFlag == 0) {
            //objDG =document.forms[0].elements[i];

            if (e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parIndex) {
                objDG = e;
                bolFlag = 1;
            }
        }

        //找調整數
        if (bolAdjFlag == 0) {
            //objAdj =document.forms[0].elements[i];

            if (e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parIndex) {
                objAdj = e;
                bolAdjFlag = 1;
            }
        }

        //找出明細總和
        if (e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parIndex) {
            if (e.value != "") {
                dblTotal += parseFloat(replaceString(e.value, ",", ""));
            }
        }
    } // next i

    if (parObj.checked == true) {

        objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
        parObj.checked = true;
    }
    else {
        objAdj.value = 0;
        //parObj.checked=true;
    }
}

