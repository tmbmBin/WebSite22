
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

function GetTotalTrlRowMoney(parClientID, parCtrlID) {


    var strCtrlName;


    //飛機
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTAir");
    var dblAir = "";
    try
    { dblAir = document.getElementById(strCtrlName).value; }
    catch (e) { dblAir = 0; }
    if (dblAir == "") { dblAir = 0; }

    //高鐵
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlThsrc");
    var dblHsrc = "";     
    try
    { dblCardblHsrc = document.getElementById(strCtrlName).value; }
    catch (e) { dblHsrc = 0; }
    if (dblHsrc == "") { dblHsrc = 0; }

    //汽車
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTCar");
    var dblCar = "";
    try
    { dblCar = document.getElementById(strCtrlName).value; }
    catch (e) { dblCar = 0; }
    if (dblCar == "") { dblCar = 0; }

    //捷運
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlMetro");
    var dblMetro ="";  
    try
    {dblMetro = document.getElementById(strCtrlName).value; }
    catch (e) { dblMetro = 0; }
    if (dblMetro == "") { dblMetro = 0; }        


    //火車
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTRail");
    var dblRail = "";  
    try
    { dblRail = document.getElementById(strCtrlName).value; }
    catch (e) { dblRail = 0; }
    if (dblRail == "") { dblRail = 0; }

    //輪船
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlTBoats");
    var dblBoat = "";  
    try
    { dblBoat = document.getElementById(strCtrlName).value; }
    catch (e) { dblBoat = 0; }
    if (dblBoat == "") { dblBoat = 0; }


    //住宿費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlStay");
    var dblStay = ""; 
    try
    { dblStay = document.getElementById(strCtrlName).value; }
    catch (e) { dblStay = 0; }
    if (dblStay == "") { dblStay = 0; }

    //膳雜費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFMisce");
    var dblMisce = "";    
    try
    { dblMisce = document.getElementById(strCtrlName).value; }
    catch (e) { dblMisce = 0; }
    if (dblMisce == "") { dblMisce = 0; }

    //生活費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlAllowance");
    var dblAllowance ="" ;
    try
    {dblAllowance = document.getElementById(strCtrlName).value;}
    catch(e){dblAllowance = 0;}     
    if (dblAllowance == "") {dblAllowance = 0;}

    //手續費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAgency");
    var dblAgency ="" ;
    try
    {dblAgency = document.getElementById(strCtrlName).value;}
    catch(e){dblAgency = 0;}     
    if (dblAgency == "") {dblAgency = 0;}

    //保險費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFInsurance");
    var dblInsurance ="" ;
    try
    {dblInsurance = document.getElementById(strCtrlName).value;}
    catch(e){dblInsurance = 0;}     
    if (dblInsurance == "") {dblInsurance = 0;}
    
    //行政費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFAssign");
    var dblAssign ="" ;
    try
    {dblAssign = document.getElementById(strCtrlName).value;}
    catch(e){dblAssign = 0;}     
    if (dblAssign == "") {dblAssign = 0;}
                            
    //禮品交際費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFEntertain");
    var dblEntertain ="" ;
    try
    {dblEntertain = document.getElementById(strCtrlName).value;}
    catch(e){dblEntertain = 0;}     
    if (dblEntertain == "") {dblEntertain = 0;}
                             
    //雜費
    strCtrlName = replaceString(parClientID, parCtrlID, "ctl_AcdTrlFOther");
    var dblOther ="" ;
    try
    {dblOther = document.getElementById(strCtrlName).value;}
    catch(e){dblOther = 0;}     
    if (dblOther == "") {dblOther = 0;}                              
 



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


function GetTotalTrlColMoney(parClientID, parCtrlID) {


    var strCtrlName;
   
    strCtrlName = replaceString(parClientID, parCtrlID);
    var dblEntertain = "";
    try
    { dblEntertain = document.getElementById(strCtrlName).value; }
    catch (e) { dblEntertain = 0; }
    if (dblEntertain == "") { dblEntertain = 0; }

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



}