function get_F_XCode(obj, replaceID, parCodeVear, parModFlag, parBgtDepCode, parOtherBgtFlag) {

    //    //    var DDL = document.all(obj.id.replace(replaceID, "") + "DDLdgPlanCate");
    //    //    var planTYPE = DDL[DDL.selectedIndex].value;
    //    //    requestInfo_PlanCode(obj.id, replaceID, "DDLdgPlanCate;TBdgPlanName;TBdgPlanCode;TBdgOulName;TBdgOulCode", planTYPE, parCodeVear);

    ////=======================================================================================
    try { 
        var varObj = document.all(obj.id.replace(replaceID, "") + "DDLdgPlanCateName");
        var planTYPE = varObj.value;

    }
    catch (e)
    {;}
    //    
    ////=======================================================================================
    //    var strBgtDepCode;
    //   
    //    try 
    //    {
    //        
    //        strBgtDepCode = document.all(obj.id.replace(replaceID, "") + "DDLdgBgtDepCode").value;
    //    }
    //    catch (e) {
    //     
    //       try {
    //         var tmpArray = obj.id.split("_");
    //         
    //         strBgtDepCode = document.all(tmpArray[0] + "DDLBgtDep").value;
    //         }
    //     }
    //     catch (e)
    //     { ; }
    //     
    ////=======================================================================================
    //     
    //      var strOtherBgtFlag;


    //try
    //{

    // var tmpArray = obj.id.split("_");
    // var objTmpCB =document.all(tmpArray[0] + "CBOtherBgtDep");
    // if(objTmpCB.checked== true) {strOtherBgtFlag="1";} else { strOtherBgtFlag="0";}
    //         
    //         
    //         } catch(e){;}


    requestInfo_PlanCode(obj.id, replaceID, ";DDLdgPlan;DDLdgOul", planTYPE, parCodeVear, parModFlag, parBgtDepCode, parOtherBgtFlag);
}




//明細科目
function requestInfo_PlanCode(thisID, replaceID, requestOBJ, planTYPE, parCodeVear, parModFlag, parBgtDepCode, parOtherBgtFlag) {

    var url = "../planRelation/planRelatEditor.aspx?obj=" + thisID + "&mod=&year=" + parCodeVear + "&mod=" + parModFlag + "&bgtdepcode=" + parBgtDepCode + "&otherbgtflag=" + parOtherBgtFlag;


    //	try{ url += "&code=" + document.all(thisID.replace("text_","hid_")).value; }catch(e){;}
    if (typeof planTYPE != "undefined") {
        url += "&exp=1&cate=" + planTYPE;
    }
    var infoStream = showModalDialog(url, window, "dialogWidth: 750px; dialogHeight: 675px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
    var prvID = thisID.replace(replaceID, '');

    if (infoStream != "Cancel") {
        var infoArray = infoStream.split(";");
        var objArray = requestOBJ.split(";");

        var intDataNo = -1;
        for (var i = 0; i < objArray.length; i++) {
            //            if (jLeft(objArray[i], 3) == "ddl")
            //                selectDDLitemByValue(prvID + objArray[i], infoArray[i]);
            //            else
            //                document.all(prvID + objArray[i]).value = infoArray[i];
            //            document.all(prvID + objArray[i]).title = infoArray[i];


            // alert(infoArray[i]);

            if (jLeft(objArray[i], 3) == "DDL") {
              
                selectDDLitemByValue(prvID + objArray[i], infoArray[i*2+1], infoArray[(i*2)],true);
            }
            else {
                //intDataNo += 1
                //document.all(prvID + objArray[i]).value = infoArray[intDataNo];
                //intDataNo += 1
                //document.all(prvID + objArray[i]).title = infoArray[intDataNo];
                try {
                    document.all(prvID + objArray[i]).value = infoArray[i];
                } catch (e) { ; }
            }




        }
    }
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
function selectDDLitemByValue(ddlId, itemValue,itemName,AddFlag) {
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
        ddl.options[i] = new Option( itemName, itemValue);
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



//-->