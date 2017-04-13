function fnOpenOTData() {
 var strParams;
 strParams="&sessionid=" + document.all("ctl_SessionID").value.toString();

    var strReturnVal = showModalDialog("FrmActPayeePay.aspx?type=1"  + strParams , window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

    if (strReturnVal != "Cancel") {

        document.all("ctl_SessionID").value = strReturnVal;
  
    }
 
}


		function fnCallSearchDialog()
		{

			var strReturnVal=showModalDialog("FrmSearch.aspx?stageflag=1&mod="+ "<%=strModFlag %>",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

			if (strReturnVal != "Cancel")
				{
					//alert( document.all("TBFindSql").value);
					document.all("TBFindSql").value=strReturnVal;
					//alert( document.all("TBFindSql").value);
					//Form1.TBFindSql.value=strReturnVal;
				}

			//Form1.TBFindSql.value=strReturnVal;

		}

	function fnCallPayDtlDialog(parParams){
parParams +="&datastage=P&SessID=" + document.getElementById("TBPayDtlData").value;
	var strReturnVal=showModalDialog("../AppCtrlCustom/FrmPayMethod.aspx?" + parParams,window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
	if (strReturnVal != "Cancel" )
	{
		document.all("TBPayDtlData").value=  strReturnVal;
		//document.all("TextBox1").value=  strReturnVal;
	}
}

		

//		function  fnCallPrntWeb()
//		{
//			var strParams;


//		  // alert("&acmwordnum=" + document.all("TBAcmWordNum").value );
//		  if (document.all("DDLReport").value == "Gen01" || document.all("DDLReport").value == "Gen03")
//		  {
//			strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("ctl05_TBAcmWordNum").title + "&acmwordnum=" + document.all("ctl05_TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acpPayNo=1" + "&acmkidnum=<%=strDefKidNum  %>";

//			 window.open("../UI.ActReports.Web/FrmRptGen01.aspx?rptflag=" +  document.all("DDLReport").value + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

//		  }
//		}

		function checkVisaKind(parVal)
		{

//			if (parseFloat(replaceString(parVal,",","")) >0 && parseFloat(replaceString(parVal,",","")) <=10000 )
//			{

//				document.all("CBAllowanceFlag").checked=true;
//			}
//			else
//			{
//				document.all("CBAllowanceFlag").checked=false;
//			}
		}
	function ShowAddVisaData(parSObj, parTObj)
		{
		    if(document.all("CBAddVisa").checked==true)
		    {
		        document.all("TDAddVisaData1").style.display="block";
		        document.all("TDAddVisaData2").style.display="block";
		    }
		    else 
		    {
		    document.all("TDAddVisaData1").style.display="none";
		    document.all("TDAddVisaData2").style.display="none";
		    }
		}
		
		
		function  fnCallReportMenu(parParams){

	var strParams;
	strParams=parParams;
	 //strParams = "&acmyear=" + <%=Session("default_Year") %> + "&acmNo=" + document.all("TBAcmWordNum").title + "&acmwordnum=" + document.all("TBAcmWordNum").value + "&acmNo1=0" + "&acpPayYear=" +  <%=Session("default_Year") %>  + "&acmkidnum=<%=strDefKidNum  %>" + "&page1qty=7&page2qty=43" ;
	 window.open("../UI.ActReports.Web/FrmRptMenu.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

  }


		function showfiled(parSObj, parTObj) {
    if (document.all("CBAutoTempPay").checked == true) {
        document.all("TRTmpPayData").style.display = "block";
//        document.all("TRTmpPayData1").style.display = "block";
    }
    else {
        document.all("TRTmpPayData").style.display = "none";
        //document.all("TRTmpPayData1").style.display = "none";
    }
}
		
function DisableAfterSubmit(){
	var obj = event.srcElement;
	var objs = document.getElementsByTagName('INPUT');
	for(var i=0; i<objs.length; i++){
		if(objs[i].type.toLowerCase() == 'submit'){
			objs[i].disabled = true;
		}
	}
}
	



    
    function show_item(item, sender) {
        var item_style = document.all[item].style;

        if (typeof sender != "undefined") {
            if (document.getElementById(sender).src.slice(-8) == 'plus.gif') {
                item_style.display = "block";
            }
            else {
                item_style.display = "none";
            }
        }
        else {

            if (item_style.display == 'none') {
                item_style.display = "block";
            }
            else {
                item_style.display = "none";
            }
        }
    }

    function sync_title_img(sender) {
        if (sender.style.display == 'block') {
            document.getElementById("img_" + sender.id).src = "images/minus.gif";
        }
        else {
            document.getElementById("img_" + sender.id).src = "images/plus.gif";
        }
    }


    function scale_item(sender) {
        var pORm;
        if (document.getElementById(sender).src.slice(-8) == 'plus.gif')
            pORm = "+";
        else
            pORm = "-";

        //	scale_item_by(pORm, "table");
        //	scale_item_by(pORm, "td");
        scale_item_by(pORm, "div");
        //	scale_item_by(pORm, "hr");

        if (pORm == "+")
            document.getElementById(sender).src = "images/minus.gif";
        else
            document.getElementById(sender).src = "images/plus.gif";
    }

    function scale_item_by(pORm, tagName) {
        var obj = document.getElementsByTagName(tagName);
        for (var i = 0; i < obj.length; i++)
            try {
                if (obj[i].alt != undefined)
                //alert(obj[i].alt);
                    if (pORm == "+") {
                        obj[i].className = obj[i].alt + "_noWidth";
                    }
                    else {
                        obj[i].className = obj[i].alt + "_width";
                    }
            } catch (e) { ; }
    }

    function GetIEVer() {
        var x;
        for (i = 0; i < 10; i++) {
            for (z = 0; z < 10; z++) {
                if (navigator.appVersion.match("MSIE " + i + "." + z) != null)
                    x = i + "." + z;
            }
        }
        return x;
    }

    function SetCookie(sName, sValue) {
        keepDay = 7;
        setDay = new Date();
        setDay.setTime(setDay.getTime() + (keepDay * 1000 * 60 * 60 * 24));
        expDay = setDay.toGMTString();

        document.cookie = sName + "=" + escape(sValue) + "; expires=" + expDay;
    }

    function GetCookie(sName) {
        var aCookie = document.cookie.split("; ");
        for (var i = 0; i < aCookie.length; i++) {
            var aCrumb = aCookie[i].split("=");
            if (sName == aCrumb[0])
                return unescape(aCrumb[1]);
        }
        return null;
    }

    function GetPageName() {
        var strHref = window.location.href;
        var pageName = strHref.slice(strHref.lastIndexOf("/") + 1);
        pageName = (pageName + "?").split("?")[0];
        return pageName;
        //	return (window.location.href).slice((window.location.href).lastIndexOf("/") + 1);
    }

    function jRight(text, numb) {
        var str = text;
        str = str.substring(str.length - numb, str.length);
        return str;
    }

    function set_cookies() {
        try { SetCookie(GetPageName() + ":FoldTitle_11", FoldTitle_11.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_20", FoldTitle_20.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_14", FoldTitle_14.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_16", FoldTitle_16.style.display); } catch (e) { ; } //折疊項目
        try { SetCookie(GetPageName() + ":FoldTitle_50", FoldTitle_50.style.display); } catch (e) { ; } //折疊項目


        try { SetCookie(GetPageName() + ":div_UCProdApply", div_UCProdApply.className); } catch (e) { ; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCActPayVisa", div_UCActPayVisa.className); } catch (e) { ; } //縮放表格
        try { SetCookie(GetPageName() + ":div_UCPayName", div_UCPayName.className); } catch (e) { ; } //縮放表格
    }

    function get_cookies() {
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_20"), "FoldTitle_20", "img_FoldTitle_20"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_14"), "FoldTitle_14", "img_FoldTitle_14"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_16"), "FoldTitle_16", "img_FoldTitle_16"); } catch (e) { ; } //折疊項目
        try { SetFold(GetCookie(GetPageName() + ":FoldTitle_50"), "FoldTitle_50", "img_FoldTitle_50"); } catch (e) { ; } //折疊項目

        try { SetDiv(GetCookie(GetPageName() + ":div_UCProdApply"), "div_UCProdApply", "img20"); } catch (e) { ; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCActPayVisa"), "div_UCActPayVisa", "img14"); } catch (e) { ; } //縮放表格
        try { SetDiv(GetCookie(GetPageName() + ":div_UCPayName"), "div_UCPayName", "img16"); } catch (e) { ; } //縮放表格
    }

    function SetFold(sValue, item, sender) {
        if (sValue == "block") {
            document.getElementById(item).style.display = "block";
            document.getElementById(sender).src = "images/minus.gif";
        }
        else {
            document.getElementById(item).style.display = "none";
            document.getElementById(sender).src = "images/plus.gif";
        }
    }

    function SetDiv(sValue, item, sender) {
        document.getElementById(item).className = sValue;
        if (jRight(sValue, 7) == "noWidth") {
            document.getElementById(sender).src = "images/minus.gif";
        }
        else {
            document.getElementById(sender).src = "images/plus.gif";
        }
    }