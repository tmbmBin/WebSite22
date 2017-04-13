<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmActPayeePay.aspx.vb" Inherits="UI.OTPay.Web.FrmActPayeePay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <base target="_self" />
           <script language="javascript">

               function fnGetInfo() {
                   strValue = document.all("ctl_SessionID").value;
                   returnValue = strValue;

               }


               returnValue = "Cancel";
               function fnCancel() {
                   //var sData = dialogArguments;
                   //sData.sUserName = "";
                   //sData.fnUpdate();
               }
			
            </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="Table1" runat="server" style="margin-top: 0px; margin-left: 0px; border-collapse: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" bordercolor="#666668">
                                <table style="table-layout:fixed;" border="0">
                                    <tr>
                                        <td style="width:90px; text-align:right" >加班批號：</td>
                                        <td><asp:TextBox ID="ctl_AceWordNum" runat="server" Width="100px"></asp:TextBox></td>
                                    </tr>

                                </table>                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="table-layout:fixed; width:100%" border="0" >
                                    <tr>
                                        <td><asp:Button ID="btnList" runat="server" Text="列出資料" /></td>
                                        <td><asp:Button ID="btnOK" runat="server" Text="帶回資料" /><input id="ctl_SessionID" type="hidden" runat="server" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <br />
   
   
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
        CellSpacing="1" EnableModelValidation="True" GridLines="None" 
        AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="選取">
                <ItemTemplate>
                    <asp:CheckBox ID="CBdgSelect" runat="server" />                   
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="合併號碼" Visible="false">
                <ItemTemplate>
                    <asp:TextBox ID="TBdgGroupNo" runat="server" Width="50px"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="年度">
                <ItemTemplate>
                    <asp:Label ID="LBdgAcmYear" runat="server" Text='<%# Eval("年度") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="部門名稱">
                <ItemTemplate>
                    <input id="TBdgAcvBgtDepCode" runat="server" type="hidden" value='<%# Eval("部門代碼") %>' />
                    <asp:Label ID="LBdgAcvBgtDepName" runat="server" Text='<%# Eval("部門名稱") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="計畫名稱">
                <ItemTemplate>
                    <input id="TBdgAcvOutlayYear" runat="server" type="hidden" value='<%# Eval("科目年度別") %>' />
                    <input id="TBdgAcvPlanCode" runat="server" type="hidden" value='<%# Eval("計畫代碼") %>' />
                    <asp:Label ID="LBdgAcvPlanName" runat="server" Text='<%# Eval("計畫名稱") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用途別名稱">
                <ItemTemplate>                  
                    <input id="TBdgAcvOutlayCode" runat="server" type="hidden" value='<%# Eval("用途別代碼") %>' />
                    <asp:Label ID="LBdgAcvOutlayName" runat="server" Text='<%# Eval("用途別名稱") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="金額">
                <ItemTemplate>
                    <asp:Label ID="LBdgAcvMoney" runat="server" Text='<%# Format(Val(Eval("應付金額") &""),  "#,0") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="X-Small" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
   
   
    </form>
</body>
</html>
