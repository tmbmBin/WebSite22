function setShowBudget(parObj) {


	var strPath
		
	strPath="";
	var MyParentIndex;
	var MyIndex;
	var bolChkOul=false;
	var strPathOul="";
	if(parObj)
	{
		MyParentIndex=parObj.MyParentIndex;
	    MyIndex=parObj.MyIndex
	}
	else {
	    MyParentIndex = 0;
        MyIndex=0;
    }



    for (var i = 0; i < document.forms[0].elements.length; i++) 
    {

        var e = document.forms[0].elements[i];

        if (e.MyName == "DDLdgKind" && e.MyIndex == MyParentIndex) //門別
        {
            if (e.value != "") {
                if (strPath != "") { strPath += "&"; }
                strPath += "myAccKind=" + e.value;
            }

        }
        else
            if (e.MyName == "DDLdgbgtSource" && e.MyIndex == MyParentIndex) //預算來源
            {
                if (e.value != "") {
                    if (strPath != "") { strPath += "&"; }
                    strPath += "mybgtSource=" + e.value;

                }
            }
            else
                if (e.MyName == "DDLdgWorkUnitName" && e.MyIndex == MyParentIndex)		//承辦業務		                            
                {
                    if (e.value != "") {
                        if (strPath != "") { strPath += "&"; }
                        strPath += "myBiz=" + e.value;

                    }
                }


                else

                    if (e.MyName == "DDLdgPlanName" && e.MyIndex == MyParentIndex) 	//計畫
                    {
                        if (e.value != "") {
                            if (strPath != "") { strPath += "&"; }
                            strPath += "myPlan=" + e.value;

                        }
                    }
                    else

                        if (e.MyName == "DDLdgOulName" && e.MyIndex == MyIndex && e.MyParentIndex == MyParentIndex) //再簽用途別(決標用途別)
                        {
                            if (e.value != "") {
                                if (strPath != "") { strPath += "&"; }
                                strPath += "myOul=" + e.value;
                                bolChkOul = true;
                            }
                        }
                        else
                            if (!bolChkOul && e.MyName == "DDLdgOulName" && e.MyIndex == MyParentIndex) 		//簽證用途別
                            {
                                if (e.value != "") {
                                    strPathOul = "myOul=" + e.value;
                                }
                            }
                            else
                                if (e.MyName == "DDLdgBgtDepName" && e.MyIndex == MyParentIndex) 	//計畫
                                {
                                    if (strPath != "") { strPath += "&"; }
                                    strPath += "myBgtDep=" + e.value;
                                }

			} // next i

if(!bolChkOul)		
{if(strPath) strPath+="&"+strPathOul;
 else 	strPath=strPathOul;
}	
//alert(strPath);
if (strPath ) {
    try {
        if (document.all("DDLBgtSource").value != "")
			{
			    if (strPath != "") { strPath += "&"; }
				//strPath += "myBgtDep=" + document.all("DDLBgtDep").value;
			    strPath += "mybgtSource=" + document.all("DDLBgtSource").value;
			}
} catch (e) { ; }
try { document.getElementById("iFrame").src = "../UI.ActSum.WEB/ShowBudget1.aspx?MenuID=Y1&mod=2&" + strPath; } catch (e) { ; }
}
			
}