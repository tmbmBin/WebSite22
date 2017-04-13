<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchCash1.aspx.vb" Inherits="UI.Cash.Web.FrmSearchCash1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="No-cache" />
    <base target="_self" />
    <script type="text/javascript" language="javascript" >
   
  
        function fnGetInfo(){
            var strValue ="";
         
            if (document.all("TBCsmBatchNo").value != "")
			    {
			        strValue = " And IsNull(C1.csmBatchNo,'') = '" + document.all("TBCsmBatchNo").value + "'";
			    }

			    
			    if (document.all("TBAcmWordNum").value !="")
			    {
			        strValue += " And IsNull(IsNull(M.acmTopWordNum, M.acmSourWordNum), M.AcmWordNum)= '" + document.all("TBAcmWordNum").value + "'";
			    }
			    
			    

			    if (document.all("TBMemo").value !="")
			    {
				    strValue += " And IsNull(C1.csmMemo,'') Like '%"+ document.all("TBMemo").value +"%'";
			    }
			    
	            returnValue=strValue;
	    }


        returnValue="Cancel";

		
			
			
        function replaceString(sString, sReplaceThis, sWithThis) 
	        { 
		        if (sReplaceThis != "" && sReplaceThis != sWithThis)
		        {
			        var counter = 0;
			        var start = 0;
			        var before = "";
			        var after = "";
        			
			        while (counter<sString.length)
			        {
				        start = sString.indexOf(sReplaceThis, counter);
				        if (start == -1)
				        {
					        break;
				        }
				         else
				         {
					        before = sString.substr(0, start);
					        after = sString.substr(start + sReplaceThis.length, sString.length);
					        sString = before + sWithThis + after;
					        counter = before.length + sWithThis.length;
				        }
			        }
		        }
        		
		        return sString;
	        }
  
    
    
    
    
      	function check_Num(){
  	//alert("a");
				if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
					return true;}
				else{event.keyCode=0;false;}
		}
		

    
    
    
    
    
    
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
 	<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="550">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
										<tr>
											<td align="right" width="90">撥還批號：</td>
											<td align="left" width="150"><asp:TextBox id="TBCsmBatchNo" runat="server" Width="121px"></asp:TextBox></td>
											<td align="right" width="90">簽證編號：</td>
											<td align="left" ><asp:TextBox id="TBAcmWordNum" runat="server" Width="121px"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="90">備　　註：</td>
											<td align="left" colspan="3"><asp:TextBox id="TBMemo" runat="server" Width="365px"></asp:TextBox></td>
										</tr>
										</table>
								</td>
							</tr>
							<tr>
								<td><input id="BtnOK" type="button" value="確認" name="BtnOK" runat="server" style="width: 60px; HEIGHT: 22px" onclick="fnGetInfo();window.close();" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>    </form>
</body>
</html>
