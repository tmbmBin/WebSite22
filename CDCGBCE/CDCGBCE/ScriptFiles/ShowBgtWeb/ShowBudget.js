function setShowBudget(parObj) {

    var strPath

    strPath = "";
    var MyParentIndex;
    var MyIndex;
    var bolChkOul = false;
    var strPathOul = "";
    var strTmpBgtCode = "";
    if (parObj) {
        MyParentIndex = parObj.MyParentIndex;
        MyIndex = parObj.MyIndex
    }
    else {
        MyParentIndex = 0;
        MyIndex = 0;
    }




    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];

        if (e.getAttribute("MyName") == "DDLdgKind" && e.getAttribute("MyIndex") == MyParentIndex) //門別
        {
            if (e.value != "") {
                if (strPath != "") {
                    strPath += "&"
                }
                strPath += "myAccKind=" + e.value;

            }
        }
        else
            if (e.getAttribute("MyName") == "DDLdgbgtSource" && e.getAttribute("MyIndex") == MyParentIndex) //預算來源
        {
            if (e.value != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "mybgtSource=" + e.value;

            }
        }

        else
            if (e.getAttribute("MyName") == "DDLdgBgtDepCode" && e.getAttribute("MyIndex") == MyParentIndex) //經費單位
        {
            if (e.value != "") {
                strTmpBgtCode = "myBgtDep=" + e.value;
                //						if (strPath !="" )
                //						{strPath +="&"}
                //						strPath += "myBgtDep=" + e.value;

            }
        }


        else

            if (e.getAttribute("MyName") == "DDLdgBiz" && e.getAttribute("MyIndex") == MyParentIndex)		//承辦業務
        {
            if (e.value != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "myBiz=" + e.value;

            }
        }


        else

            if (e.getAttribute("MyName") == "DDLdgPlan" && e.getAttribute("MyIndex") == MyParentIndex) 	//計畫
        {
            if (e.value != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "myPlan=" + e.value;

            }
        }


        else




            if (e.getAttribute("MyName") == "DDLdlOul" && e.getAttribute("MyIndex") == MyIndex && e.getAttribute("MyParentIndex") == MyParentIndex) //再簽用途別(決標用途別)
        {

            if (e.value != "") {
                if (strPath != "")
                { strPath += "&" }
                strPath += "myOul=" + e.value;
                bolChkOul = true;

            }
        }



        else


            if (!bolChkOul && e.getAttribute("MyName") == "DDLdgOul" && e.getAttribute("MyIndex") == MyParentIndex) 		//簽證用途別
        {
            if (e.value != "") {
                strPathOul = "myOul=" + e.value;

            }
        }
    } // next i

    
    if (!bolChkOul) {
        if (strPath) strPath += "&" + strPathOul;
        else strPath = strPathOul;
    }
    //alert(strPath);


    if (strPath) {
        
        if (strTmpBgtCode == "") {
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
        }
        else {
            if (strPath != "") { strPath += "&" }
            strPath += strTmpBgtCode;
        }





        //if ( parModFlag !="")
        //{
        //		 if (strPath !="" ){strPath +="&";}
        //		  strPath += "mod=" +parModFlag ;
        //	}

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
    }

}
