<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchPay1.aspx.vb" Inherits="UI.OffSet.Web.FrmSearchPay1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
        	<META http-equiv="Pragma" content="No-cache">
	<base target="_self"></base>
    <script language="javascript">
   
  
    function fnGetInfo(){
			var strValue="";
			var YearFlag=0;
		 
			
		  if (document.all("DDLAccKind").value !="")
			{
				//strValue= ' V.acvAccKind' + '^0^' + document.all("DDLAccKind").value;
				strValue= " And  ( IsNull(PV.acvAccKind,'') = '" + document.all("DDLAccKind").value +"'  Or  IsNull(PV1.acvAccKind,'')='"+ document.all("DDLAccKind").value +"')";
			}

			if (document.all("DDLbgtSource").value !="")
			{
				//var tmpArray ;				 			 
				//tmpArray=document.all("DDLbgtSource").value.split(":");
				//if ( strValue !="" ){strValue += '|' ;}
				
				strValue += " And (IsNull( PV.acvBgtSourceCode,'')= '" + document.all("DDLbgtSource").value + "'  Or  IsNull(PV1.acvBgtSourceCode,'')='"+ document.all("DDLbgtSource").value + "' )";
			}

 
			
			if (document.all("DDLBgtDep").value !="")
			{
				//if ( strValue !="" ){strValue += '|' ;}				
				strValue += " And (IsNull(IsNull(IsNull(P.acpBgtUnitNo,M1.acmBgtUnitNo), M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo))='"+ document.all("DDLBgtDep").value +"')"
				//  Or  IsNull(P.acpBgtUnitNo,'')='"+ document.all("DDLBgtDep").value +"')";
			}


			if (document.all("DDLWorkDep").value !="")
			{
				//if ( strValue !="" ){strValue += '|' ;}				
				strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value +"'";
					               
			}
 
			
			if (document.all("DDLPlan").value !="")			
			{
				var tmpArray ;				 			 
				tmpArray=document.all("DDLPlan").value.split(":");			
				//if ( strValue !="" ){strValue += '|';}
				
				if (YearFlag==0)
				{
					strValue += " And ( ( IsNull(PV.acvOutlayYear,0)=" + tmpArray[0] + " And IsNull(PV.acvPlanCode,'') Like '" + tmpArray[1] + "%')  Or  (IsNull(PV1.acvOutlayYear,0)=" + tmpArray[0] + " And IsNull(PV1.acvPlanCode,'') Like '" + tmpArray[1] + "%' ))" ;
					YearFlag=1;
				}
				else
				{
					strValue += " And ( IsNull(PV.acvPlanCode) Like " + tmpArray[1] + "%'  Or  IsNull(PV1.acvPlanCode,'')  Like " + tmpArray[1] + "%') ";
				}
			}

			 if (document.all("DDLOul").value !="")
			{
				var tmpArray ;
				tmpArray=document.all("DDLOul").value.split(":");
				//if ( strValue !="" ){strValue += '|';}			
				
				if (YearFlag==0)
				{
					strValue += " And ((IsNull(PV.acvOutlayYear,0)=" + tmpArray[0] + " And IsNull(PV.acvOutlayCode,'') Like '"+ tmpArray[1] + "%') Or IsNull(PV1.acvOutlayCode, '') Like '" + tmpArray[1] + "%')  ";
					YearFlag=1;
				}
				else
				{
					strValue += " And  ( IsNull(PV.acvOutlayCode,'') Like '" + tmpArray[1] + "%' Or IsNull(PV1.acvOutlayCode, '') Like '" + tmpArray[1] + "%') ";
				}
			}
			 
			 
			 
			 
			 if (document.all("DDLMonth").value !="")
			{
				//if ( strValue !="" ){strValue += '|';}			
				strValue += " And  (IsNulL( M1.acmMonth, M.acmMonth) = " +  document.all("DDLMonth").value + " Or IsNull(P.acpPayMonth,0)="+  document.all("DDLMonth").value  +")" ;
			}
			 
			 
			 
			 
			if (document.all("DDLPayKind").value !="")
			{
				//if ( strValue !="" ){strValue += '|';}			
				strValue += " And (IsNull(PV.acvPrePayFlag,'0') ='" +  document.all("DDLPayKind").value + "' Or IsNull(PV1.acvPrePayFlag,'0')='" +  document.all("DDLPayKind").value + "')";
			}
			 
			 
			if (document.all("TBMemo").value !="")
			{
				//strValue= strValue +  ' and A.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
				//if ( strValue !="" ){strValue += '|';}			
				strValue += " And (IsNull(P.acpMemo,'') Like '%" + document.all("TBMemo").value + "%' Or IsNull(P1.acpMemo,'') Like '%" + document.all("TBMemo").value + "%')";
			}
			 
			 if (document.all("TBAcvMemo").value !="")
			{
				//strValue= strValue +  ' and A.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
				//if ( strValue !="" ){strValue += '|';}			
				strValue += " And ( IsNull(PV.acvMemo,'') Like '%" + document.all("TBacvMemo").value + "%' Or IsNull(PV1.acvMemo,'') Like '%" + document.all("TBacvMemo").value + "%') ";
			}
			 
			if (document.all("TBStaff").value !="")
			{
			//strValue= strValue +  ' and A.acmWorkUserNo Like ' + "'" + document.all("TBStaff").value + "%'";
				//if ( strValue !="" ){strValue += '|';}
			    strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + document.all("TBStaff").value + "%'";
			    
			}
			 
			
			
			if (document.all("TBMoney").value !="")
			{
				
				//strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
				//if ( strValue !="" ){strValue += '|';}			
				strValue += " And  ( IsNull(P.acpMoney,0) = "  +  document.all("TBMoney").value  +" Or IsNull(P1.acpMoney,0)=  "  +  document.all("TBMoney").value  +" )"   ;
				
				
			}
			 if (document.all("TBacvMoney").value !="")
			{
				
				//strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
				//if ( strValue !="" ){strValue += '|';}			
				strValue += " And ( IsNull( PV.acvMoney,0) = "  +  document.all("TBacvMoney").value + " Or IsNull(PV1.acvMoney,0) ="  +  document.all("TBacvMoney").value + ")" ;
				
				
			}
			
	
//			 if (document.all("DDLLevelKind").value !="")
//			{
//				
//				//strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
//				//if ( strValue !="" ){strValue += '|';}
//				
//				strValue += " And IsNull(IsNull(M1.acmProdLevelKind , M.acmProdLevelKind),'0') ='" +  document.all("DDLLevelKind").value + "'" ;	
//				
//				//strValue += " And V.acvMoney = "  +  document.all("DDLLevelKind").value;
//						alert(strValue);
//				
//			}
			
			 
				
//			 if (document.all("TBAcmWordNum").value !="")
//			{
//				
//				//strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
//				//if ( strValue !="" ){strValue += '|';}
//				
//				strValue += " And IsNull(M.acmWordNum,'') Like '" +  document.all("TBAcmWordNum").value + "%'" ;	
//				
//				//strValue += " And V.acvMoney = "  +  document.all("DDLLevelKind").value;
//				
//				
//			}
//			
			
		
			
			
//	        window.returnValue=strValue;
 
		 returnValue=strValue;
 
		 


	}


    returnValue="Cancel";

		
			
			
function replaceString(sString, sReplaceThis, sWithThis) 
	{ 
		if (sReplaceThis != "" && sReplaceThis != sWithThis)
		{
			var counter = 0;
			var start = 0;
			var before = "";
			var after = "";
			
			while (counter<sString.length)
			{
				start = sString.indexOf(sReplaceThis, counter);
				if (start == -1)
				{
					break;
				}
				 else
				 {
					before = sString.substr(0, start);
					after = sString.substr(start + sReplaceThis.length, sString.length);
					sString = before + sWithThis + after;
					counter = before.length + sWithThis.length;
				}
			}
		}
		
		return sString;
	}
  
    
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
											<td align="right" width="19%"><FONT face="新細明體">門別</FONT></td>
											<td align="left" width="34%">
												<asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList></td>
											<td align="right" width="15%"><FONT face="新細明體">預算來源</FONT></td>
											<td align="left" width="30%"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList></FONT></td>
										</tr>
										<tr>
											<td align="right" width="19%"><FONT face="新細明體">經費單位</FONT></td>
											<td align="left" width="34%"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtDep" runat="server"></asp:DropDownList></FONT></td>
											<td align="right" width="15%"><FONT face="新細明體">承辦單位</FONT></td>
											<td align="left" width="30%">
												<asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="19%"><FONT face="新細明體">承辦業務</FONT></td>
											<td align="left" width="34%"><FONT face="新細明體">
													<asp:DropDownList id="DDLWorkUnit" runat="server"></asp:DropDownList></FONT></td>
											<td align="right" width="15%">
												簽證月份</td>
											<td align="left" width="30%"><FONT face="新細明體">
													<asp:dropdownlist id="DDLMonth" runat="server" AutoPostBack="True" Width="50px">
														<asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
														<asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
														<asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
														<asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
														<asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
														<asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
														<asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
														<asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
														<asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
														<asp:ListItem Value="10">10月</asp:ListItem>
														<asp:ListItem Value="11">11月</asp:ListItem>
														<asp:ListItem Value="12">12月</asp:ListItem>
													</asp:dropdownlist></FONT></td>
										</tr>
										<TR>
											<TD align="right" width="19%" style="HEIGHT: 18px"><FONT face="新細明體">計畫</FONT></TD>
											<TD align="left" colspan="3" style="HEIGHT: 18px">
												<asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></TD>
										</TR>
										<TR>
											<TD align="right" width="19%"><FONT face="新細明體">用途別</FONT></TD>
											<TD align="left" colspan="2">
												<asp:DropDownList id="DDLOul" runat="server"></asp:DropDownList></TD>
											<TD align="left" width="30%">
												<font face="新細明體"></font>
											</TD>
										</TR>
										<TR>
											<TD align="right" width="19%"><FONT face="新細明體">付款方式</FONT></TD>
											<TD align="left" width="34%"><FONT face="新細明體">
													<asp:DropDownList id="DDLPayKind" runat="server">
														<asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="0">實付款</asp:ListItem>
														<asp:ListItem Value="1">暫付款</asp:ListItem>
													</asp:DropDownList></FONT></TD>
											<TD align="right" width="15%">承辦人員</TD>
											<TD align="left" width="30%">
												<asp:TextBox id="TBStaff" runat="server" Width="116px"></asp:TextBox></TD>
										</TR>
										<TR>
											<TD align="right" width="19%">主檔事由</TD>
											<TD align="left" width="34%">
												<asp:TextBox id="TBMemo" runat="server" Width="116px"></asp:TextBox></TD>
											<TD align="right" width="15%">主檔金額</TD>
											<TD align="left" width="30%"><asp:TextBox id="TBMoney" runat="server" Width="116px"></asp:TextBox>
											</TD>
										</TR>
										<TR>
											<TD align="right" width="19%">用途說明</TD>
											<TD align="left" width="34%">
												<asp:TextBox id="TBAcvMemo" runat="server" Width="150px"></asp:TextBox></TD>
											<TD align="right" width="15%">動支金額</TD>
											<TD align="left" width="30%">
												<asp:TextBox id="TBacvMoney" runat="server" Width="116px"></asp:TextBox></TD>
										</TR>
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
