/// <reference path="JSTrl.js" />

function testfun() { 


}
function autowidth(parObj) {


    if (!parObj.style.width) return;
    //		    window.status =""
    //alert(this.style.width);
    parObj._onchange = parObj.onchange;
    parObj.onchange = null;

    if (!parObj._oldwidth) parObj._oldwidth = parObj.style.width;
    //parObj.style.position = "absolute";
    if (parObj._offsetWidth >= 500) {
        parObj.style.width = "500";
    }
    else {
        parObj.style.width = "";
        parObj._offsetWidth = parObj.offsetWidth;
        //window.status=parObj.offsetWidth;
    }
    //		 if (parObj.offsetWidth > 500) {		     
    //		         parObj.style.width = "500";   
    //		 }
    //document.all("Label1").innerText=parObj.offsetWidth;
    //parentNode.width="";
    parObj.onchange = parObj._onchange;

    //window.status= parObj.onchange;
}

function defwith(parObj) {
    //parObj.style.position = "";
    parObj.style.width = parObj._oldwidth; //"200";
}
