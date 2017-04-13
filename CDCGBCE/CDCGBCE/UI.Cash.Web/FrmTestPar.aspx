<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmTestPar.aspx.vb" Inherits="UI.Cash.Web.FrmTestPar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <base target="_self" />
    <script type="text/javascript">
        function ReturnStr() {
            var EditStr = document.getElementById('Select_Plan').value + '｜' + document.getElementById('Select_Outlay').value;
            if (window.showModalDialog) {
                window.returnValue = EditStr;
                window.close();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        計畫名稱：
        <select id="Select_Plan">
            <option value="302010702 提升傳染病防治醫療網功能業務">302010702 提升傳染病防治醫療網功能業務</option>
            <option value="302011106 六分局業務">302011106 六分局業務</option>
            <option value="302010804 提升國民整體防疫知能業務">302010804 提升國民整體防疫知能業務</option>
        </select><br />
        用途別名稱：<select id="Select_Outlay">
            <option value="022102 規費">022102 規費</option>
            <option value="027101 消耗品">027101 消耗品</option>
            <option value="027901 一般事務費">027901 一般事務費</option>
            <option value="028301 車輛及辦公器具養護費">028301 車輛及辦公器具養護費</option>
        </select><br /><br />
        <input id="Button1" type="button" value="傳回" onclick="ReturnStr();" runat="server" />
    </div>
    </form>
</body>
</html>
