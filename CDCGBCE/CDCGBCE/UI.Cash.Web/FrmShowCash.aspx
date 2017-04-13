<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmShowCash.aspx.vb" Inherits="UI.Cash.Web.FrmShowCash" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
     <table style="FONT-SIZE: 12px; Z-INDEX: 101; LEFT: 0px; WIDTH: 160px; POSITION: absolute; TOP: 10px; HEIGHT: 60px; TEXT-ALIGN: right" cellSpacing="0" cellPadding="0" width="190" border="1" runat="server">
	    <tr>
			    <td style="width: 80px; background-color: Silver" align="center">期初零用金</td>
			    <td style="background-color:Silver">　
                    <asp:Label ID="LBInital" runat="server" Text="0" style="text-align:center"></asp:Label>
                </td>
		    </tr>
		    <tr>
			    <td style="width: 80px; background-color: #ffcccc" align="center">已領用金額</td>
			    <td style="background-color:#ffcccc">　
                    <asp:Label ID="LBPayTotal" runat="server" Text="0" style="text-align:center"></asp:Label>
                </td>
		    </tr>
		    <tr>
			    <td style="width: 80px; background-color: #ffffe0" align="center">已撥入金額</td>
			    <td style="background-color:#ffffe0">　
                    <asp:Label ID="LBInTotal" runat="server" Text="0" style="text-align:center"></asp:Label>
                </td>
		    </tr>
		    <tr>
			    <td style="width: 80px; background-color:#ccccff" align="center">未撥入金額</td>
			    <td style="background-color:#ccccff">　
                    <asp:Label ID="LBUnInTotal" runat="server" Text="0" style="text-align:center"></asp:Label>
                </td>
		    </tr>
		    <tr>
			    <td style="width: 80px; background-color:#ffcc66" align="center">零用金餘額</td>
			    <td style="background-color:#ffcc66">　
                    <asp:Label ID="LBMoneyLeft" runat="server" Text="0" style="text-align:center"></asp:Label>
                </td>
		    </tr>
		    <tr>
		        <td colspan="2">
		            <asp:DropDownList ID="ddl_Sort" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
		        </td>
		    </tr>
    </table>    
    </form>
</body>
</html>
