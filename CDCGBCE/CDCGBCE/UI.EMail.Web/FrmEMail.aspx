<%@ Page Language="vb" validateRequest="false" AutoEventWireup="false" CodeBehind="FrmEMail.aspx.vb" Inherits="UI.EMail.Web.FrmEMail" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="800" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff"
                        cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style=" table-layout:fixed; border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td style="text-align: right; width:90px">寄件人：</td>
                                        <td style="text-align: left"><asp:TextBox ID="ctl_mailFrom" runat="server" 
                                                DBFieldName="mailFrom" Width="230px"></asp:TextBox></td>
                                        <td style="text-align: right; width:90px">回覆地址：</td>
                                        <td style="text-align: left"><asp:TextBox ID="ctl_mailAddrReply" runat="server" 
                                                DBFieldName="mailAddrReply" Width="230px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">收件人：</td>
                                        <td style="text-align: left" colspan="3"><asp:TextBox ID="ctl_mailTo" 
                                                runat="server" DBFieldName="mailTo" Width="572px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">副本：</td>
                                        <td style="text-align: left" colspan="3"><asp:TextBox ID="ctl_mailCC"  
                                                runat="server" DBFieldName="mailCC" Width="572px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">密件副本：</td>
                                        <td style="text-align: left" colspan="3"><asp:TextBox ID="ctl_mailBCC" 
                                                runat="server" DBFieldName="mailBCC" Width="572px"></asp:TextBox></td></tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">&nbsp;</td>
                                        <td style="text-align: left" colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table style="table-layout:fixed; width:100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right; width:88px">等級：</td>
                                                    <td style="text-align: left; width:120px">
                                                        <asp:DropDownList ID="ctl_mailPriority" runat="server" DBFieldName="mailPriority">
                                                            <asp:ListItem Value="">預設</asp:ListItem>
                                                            <asp:ListItem Value="0">普通</asp:ListItem>
                                                            <asp:ListItem Value="1">低層級</asp:ListItem>
                                                            <asp:ListItem Value="2">重要</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: right; width:120px"><asp:CheckBox ID="ctl_mailReadNotification"     runat="server" Text="讀取回條：" TextAlign="Left" DBFieldName="mailReadNotification" /></td>
                                                    <td style="text-align: right; width:120px"><asp:CheckBox ID="ctl_mailDeliveryNotification" runat="server" Text="送達回條：" TextAlign="Left" DBFieldName="mailDeliveryNotification" /></td>                                   
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">&nbsp;</td>
                                        <td style="text-align: left" colspan="3">
                                                                    <asp:Button ID="btnSend" runat="server" Text="傳送" Visible="False" />
                                                                    <asp:Button ID="btnSave" 
                                                                        runat="server" Text="存檔" Visible="False" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">主旨：</td>
                                        <td style="text-align: left" colspan="3"><asp:TextBox ID="ctl_mailSubject" 
                                                runat="server" DBFieldName="mailSubject" Width="572px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">附件：</td>
                                        <td style="text-align: left" colspan="3">
                                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" 
                                                RepeatDirection="Horizontal">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" Visible="false" runat="server" NavigateUrl='<%# "DownloadFiles.ashx?tableName=mmsOutBoxAttachment&mailyear=" & Eval("mailYear") &"&mailno="& Eval("mailNo")  &"&attno="&  Eval("attNo")  %>' Target="_blank" Text='<%# Eval("attFileName")%>'><%# Eval("attFileName")%></asp:HyperLink>
                                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "FrmDownloadFile.aspx?tableName=mmsOutBoxAttachment&mailyear=" & Eval("mailYear") &"&mailno="& Eval("mailNo")  &"&attno="&  Eval("attNo")  %>' Target="_blank" Text='<%# Eval("attFileName")%>'><%# Eval("attFileName")%></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width:90px">內容：</td>
                                        <td style="text-align: left" colspan="3">
                                            <table style="table-layout:fixed; width:100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><asp:CheckBox ID="ctl_mailContentFormat" runat="server" Text="HTML內容：" TextAlign="Left" DBFieldName="mailContentFormat" /></td>
                                                    <td style="text-align: right; width:90px">內容編碼：</td>
                                                    <td>
                                                        <asp:DropDownList ID="ctl_mailContentEncoding" runat="server" DBFieldName="mailContentEncoding">
                                                            <asp:ListItem Value="">預設</asp:ListItem>
                                                            <asp:ListItem Value="0">UTF8</asp:ListItem>
                                                            <asp:ListItem Value="1">Big5</asp:ListItem>
                                                            <asp:ListItem Value="2">Unicode</asp:ListItem>
                                                            <asp:ListItem Value="3">ASCII</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: right; width:90px">主旨編碼：</td>
                                                    <td>
                                                        <asp:DropDownList ID="ctl_mailSubjectEncoding" runat="server" DBFieldName="mailSubjectEncoding">
                                                            <asp:ListItem Value="">預設</asp:ListItem>
                                                            <asp:ListItem Value="0">UTF8</asp:ListItem>
                                                            <asp:ListItem Value="1">Big5</asp:ListItem>
                                                            <asp:ListItem Value="2">Unicode</asp:ListItem>
                                                            <asp:ListItem Value="3">ASCII</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; " colspan="4">
                                            <CKEditor:CKEditorControl ID="ctl_mailContent" DBFieldName="mailContent" BasePath="~\ckeditor" runat="server" width="100%" Height="300">
                                            </CKEditor:CKEditorControl>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
     
                    </table>
                </td>
            </tr>             
        </table>

    </div>
        <input id="ctl_MailYear" runat="server" type="hidden" DBFieldName="mailYear" />
   
        <input id="ctl_MailNo" runat="server" type="hidden" DBFieldName="mailNo" />
         <input id="ctl_mailCreateDTime" runat="server" type="hidden" DBFieldName="mailCreateDTime" />
           <input id="ctl_mailCreateUser" runat="server" type="hidden" DBFieldName="mailCreateUser" />

    </form>    

</body>
</html>
