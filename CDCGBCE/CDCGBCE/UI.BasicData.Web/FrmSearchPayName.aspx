<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchPayName.aspx.vb" Inherits="UI.BasicData.Web.FrmSearchPayName" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meat http-equiv="Pragma" content="No-cache" />
    <base target="_self" />
    <script language="javascript" type="text/javascript">
    
    
      
      
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


    
        function fnGetInfo() {
            var strValue = "";
            if (document.all("TBpayCode").value != "")
            { strValue = " And payCode = '" +  replaceString(document.all("TBpayCode").value,"'","")  + "'"; }

            if (document.all("DDLPayKind").value != "") 
            {
                //alert(" And payKind= '" + document.all("DDLPayKind").value + "'");
                strValue += " And payKind= '" + replaceString(document.all("DDLPayKind").value,"'","")  + "'" ;
                //alert(strValue);
            }

            if (document.all("TBpayID").value != "") {
                strValue += " And payID='" + replaceString(document.all("TBpayID").value,"'","") + "'";
            }


            if (replaceString(document.all("TBpayName").value,"'","") != "") {
                strValue += " And payName Like '%" + replaceString(document.all("TBpayName").value,"'","")  + "%'";
            }

            if (replaceString(document.all("TBpayAliasNo").value,"'","") != "")
            { strValue += " And payAliasNo Like '%" + replaceString(document.all("TBpayAliasNo").value,"'","")  + "%'"; }
            
            
            if (document.all("DDLDepName").value != "")
            { strValue += " And N.dptCode ='" + replaceString(document.all("DDLDepName").value,"'","")  + "'"; }

            
            
            
            
            
           
            
            

            returnValue = strValue;
        }


        returnValue = "Cancel";
        function fnCancel() {

        }
  
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <table style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 width=100%>
            <tr>
                <td style="WIDTH: 120px; padding-right:2px" align="right" >受款人代碼</td>
                <td style="WIDTH: 160px"><asp:textbox id="TBpayCode" runat="server" MaxLength="12" Width="100px"></asp:textbox></td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" >受款人種類</td>
                <td>
                    <asp:DropDownList ID="DDLPayKind" runat="server">
                    <asp:ListItem Value="">......</asp:ListItem>
                    <asp:ListItem Value="0">其他</asp:ListItem>
                    <asp:ListItem Value="1">員工</asp:ListItem>
                    <asp:ListItem Value="2">專戶</asp:ListItem>
                    <asp:ListItem Value="3">債權人</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="WIDTH: 120px; padding-right:2px" align="right" >身分證號(統編)</td>
                <td style="WIDTH: 160px"><asp:textbox id="TBpayID" runat="server" MaxLength="12" Width="100px"></asp:textbox></td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" >&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="WIDTH: 120px; padding-right:2px" align="right" >受款人名稱</td>
                <td colspan="3"><asp:textbox id="TBpayName" runat="server" MaxLength="120" Width="420px"></asp:textbox></td>
            </tr >
            <tr style="display:none">
                <td style="WIDTH: 120px; padding-right:2px" align="right" >地址</td>
                <td colspan="3">
                    <asp:textbox id="TBpayZipCode" runat="server" MaxLength="10" Width="50px" ToolTip="郵遞區號"></asp:textbox>
                    <asp:textbox id="TBpayAddress" runat="server" MaxLength="86" Width="340px"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td style="WIDTH: 120px; padding-right:2px" align="right" >受款人簡稱</td>
                <td style="WIDTH: 160px"><asp:textbox id="TBpayAliasNo" runat="server" MaxLength="14" Width="150px"></asp:textbox></td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" ></td>
                <td></td>
            </tr>
            <tr >
                <td align="right" style="padding-right: 2px; width: 120px">
                    部門名稱</td>
                <td style="width: 160px">
                    <asp:DropDownList ID="DDLDepName" runat="server" TabIndex="8" Width="150px">
                    </asp:DropDownList></td>
                <td align="right" style="padding-right: 2px; width: 110px">
                </td>
                <td>
                </td>
            </tr>
            <tr  style="display:none">
                <td style="WIDTH: 120px; padding-right:2px" align="right" >連絡人(一)</td>
                <td style="WIDTH: 160px"><asp:textbox id="TBpayTalk1" runat="server" MaxLength="20" Width="150px"></asp:textbox></td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" >連絡電話(一)</td>
                <td><asp:textbox id="TBpayTel1" runat="server" MaxLength="20" Width="150px"></asp:textbox></td>
            </tr>
                <tr style="display:none">
                <td style="WIDTH: 120px; padding-right:2px" align="right" >連絡人(二)</td>
                <td style="WIDTH: 160px"><asp:textbox id="TBpayTalk2" runat="server" MaxLength="20" Width="150px"></asp:textbox></td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" >連絡電話(二)</td>
                <td><asp:textbox id="TBpayTel2" runat="server" MaxLength="20" Width="150px"></asp:textbox></td>
            </tr>
            <tr style="display:none">
                <td style="WIDTH: 120px; padding-right:2px" align="right" >&nbsp;</td>
                <td style="WIDTH: 160px">&nbsp;</td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" >&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr >
                <td style="WIDTH: 120px; padding-right:2px" align="right" >
                    <input id="BtnOK" type="button" value="確認" name="BtnOK" runat="server" Width="60px" style="WIDTH: 60px; HEIGHT: 22px" onclick="fnGetInfo();window.close();">
                </td>
                <td style="WIDTH: 160px">&nbsp;</td>
                <td style="WIDTH: 110px; padding-right:2px" align="right" >&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
     </form>
</body>
</html>
