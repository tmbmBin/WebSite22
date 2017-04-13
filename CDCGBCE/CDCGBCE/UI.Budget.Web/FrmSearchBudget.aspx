<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchBudget.aspx.vb" Inherits="UI.Budget.Web.FrmSearchBudget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    		<META http-equiv="Pragma" content="No-cache">
		<base target="_self">
		<script language="javascript">
		<!--
		
		function fnGetInfo(){
			var YearFalg;
			var strValue="";
			  YearFlag=0;
			if (document.all("DDLAccKind").value !="")
			{
				strValue= ' And B.bgtAccKind = ' + "'"+ document.all("DDLAccKind").value + "'";
				//strValue= ' B.bgtAccKind' + '^' + '0' +'^'  + document.all("DDLAccKind").value ;
			}

			if (document.all("DDLbgtSource").value !="") //預算來源
			
			{
				//var tmpArray ;				 			 
				//tmpArray=document.all("DDLbgtSource").value.split(":");			
				//strValue= strValue + ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtBgtSourceCode = ' + "'"+tmpArray[1] + "'";	
				//if ( strValue !="" )
				//{strValue += ' And ' ;
				//}
				
				//strValue= strValue +  ' B.bgtOutlayYear'   + '^' + '0' +'^'  + tmpArray[0] + '| B.bgtBgtSourceCode'   + '^' + '0' +'^'  + tmpArray[1] ;	
				strValue= strValue + ' And  B.bgtBgtSourceCode = ' + "'"+ document.all("DDLbgtSource").value  + "'";	
				YearFlag=1;	
				
			}


			if (document.all("DDLBgtDep").value !="") 　　//經費單位　　
			{
				//if ( strValue !="" )
				//{strValue += '|';
				//}
				strValue= ' and B.bgtDepCode = ' + "'"+ document.all("DDLBgtDep").value + "'";
				//strValue += ' B.bgtDepCode'   + '^' + '0' +'^'  +  document.all("DDLBgtDep").value ;
			}

			if (document.all("DDLWorkDep").value !="")  //執行單位
			{
			
				//if ( strValue !="" )
				//{strValue += '|';
				//}
				//strValue += ' B.bgtWorkUnitNo'  + '^' + '0' +'^'  + document.all("DDLWorkDep").value ;
				strValue += ' And IsNull ( B.bgtWorkUnitNo, B.bgtDepCode )= ' + "'" + document.all("DDLWorkDep").value + "'" ;
				
				//if ( document.all("DDLBgtDep").value == document.all("DDLWorkDep").value ) 
				//{
				//	if (document.all("DDLBgtDep").value !="") 
				//	{
				//		strValue += ' And ( IsNulL(B.bgtWorkUnitNo = ' + "'" +   document.all("DDLWorkDep").value + "'" +  ' Or  B.bgtWorkUnitNo Is Null ) '  ;								
				//	}
				//}
				//else
				//{
				//	strValue += ' And IsNull ( B.bgtWorkUnitNo, B.bgtDepCode )= ' + "'" + document.all("DDLWorkDep").value + "'" ;								
				//}
			}

			if (document.all("DDLPlan").value !="")			
			{
			
			
				var tmpArray ;				 			 
				tmpArray=document.all("DDLPlan").value.split(":");			
				//strValue= strValue +  ' and B.bgtPlanCode = ' + "'"+ tmpArray[1] +"'";
				//strValue= strValue +  ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtPlanCode = ' + "'"+ tmpArray[1] +"'";
				//if ( strValue !="" )
				//{strValue += '|';
				//}
				
				if (YearFlag==0)
				{
					//strValue += ' B.bgtOutlayYear'   + '^' + '0' +'^'  + tmpArray[0] + '| B.bgtPlanCode'  + '^' + '1' +'^'  +tmpArray[1] + '%';
					strValue= strValue +  ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtPlanCode Like ' + "'"+ tmpArray[1] +"%'";
					YearFlag=1;
				}
				else
				{
					strValue += ' B.bgtPlanCode Like ' + "'"  + tmpArray[1] + "%'" ;
				}
				
			}

			 if (document.all("DDLOul").value !="")
			{
				var tmpArray ;
				tmpArray=document.all("DDLOul").value.split(":");
				
				//if ( strValue !="" )
				//{strValue += '|';
				//}
							
				//strValue= strValue +  ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtOutlayCode = ' + "'"+ tmpArray[1] +"'";
		
				
				if (YearFlag==0)
				{
					//strValue +=   ' B.bgtOutlayYear'  + '^' + '0' +'^'  +  tmpArray[0] + '| B.bgtOutlayCode'   + '^' + '0' +'^'  +  tmpArray[1] ;
					strValue= strValue +  ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtOutlayCode = ' + "'"+ tmpArray[1] +"'";
					YearFlag=1;
				}
				else
				{
					strValue +=   ' And B.bgtOutlayCode Like ' +"'"+  tmpArray[1] +"%'" ;
				}
							
				
			}
			 
			 
			 
			  if (document.all("DDLWorkUnit").value !="") //承辦業務別
			{
				var tmpArray ;
				tmpArray=document.all("DDLWorkUnit").value.split(":");
				
				//if ( strValue !="" )
				//{strValue += '|';
				//}
							
				//strValue= strValue +  ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtOutlayCode = ' + "'"+ tmpArray[1] +"'";
		
				
				if (YearFlag==0)
				{
					//strValue +=   ' B.bgtOutlayYear'  + '^' + '0' +'^'  +  tmpArray[0] + '| B.bgtBizCode'   + '^' + '0' +'^'  +  tmpArray[1] ;
					strValue= strValue +  ' and B.bgtOutlayYear= ' +  tmpArray[0] + ' and B.bgtOutlayCode = ' + "'"+ tmpArray[1] +"'";
					YearFlag=1;
				}
				else
				{
					strValue +=   ' And B.bgtBizCode =' + "'" +  tmpArray[1] + "'" ;
				}
							
				
			}


			if (document.all("TBbgsNo").value != "") //序號
			{
 
			    strValue += ' And A.bgsNo = ' + document.all("TBbgsNo").value;

			}

			if (document.all("TBMemo").value != "") {

			    strValue += " And A.bgsMemo Like '%" + document.all("TBMemo").value + "%'";
			}



			if (document.all("TBMoney").value != "") {

			    //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
			    //if ( strValue !="" ){strValue += '|';}
			    strValue += " And B.bgtMoney = " + document.all("TBMoney").value;


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
</head>
<body>
    <form id="form1" runat="server">
			<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				bgcolor="#dadee9" width="550">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
										<tr>
											<td align="right" width="100"><FONT face="新細明體">門別</FONT></td>
											<td align="left" width="200">
												<asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList></td>
											<td align="right" width="100"><FONT face="新細明體">預算來源</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList></FONT></td>
										</tr>
										<tr>
											<td align="right" width="100"><FONT face="新細明體">經費單位</FONT></td>
											<td align="left" width="200"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtDep" runat="server"></asp:DropDownList></FONT></td>
											<td align="right" width="100"><FONT face="新細明體">執行單位</FONT></td>
											<td align="left">
												<asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="100"><FONT face="新細明體">承辦業務</FONT></td>
											<td align="left" width="200"><FONT face="新細明體">
													<asp:DropDownList id="DDLWorkUnit" runat="server"></asp:DropDownList></FONT></td>
											<td align="right" width="100">金額
											</td>
											<td align="left">
                                                <asp:TextBox ID="TBMoney" runat="server" Width="120px"></asp:TextBox></td>
										</tr>
										<TR>
											<TD align="right" width="100"><FONT face="新細明體">計畫</FONT></TD>
											<TD align="left" colspan="3">
												<asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></TD>

										</TR>
										<TR>
											<TD align="right" width="100"><FONT face="新細明體">用途別</FONT></TD>
											<TD align="left" colspan="3">
												<asp:DropDownList id="DDLOul" runat="server" Width="401px"></asp:DropDownList></TD>
			
										</TR>
										<tr>
										    <td align="right" >摘要</td>
										    <td>
                                                <asp:TextBox ID="TBMemo" runat="server" Width="192px"></asp:TextBox>
                                            </td>
										    <td align="right" >流水號</td>
										    <td>
                                                <asp:TextBox ID="TBbgsNo" runat="server" Width=120></asp:TextBox>
                                            </td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><INPUT id="BtnOK" type="button" value="確認" name="BtnOK" runat="server" Width="60px" style="WIDTH: 60px; HEIGHT: 22px"
										onclick="fnGetInfo();window.close();"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </form>
</body>
</html>
