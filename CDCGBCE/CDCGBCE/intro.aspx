<%@ Page Language="VB" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="System.Net" %>
 
<script runat="server">
    'author:nickey
    'version:v2.0
    'date:96.5.18
    Dim Url As String
    
    Public strVer As String
    
    Sub Page_Load(ByVal Sender As Object, ByVal E As EventArgs)
        
        strVer = DB.Base.BIZ.BaseBiz.GetSysVer(Server.MapPath("") & "\Ver.txt", "")
	
    End Sub

</script>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title><%= System.Configuration.ConfigurationSettings.AppSettings("OrgShortName") %>｜<%= System.Configuration.ConfigurationSettings.AppSettings("SysName") %></title>
</head>
<body>
<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="95%">
	<tr>
		<td align="center">
		<table border="0" cellpadding="0" style="border-collapse: collapse">
			<tr>
				<td style="border-left: 1px solid #333333; border-right: 1px solid #333333; border-top: 1px solid #333333"><img border="0" style="margin-top: 15px; margin-bottom: 15px; margin-left: 40px; margin-right: 50px" src="images/logo.jpg"></td>
			</tr>
			<tr>
				<td align="center" height="75" valign="top" style="border-left: 1px solid #333333; border-right: 1px solid #333333; border-bottom: 1px solid #333333">
					<font face="標楷體" size="5"><%= System.Configuration.ConfigurationSettings.AppSettings("SysName") %></font><font face="標楷體" size="1" color="blue" ><b><%=strVer%></b></font><br>
					<table border="0" cellpadding="0" cellspacing="0" width="100%" height="50">
						<tr>
							<td align="center"><font size="1">作業期間</font><font size="7" color="#FF9900"><%=Session("default_Year") %></font><font size="1">年</font><font size="7" color="#FF9900"><%=Session("default_Month") %></font><font size="1">月</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</tr>
</table>
<div align="right"><font style="margin-right: 10px" face="Verdana" size="1"><%=  ToolsFun.MsDbFun.GetDbVal("SELECT 'Powered by Microsoft SQL Server ' + CONVERT(nvarchar,SERVERPROPERTY('ProductVersion')) + ' ' + CONVERT(nvarchar,SERVERPROPERTY('ProductLevel'))") %></font></div>
<div align="right"><font style="margin-right: 10px" face="Verdana" size="1"><%= "@" & IPAddress.Parse(Request.ServerVariables("REMOTE_ADDR")).ToString %></font></div>
</body>
</html>