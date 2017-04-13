<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSendMailV1.aspx.vb" Async="true"  Inherits="UI.EMail.Web.FrmSendMailV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium"  ForeColor="Blue"></asp:Label>    
    </div>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        style="height: 19px">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>22</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="V0" />
    <p>
        <asp:Button ID="Button2" runat="server" Text="V1" />
    </p>
    <p>
        <asp:Button ID="Button3" runat="server" Text="V2" />
    </p>
    <p>
        <asp:Button ID="Button4" runat="server" Text="V3" />
    </p>
    </form>
</body>
</html>
