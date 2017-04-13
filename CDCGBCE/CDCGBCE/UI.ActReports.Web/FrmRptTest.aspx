<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptTest.aspx.vb" Inherits="UI.ActReports.Web.FrmRptTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server" Width="700px" Text="acmYear=98&acmNoPrv=669&acpPayYear=98&acpPayNo=1&acmWordNum=09800518&rptflag=Gen01.xls"></asp:TextBox>
        <asp:Button ID="btn_submit" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
