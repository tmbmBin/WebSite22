<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSortBudget.aspx.vb" Inherits="UI.Budget.Web.FrmSortBudget" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    	<META http-equiv="Pragma" content="No-cache">
		<base target="_self">
		<script language="javascript">
		<!--
		
		    function fnGetInfo() {
		        var strValue = "";
		        if (document.all("DDLDep").value != "") {
		            //strValue= ' and accExch.accNo like ' + "'"+ document.all("TBAccID").value + "%'";

		            if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '1') {
		                strValue = " and A.bgtDepCode like '" + document.all("DDLDep").value + "%'";
		            }
		            else if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '2') {
		                strValue = " and F.pdpDepCode = '" + document.all("DDLDep").value + "'";
		            }
		        }

		        if (document.all("DDLPlan").value != "") {
		            var tmpArray;
		            tmpArray = document.all("DDLPlan").value.split(":");

		            if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '1') {

		                //alert(tmpArray[0]);
		                //alert(tmpArray[1]);
		                strValue = strValue + " and A.bgtOutlayYear= " + tmpArray[0] + "  and A.bgtPlanCode Like '" + tmpArray[1] + "%'";
		            }
		            else if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '2') {
		                strValue = strValue + " and F.pdpPlanCode Like '" + tmpArray[1] + "%'";
		            }
		        }

		        if (document.all("DDLOutlay").value != "") {
		            var tmpArray;
		            tmpArray = document.all("DDLOutlay").value.split(":");
		            //alert (tmpArray[0]);				
		            //strValue= strValue +  " and A.pdpOutlayYear= " +  tmpArray[0] + " and A.bgtOutlayCode = '"+ tmpArray[1] +"'";


		            if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '1') {

		                //alert(tmpArray[0]);
		                //alert(tmpArray[1]);
		                strValue = strValue + " and A.bgtOutlayYear= " + tmpArray[0] + "  and A.bgtOutlayCode Like '" + tmpArray[1] + "%'";

		            }
		            else if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '2') {
		                strValue = strValue + " and F.pdpPlanCode Like '" + tmpArray[1] + "%'";
		            }
		        }

		        if (document.all("TBPlanName").value != "") {
		            if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '1') {
		                strValue = strValue + " and P.plnPlanName like '%" + document.all("TBPlanName").value + "%'";
		            }
		            else if ('<%=AntiXss.HtmlEncode(Request.QueryString("showtype"))%>' == '2') {
		                strValue = strValue + " and P.plnPlanName like '%" + document.all("TBPlanName").value + "%'";
		            }
		        }

		        returnValue = strValue;
		    }


			returnValue="Cancel";
			function fnCancel() {
			    //var sData = dialogArguments;
			    //sData.sUserName = "";
			    //sData.fnUpdate();
			}

		//-->
		</script>
</head>
<body>
    <form id="form1" runat="server">
				<TABLE cellSpacing="1" cellPadding="1" bgColor="#dadee9" border="0">
					<TR>
						<TD style="WIDTH: 88px">經&nbsp;費&nbsp; 單 位</TD>
						<TD><asp:dropdownlist id="DDLDep" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 88px">計 畫 &nbsp;科 目</TD>
						<TD><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 88px">用途別科目</TD>
						<TD><asp:dropdownlist id="DDLOutlay" runat="server"></asp:dropdownlist></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 88px">計 畫&nbsp;&nbsp;名 稱</TD>
						<TD><asp:textbox id="TBPlanName" runat="server"></asp:textbox><br>
							<asp:Label id="Label1" runat="server" ForeColor="DarkGreen" Font-Size="Small">輸入計畫名稱字串，查詢含有相關字的計畫名稱</asp:Label></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 89px"></TD>
						<TD><INPUT id="Button1" style="WIDTH: 72px; HEIGHT: 24px" onclick="fnGetInfo();window.close();"
								type="button" value="搜尋" name="Button1" runat="server"></TD>
						<TD></TD>
						<TD></TD>
					</TR>
				</TABLE>
    </form>
</body>
</html>
