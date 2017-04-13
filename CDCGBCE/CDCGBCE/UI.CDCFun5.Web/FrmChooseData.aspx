<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmChooseData.aspx.vb" Inherits="UI.CDCFun5.Web.FrmChooseData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" EnableModelValidation="True" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <a >選取</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="補、捐 (獎)助計畫名稱">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("acmMemo") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="XX-Small" />
            </asp:TemplateField>
            <asp:BoundField DataField="subsidy_y" HeaderText="明定補助之條件標準(是)" >
            <HeaderStyle Font-Size="XX-Small" />
            </asp:BoundField>
            <asp:BoundField DataField="subsidy_n" HeaderText="明定補助之條件標準(否)" >
            <HeaderStyle Font-Size="XX-Small" />
            </asp:BoundField>
            <asp:BoundField DataField="finish_y" HeaderText="計畫執行情形(已完成)" >
            <HeaderStyle Font-Size="XX-Small" />
            </asp:BoundField>
            <asp:BoundField DataField="finish_n" HeaderText="計畫執行情形(未完成)" >
            <HeaderStyle Font-Size="XX-Small" />
            </asp:BoundField>
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
            <asp:BoundField />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <div>
    
    </div>
    </form>
</body>
</html>
