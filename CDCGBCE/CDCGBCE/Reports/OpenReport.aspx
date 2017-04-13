<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OpenReport.aspx.vb" Inherits="Reports.OpenReport" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
	<HEAD>
		<title>OpenReport</title>  <%--2016.08.29 for資安註解--%>
		<%--<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">--%> 
		<%--<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">--%>
		<%--<meta name="vs_defaultClientScript" content="JavaScript">--%>
	    <%--<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">--%>
	</HEAD>
<script type="text/javascript">  //<SCRIPT LANGUAGE="javascript">
var divCount = 20, nStatusCellIndex = 0;
function ChangeStatusColor(idx) {
    if (idx / divCount < 1) {    
       document.getElementById("tbl").rows[0].cells[idx].bgColor = "#BF5BC4";
       nStatusCellIndex++;
 }
 else {
  for (var j=0; j<divCount; j++) 
   document.getElementById("tbl").rows[0].cells[j].bgColor="silver";nStatusCellIndex = 0;
 }
}
function Start(){
    timerID = setInterval("ChangeStatusColor(nStatusCellIndex)", 100);
}
</script>

	<body MS_POSITIONING="GridLayout" bgcolor="#FFFAE8">	
	  <center>
				<table height="80%" valign="center" ID="Prss">
					<tr><td><table width="100%" ID="Table2">
								<tr><td align="center">資料處理中 ...</td></tr>
							</table>
							<table id="tbl" width="100%" cellpadding="1" cellspacing="1">
								<tr>
									<script language="javascript">
                                     for (var k = 0; k< divCount; k++) 
                                        document.write("<td bgColor='silver' width=8><br></td>\n");
									</script>
								</tr>
							</table>
						</td></tr>
				 </table>
		</center>		
	  <form id="Form1" method="post" name='Form1'>
		    <% 
                Dim HtmlStr As String
                Dim x As String
                For Each x In Request.QueryString
                    If StrComp(x, "_src", 1) <> 0 Then   '資安防禦 Reflected XSS All Clients\路徑 928: 
                        HtmlStr = HtmlStr & "<input type='HIDDEN' name='" & x & "' value='" & Request.QueryString(x) & "'>"
                    End If
                Next
                For Each x In Request.Form
                    If StrComp(x, "_src", 1) <> 0 Then
                        HtmlStr = HtmlStr & "<input type='HIDDEN' name='" & x & "' value='" & Request.Form(x) & "'>"
                    End If
                Next
                '20170217 17.60 查詢動支編號10600423，可是查詢出來的不是
                '輸出成元件編碼就錯了
                Response.Write(Server.HtmlDecode(Server.HtmlEncode(HtmlStr)))  '20161011 改成輸出前encode
            %>            			
		</form>
	  <script type="text/javascript"> //<SCRIPT LANGUAGE="javascript">
		if(top==self)
		{ self.moveTo(0,0); 
		  self.resizeTo(screen.availWidth,screen.availHeight); 
		}
		<% If Server.HtmlEncode(Request("_src") & "") <> "" Then
              Response.Write("Start();")
              If Request.QueryString.Count = 0 Then
                  Response.Write("document.Form1.method=""POST"";")
              Else
                  Response.Write("document.Form1.method=""GET"";")
              End If
              '20170217 17.60 查詢動支編號10600423，可是查詢出來的不是
              '輸出不能編碼會出錯
              Response.Write("document.Form1.action=""" & Server.HtmlDecode(Server.HtmlEncode(Request("_src"))) & """;")
              Response.Write("document.Form1.submit();")
          End If
		%>
		</SCRIPT>
	</body>	
</HTML>
