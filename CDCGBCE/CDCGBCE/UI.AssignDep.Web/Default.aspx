<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="UI.AssignDep.Web._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
 	<frameset name="MyFrame" framespacing="0" border="0" frameborder="1" rows="*,330">
		<frame name="topFrame" src="<%=strTopUrl %>">
		<frame name="btmFrame" src="<%=strBtmUrl %>">
		<noframes>
		<body>

		<p>此網頁使用框架，但是您的瀏覽器不支援框架。</p>

		</body>
		</noframes>


	</frameset> 
</html>
