
function setShowBudget(parObj) {


    var strPath
    var bolChkOul = false;
    var bolChkPlan = false;
    var strPathOul = "";
    var strPathPlan = "";
    var MyParentIndex;
    var MyIndex;

    strPath = "";

    if (parObj) {
        MyParentIndex = parObj.MyParentIndex;
        MyIndex = parObj.MyIndex
    } else {
        MyParentIndex = 0;
        MyIndex = 0;
    }




    //門別
    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        if (e.getAttribute("MyName") == "TBdgAccKindName" && e.getAttribute("MyIndex") == MyParentIndex) {
            if (e.title != "") {
                if (strPath != "") {
                    strPath += "&"
                }
                strPath += "myAccKind=" + e.title;

            }
        }
        else
        //預算來源
            if (e.getAttribute("MyName") == "TBdgBgtSourName" && e.getAttribute("MyIndex") == MyParentIndex) {
            if (e.title != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "mybgtSource=" + e.title;

            }
        }
        else
        //承辦業務
            if (e.getAttribute("MyName") == "TBdgBizName" && e.getAttribute("MyIndex") == MyParentIndex) {
            if (e.title != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "myBiz=" + e.title;

            }
        }

        else
        //轉正計畫
            if (e.getAttribute("MyName") == "DDLdlPlanName" && e.getAttribute("MyIndex") == MyIndex && e.getAttribute("MyParentIndex") == MyParentIndex) {

            if (e.value != "") {
                if (strPath != "")
                { strPath += "&" }

                strPath += "myPlan=" + e.value;
                bolChkPlan = true;

            }

        }

        else
        //計畫
            if (!bolChkPlan && e.getAttribute("MyName") == "TBdgPalnName" && e.getAttribute("MyIndex") == MyParentIndex) {
            if (e.title != "") {

                strPathPlan = "myPlan=" + e.title;

            }
        }
        else
        //報支用途別
            if (e.getAttribute("MyName") == "DDLdlOulName" && e.getAttribute("MyIndex") == MyIndex && e.getAttribute("MyParentIndex") == MyParentIndex) {
            if (e.value != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "myOul=" + e.value;
                bolChkOul = true;
            }
        }



        else
        //簽證用途別
            if (!bolChkOul && e.getAttribute("MyName") == "TBdgOulName" && e.getAttribute("MyIndex") == MyParentIndex) {		//alert(e.title);
            if (e.title != "") {
                strPathOul = "myOul=" + e.title;
            }
        }


    } // next i




    if (bolChkOul) {
        if (!bolChkPlan) {
            if (strPath) strPath += "&" + strPathPlan;
            else strPath = strPathPlan;
        }

    }
    else {

        if (bolChkPlan) {
            if (strPath) strPath += "&" + strPathOul;
            else strPath = strPathOul
        }
        else {
            if (strPath) strPath += "&" + strPathOul + "&" + strPathPlan;
            else strPath = strPathOul + "&" + strPathPlan; ;
        }


    }









    if (strPath) {
        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];

            if (e.getAttribute("MyName") == "DDLBgtDep") {
                if (e.value != "") {
                    if (strPath != "")
                    { strPath += "&" }
                    strPath += "myBgtDep=" + e.value;
                }

                break;
            }

        }



        var strModFlag = "";
        if (document.all("TBModFlag") && document.all("TBModFlag").value != "") {
            if (strPath != "") { strPath += "&"; }
            strPath += "mod=" + document.all("TBModFlag").value;
            strModFlag = document.all("TBModFlag").value;
        }



        if (strModFlag == "2") {
            try { document.getElementById("iFrame").src = "../UI.ActSum.WEB/ShowBudget1.aspx?" + strPath + "&menuid=Y1"; } catch (e) { ; }
        }
        else {
            if (strModFlag == "5")
            { try { document.getElementById("iFrame").src = "../UI.ActSum.WEB/FrmLauncher.aspx?" + strPath + "&menuid=Y1"; } catch (e) { ; } }
            else
            { try { document.getElementById("iFrame").src = ""; } catch (e) { ; } }
        }

        //try { document.getElementById("iFrame").src = "../UI.ActSum.WEB/ShowBudget1.aspx?" + strPath+ "&menuid=Y1"; } catch (e) { ; }
        //try{document.getElementById("iFrame").src="../UI.ActSum.WEB/FrmLauncher.aspx?"+strPath;}catch(e){;}

    }



}
