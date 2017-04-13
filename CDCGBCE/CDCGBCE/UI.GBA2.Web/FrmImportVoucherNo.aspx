<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmImportVoucherNo.aspx.vb" Inherits="UI.GBA2.Web.FrmImportVoucherNo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btn_Upload" runat="server" Height="20px" Text="上傳" Width="50px" />
        </div>
        <span style="display: none">
            <asp:Label ID="lbFilePath" runat="server" Text=""></asp:Label></span>
    </form>
</body>
</html>
