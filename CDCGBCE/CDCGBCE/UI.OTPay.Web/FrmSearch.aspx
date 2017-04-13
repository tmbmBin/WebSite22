<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearch.aspx.vb" Inherits="UI.OTPay.Web.FrmSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <meta http-equiv="Pragma" content="No-cache" />
	<base target="_self" />
	<script language="javascript" type="text/javascript">

	    function check_Num() {
	        if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
	            return true;
	        }
	        else { event.keyCode = 0; false; }
	    }



	    function fnGetInfo() {
	        var strValue = "";
	        var YearFlag = 0;

	        if (document.all("DDLAccKind").value != "") {
	            //strValue= ' V.acvAccKind' + '^0^' + document.all("DDLAccKind").value;

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue = " And IsNull(V1.acvAccKind, V.acvAccKind) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                case "11":
	                    strValue = " And IsNull(V2.acvAccKind, IsNull(V1.acvAccKind, V.acvAccKind)) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                case "12":
	                    strValue = " And IsNull(PV.acvAccKind, IsNull(V2.acvAccKind, IsNull(V1.acvAccKind, V.acvAccKind))) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                case "13":
	                    strValue = " And IsNull(PV1.acvAccKind, PV.acvAccKind) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                default:
	                    strValue = " And V.acvAccKind = '" + document.all("DDLAccKind").value + "'";

	            }



	        }

	        if (document.all("DDLbgtSource").value != "") {
	            //var tmpArray ;				 			 
	            //tmpArray=document.all("DDLbgtSource").value.split(":");
	            //if ( strValue !="" ){strValue += '|' ;}

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(V1.acvBgtSourceCode, V.acvBgtSourceCode) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(V2.acvBgtSourceCode, IsNull(V1.acvBgtSourceCode, V.acvBgtSourceCode)) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV.acvBgtSourceCode, IsNull(V2.acvBgtSourceCode, IsNull(V1.acvBgtSourceCode, V.acvBgtSourceCode))) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(PV1.acvBgtSourceCode, PV.acvBgtSourceCode) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                default:
	                    strValue += " And V.acvBgtSourceCode= '" + document.all("DDLbgtSource").value + "'";

	            }


	            //strValue += " And V.acvBgtSourceCode= '" + document.all("DDLbgtSource").value + "'";
	        }


	        if (document.all("DDLBgtDep").value != "") {
	            //if ( strValue !="" ){strValue += '|' ;}				

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(P.acpBgtUnitNo, IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(P.acpBgtUnitNo, IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                default:
	                    strValue += " And IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)='" + document.all("DDLBgtDep").value + "'";

	            }

	            //strValue += " And IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)='"+ document.all("DDLBgtDep").value +"'";
	        }


	        if (document.all("DDLWorkDep").value != "") {
	            //if ( strValue !="" ){strValue += '|' ;}

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                default:
	                    strValue += " And M.acmWorkUnitNo='" + document.all("DDLWorkDep").value + "'";

	            }

	            //strValue += " And M.acmWorkUnitNo='" + document.all("DDLWorkDep").value +"'";

	        }



	        if (document.all("DDLWorkUnit").value != "") {
	            //if ( strValue !="" ){strValue += '|' ;}
	            var tmpArray;
	            tmpArray = document.all("DDLWorkUnit").value.split(":");


	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvBizCode, V.acvBizCode) = '" + tmpArray[1] + "'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + tmpArray[1] + "'";
	                    }

	                    break;
	                case "3":
	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvBizCode, V.acvBizCode) = '" + tmpArray[1] + "'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + tmpArray[1] + "'";
	                    }
	                    break;
	                case "11":
	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvBizCode, V.acvBizCode) = '" + tmpArray[1] + "'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + tmpArray[1] + "'";
	                    }
	                    break;
	                case "12":
	                    strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + document.all("DDLWorkUnit").value + "'";
	                    break;
	                default:

	                    if (YearFlag == 0) {
	                        strValue += " And V.acvOutlayYear =" + tmpArray[0] + " And V.acvBizCode = '" + tmpArray[1] + "'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And V.acvBizCode ='" + tmpArray[1] + "'";
	                    }

	            }

	        }






	        if (document.all("DDLPlan").value != "") {
	            var tmpArray;
	            tmpArray = document.all("DDLPlan").value.split(":");
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "3":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvPlanCode, V.acvPlanCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvPlanCode, V.acvPlanCode) Like " + tmpArray[1] + "%'";
	                    }

	                    break;

	                case "11":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear)) =" + tmpArray[0] + " And IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode)) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode)) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "12":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV.acvOutlayYear, IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear))) =" + tmpArray[0] + " And IsNull(PV.acvPlanCode, IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode))) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV.acvPlanCode, IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode))) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "13":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV1.acvOutlayYear, PV.acvOutlayYear) =" + tmpArray[0] + " And IsNull(PV1.acvPlanCode, PV.acvPlanCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV1.acvPlanCode, PV.acvPlanCode) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                default:

	                    if (YearFlag == 0) {
	                        strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And V.acvPlanCode Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And  V.acvPlanCode Like " + tmpArray[1] + "%'";
	                    }

	            }

	            //				if (YearFlag==0)
	            //				{
	            //					strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And V.acvPlanCode Like '" + tmpArray[1] + "%'";
	            //					YearFlag=1;
	            //				}
	            //				else
	            //				{
	            //					strValue += " And  V.acvPlanCode Like " + tmpArray[1] + "%'";
	            //				}
	        }

	        if (document.all("DDLOul").value != "") {
	            var tmpArray;
	            tmpArray = document.all("DDLOul").value.split(":");
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "3":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvOutlayCode, V.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvOutlayCode, V.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "11":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear)) =" + tmpArray[0] + " And IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode)) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode)) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "12":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV.acvOutlayYear, IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear))) =" + tmpArray[0] + " And IsNull(PV.acvOutlayCode, IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode))) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV.acvOutlayCode, IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode))) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "13":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV1.acvOutlayYear, PV.acvOutlayYear) =" + tmpArray[0] + " And IsNull(PV1.acvOutlayCode, PV.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV1.acvOutlayCode, PV.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                default:

	                    if (YearFlag == 0) {
	                        strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And V.acvOutlayCode Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And  V.acvOutlayCode Like '" + tmpArray[1] + "%'";
	                    }

	            }


	            //				if (YearFlag==0)
	            //				{
	            //					strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And  V.acvOutlayCode Like '"+ tmpArray[1] + "%'";
	            //					YearFlag=1;
	            //				}
	            //				else
	            //				{
	            //					strValue += " And  V.acvOutlayCode Like '" + tmpArray[1] + "%'";
	            //				}
	        }




	        if (document.all("DDLMonth").value != "") {
	            //if ( strValue !="" ){strValue += '|';}			

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(M1.acmMonth, M.acmMonth)=" + document.all("DDLMonth").value;
	                    break;
	                case "11":
	                    strValue += " And IsNull(M2.acmMonth, IsNull(M1.acmMonth, M.acmMonth))=" + document.all("DDLMonth").value;
	                    break;
	                case "12":
	                    strValue += " And IsNull(P.acpPayMonth, IsNull(M2.acmMonth, IsNull(M1.acmMonth, M.acmMonth)))=" + document.all("DDLMonth").value;
	                    break;
	                case "13":
	                    strValue += " And IsNull(P1.acpPayMonth, P.acpPayMonth)=" + document.all("DDLMonth").value;
	                    break;
	                default:
	                    strValue += " And M.acmMonth =" + document.all("DDLMonth").value;

	            }

	            //strValue += " And  M.acmMonth = " +  document.all("DDLMonth").value;


	        }




	        if (document.all("DDLPayKind").value != "") {
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(V1.acvPrePayFlag, V.acvPrePayFlag)='" + document.all("DDLPayKind").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(V2.acvPrePayFlag, IsNull(V1.acvPrePayFlag, V.acvPrePayFlag))='" + document.all("DDLPayKind").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV.acvPrePayFlag, IsNull(V2.acvPrePayFlag, IsNull(V1.acvPrePayFlag, V.acvPrePayFlag)))='" + document.all("DDLPayKind").value + "'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(PV1.acvPrePayFlag, PV.acvPrePayFlag)='" + document.all("DDLPayKind").value + "'";
	                    break;
	                default:
	                    strValue += " And V.acvPrePayFlag ='" + document.all("DDLPayKind").value + "'";

	            }

	            //strValue += " And V.acvPrePayFlag ='" +  document.all("DDLPayKind").value + "'";
	        }


	        if (document.all("TBMemo").value != "") {

	            //if ( strValue !="" ){strValue += '|';}
	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(M1.acmMemo, M.acmMemo) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(M2.acmMemo, IsNull(M1.acmMemo, M.acmMemo)) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(P.acpMemo, IsNull(M2.acmMemo, IsNull(M1.acmMemo, M.acmMemo))) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(P1.acpMemo, P.acpMemo) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                default:
	                    strValue += " And M.acmMemo Like '%" + document.all("TBMemo").value + "%'";

	            }

	            //strValue += " And M.acmMemo Like '%" + document.all("TBMemo").value + "%'";
	        }

	        if (document.all("TBAcvMemo").value != "") {
	            //strValue= strValue +  ' and M.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(V1.acvMemo, V.acvMemo) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(V2.acvMemo, IsNull(V1.acvMemo, V.acvMemo)) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV.acvMemo, IsNull(V2.acvMemo, IsNull(V1.acvMemo, V.acvMemo))) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(PV1.acvMemo, PV.acvMemo) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                default:
	                    strValue += " And V.acvMemo Like '%" + document.all("TBacvMemo").value + "%'";

	            }

	            //strValue += " And V.acvMemo Like '%" + document.all("TBacvMemo").value + "%'";
	        }

	        if (document.all("TBStaff").value != "") {
	            //strValue= strValue +  ' and M.acmWorkUserNo Like ' + "'" + document.all("TBStaff").value + "%'";
	            //if ( strValue !="" ){strValue += '|';}				
	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                case "13":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                default:
	                    strValue += " And M.acmWorkUserNo Like '" + document.all("TBStaff").value + "%'";

	            }
	            //strValue += " And M.acmWorkUserNo Like '"+  document.all("TBStaff").value + "%'";
	        }



	        if (document.all("TBMoney").value != "") {

	            //strValue= strValue +  ' and M.acmMoney = ' +  document.all("TBMoney").value ;
	            //if ( strValue !="" ){strValue += '|';}
	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(M1.acmMoney, M.acmMoney) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                case "11":
	                    strValue += " And IsNull(M2.acmMoney, IsNull(M1.acmMoney, M.acmMoney)) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                case "12":
	                    strValue += " And IsNull(P.acpMoney, IsNull(M2.acmMoney, IsNull(M1.acmMoney, M.acmMoney))) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                case "13":
	                    strValue += " And IsNull(P1.acpMoney, P.acpMoney) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                default:
	                    strValue += " And M.acmMoney = " + replaceString(document.all("TBMoney").value, ",", "");

	            }
	            //strValue += " And M.acmMoney = " + replaceString( document.all("TBMoney").value,",","");


	        }
	        if (document.all("TBacvMoney").value != "") {

	            //strValue= strValue +  ' and M.acmMoney = ' +  document.all("TBMoney").value ;
	            //if ( strValue !="" ){strValue += '|';}
	            switch ("<%=strStageFlag%>") {
	                case "3":
	                    strValue += " And IsNull(V1.acvMoney, V.acvMoney) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                case "11":
	                    strValue += " And IsNull(V2.acvMoney, IsNull(V1.acvMoney, V.acvMoney)) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV.acvMoney, IsNull(V2.acvMoney, IsNull(V1.acvMoney, V.acvMoney))) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                case "13":
	                    strValue += " And IsNull(PV1.acvMoney, PV.acvMoney) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                default:
	                    strValue += " And V.acvMoney = " + replaceString(document.all("TBacvMoney").value, ",", "");

	            }


	            //strValue += " And V.acvMoney = "  +  replaceString(document.all("TBacvMoney").value,",","");


	        }
	        returnValue = strValue;

	    }


	    returnValue = "Cancel";
	    function fnCancel() {
	        //var sData = dialogArguments;
	        //sData.sUserName = "";
	        //sData.fnUpdate();
	    }




	    function replaceString(sString, sReplaceThis, sWithThis) {
	        if (sReplaceThis != "" && sReplaceThis != sWithThis) {
	            var counter = 0;
	            var start = 0;
	            var before = "";
	            var after = "";

	            while (counter < sString.length) {
	                start = sString.indexOf(sReplaceThis, counter);
	                if (start == -1) {
	                    break;
	                }
	                else {
	                    before = sString.substr(0, start);
	                    after = sString.substr(start + sReplaceThis.length, sString.length);
	                    sString = before + sWithThis + after;
	                    counter = before.length + sWithThis.length;
	                }
	            }
	        }

	        return sString;
	    }




	    function fnGetInfoV1() {
	        var strValue = "";
	        var YearFlag = 0;

	        if (document.all("DDLAccKind").value != "") {
	            //strValue= ' V.acvAccKind' + '^0^' + document.all("DDLAccKind").value;

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue = " And IsNull(V1.acvAccKind, V.acvAccKind) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                case "3":
	                    strValue = " And IsNull(V2.acvAccKind, IsNull(V1.acvAccKind, V.acvAccKind)) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                case "11":
	                    strValue = " And IsNull(PV.acvAccKind, IsNull(V2.acvAccKind, IsNull(V1.acvAccKind, V.acvAccKind))) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                case "12":
	                    strValue = " And IsNull(PV1.acvAccKind, PV.acvAccKind) = '" + document.all("DDLAccKind").value + "'";
	                    break;
	                default:
	                    strValue = " And V.acvAccKind = '" + document.all("DDLAccKind").value + "'";

	            }



	        }

	        if (document.all("DDLbgtSource").value != "") {
	            //var tmpArray ;				 			 
	            //tmpArray=document.all("DDLbgtSource").value.split(":");
	            //if ( strValue !="" ){strValue += '|' ;}

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(V1.acvBgtSourceCode, V.acvBgtSourceCode) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(V2.acvBgtSourceCode, IsNull(V1.acvBgtSourceCode, V.acvBgtSourceCode)) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(PV.acvBgtSourceCode, IsNull(V2.acvBgtSourceCode, IsNull(V1.acvBgtSourceCode, V.acvBgtSourceCode))) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV1.acvBgtSourceCode, PV.acvBgtSourceCode) = '" + document.all("DDLbgtSource").value + "'";
	                    break;
	                default:
	                    strValue += " And V.acvBgtSourceCode= '" + document.all("DDLbgtSource").value + "'";

	            }


	            //strValue += " And V.acvBgtSourceCode= '" + document.all("DDLbgtSource").value + "'";
	        }


	        if (document.all("DDLBgtDep").value != "") {
	            //if ( strValue !="" ){strValue += '|' ;}				

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(P.acpBgtUnitNo, IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(P.acpBgtUnitNo, IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)))='" + document.all("DDLBgtDep").value + "'";
	                    break;
	                default:
	                    strValue += " And IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)='" + document.all("DDLBgtDep").value + "'";

	            }

	            //strValue += " And IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo)='"+ document.all("DDLBgtDep").value +"'";
	        }


	        if (document.all("DDLWorkDep").value != "") {
	            //if ( strValue !="" ){strValue += '|' ;}

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";
	                    break;
	                default:
	                    strValue += " And M.acmWorkUnitNo='" + document.all("DDLWorkDep").value + "'";

	            }

	            //strValue += " And M.acmWorkUnitNo='" + document.all("DDLWorkDep").value +"'";

	        }

	        alert("FF")
	        if (document.all("DDLWorkUnit").value != "") {
	            //if ( strValue !="" ){strValue += '|' ;}
	            alert("kk")
	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + document.all("DDLWorkUnit").value + "'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + document.all("DDLWorkUnit").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + document.all("DDLWorkUnit").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + document.all("DDLWorkUnit").value + "'";
	                    break;
	                default:
	                    strValue += " And V.acvBizCode='" + document.all("DDLWorkUnit").value + "'";

	            }
	            alert(document.all("DDLWorkUnit").value)
	        }







	        if (document.all("DDLPlan").value != "") {
	            var tmpArray;
	            tmpArray = document.all("DDLPlan").value.split(":");
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "2":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvPlanCode, V.acvPlanCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvPlanCode, V.acvPlanCode) Like " + tmpArray[1] + "%'";
	                    }

	                    break;

	                case "3":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear)) =" + tmpArray[0] + " And IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode)) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode)) Like " + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "11":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV.acvOutlayYear, IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear))) =" + tmpArray[0] + " And IsNull(PV.acvPlanCode, IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode))) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV.acvPlanCode, IsNull(V2.acvPlanCode, IsNull(V1.acvPlanCode, V.acvPlanCode))) Like " + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "12":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV1.acvOutlayYear, PV.acvOutlayYear) =" + tmpArray[0] + " And IsNull(PV1.acvPlanCode, PV.acvPlanCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV1.acvPlanCode, PV.acvPlanCode) Like " + tmpArray[1] + "%'";
	                    }

	                    break;
	                default:

	                    if (YearFlag == 0) {
	                        strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And V.acvPlanCode Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And  V.acvPlanCode Like " + tmpArray[1] + "%'";
	                    }

	            }

	            //				if (YearFlag==0)
	            //				{
	            //					strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And V.acvPlanCode Like '" + tmpArray[1] + "%'";
	            //					YearFlag=1;
	            //				}
	            //				else
	            //				{
	            //					strValue += " And  V.acvPlanCode Like " + tmpArray[1] + "%'";
	            //				}
	        }

	        if (document.all("DDLOul").value != "") {
	            var tmpArray;
	            tmpArray = document.all("DDLOul").value.split(":");
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "2":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear) =" + tmpArray[0] + " And IsNull(V1.acvOutlayCode, V.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V1.acvOutlayCode, V.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "3":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear)) =" + tmpArray[0] + " And IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode)) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode)) Like '" + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "11":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV.acvOutlayYear, IsNull(V2.acvOutlayYear, IsNull(V1.acvOutlayYear, V.acvOutlayYear))) =" + tmpArray[0] + " And IsNull(PV.acvOutlayCode, IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode))) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV.acvOutlayCode, IsNull(V2.acvOutlayCode, IsNull(V1.acvOutlayCode, V.acvOutlayCode))) Like " + tmpArray[1] + "%'";
	                    }

	                    break;
	                case "12":

	                    if (YearFlag == 0) {
	                        strValue += " And IsNull(PV1.acvOutlayYear, PV.acvOutlayYear) =" + tmpArray[0] + " And IsNull(PV1.acvOutlayCode, PV.acvOutlayCode) Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And IsNull(PV1.acvOutlayCode, PV.acvOutlayCode) Like " + tmpArray[1] + "%'";
	                    }

	                    break;
	                default:

	                    if (YearFlag == 0) {
	                        strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And V.acvOutlayCode Like '" + tmpArray[1] + "%'";
	                        YearFlag = 1;
	                    }
	                    else {
	                        strValue += " And  V.acvOutlayCode Like " + tmpArray[1] + "%'";
	                    }

	            }


	            //				if (YearFlag==0)
	            //				{
	            //					strValue += " And V.acvOutlayYear=" + tmpArray[0] + " And  V.acvOutlayCode Like '"+ tmpArray[1] + "%'";
	            //					YearFlag=1;
	            //				}
	            //				else
	            //				{
	            //					strValue += " And  V.acvOutlayCode Like '" + tmpArray[1] + "%'";
	            //				}
	        }




	        if (document.all("DDLMonth").value != "") {
	            //if ( strValue !="" ){strValue += '|';}			

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(M1.acmMonth, M.acmMonth)=" + document.all("DDLMonth").value;
	                    break;
	                case "3":
	                    strValue += " And IsNull(M2.acmMonth, IsNull(M1.acmMonth, M.acmMonth))=" + document.all("DDLMonth").value;
	                    break;
	                case "11":
	                    strValue += " And IsNull(P.acpPayMonth, IsNull(M2.acmMonth, IsNull(M1.acmMonth, M.acmMonth)))=" + document.all("DDLMonth").value;
	                    break;
	                case "12":
	                    strValue += " And IsNull(P1.acpPayMonth, P.acpPayMonth)=" + document.all("DDLMonth").value;
	                    break;
	                default:
	                    strValue += " And M.acmMonth =" + document.all("DDLMonth").value;

	            }

	            //strValue += " And  M.acmMonth = " +  document.all("DDLMonth").value;


	        }




	        if (document.all("DDLPayKind").value != "") {
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(V1.acvPrePayFlag, V.acvPrePayFlag)='" + document.all("DDLPayKind").value + "'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(V2.acvPrePayFlag, IsNull(V1.acvPrePayFlag, V.acvPrePayFlag))='" + document.all("DDLPayKind").value + "'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(PV.acvPrePayFlag, IsNull(V2.acvPrePayFlag, IsNull(V1.acvPrePayFlag, V.acvPrePayFlag)))='" + document.all("DDLPayKind").value + "'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV1.acvPrePayFlag, PV.acvPrePayFlag)='" + document.all("DDLPayKind").value + "'";
	                    break;
	                default:
	                    strValue += " And V.acvPrePayFlag ='" + document.all("DDLPayKind").value + "'";

	            }

	            //strValue += " And V.acvPrePayFlag ='" +  document.all("DDLPayKind").value + "'";
	        }


	        if (document.all("TBMemo").value != "") {

	            //if ( strValue !="" ){strValue += '|';}
	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(M1.acmMemo, M.acmMemo) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(M2.acmMemo, IsNull(M1.acmMemo, M.acmMemo)) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(P.acpMemo, IsNull(M2.acmMemo, IsNull(M1.acmMemo, M.acmMemo))) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(P1.acpMemo, P.acpMemo) Like '%" + document.all("TBMemo").value + "%'";
	                    break;
	                default:
	                    strValue += " And M.acmMemo Like '%" + document.all("TBMemo").value + "%'";

	            }

	            //strValue += " And M.acmMemo Like '%" + document.all("TBMemo").value + "%'";
	        }

	        if (document.all("TBAcvMemo").value != "") {
	            //strValue= strValue +  ' and M.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
	            //if ( strValue !="" ){strValue += '|';}

	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(V1.acvMemo, V.acvMemo) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(V2.acvMemo, IsNull(V1.acvMemo, V.acvMemo)) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(PV.acvMemo, IsNull(V2.acvMemo, IsNull(V1.acvMemo, V.acvMemo))) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV1.acvMemo, PV.acvMemo) Like '%" + document.all("TBacvMemo").value + "%'";
	                    break;
	                default:
	                    strValue += " And V.acvMemo Like '%" + document.all("TBacvMemo").value + "%'";

	            }

	            //strValue += " And V.acvMemo Like '%" + document.all("TBacvMemo").value + "%'";
	        }

	        if (document.all("TBStaff").value != "") {
	            //strValue= strValue +  ' and M.acmWorkUserNo Like ' + "'" + document.all("TBStaff").value + "%'";
	            //if ( strValue !="" ){strValue += '|';}				
	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                case "3":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                case "11":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                case "12":
	                    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
	                    break;
	                default:
	                    strValue += " And M.acmWorkUserNo Like '" + document.all("TBStaff").value + "%'";

	            }
	            //strValue += " And M.acmWorkUserNo Like '"+  document.all("TBStaff").value + "%'";
	        }



	        if (document.all("TBMoney").value != "") {

	            //strValue= strValue +  ' and M.acmMoney = ' +  document.all("TBMoney").value ;
	            //if ( strValue !="" ){strValue += '|';}
	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(M1.acmMoney, M.acmMoney) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                case "3":
	                    strValue += " And IsNull(M2.acmMoney, IsNull(M1.acmMoney, M.acmMoney)) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                case "11":
	                    strValue += " And IsNull(P.acpMoney, IsNull(M2.acmMoney, IsNull(M1.acmMoney, M.acmMoney))) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                case "12":
	                    strValue += " And IsNull(P1.acpMoney, P.acpMoney) = " + replaceString(document.all("TBMoney").value, ",", "");
	                    break;
	                default:
	                    strValue += " And M.acmMoney = " + replaceString(document.all("TBMoney").value, ",", "");

	            }
	            //strValue += " And M.acmMoney = " + replaceString( document.all("TBMoney").value,",","");


	        }
	        if (document.all("TBacvMoney").value != "") {

	            //strValue= strValue +  ' and M.acmMoney = ' +  document.all("TBMoney").value ;
	            //if ( strValue !="" ){strValue += '|';}
	            switch ("<%=strStageFlag%>") {
	                case "2":
	                    strValue += " And IsNull(V1.acvMoney, V.acvMoney) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                case "3":
	                    strValue += " And IsNull(V2.acvMoney, IsNull(V1.acvMoney, V.acvMoney)) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                case "11":
	                    strValue += " And IsNull(PV.acvMoney, IsNull(V2.acvMoney, IsNull(V1.acvMoney, V.acvMoney))) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                case "12":
	                    strValue += " And IsNull(PV1.acvMoney, PV.acvMoney) = " + replaceString(document.all("TBacvMoney").value, ",", "");
	                    break;
	                default:
	                    strValue += " And V.acvMoney = " + replaceString(document.all("TBacvMoney").value, ",", "");

	            }


	            //strValue += " And V.acvMoney = "  +  replaceString(document.all("TBacvMoney").value,",","");


	        }
	        returnValue = strValue;

	    }
        	
	</script> 
    
    
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="550">
            <tr>
                <td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
                    <table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>
                                <table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
                                    <tr>
                                        <td align="right" style="width: 80px"><FONT face="新細明體">門別</FONT></td>
                                        <td align="left" style="width: 200px"><asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList></td>
                                        <td align="right" style="width: 80px"><FONT face="新細明體">預算來源</FONT></td>
                                        <td align="left"><asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">經費單位</td>
                                        <td align="left" style="width: 200px"><asp:DropDownList id="DDLBgtDep" runat="server"></asp:DropDownList></td>
                                        <td align="right" style="width: 80px">承辦單位</td>
                                        <td align="left"><asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">承辦業務</td>
                                        <td align="left" style="width: 200px"><asp:DropDownList id="DDLWorkUnit" runat="server"></asp:DropDownList></td>
                                        <td align="right" style="width: 80px">簽證月份</td>
                                        <td align="left">
                                            <asp:dropdownlist id="DDLMonth" runat="server" AutoPostBack="True" Width="50px">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
                                                <asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
                                                <asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
                                                <asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
                                                <asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
                                                <asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
                                                <asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
                                                <asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
                                                <asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
                                                <asp:ListItem Value="10">10月</asp:ListItem>
                                                <asp:ListItem Value="11">11月</asp:ListItem>
                                                <asp:ListItem Value="12">12月</asp:ListItem>
                                            </asp:dropdownlist>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">計畫</TD>
                                        <td align="left" colspan="3"><asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">用途別</td>
                                        <td align="left" colspan="3"><asp:DropDownList id="DDLOul" runat="server" 
                                                Width="400px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">付款方式</td>
                                        <td align="left" style="width: 200px">
                                            <asp:DropDownList id="DDLPayKind" runat="server">
                                                <asp:ListItem Value="">......</asp:ListItem>
                                                <asp:ListItem Value="0">實付款</asp:ListItem>
                                                <asp:ListItem Value="1">暫付款</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" style="width: 80px;display:none">承辦人員</td>
                                        <td align="left" style="display:none"><asp:TextBox id="TBStaff" runat="server" Width="116px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">主檔事由</td>
                                        <td align="left" style="width: 200px"><asp:TextBox id="TBMemo" runat="server" Width="150px"></asp:TextBox></td>
                                        <td align="right" style="width: 80px">主檔金額</TD>
                                        <td align="left"><asp:TextBox id="TBMoney" runat="server" Width="116px" onkeypress="return check_Num()"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">用途說明</td>
                                        <td align="left" style="width: 200px"><asp:TextBox id="TBAcvMemo" runat="server" Width="150px"></asp:TextBox></td>
                                        <td align="right" style="width: 80px">動支金額</td>
                                        <td align="left"><asp:TextBox id="TBacvMoney" runat="server" Width="116px" onkeypress="return check_Num()"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                                <td><input id="BtnOK" type="button" value="確認" name="BtnOK" runat="server" style="WIDTH: 60px; HEIGHT: 22px" onclick="fnGetInfo();window.close();" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
