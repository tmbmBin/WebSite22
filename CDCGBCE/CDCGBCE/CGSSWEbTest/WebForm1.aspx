<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CGSSWebTest.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="SendXml" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="ShowXmL" />

         <asp:Button ID="Button3" runat="server" Text="SerachData" OnClick="Button3_Click" />

         <asp:Button ID="Button4" runat="server" Text="SendXml指定一筆" OnClick="Button4_Click" />

         <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>

           <asp:TextBox ID="TextBox3" runat="server" Height="400px" TextMode="MultiLine" Width="100%"></asp:TextBox>
    </div>
    </form>
</body>
</html>
