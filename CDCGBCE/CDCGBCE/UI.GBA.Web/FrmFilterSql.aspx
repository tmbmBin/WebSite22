<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmFilterSql.aspx.vb" Inherits="UI.GBA.Web.FrmFilterSql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmFilterSql</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<base target="_self">
		<script language="javascript">
		<!--
		
		function fnGetInfo(){
			var strValue="";
			var YearFlag=0;
			
			if (document.all("DDLAccKind").value !="")
			{
				strValue= ' MyDS.acvAccKind' + '^0^' + document.all("DDLAccKind").value;
			}
			

			if (document.all("DDLbgtSource").value !="")
			{
				
				if ( strValue !="" ){strValue += '|' ;}
				
				strValue += ' MyDS.acvBgtSourceCode' + '^0^' +document.all("DDLbgtSource").value;
			}


			if (document.all("DDLBgtDep").value !="")
			{
				if ( strValue !="" ){strValue += '|' ;}				
				strValue += ' M.acmBgtUnitNo' +'^0^' + document.all("DDLBgtDep").value;
			}


			if (document.all("DDLWorkDep").value !="")
			{
				if ( strValue !="" ){strValue += '|' ;}				
				strValue += ' MyDS.acmWorkUnitNo' + '^0^' + document.all("DDLWorkDep").value ;
			}

			if (document.all("DDLPlan").value !="")			
			{
				var tmpArray ;				 			 
				tmpArray=document.all("DDLPlan").value.split(":");			
				if ( strValue !="" ){strValue += '|';}
				
				if (YearFlag==0)
				{
					strValue += ' MyDS.acvOutlayYear'+ '^0^' + '| MyDS.acvPlanCode '+ '^1^' + tmpArray[1] + '%';
					YearFlag=1;
				}
				else
				{
					strValue += ' MyDS.acvPlanCode' + '^0^' + tmpArray[1];
				}
			}

			 if (document.all("DDLOul").value !="")
			{
				var tmpArray ;
				tmpArray=document.all("DDLOul").value.split(":");
				if ( strValue !="" ){strValue += '|';}			
				
				if (YearFlag==0)
				{
					strValue += ' MyDS.acvOutlayYear'+ '^0^' + '| MyDS.acvOutlayCode '+ '^0^' + tmpArray[1];
					YearFlag=1;
				}
				else
				{
					strValue += ' MyDS.acvOutlayCode' + '^0^' + tmpArray[1];
				}
			}
			 
			 
			 
			 	 
			if (document.all("TBMemo").value !="")
			{
				//strValue= strValue +  ' and A.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
				if ( strValue !="" ){strValue += '|';}			
				strValue += ' MyDS.acvMemo' + '^1^'+ '%' + document.all("TBMemo").value + '%';
			}
			 
			 
			 
			if (document.all("TBStaffName").value !="")
			{
			//strValue= strValue +  ' and A.acmWorkUserNo Like ' + "'" + document.all("TBStaff").value + "%'";
				if ( strValue !="" ){strValue += '|';}			
				strValue += ' MyDS.acmWorkUserNo' + '^1^'+  document.all("TBStaffName").value + '%';
			}
			 
			
		
		
			 
		
			 
		returnValue=strValue;
		 


			}


			returnValue="Cancel";
			function fnCancel(){
			//var sData = dialogArguments;
			//sData.sUserName = "";
			//sData.fnUpdate();
			}

		//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; WIDTH: 600px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellPadding="5" width="600" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellSpacing="1" cellPadding="1" border="0" width="100%">
										<tr>
											<td align="right" width="90">日期區間</td>
											<td colSpan="2"><asp:textbox id="TBBDate" runat="server" Width="80px">195/12/31</asp:textbox>至<asp:textbox id="TBEDate" runat="server" Width="80px">195/12/31</asp:textbox></td>
											<td></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90" style="DISPLAY:none">帳別名稱</td>
											<td width="160" style="DISPLAY:none"><asp:dropdownlist id="DDLTeamName" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" style="DISPLAY:none">年 度</td>
											<td align="left" style="DISPLAY:none"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90">預算來源</td>
											<td width="160"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90">經資門別</td>
											<td align="left"><asp:dropdownlist id="DDLAccKind" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90">經費單位</td>
											<td width="160"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="right" width="90">承辦業務</td>
											<td align="left"><font face="新細明體"><asp:dropdownlist id="DDLBiz" runat="server" Width="144px"></asp:dropdownlist></font></td>
										</tr>
										<tr>
											<td align="right" width="90">執行單位</td>
											<td width="160"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90">承辦人員</td>
											<td align="left"><asp:textbox id="TBStaffName" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90">動支編號</td>
											<td width="160"><asp:textbox id="TBacmWordNum" runat="server" Width="144px"></asp:textbox></td>
											<td align="right" width="90">案號名稱</td>
											<td align="left"><asp:textbox id="TBCaseNo" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr style="DISPLAY:none">
											<td align="right" width="90">摘要</td>
											<td width="160"><asp:textbox id="TBMemo" runat="server" Width="144px"></asp:textbox></td>
											<td align="right" width="90">廠商名稱</td>
											<td align="left"><asp:textbox id="TBPayName" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr>
											<td align="right" width="90">計畫名稱</td>
											<td colspan="3"><asp:DropDownList id="DDLPlan" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="90">用途別</td>
											<td colspan="3"><asp:DropDownList id="DDLOul" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="90"><INPUT id="BtnOK" style="WIDTH: 60px; HEIGHT: 22px" onclick="fnGetInfo();window.close();"
													type="button" value="確認" name="BtnOK" runat="server" Width="60px"></td>
											<td>
											</td>
											<td align="right"></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
