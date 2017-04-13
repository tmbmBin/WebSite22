<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearch.aspx.vb" Inherits="UI.GBA2.Web.FrmSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <META http-equiv="Pragma" content="No-cache">
		<base target="_self">
		<script language="javascript">
		<!--

		    function fnGetInfo() {
		        var strValue = "";
		        var YearFlag = 0;

		        if (document.all("TBAcmWordNum").value != "") {

		            //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
		            //if ( strValue !="" ){strValue += '|';}			
		            strValue += " And M.acmWordNum='" + document.all("TBAcmWordNum").value + "'";


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
		//-->
		</script>
</head>
<body>
    <form id="form1" runat="server">
<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				bgcolor="#dadee9" width="550">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
										<TR>
											<TD align="right" width="100">動支編號</TD>
											<TD align="left" width="150"><asp:TextBox id="TBAcmWordNum" runat="server" Width="150px"></asp:TextBox></TD>
											<TD align="right" width="100">
											</TD>
											<TD align="left"></TD>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td><INPUT id="BtnOK" type="button" value="確認" name="BtnOK" runat="server" Width="60px" style="WIDTH: 60px; HEIGHT: 22px"
										onclick="fnGetInfo();window.close();"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </form>
</body>
</html>
