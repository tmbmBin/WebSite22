<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptMenu.aspx.vb" Inherits="UI.ActReports.Web.FrmRptMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <table style=" table-layout:fixed; margin-top:10px;margin-left:10px; border-collapse:collapse" bordercolor="#666668" cellpadding="5" width="500" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout:fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="BORDER-COLLAPSE: collapse" width="100%" border="0" cellpadding="1" cellspacing="0" >
                                    <tr style="display:none">
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="width:90px; text-align:right;" nowap>動支編號：</td>
                                        <td style="width:150px; text-align:left"><asp:Label ID="LBAacmWordNum" 
                                                runat="server"></asp:Label></td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="text-align:left" colspan="2">可列印報表如下：</td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="text-align:Left" colspan="5">
                                            <asp:RadioButtonList ID="RBRptList" runat="server">
                                            </asp:RadioButtonList>
                                        </td>                                        
                                    </tr>                                    
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table  style="border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnList" runat="server" Text="列出資料" Visible="False" />
                                            <asp:Button ID="BtnPrint" runat="server" Text="列印報表" />
                                            <asp:checkbox id="CBExcel" runat="server" Text="轉製成EXCEL" Checked="True" 
                                                Visible="False"></asp:checkbox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
123
	<iframe id="rptFrame" name="rptFrame" border="1" frameborder="1" width="100%" scrolling="no" height=100%  src="<%=strFrameSrc%>"></iframe>                             </td>

    </form>
</body>
</html>
