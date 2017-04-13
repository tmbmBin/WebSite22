function CallPickerFun(prObj, parReplaceID, parCodeVear, parModFlag, parBgtDepCode, parOtherBgtFlag) 
{


    //===Beg===取計畫種類(公務OR基金)=====================================================================================================
    var strPlanCateCode = "";
    try 
    {
        var varObj = document.all(prObj.id.replace(parReplaceID, "") + "DDLdgPlanCateName");
        strPlanCateCode = varObj.value;
    }
    catch (e)
    { ; }
    
    //===End===取計畫種類(公務OR基金)=====================================================================================================




    GetAllSubjectData(prObj.id, parReplaceID, ";DDLdgPlan;DDLdgOul", strPlanCateCode, parCodeVear, parModFlag, parBgtDepCode, parOtherBgtFlag);


}






function GetAllSubjectData(parObjID, parReplaceID, parTargetObj, parPlanCateCode, parCodeVear, parModFlag, parBgtDepCode, parOtherBgtFlag) {
    var strUrl = "../tmPlanPicker/tmPlanPicker.aspx?obj=" + parObjID + "&mod=&year=" + parCodeVear + "&mod=" + parModFlag + "&bgtdepcode=" + parBgtDepCode + "&otherbgtflag=" + parOtherBgtFlag;


    //=========取計畫種類(公務OR基金)=================================================================================

    if (typeof parPlanCateCode != "undefined" || parPlanCateCode != "") {
        strUrl += "&exp=1&cate=" + parPlanCateCode;
    }

    var infoStream = showModalDialog(strUrl, window, "dialogWidth: 750px; dialogHeight: 680px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    var prvID = parObjID.replace(parReplaceID, '');



    //===Beg===處理回傳的資料====================================================================================

    if (infoStream != "Cancel") {
        var infoArray = infoStream.split(";");
        var objArray = parTargetObj.split(";");

        var intDataNo = -1;
        for (var i = 0; i < objArray.length; i++) {
           

            if (jLeft(objArray[i], 3) == "DDL") {

                selectDDLitemByValue(prvID + objArray[i],  infoArray[i * 2 ], infoArray[(i * 2)+1], true);
            }
            else {
               
                try {
                    document.all(prvID + objArray[i]).value = infoArray[i];
                } catch (e) { ; }
            }




        }
    }

    //===End===處理回傳的資料====================================================================================





}



function jRight(text, numb) {
    var str = text;
    str = str.substring(str.length - numb, str.length);
    return str;
}

function jLeft(text, numb) {
    return text.substring(0, numb);
}

//設定DropDownList值
function selectDDLitemByValue(ddlId, itemValue, itemName, AddFlag) {
    var ddl = document.getElementById(ddlId);

    var i;
    //alert('length=' + ddl.options.length + ";itemValue=" + itemValue + ";itemName=" + itemName);


    for (i = 0; i < ddl.options.length; i++) {
        if (ddl[i].value == itemValue) {
            ddl[i].selected = true;
            // alert(ddl[i].value);
            break;
        }

    }


    if (AddFlag && i >= ddl.options.length) {
        //alert(ddl.options.length);
        ddl.options.length++;
        //alert(ddl.options.length);
        ddl.options[i] = new Option(itemName, itemValue);
        ddl.options[i].selected = true;
    }
}


function AddItem(parObjID, parText, parValue) {
    // Create an Option object               
    var opt = document.createElement("option");

    // Add an Option object to Drop Down/List Box
    opt.Text = parText;
    opt.Value = parValue;
    document.getElementById(parObjID).options.add(opt);        // Assign text and value to Option object

}
