<%@ Page EnableEventValidation="false" Language="vb" AutoEventWireup="false" CodeBehind="FrmPrint01.aspx.vb" Inherits="UI.ActDataSearch.Web.FrmPrint01" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register src="../AppCtrlSearch/UCSelect.ascx" tagname="UCSelect" tagprefix="uc1" %>
<%@ Register src="../AppCtrlSearch/UCWhere.ascx" tagname="UCWhere" tagprefix="uc2" %>
  
 
<html >
<head runat="server">
    <title></title>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />

    <script language="javascript" src="../ScriptFiles/JS_ActSearch_LBSelectFun.js"></script>

    <script language="javascript" type="text/javascript">
		function UCBDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}
		function UCEDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}
	

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="810" bgcolor="#dadee9">
        <tr>
            <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                    <tr >
                        <td> 
                            <table id="Table1" runat="server" style="table-layout:fixed" cellpadding="1" cellspacing="0" border="0" >
                                <tr>
                                    <td style="width:310px; text-align:left"><uc1:UCSelect ID="UCSelect" runat="server" /></td>
                                    <td style="width:310px; text-align:left"><uc1:UCSelect ID="UCGroup" runat="server" /></td>
                                    <td style="width:310px; text-align:left"><uc1:UCSelect ID="UCOrder" runat="server" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr >
                    <tr >
                        <td>
                            <uc2:ucwhere ID="UCWhere" runat="server" />
                        </td>
                    </tr >
                    <tr>
                        <td>
                            <table id="Table2" runat="server" style="table-layout:fixed" cellpadding="1" cellspacing="0" border="0" >
                                <tr>
                                    <td><asp:Button ID="BtnList" runat="server" Text="列出資料" /></td>
                                    <td><asp:Button ID="BtnPrint" runat="server" Text="列印資料" />
                                        <asp:CheckBox ID="CBDownLoad" runat="server" Checked="True" Text="轉製成Excel報表" 
                                            Visible="False" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>      
    </table>    
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    
    </form>
</body>
</html>
