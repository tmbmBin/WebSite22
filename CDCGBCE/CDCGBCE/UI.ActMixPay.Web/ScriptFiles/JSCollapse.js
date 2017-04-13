
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
    try { SetCookie(GetPageName() + ":FoldTitle_15", FoldTitle_15.style.display); } catch (e) { ; } //折疊項目
    try { SetCookie(GetPageName() + ":FoldTitle_16", FoldTitle_16.style.display); } catch (e) { ; } //折疊項目
    try { SetCookie(GetPageName() + ":FoldTitle_50", FoldTitle_50.style.display); } catch (e) { ; } //折疊項目


    try { SetCookie(GetPageName() + ":div_UCProdApply", div_UCProdApply.className); } catch (e) { ; } //縮放表格
    try { SetCookie(GetPageName() + ":div_UCActPayVisa", div_UCActPayVisa.className); } catch (e) { ; } //縮放表格
    try { SetCookie(GetPageName() + ":div_UCActPayVisaMix", div_UCActPayVisaMix.className); } catch (e) { ; } //縮放表格
    try { SetCookie(GetPageName() + ":div_UCPayName", div_UCPayName.className); } catch (e) { ; } //縮放表格
}

function get_cookies() {
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_11"), "FoldTitle_11", "img_FoldTitle_11"); } catch (e) { ; } //折疊項目
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_20"), "FoldTitle_20", "img_FoldTitle_20"); } catch (e) { ; } //折疊項目
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_14"), "FoldTitle_14", "img_FoldTitle_14"); } catch (e) { ; } //折疊項目
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_15"), "FoldTitle_15", "img_FoldTitle_15"); } catch (e) { ; } //折疊項目
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_16"), "FoldTitle_16", "img_FoldTitle_16"); } catch (e) { ; } //折疊項目
    try { SetFold(GetCookie(GetPageName() + ":FoldTitle_50"), "FoldTitle_50", "img_FoldTitle_50"); } catch (e) { ; } //折疊項目

    try { SetDiv(GetCookie(GetPageName() + ":div_UCProdApply"), "div_UCProdApply", "img20"); } catch (e) { ; } //縮放表格
    try { SetDiv(GetCookie(GetPageName() + ":div_UCActPayVisa"), "div_UCActPayVisa", "img14"); } catch (e) { ; } //縮放表格
    try { SetDiv(GetCookie(GetPageName() + ":div_UCActPayVisaMix"), "div_UCActPayVisaMix", "img15"); } catch (e) { ; } //縮放表格
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