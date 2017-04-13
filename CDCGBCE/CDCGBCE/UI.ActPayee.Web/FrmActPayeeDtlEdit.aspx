<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActPayeeDtlEdit.aspx.vb"
    Inherits="UI.ActPayee.Web.FrmActPayeeDtlEdit" %>

<%@ Import Namespace="Microsoft.Security.Application" %>
<%@ Register Src="../UI.ActPayee.UC/UCActPayeeDtlEdit.ascx" TagName="UCActPayeeDtlEdit"
    TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FrmActPayeeDtlEdit</title>
    <base target="_self" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script type="text/javascript" language="javascript" src="../UI.ActPayee.UC/ScriptFiles/UCActPayeeDtlEdit.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="ctl_WhereSql" runat="server" type="hidden" />
        <input id="ctl_ParamsSessionID" runat="server" type="hidden" />

        <uc2:ucactpayeedtledit id="UCActPayeeDtlEdit1" runat="server" />
    </form>
</body>
</html>
