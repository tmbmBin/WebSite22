<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashReject.aspx.vb" Inherits="UI.Cash.Web.FrmCashReject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
</head>
<body>
    <form id="form1" runat="server">
        <asp:datagrid id="DGCash" runat="server" Width="1000px" AutoGenerateColumns="False">
            <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
            <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
            <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
            <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>
            <Columns>
                    <asp:TemplateColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate><asp:CheckBox ID="CBdgSelect" runat="server" onclick="GetTotalCnt(this);"   />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="核退原因" >
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txt_csmRejectData" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.csmRejectData") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="動支編號" >
                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtn_acmWordNum" runat="server" CausesValidation="False" ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' OnClientClick="Get_EditStr(this);return false;" ><%# DataBinder.Eval(Container, "DataItem.acmWordNum") %></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>                                                              
                    <asp:TemplateColumn HeaderText="計畫名稱" >
                        <ItemTemplate>
                            <asp:Label ID="lab_plnPlanName" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.plnPlanName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="left" Wrap="False" Width="200px" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="用途別名稱" >
                        <ItemTemplate>
                            <asp:Label ID="lab_oulOutlayName" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.oulOutlayName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="left" Wrap="False" />
                    </asp:TemplateColumn>                                  
                    <asp:TemplateColumn HeaderText="金額" >
                        <ItemTemplate>
                            <asp:Label ID="LBdgMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPassMoney", "{0:#,#}") %>' MyName="LBdgMoney" MyIndex="<%# Container.ItemIndex %>"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="申請人"><HeaderStyle Width="80px" Wrap="False" /></asp:BoundColumn>
                   <asp:BoundColumn DataField="acvMemo" HeaderText="用途說明">
                       <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                   </asp:BoundColumn>
                   <asp:BoundColumn DataField="acmYear" HeaderText="acmYear-7" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acmNo" HeaderText="acmNo-8" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acvNo" HeaderText="acvNo-9" Visible="False"></asp:BoundColumn> 
                   <asp:BoundColumn DataField="acmNo1" HeaderText="acmNo1-10" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acvNo1" HeaderText="acvNo1-11" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acmNo2" HeaderText="acmNo2-12" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acvNo2" HeaderText="acvNo2-13" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acpPayYear" HeaderText="acpPayYear-14" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acpPayNo" HeaderText="acpPayNo-15" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="acvSubNo" HeaderText="acvSubNo-16" Visible="False"></asp:BoundColumn>
                   <asp:BoundColumn DataField="OrderFlag" HeaderText="OrderFlag-17" Visible="False"></asp:BoundColumn>     
            </Columns>
    </asp:datagrid>
    </form>
</body>
</html>
