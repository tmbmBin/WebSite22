<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExcelEnter.aspx.vb" Inherits="UI.CashRpt.Web.ExcelEnter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Horizontal">
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:BoundField DataField="PlanName" HeaderText="PlanName" />
                <asp:BoundField DataField="oulName" HeaderText="oulName" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView><br />
        <asp:DataGrid runat="server" ID="DG" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundColumn DataField="PlanName" HeaderText="PlanName"></asp:BoundColumn>
                <asp:BoundColumn DataField="oulName" HeaderText="oulName"></asp:BoundColumn>
            </Columns>
            <HeaderStyle BackColor="#FF9999" />
        </asp:DataGrid>
    
        <asp:Button ID="Button1" runat="server" Text="轉報表" />
    
    </div>
    </form>
</body>
</html>
