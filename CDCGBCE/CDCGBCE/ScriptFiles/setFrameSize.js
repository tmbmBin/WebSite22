function setiFrameBox(ObjStr, ReSetFlag, TimeOut) {
    var setObj = ObjStr;
    var WaitTime = 0;
    if (typeof (setObj) != "object") try { setObj = document.all[ObjStr]; } catch (e) { ; }
    if (typeof (setObj) != "object") try { setObj = eval(ObjStr); } catch (e) { ; }
    if (setObj && ((!ReSetFlag && (setObj.runtimeStyle.width || setObj.runtimeStyle.height)) || ReSetFlag == 1)) {
        setObj.runtimeStyle.width = null;
        setObj.runtimeStyle.height = null;
    }
    else
        if (setObj && setObj.contentWindow.document.body && setObj.contentWindow.document.body.all.length) //ReSetFlag:-1=all,2~n:(n-1) times
    {
        var myLen = setObj.contentWindow.document.body.scrollWidth * 1 + setObj.contentWindow.document.body.rightMargin * 1 + setObj.contentWindow.document.body.leftMargin * 1;
        if (myLen < setObj.contentWindow.document.body.offsetWidth) myLen = setObj.contentWindow.document.body.offsetWidth;
        if (myLen != setObj.runtimeStyle.width) setObj.runtimeStyle.width = myLen;
        myLen = setObj.contentWindow.document.body.scrollHeight * 1 + setObj.contentWindow.document.body.topMargin * 1 + setObj.contentWindow.document.body.bottomMargin * 1 + 10;
        if (myLen < setObj.contentWindow.document.body.offsetHeight) myLen = setObj.contentWindow.document.body.offsetHeight;
        if (myLen != setObj.runtimeStyle.height) setObj.runtimeStyle.height = myLen;
        if (ReSetFlag == -1 || ReSetFlag > 2) {
            if (ReSetFlag > 2) ReSetFlag--;
            WaitTime = (TimeOut) ? TimeOut : 1000;
        }
    } else WaitTime = 200;
    if (WaitTime) {//alert("setiFrameBox('"+ObjStr+"',"+((!ReSetFlag)?'null':ReSetFlag)+","+((!TimeOut)?'null':TimeOut)+")");
        if (typeof (ObjStr) == "object") {
            if (ObjStr.id)
                setTimeout("setiFrameBox('" + ObjStr.id + "'," + ((!ReSetFlag) ? 'null' : ReSetFlag) + "," + ((!TimeOut) ? 'null' : TimeOut) + ")", WaitTime);
        }
        else
            setTimeout("setiFrameBox('" + ObjStr + "'," + ((!ReSetFlag) ? 'null' : ReSetFlag) + "," + ((!TimeOut) ? 'null' : TimeOut) + ")", WaitTime);
    }
}