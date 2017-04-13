<%@ Page Language="vb" EnableEventValidation="false" AutoEventWireup="false" CodeBehind="FrmAssignDep.aspx.vb" Inherits="UI.AssignDep.Web.FrmAssignDep" %>
<%@ Register src="../AppCtrlSearch/UCSelect.ascx" tagname="UCSelect" tagprefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <base target="_self"/>
    <script language="javascript" src="../ScriptFiles/JS_ActSearch_LBSelectFun.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="5" style="border-collapse: collapse; margin-top: 10px; margin-left: 10px; width:600px" bgcolor="#dadee9" border="0" >
            <tr>
                <td style="border-right:#666668 1pt solid; border-top:#666668 1pt solid; border-left:#666668 1pt solid; border-bottom:#666668 1pt solid">
                   <table style="border-collapse: collapse; border-color: #FFFFFF" cellpadding="1" border="1" width="100%">
                        <tr>
                            <td>
                               <uc1:UCSelect ID="UCSelect" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="BtnSave" runat="server" Text="存檔" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
