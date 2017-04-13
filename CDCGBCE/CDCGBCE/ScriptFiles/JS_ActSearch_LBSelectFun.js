
function ChangeOpt(Opt1, Opt2) {
    var Tmp_value = Opt1.value;
    var Tmp_text = Opt1.text;
    var Tmp_selected = Opt1.selected;
    Opt1.value = Opt2.value;
    Opt1.text = Opt2.text;
    Opt1.selected = Opt2.selected;
    Opt2.value = Tmp_value;
    Opt2.text = Tmp_text;
    Opt2.selected = Tmp_selected;
}

function putUp(setObj) {
    var ChgCnt = 0;
    for (var i = 0; i < setObj.options.length; i++)
        if (setObj.options[i].selected && i > 0) {
        ChangeOpt(setObj.options[i], setObj.options[i - 1]);
        ChgCnt++;
    }
    return ChgCnt;
}


function putDn(setObj) {
    var ChgCnt = 0;
    for (var i = setObj.options.length - 1; i >= 0; i--)
        if (setObj.options[i].selected && i < setObj.options.length - 1) {
        ChangeOpt(setObj.options[i], setObj.options[i + 1]);
        ChgCnt++;
    }
    return ChgCnt;
}


function putUpEnd(setObj) {
    var ChgCnt = 0;
    var Cnt;
    if (setObj.options.length > 0)
        while (!setObj.options[0].selected)
        if ((Cnt = putUp(setObj)) <= 0) break;
    else ChgCnt += Cnt;
    return ChgCnt;
}
function putDnEnd(setObj) {
    var ChgCnt = 0;
    var Cnt;
    if (setObj.options.length > 0)
        while (!setObj.options[setObj.options.length - 1].selected)
        if ((Cnt = putDn(setObj)) <= 0) break;
    else ChgCnt += Cnt;
    return ChgCnt;
}
function moveOpt(setObj, setObjDest, AllFlag) {
    var MovCnt = 0;
    var MovFirstIdx = -1;
    for (var i = 0; i < setObj.options.length; i++)
        if (setObj.options[i].selected || AllFlag) {
        if (MovFirstIdx == -1) {
            for (var j = 0; j < setObjDest.options.length; j++)
                setObjDest.options[j].selected = false;
            MovFirstIdx = i;
        }
        setObjDest.options.add(new Option(setObj.options[i].text, setObj.options[i].value));
        setObjDest.options[setObjDest.options.length - 1].selected = setObj.options[i].selected;
        setObj.options.remove(i);
        MovCnt++;
        i--;
    }
    if (!AllFlag) {
        if (MovFirstIdx < 0) MovFirstIdx = 0;
        if (MovFirstIdx >= setObj.options.length) MovFirstIdx = setObj.options.length - 1;
        if (MovFirstIdx >= 0) setObj.options[MovFirstIdx].selected = true;
    }
    return MovCnt;
}
function getSeleOptVal(setObj, AllFlag, Spc) {
    var OptVal = "";
    for (var i = 0; i < setObj.options.length; i++)
        if (setObj.options[i].selected || AllFlag) {
        if (Spc && OptVal != "") {
            if (OptVal != "") OptVal += ", ";
            OptVal += Spc + setObj.options[i].value;
        }
        else {
            if (OptVal != "") OptVal += ", ";
            OptVal += setObj.options[i].value;
        }
    }

    return OptVal;
}
