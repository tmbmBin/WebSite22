<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmDailyFee.aspx.vb" Inherits="UI.CDCTrl.Web.FrmDailyFee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   	<base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript" >
//        function fnGetInfo(parVal) {
//            returnValue = parVal;       
//        }
        
        returnValue = "Cancel";
 
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>


      <table style=" table-layout:fixed; margin-top:10px;margin-left:10px; border-collapse:collapse" bordercolor="#666668" cellpadding="5" width="500" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout:fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="BORDER-COLLAPSE: collapse" width="100%" border="0" cellpadding="1" cellspacing="0" >
                                    <tr style="display:none">
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="width:90px; text-align:right;" nowap>職級：</td>
                                        <td style="width:150px; text-align:left">
    <asp:DropDownList ID="DDLRankLevel" runat="server" AutoPostBack="True">
    </asp:DropDownList>
                                        </td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td style="width:90px; text-align:right">&nbsp;</td>
                                        <td style="width:150px; text-align:left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="text-align:Left" colspan="5">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" 
                                                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="選取">
                    <ItemTemplate>
                        <asp:CheckBox ID="ctl_Select" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="職級">                 
                    <ItemTemplate>
                        <asp:Label ID="LBRankLevel" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.職級名稱") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="住宿費">                 
                    <ItemTemplate>
                        <asp:Label ID="LBStay" runat="server" style="text-align:right"  Text='<%# format( DataBinder.Eval(Container, "DataItem.住宿費"), "#,0") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="膳雜費">                  
                    <ItemTemplate>
                        <asp:Label ID="LBMisce" runat="server" style="text-align:right"  Text='<%# format( DataBinder.Eval(Container, "DataItem.膳雜費"), "#,0") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Font-Size="Small" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
                                        </td>                                        
                                    </tr>                                    
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table  style="border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnOK" runat="server" Text="確認帶回"  />
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>



    </form>
</body>
</html>
