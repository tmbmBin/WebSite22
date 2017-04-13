<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmAcvBgtSourCntEdit.aspx.vb" Inherits="UI.ActProdPay.Web.FrmAcvBgtSourCntEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <base target="_self" />
    <script type="text/javascript">


        function fnGetInfo(bnkSubNo) {           
            returnValue = bnkSubNo;         
        }


        returnValue = "Cancel";
        function fnCancel() {
         
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    預備金次數：<asp:TextBox ID="ctl_AcvBgtSourCnt" runat="server" Width="50px" style="text-align:center" ></asp:TextBox>
        <asp:Button runat="server" ID="btnSave" Width="60px" Text="存檔" />
    </div>
    </form>
</body>
</html>
