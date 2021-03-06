﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmOutBoxList.aspx.vb" Inherits="UI.EMail.Web.FrmOutBoxList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
    <script language="javascript" type="text/javascript" src="ScriptFiles/JSMailBox.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="700" bgcolor="#dadee9" border="1">
                <tr>
                    <td>
                        <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff"
                            cellpadding="1" width="100%" border="1">
                            <tr>
                                <td>
                                    <table style="table-layout: fixed; border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                        <tr>
                                            <td style="text-align: right; width: 90px">批號：</td>
                                            <td style="text-align: left; width: 120px">
                                                <asp:TextBox ID="ctl_mailGroupCode" runat="server" Width="100px"></asp:TextBox></td>
                                            <td style="text-align: right; width: 90px">主旨：</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="ctl_mailSubject" runat="server"
                                                    Width="350px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right; width: 90px">收件人：</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="ctl_mailTo" runat="server"
                                                    Width="100px"></asp:TextBox></td>
                                            <td style="text-align: right; width: 90px">內容：</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="ctl_mailContent" runat="server"
                                                    Width="350px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnList" runat="server" Text="列出資料" /></td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>

            <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="700" bgcolor="#dadee9" border="1">
                <tr>
                    <td>
                        <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnBatchSendMail" runat="server" Text="整批寄信" /></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>


                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
                                        CellPadding="3" CellSpacing="1" EnableModelValidation="True"
                                        Font-Size="Small" AllowPaging="True" PageSize="20">
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取">
                                                <HeaderStyle Width="30px" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBdgSelect" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="刪除" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("郵件系統號") %>'
                                                        CommandName="Delete" Text="刪除" OnClientClick="if(confirm('是否確定刪除此封郵件?')) return confirm('確定要刪除本封郵件?'); else return false;"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="郵件等級">
                                                <HeaderStyle Width="10px" />
                                                <HeaderTemplate>
                                                    <asp:Image ID="HeaderImageMark" runat="server" ImageUrl="images/mark03.ico" ToolTip="郵件等級" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="ImageMark" runat="server" ImageUrl="images/mark03.ico" ToolTip="郵件等級" Visible='<%# IIF( val(Eval("郵件等級") &"") =2 , True, False) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="附件">
                                                <HeaderStyle Width="10px" />
                                                <HeaderTemplate>
                                                    <asp:Image ID="HeaderImageAtt" Width="10px" runat="server" ImageUrl="images/paperclip01.ico" ToolTip="附件" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="ImageAtt" Width="10px" runat="server" ImageUrl="images/paperclip01.ico" ToolTip="附件" Visible='<%# IIF( val(Eval("附件數量") &"") >0 , True, False) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="序號">
                                                <HeaderStyle Width="40px" />
                                                <ItemTemplate>
                                                    <input id="ctl_mailYear" runat="server" type="hidden" value='<%# Eval("郵件年度") %>' />
                                                    <input id="ctl_mailNo" runat="server" type="hidden" value='<%# Eval("郵件系統號") %>' />
                                                    <asp:Label ID="LBdgDataNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="批號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMailGroupCode" runat="server" Text='<%# Eval("批號") %>' ToolTip='<%# Eval("郵件系統號") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="收件人">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMailTo" runat="server" Text='<%# Eval("收件人") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="主旨">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="LBdgMailSubject" NavigateUrl='<%# "FrmEMail.aspx?TableName=mmsOutBox&mailYear=" & Eval("郵件年度") &"&mailNo=" & Eval("郵件系統號") %>' runat="server" Text='<%# Eval("郵件主旨") %>' Target="_blank"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="寄件日期">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMailModifyDTime" runat="server" Text='<%# Eval("異動時間") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="寄信動作">
                                                <ItemTemplate>
                                                    <input id="LBSendMail" type="button" runat="server" value="寄信" onclick='<%# "if(confirm(" & chr(39) &"是否要寄送本封郵件?" & chr(39) &")) return OpenSendMailPage("& Eval("郵件年度") &"," & Eval("郵件系統號")  &"); else return false;" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
