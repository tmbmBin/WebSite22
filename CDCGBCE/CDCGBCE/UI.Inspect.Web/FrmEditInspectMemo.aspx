<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmEditInspectMemo.aspx.vb" Inherits="UI.Inspect.Web.FrmEditInspectMemo" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        	<meta HTTP-EQUIV="Pragma" CONTENT="No-cache" />
		<base target="_self">
		<script language="javascript">
            returnValue = "Cancel";
		    function fnGetInfo() {
		        if (document.all("TBMemo").value != "") {
		            returnValue = "Cancel";
		        }
		        else
		        { returnValue = document.all("TBMemo").value; }
		        
		    }

		    function fnGetData() {

		        // alert(<%=  AntiXss.HtmlEncode(Request.QueryString("acmpayname")) %>);
		     
		    }
		    //returnValue = <%=  AntiXss.HtmlEncode(Request.QueryString("acmpayname")) %>;

		  
          

        </script>

</head>
<body>
    <form id="form1" runat="server">
   	<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellPadding="5" width="600" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" 	border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="1" width="100%" border="0">
										<tr>
										    <td>
										        <table cellSpacing="0" cellPadding="1" width="100%" border="0">
										            <tr>
										                <td colspan=4 align="center"  >
                                                            <asp:Label ID="Label1" runat="server" Text="編輯就地審計說明事由"></asp:Label>
                                                        </td>										                
										            </tr>
										            <tr>
										                <td align="right" width="90">事由：</td>
										                <td colspan=3>
                                                            <asp:TextBox ID="TBMemo" runat="server" Width="450px" MaxLength="45"></asp:TextBox>
                                                        </td>
										            </tr>
										            <tr>
										                <td  align="right" width="100">&nbsp;</td>
										                <td colspan=3>
                                                            <asp:CheckBox ID="CBAll" runat="server" Text="整筆動支資料設為就地審計" />
                                                        </td>
										            </tr>
										            
										        </table>
										    </td>
										</tr>
									</table>
								</td>
							</tr>							
							<tr>
							    <td align="left">
							        <asp:button id="BtnSave" runat="server" Width="75px" Text="存檔" Height="22px" ></asp:button>
							        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" ForeColor="#FF3300"></asp:Label>
                                    </tr>
						</table>
					</td>
				</tr>
			</table>        </form>
</body>
</html>
