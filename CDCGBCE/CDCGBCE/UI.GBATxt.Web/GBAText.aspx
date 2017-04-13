<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GBAText.aspx.cs" Inherits="UI.GBATxt.Web.GBAText" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="80%">
        <tr>
            <td align="center" class="style1">
                <asp:Label ID="labDate" runat="server" Font-Bold="True" ForeColor="Black" 
                    Text="日期："></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtDate" runat="server" MaxLength="7"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="（例：0990101）"></asp:Label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="請輸滿7位0-9之數字" 
                    ValidationExpression="([0-9]){7}" ValidationGroup="Submit"></asp:RegularExpressionValidator>
            </td>
            <td align="center" class="style1">
                <asp:Label ID="labNumber" runat="server" Font-Bold="True" Text="流水號："></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtNumber" runat="server" Font-Italic="False" 
                    Font-Underline="False" MaxLength="1"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtNumber" Display="Dynamic" ErrorMessage="僅為能數字1~9及英文A~Z" 
                    ValidationExpression="([1-9]|[a-z]|[A-Z]){1}" ValidationGroup="Submit"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style1">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="匯出批號："></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtLotNumber" runat="server" MaxLength="8"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtLotNumber" Display="Dynamic" ErrorMessage="請輸入8位數之批號" 
                    ValidationExpression="([0-9]|[a-z]|[A-Z]){8}" ValidationGroup="Submit"></asp:RegularExpressionValidator>
            </td>
            <td align="center" class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style1" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style1" colspan="4">
                <asp:Button ID="butSearch" runat="server" onclick="butSearch_Click" Text="查詢" 
                    ValidationGroup="Submit" />
                　<asp:Button ID="butRe" runat="server" onclick="butRe_Click" Text="清空" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style1" colspan="4">
                       <br />
                       <asp:GridView ID="gvGBAList" runat="server" 
            AutoGenerateColumns="False" Height="50%" Width="80%" AllowPaging="True" 
                    onpageindexchanging="gvGBAList_PageIndexChanging" EmptyDataText="暫無相關資料！！" 
                           DataKeyNames="txtFileID">
                            <Columns>
                                <asp:BoundField HeaderText="檔名" DataField="txtFileName" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hydownload" runat="server" 
                                            NavigateUrl='<%# "Load.ashx?txtFileName="+ Eval("txtFileName") %> '>下載</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="txtUpdateDate" HeaderText="最後存取時間" />
                            </Columns>
                        </asp:GridView>
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>
