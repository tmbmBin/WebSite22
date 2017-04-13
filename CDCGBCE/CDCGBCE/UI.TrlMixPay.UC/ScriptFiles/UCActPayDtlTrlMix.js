
function fnGetWorkingDays(parID, parCtrlName) {
    var sDateCtrlName = replaceString(parID, parCtrlName, "ctl_AcdTrlDate");
    var eDateCtrlName = replaceString(parID, parCtrlName, "ctl_AcdTrlEDate");
    var totalDaysCtrlName = replaceString(parID, parCtrlName, "ctl_AcdTrlTotalDays");

    var intDays = GetWorkingDays(document.getElementById(sDateCtrlName).value, document.getElementById(eDateCtrlName).value);
    if (isNaN(intDays) == true) { intDays = 0; }
    document.getElementById(totalDaysCtrlName).value = intDays;
}

function GetTotalTrlRowMoney(parClientID, parCtrlID) {


    var strCtrlName;


    //飛機
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTAir");
    var dblAir = "";
    try
    { dblAir = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblAir = 0; }
    if (dblAir == "") { dblAir = 0; }

    //高鐵
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlThsrc");
    var dblHsrc = "";
    try
    { dblCardblHsrc = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblHsrc = 0; }
    if (dblHsrc == "") { dblHsrc = 0; }

    //汽車
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTCar");
    var dblCar = "";
    try
    { dblCar = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblCar = 0; }
    if (dblCar == "") { dblCar = 0; }

    //捷運
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlMetro");
    var dblMetro = "";
    try
    { dblMetro = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblMetro = 0; }
    if (dblMetro == "") { dblMetro = 0; }


    //火車
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTRail");
    var dblRail = "";
    try
    { dblRail = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblRail = 0; }
    if (dblRail == "") { dblRail = 0; }

    //輪船
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTBoats");
    var dblBoat = "";
    try
    { dblBoat = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblBoat = 0; }
    if (dblBoat == "") { dblBoat = 0; }


    //住宿費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlStay");
    var dblStay = "";
    try
    { dblStay = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblStay = 0; }
    if (dblStay == "") { dblStay = 0; }

    //膳雜費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFMisce");
    var dblMisce = "";
    try
    { dblMisce = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblMisce = 0; }
    if (dblMisce == "") { dblMisce = 0; }

    //    //生活費台幣
    //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlAllowance");
    //    var dblAllowance ="" ;
    //    try
    //    {dblAllowance = document.getElementById(strCtrlName).value;}
    //    catch(e){dblAllowance = 0;}     
    //    if (dblAllowance == "") {dblAllowance = 0;}

    //生活費外幣
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlAllowanceCrnMoney");
    var dblAllowance = "";
    try {
        var dblAllowanceRate;
        dblAllowanceRate = replaceString(document.getElementById("UCActPayTrlDtl1_ctl_aceMoney").value, ",", "");

        dblAllowance = replaceString(document.getElementById(strCtrlName).value, ",", "");

        if (dblAllowance == "") { dblAllowance = 0; }
        if (dblAllowanceRate == "" || dblAllowanceRate == "0") { dblAllowanceRate = 1; }

        dblAllowance = parseFloat(dblAllowance) * parseFloat(dblAllowanceRate);
    }
    catch (e) { dblAllowance = 0; }
    if (dblAllowance == "") { dblAllowance = 0; }



    //手續費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAgency");
    var dblAgency = "";
    try
    { dblAgency = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblAgency = 0; }
    if (dblAgency == "") { dblAgency = 0; }

    //保險費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFInsurance");
    var dblInsurance = "";
    try
    { dblInsurance = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblInsurance = 0; }
    if (dblInsurance == "") { dblInsurance = 0; }

    //行政費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAssign");
    var dblAssign = "";
    try
    { dblAssign = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblAssign = 0; }
    if (dblAssign == "") { dblAssign = 0; }

    //禮品交際費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFEntertain");
    var dblEntertain = "";
    try
    { dblEntertain = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblEntertain = 0; }
    if (dblEntertain == "") { dblEntertain = 0; }

    //雜費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFOther");
    var dblOther = "";
    try
    { dblOther = replaceString(document.getElementById(strCtrlName).value, ",", ""); }
    catch (e) { dblOther = 0; }
    if (dblOther == "") { dblOther = 0; }




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

    //小計
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdMoney");


    document.getElementById(strCtrlName).value = fmtMoney(dblTotal);



}


function GetTotalTrlColMoneyV1(parClientID) {


    var dblTotal;

    var dblAir = 0;
    var dblHsrc = 0;
    var dblCar = 0;
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



    for (i = 1; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);
        //    strCtrlName = strParentName + strTmpName + "_ctl_PcbMoney"



        //飛機
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTAir");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTAir";
        var dblAir = "";
        try
        { dblAir += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //if (dblAir == "") { dblAir = 0; }

        //高鐵
        //strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlThsrc");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlThsrc";
        var dblHsrc = "";
        try
        { dblCardblHsrc += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblHsrc == "") { dblHsrc = 0; }

        //汽車
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTCar");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTCar";
        var dblCar = "";
        try
        { dblCar += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblCar == "") { dblCar = 0; }

        //捷運
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlMetro");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlMetro";
        var dblMetro = "";
        try
        { dblMetro += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblMetro == "") { dblMetro = 0; }


        //火車
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTRail");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTRail";
        var dblRail = "";
        try
        { dblRail += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblRail == "") { dblRail = 0; }

        //輪船
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTBoats");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTBoats";
        var dblBoat = "";
        try
        { dblBoat += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblBoat == "") { dblBoat = 0; }


        //住宿費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlStay");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlStay";
        var dblStay = "";
        try
        { dblStay += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblStay == "") { dblStay = 0; }

        //膳雜費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFMisce");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFMisce";
        var dblMisce = "";
        try
        { dblMisce += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblMisce == "") { dblMisce = 0; }

        //    //生活費台幣
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlAllowance");
        //    var dblAllowance ="" ;
        //    try
        //    {dblAllowance = document.getElementById(strCtrlName).value;}
        //    catch(e){dblAllowance = 0;}     
        //    if (dblAllowance == "") {dblAllowance = 0;}

        //生活費外幣
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlAllowanceCrnMoney");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlAllowanceCrnMoney";
        var dblAllowance = "";
        try {

            dblAllowance += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", ""));



            //        dblAllowance = parseFloat(dblAllowance) * parseFloat(dblAllowanceRate);
        }
        catch (e) { break; }
        //    if (dblAllowance == "") { dblAllowance = 0; }



        //手續費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAgency");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFAgency";
        var dblAgency = "";
        try
        { dblAgency += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblAgency == "") { dblAgency = 0; }

        //保險費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFInsurance");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFInsurance";
        var dblInsurance = "";
        try
        { dblInsurance += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblInsurance == "") { dblInsurance = 0; }

        //行政費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAssign");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFAssign";
        var dblAssign = "";
        try
        { dblAssign += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblAssign == "") { dblAssign = 0; }

        //禮品交際費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFEntertain");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFEntertain";
        var dblEntertain = "";
        try
        { dblEntertain += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblEntertain == "") { dblEntertain = 0; }

        //雜費
        //    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFOther");
        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlFOther";
        var dblOther = "";
        try
        { dblOther += parseInt(replaceString(document.getElementById(strCtrlName).value, ",", "")); }
        catch (e) { break; }
        //    if (dblOther == "") { dblOther = 0; }      



    }




    if (dblAllowance == "") { dblAllowance = 0; }
    if (dblAllowanceRate == "" || dblAllowanceRate == "0") { dblAllowanceRate = 1; }
    var dblAllowanceRate;
    dblAllowanceRate = replaceString(document.getElementById("UCActPayTrlDtl1_ctl_aceMoney").value, ",", "");
    dblAllowance = parseFloat(dblAllowance) * parseFloat(dblAllowanceRate);



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


    document.getElementById("UCActPayTrlDtl1_ctl_TrlTotalMoney").value = fmtMoney(dblTotal);




}




function GetTotalTrlColMoney(parClientID) {


    var dblTotal;

    var dblAir = 0;
    var dblHsrc = 0;
    var dblCar = 0;
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



    //匯率
    var dblAllowanceRate;
    dblAllowanceRate = replaceString(document.getElementById("UCActPayTrlDtl1_ctl_aceMoney").value, ",", "");
    if (isNaN(dblAllowanceRate) == true) { dblAllowanceRate = 1; }
    if (dblAllowanceRate == "" || dblAllowanceRate == "0") { dblAllowanceRate = 1; }

    //生活費=美金*匯率
    dblAllowance = parseFloat(dblAllowance) * parseFloat(dblAllowanceRate);



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


    document.getElementById("UCActPayTrlDtl1_ctl_TrlTotalMoney").value = fmtMoney(dblTotal);




}


function GetColMoneyTotal(parParentName, parCtrlName) {

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




function ReDoRowMoneyTotal(parClientID) {

    var dblColMoneyTotal = 0;
    var strTmpName = "";
    var strCtrlName = "";
    var dblTmpVal;
    var objCtl;




    var strParentName = "";
    var arrCtrlName = parClientID.split("_");

    for (i = 0; i <= arrCtrlName.length - 4; i = i + 1) {
        strParentName += arrCtrlName[i] + "_";
    }



    for (i = 2; i <= 99; i = i + 1) {
        strTmpName = "ctl" + ("000" + i).substring(4 - 2, 4);

        strCtrlName = strParentName + strTmpName + "_ctl_AcdTrlTAir";
        try {
            objCtl = document.getElementById(strCtrlName)
            GetTotalTrlRowMoney(strCtrlName, "ctl_AcdTrlTAir");
        }
        catch (e) { break; }
    }



}