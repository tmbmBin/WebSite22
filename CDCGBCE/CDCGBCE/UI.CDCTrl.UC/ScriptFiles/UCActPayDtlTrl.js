
function fnGetWorkingDays(parID, parCtrlName) {
    var sDateCtrlName = replaceString(parID, parCtrlName, "ctl_AcdTrlDate");
    var eDateCtrlName = replaceString(parID, parCtrlName, "ctl_AcdTrlEDate");
    var totalDaysCtrlName = replaceString(parID, parCtrlName, "ctl_AcdTrlTotalDays");

    //var strTmpSDate = CDateToWDate(document.getElementById(sDateCtrlName).value);
    //var strTmpEDate = CDateToWDate(document.getElementById(eDateCtrlName).value);
    // var intDays = DateDifference(strTmpSDate, strTmpEDate);
    var intDays = GetWorkingDays(document.getElementById(sDateCtrlName).value, document.getElementById(eDateCtrlName).value);
    if (isNaN(intDays) == true) { intDays = 0; }
    document.getElementById(totalDaysCtrlName).value = intDays;
}

function fnCallStayDialog(parID) {


    var strReturnVal = showModalDialog("../UI.CDCTrl.Web/FrmDailyFee.aspx?", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {


        var sDateCtrlName = replaceString(parID, "btn_btn_Stay", "ctl_AcdTrlDate");
        var eDateCtrlName = replaceString(parID, "btn_btn_Stay", "ctl_AcdTrlEDate");

        //var strTmpSDate = CDateToWDate(document.getElementById(sDateCtrlName).value);
        //var strTmpEDate = CDateToWDate(document.getElementById(eDateCtrlName).value);
        // var intDays = DateDifference(strTmpSDate, strTmpEDate);
        var intDays = GetWorkingDays(document.getElementById(sDateCtrlName).value, document.getElementById(eDateCtrlName).value);

        try {
            if (isNumeric(intDays) == false || isNaN(intDays) == true) { intDays = parseInt(1); }

        }
        catch (err) { intDays = parseInt(1); }
        //   alert(intDays);


        var strStayID = replaceString(parID, "btn_Stay", "ctl_AcdTrlStay");
        var strMisecID = replaceString(parID, "btn_Stay", "ctl_AcdTrlFMisce");

        var arrVal = strReturnVal.split("|");

        //            alert(fmtMoney(parseInt(arrVal[0]) * parseInt(intDays), 0, ".", ","));

        document.getElementById(strStayID).value = fmtMoney(parseInt(arrVal[0]) * parseInt(intDays));
        //document.getElementById(strMisecID).value = fmtMoney(parseInt(arrVal[1]) * parseInt(intDays));

    }


    GetTotalTrlRowMoney(parID, "btn_Stay");


}


function fnCallDailyFeeDialog(parID) {


    var strReturnVal = showModalDialog("../UI.CDCTrl.Web/FrmDailyFee.aspx?", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {


        var sDateCtrlName = replaceString(parID, "btn_FMisce", "ctl_AcdTrlDate");
        var eDateCtrlName = replaceString(parID, "btn_FMisce", "ctl_AcdTrlEDate");

        //var strTmpSDate = CDateToWDate(document.getElementById(sDateCtrlName).value);
        //var strTmpEDate = CDateToWDate(document.getElementById(eDateCtrlName).value);
        // var intDays = DateDifference(strTmpSDate, strTmpEDate);
        var intDays = GetWorkingDays(document.getElementById(sDateCtrlName).value, document.getElementById(eDateCtrlName).value);

        try {
            if (isNumeric(intDays) == false || isNaN(intDays) == true) { intDays = parseInt(1); }

        }
        catch (err) { intDays = parseInt(1); }
        //   alert(intDays);


        var strStayID = replaceString(parID, "btn_FMisce", "ctl_AcdTrlStay");
        var strMisecID = replaceString(parID, "btn_FMisce", "ctl_AcdTrlFMisce");

        var arrVal = strReturnVal.split("|");

        //            alert(fmtMoney(parseInt(arrVal[0]) * parseInt(intDays), 0, ".", ","));

        //            document.getElementById(strStayID).value = fmtMoney(parseInt(arrVal[0]) * parseInt(intDays));
        document.getElementById(strMisecID).value = fmtMoney(parseInt(arrVal[1]) * parseInt(intDays));

    }


    GetTotalTrlRowMoney(parID, "btn_FMisce");


}

function GetTotalTrlRowMoney(parClientID, parCtrlID) {


    var strCtrlName;


    //飛機
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTAir");
    var dblAir = document.getElementById(strCtrlName).value;
    if (dblAir == "") { dblAir = 0; }

    //高鐵
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlThsrc");
    var dblHsrc = document.getElementById(strCtrlName).value;
    if (dblHsrc == "") { dblHsrc = 0; }

    //汽車
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTCar");
    var dblCar = document.getElementById(strCtrlName).value;
    if (dblCar == "") { dblCar = 0; }

    //捷運
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlMetro");
    var dblMetro = document.getElementById(strCtrlName).value;
    if (dblMetro == "") { dblMetro = 0; }

    //火車
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTRail");
    var dblRail = document.getElementById(strCtrlName).value;
    if (dblRail == "") { dblRail = 0; }
    //輪船
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTBoats");
    var dblBoat = document.getElementById(strCtrlName).value;
    if (dblBoat == "") { dblBoat = 0; }

    //住宿費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlStay");
    var dblStay = document.getElementById(strCtrlName).value;
    if (dblStay == "") { dblStay = 0; }

    //膳雜費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFMisce");
    var dblMisce = document.getElementById(strCtrlName).value;
    if (dblMisce == "") { dblMisce = 0; }


    var dblTotal = parseInt(replaceString(dblAir, ",", ""))
                        + parseInt(replaceString(dblHsrc, ",", ""))
                        + parseInt(replaceString(dblCar, ",", ""))
                        + parseInt(replaceString(dblMetro, ",", ""))
                        + parseInt(replaceString(dblRail, ",", ""))
                        + parseInt(replaceString(dblBoat, ",", ""))
                        + parseInt(replaceString(dblStay, ",", ""))
                        + parseInt(replaceString(dblMisce, ",", ""));

    if (isNaN(dblTotal) == true) { dblTotal = 0; }

    //小計
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdMoney");


    document.getElementById(strCtrlName).value = fmtMoney(dblTotal);

    GetTotalTrlColMoney(parClientID);

}


//function GetTotalTrlColMoney(parClientID, parCtrlID) {


//    var strCtrlName;


//    var dblTotal = parseInt(replaceString(dblAir, ",", ""))
//                        + parseInt(replaceString(dblHsrc, ",", ""))
//                        + parseInt(replaceString(dblCar, ",", ""))
//                        + parseInt(replaceString(dblMetro, ",", ""))
//                        + parseInt(replaceString(dblRail, ",", ""))
//                        + parseInt(replaceString(dblBoat, ",", ""))
//                        + parseInt(replaceString(dblStay, ",", ""))
//                        + parseInt(replaceString(dblMisce, ",", ""));

//    if (isNaN(dblTotal) == true) { dblTotal = 0; }

//    //小計
//    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdMoney");


//    document.getElementById(strCtrlName).value = fmtMoney(dblTotal);



//}



function GetTotalTrlColMoneyV1(parClientID) {

    //alert('111');
    var dblTotal;

    var dblAir = 0;//飛機
    var dblHsrc = 0;//高鐵
    var dblCar = 0;//汽車
    var dblMetro = 0;
    var dblRail = 0;
    var dblBoat = 0;
    var dblStay = 0;
    var dblMisce = 0;
    var dblAllowance = 0;
    var dblAgency = 0;
    var dblInsurance = 0;
    var dblAssign = 0;
    var dblEntertain = 0;
    var dblOther = 0;


    var strCtrlName = "";
    var strTmpName = "";
    var strParentName = "";
    var arrCtrlName = parClientID.split("_");
    //    alert(arrCtrlName);

    for (i = 0; i <= arrCtrlName.length - 4; i = i + 1) {
        //        alert(arrCtrlName[i]);
        strParentName += arrCtrlName[i] + "_";
    }

   
  var dblTmpVal;



  

    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);

        //飛機
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTAir";
        try {
            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblAir += dblTmpVal;
        }
        catch (e) { break; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //高鐵
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlThsrc";
        try {
            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblHsrc += dblTmpVal;
        }
        catch (e) { break; }
        if (dblHsrc == "") { dblHsrc = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //汽車

        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTCar";
        try {

            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblCar += dblTmpVal;
        }
        catch (e) { break; }
        if (dblCar == "") { dblCar = 0; }
    }
 

    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //捷運
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlMetro");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlMetro";
   
        try {
             
            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblMetro += dblTmpVal;
     }
        catch (e) { break; }
        if (dblMetro == "") { dblMetro = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //火車
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTRail");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTRail";

        try {
            
            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblRail += dblTmpVal;
    }
        catch (e) { break; }
   if (dblRail == "") { dblRail = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //輪船
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTBoats");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTBoats";
    
        try {
            
            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblBoat += dblTmpVal;
    }
        catch (e) { break; }
     if (dblBoat == "") { dblBoat = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //住宿費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlStay");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlStay";
      
        try
    { dblStay += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblStay) == true) { dblStay = 0; }
       if (dblStay == "") { dblStay = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //膳雜費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFMisce");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFMisce";
  
        try
    { dblMisce += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblMisce) == true) { dblMisce = 0; }
    if (dblMisce == "") { dblMisce = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //生活費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlAllowanceCrnMoney");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlAllowanceCrnMoney";
   
        try {

            dblAllowance += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""));
            //        dblAllowance = parseFloat(dblAllowance) * parseFloat(dblAllowanceRate);
        }
        catch (e) { break; }
        if (isNaN(dblAllowance) == true) { dblAllowance = 0; }
            if (dblAllowance == "") { dblAllowance = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //手續費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAgency");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFAgency";

        try
    { dblAgency += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblAgency) == true) { dblAgency = 0; }
            if (dblAgency == "") { dblAgency = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //保險費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFInsurance");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFInsurance";
  
        try
    { dblInsurance += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblInsurance) == true) { dblInsurance = 0; }
        if (dblInsurance == "") { dblInsurance = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //行政費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAssign");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFAssign";
      
        try
    { dblAssign += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblAssign) == true) { dblAssign = 0; }
            if (dblAssign == "") { dblAssign = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //禮品交際費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFEntertain");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFEntertain";
      
        try
    { dblEntertain += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblEntertain) == true) { dblEntertain = 0; }
            if (dblEntertain == "") { dblEntertain = 0; }
    }


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //雜費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFOther");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFOther";
   
        try
    { dblOther += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
    catch (e) { break; }
    if (isNaN(dblOther) == true) { dblOther = 0; }
            if (dblOther == "") { dblOther = 0; }      

    }




    //if (dblAllowance == "") { dblAllowance = 0; }
    //if (dblAllowanceRate == "" || dblAllowanceRate == "0") { dblAllowanceRate = 1; }
    //var dblAllowanceRate;
    //dblAllowanceRate = replaceString(document.getElementById("ctl12_ctl_TrlTotalMoney").value, ",", "");
    //        dblAllowance = parseFloat(dblAllowance) * parseFloat(dblAllowanceRate);




//        alert("dblAir"          +"="+ dblAir            );
//        alert("dblHsrc"         +"="+ dblHsrc           );
//        alert("dblCar"          +"="+ dblCar            );
//        alert("dblMetro"        +"="+ dblMetro          );
//        alert("dblRail"         +"="+ dblRail           );
//        alert("dblBoat"         +"="+ dblBoat           );
//        alert("dblStay "        +"="+ dblStay           );
//        alert("dblMisce"        +"="+ dblMisce          );
//        alert("dblAllowance "   +"="+ dblAllowance      );
//        alert("dblAgency "      +"="+ dblAgency         );
//        alert("dblInsurance "   +"="+ dblInsurance      );
//        alert("dblAssign "      +"="+ dblAssign         );
//        alert("dblEntertain"    +"="+ dblEntertain      );
//        alert("dblOther" + "=" + dblOther);


    var dblTotal = parseInt(replaceString(dblAir, ",", ""))
                        + parseInt(replaceString(dblHsrc, ",", ""))
                        + parseInt(replaceString(dblCar, ",", ""))
                        + parseInt(replaceString(dblMetro, ",", ""))
                        + parseInt(replaceString(dblRail, ",", ""))
                        + parseInt(replaceString(dblBoat, ",", ""))
                        + parseInt(replaceString(dblStay, ",", ""))
                        + parseInt(replaceString(dblMisce, ",", ""))
                        + parseInt(replaceString(dblAllowance, ",", ""))
                        + parseInt(replaceString(dblAgency, ",", ""))
                        + parseInt(replaceString(dblInsurance, ",", ""))
                        + parseInt(replaceString(dblAssign, ",", ""))
                        + parseInt(replaceString(dblEntertain, ",", ""))
                        + parseInt(replaceString(dblOther, ",", ""))
                        ;
    if (isNaN(dblTotal) == true) { dblTotal = 0; }


    document.getElementById("ctl12_ctl_TrlTotalMoney").value = fmtMoney(dblTotal);




}



function GetTotalTrlColMoney(parClientID) {

    //alert('111');
    //    var dblTotal;

    var dblAir = 0; //飛機
    var dblHsrc = 0; //高鐵
    var dblCar = 0; //汽車
    var dblMetro = 0;
    var dblRail = 0;
    var dblBoat = 0;
    var dblStay = 0;
    var dblMisce = 0;
    var dblAllowance = 0;
    var dblAgency = 0;
    var dblInsurance = 0;
    var dblAssign = 0;
    var dblEntertain = 0;
    var dblOther = 0;


    var strParentName = "";
    var arrCtrlName = parClientID.split("_");


    for (i = 0; i <= arrCtrlName.length - 4; i = i + 1) {

        strParentName += arrCtrlName[i] + "_";
    }


    //飛機
    dblAir = GetColMoneyTotal(strParentName, "_ctl_AcdTrlTAir");

    //高鐵
    dblHsrc = GetColMoneyTotal(strParentName, "_ctl_AcdTrlThsrc");

    //汽車
    dblCar = GetColMoneyTotal(strParentName, "_ctl_AcdTrlTCar");

    //捷運
    dblMetro = GetColMoneyTotal(strParentName, "_ctl_AcdTrlMetro");

    //火車
    dblRail = GetColMoneyTotal(strParentName, "_ctl_AcdTrlTRail");

    //輪船
    dblBoat = GetColMoneyTotal(strParentName, "_ctl_AcdTrlTBoats");

    //住宿費
    dblStay = GetColMoneyTotal(strParentName, "_ctl_AcdTrlStay");

    //膳雜費
    dblMisce = GetColMoneyTotal(strParentName, "_ctl_AcdTrlFMisce");

    //生活費
    dblAllowance = GetColMoneyTotal(strParentName, "_ctl_AcdTrlAllowanceCrnMoney");

    //手續費
    dblAgency = GetColMoneyTotal(strParentName, "_ctl_AcdTrlFAgency");

    //保險費
    dblInsurance = GetColMoneyTotal(strParentName, "_ctl_AcdTrlFInsurance");

    //行政費
    dblAssign = GetColMoneyTotal(strParentName, "_ctl_AcdTrlFAssign");

    //禮品交際費
    dblEntertain = GetColMoneyTotal(strParentName, "_ctl_AcdTrlFEntertain");

    //雜費
    dblOther = GetColMoneyTotal(strParentName, "_ctl_AcdTrlFOther");








    //        alert("dblAir"          +"="+ dblAir            );
    //        alert("dblHsrc"         +"="+ dblHsrc           );
    //        alert("dblCar"          +"="+ dblCar            );
    //        alert("dblMetro"        +"="+ dblMetro          );
    //        alert("dblRail"         +"="+ dblRail           );
    //        alert("dblBoat"         +"="+ dblBoat           );
    //        alert("dblStay "        +"="+ dblStay           );
    //        alert("dblMisce"        +"="+ dblMisce          );
    //        alert("dblAllowance "   +"="+ dblAllowance      );
    //        alert("dblAgency "      +"="+ dblAgency         );
    //        alert("dblInsurance "   +"="+ dblInsurance      );
    //        alert("dblAssign "      +"="+ dblAssign         );
    //        alert("dblEntertain"    +"="+ dblEntertain      );
    //        alert("dblOther" + "=" + dblOther);


    var dblTotal = parseInt(replaceString(dblAir, ",", ""))
                        + parseInt(replaceString(dblHsrc, ",", ""))
                        + parseInt(replaceString(dblCar, ",", ""))
                        + parseInt(replaceString(dblMetro, ",", ""))
                        + parseInt(replaceString(dblRail, ",", ""))
                        + parseInt(replaceString(dblBoat, ",", ""))
                        + parseInt(replaceString(dblStay, ",", ""))
                        + parseInt(replaceString(dblMisce, ",", ""))
                        + parseInt(replaceString(dblAllowance, ",", ""))
                        + parseInt(replaceString(dblAgency, ",", ""))
                        + parseInt(replaceString(dblInsurance, ",", ""))
                        + parseInt(replaceString(dblAssign, ",", ""))
                        + parseInt(replaceString(dblEntertain, ",", ""))
                        + parseInt(replaceString(dblOther, ",", ""))
                        ;
    if (isNaN(dblTotal) == true) { dblTotal = 0; }


    document.getElementById("ctl12_ctl_TrlTotalMoney").value = fmtMoney(dblTotal);




}


 
function GetColMoneyTotal(parParentName, parCtrlName)
{

    var dblColMoneyTotal = 0;
    var strTmpName = "";
    var strCtrlName = "";
    var dblTmpVal;


    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
             
        strCtrlName = parParentName + strTmpName + parCtrlName;
        try {
            dblTmpVal = parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""))
            if (isNaN(dblTmpVal) == true) { dblTmpVal = 0; }
            dblColMoneyTotal += dblTmpVal;
        }
        catch (e) { break; }
    }
    if (isNaN(dblColMoneyTotal) == true) { dblColMoneyTotal = 0; }
    if (dblColMoneyTotal == "") { dblColMoneyTotal = 0; }    

    return dblColMoneyTotal

}