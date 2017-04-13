<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmBatchCopy.aspx.vb" Inherits="UI.BasicData.Web.FrmBatchCopy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
       <meta http-equiv="Pragma" content="No-cache" />
   <meta http-equiv="Cache-Control" content="no-cache" /> 

</head>
<body>
    <form id="form1" runat="server">
         <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>從
                                   <asp:dropdownlist id="DDLSourceYear" runat="server" Width="72px"></asp:dropdownlist>年度拷貝至
                                   <asp:dropdownlist id="DDLTargetYear" runat="server" Width="72px"></asp:dropdownlist>年度
                                </td>
                           </tr>
                           <tr>
                                <td><asp:CheckBox id="CBPlan" runat="server" Text="總帳科目代碼"></asp:CheckBox></td>
                           </tr>
                           <tr>
                                <td><asp:CheckBox id="CBOul" runat="server" Text="用途別科目代碼"></asp:CheckBox></td>
                           </tr>
                           <tr>
                                <td><asp:CheckBox id="CBAccCode" runat="server" Text="會計科目代碼"></asp:CheckBox></td>
                           </tr>
                           <tr>
                                <td><asp:button id="BtnCopy" runat="server" Width="75px" Text="拷貝" Height="22px"></asp:button></td>
                           </tr>
                       </table>
                   </td>
               </tr>               
           </table>
    </form>
    
</body>
</html>
