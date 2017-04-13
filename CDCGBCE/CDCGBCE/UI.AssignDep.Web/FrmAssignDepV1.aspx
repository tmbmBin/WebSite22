<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmAssignDepV1.aspx.vb" Inherits="UI.AssignDep.Web.FrmAssignDepV1" %>
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
                                <table style="table-layout:fixed; border-collapse:collapse" width="100%">
                                    <tr>
                                        <td width="90px"></td>
                                        <td></td>
                                        <td width="90px"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td align="right">核銷單位：</td>
                                        <td>
                                            <asp:DropDownList ID="DDLDepName" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right">核銷人員：</td>
                                        <td>
                                            <asp:TextBox ID="TB" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="right">核銷金額：</td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">備　　註：</td>
                                        <td colspan="5">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Horizontal">
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Font-Size="X-Small" />
            <HeaderStyle Font-Size="X-Small" />
            <Columns>
                <asp:TemplateField HeaderText="序號">                   
                    <ItemTemplate>
                        <asp:Label ID="LBdgAssNo" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="核銷單位">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="LBdgAcmAssDepName"  ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="核銷人員">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBdgAcmAssUserName" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="LBdgAcmAssUserNmae" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="核銷金額">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBdgAcmAssMoney" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LBdgAcmAssMoney" runat="server" style="text-align:right"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="備註">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBdgAcmAssMemo" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LBdgAcmAssMemo" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
    </form>
</body>
</html>
