<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UI.GBATxt.Web.WebForm1"  ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="GetSafeHtmlFragment"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="GetSafeHtml"></asp:Label>
    
        <br />
        <asp:Label ID="Label3" runat="server" Text="HtmlEncode"></asp:Label>
     <asp:Label ID="Label4" runat="server" Text="NO Encode"></asp:Label>
    </div>
    </form>
</body>
</html>
