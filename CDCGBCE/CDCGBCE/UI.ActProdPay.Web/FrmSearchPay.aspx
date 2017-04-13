<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchPay.aspx.vb" Inherits="UI.ActProdPay.Web.FrmSearchPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   	<meta http-equiv="Pragma" content="No-cache" />
	<base target="_self"></base>
    <script language="javascript" >


        function fnGetInfo() {
            var strValue = "";
            var YearFlag = 0;

            if (document.all("DDLAccKind").value != "") {
                //strValue= ' V.acvAccKind' + '^0^' + document.all("DDLAccKind").value;
                strValue = " And IsNull(V1.acvAccKind, V.acvAccKind) = '" + document.all("DDLAccKind").value + "'";
            }

            if (document.all("DDLbgtSource").value != "") {
                //var tmpArray ;				 			 
                //tmpArray=document.all("DDLbgtSource").value.split(":");
                //if ( strValue !="" ){strValue += '|' ;}

                strValue += " And IsNull( V1.acvBgtSourceCode, V.acvBgtSourceCode)= '" + document.all("DDLbgtSource").value + "'";
            }


            if (document.all("DDLBgtDep").value != "") {
                //if ( strValue !="" ){strValue += '|' ;}				
                strValue += " And IsNull(IsNull(M1.acmBgtUnitNo, M1.acmWorkUnitNo), IsNull(M.acmBgtUnitNo, M.acmWorkUnitNo))='" + document.all("DDLBgtDep").value + "'";
            }


            if (document.all("DDLWorkDep").value != "") {
                //if ( strValue !="" ){strValue += '|' ;}				
                strValue += " And IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo)='" + document.all("DDLWorkDep").value + "'";

            }


            if (document.all("DDLWorkUnit").value != "") {
                //if ( strValue !="" ){strValue += '|' ;}
                var tmpArray;
                tmpArray = document.all("DDLWorkUnit").value.split(":");


                if (YearFlag == 0) {
                    strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear)=" + tmpArray[0] + " And IsNull(V1.acvBizCode, V.acvBizCode) = '" + tmpArray[1] + "'";
                    YearFlag = 1;
                }
                else {
                    strValue += " And IsNull(V1.acvBizCode, V.acvBizCode)='" + document.all("DDLWorkUnit").value + "'";
                }
            }



            if (document.all("DDLPlan").value != "") {
                var tmpArray;
                tmpArray = document.all("DDLPlan").value.split(":");
                //if ( strValue !="" ){strValue += '|';}

                if (YearFlag == 0) {
                    strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear)=" + tmpArray[0] + " And IsNull(V1.acvPlanCode, V.acvPlanCode) Like '" + tmpArray[1] + "%'";
                    YearFlag = 1;
                }
                else {
                    strValue += " And  IsNull(V1.acvPlanCode,  V.acvPlanCode) Like " + tmpArray[1] + "%'";
                }
            }

            if (document.all("DDLOul").value != "") {
                var tmpArray;
                tmpArray = document.all("DDLOul").value.split(":");
                //if ( strValue !="" ){strValue += '|';}			

                if (YearFlag == 0) {
                    strValue += " And IsNull(V1.acvOutlayYear, V.acvOutlayYear)=" + tmpArray[0] + " And IsNull(V1.acvOutlayCode,  V.acvOutlayCode) Like '" + tmpArray[1] + "%'";
                    YearFlag = 1;
                }
                else {
                    strValue += " And  IsNull(V1.acvOutlayCode,  V.acvOutlayCode) Like '" + tmpArray[1] + "%'";
                }
            }




            if (document.all("DDLMonth").value != "") {
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And  IsNulL(M1.acmMonth, M.acmMonth) = " + document.all("DDLMonth").value;
            }




            if (document.all("DDLPayKind").value != "") {
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And IsNull(V1.acvPrePayFlag, V.acvPrePayFlag) ='" + document.all("DDLPayKind").value + "'";
            }


            if (document.all("TBMemo").value != "") {
                //strValue= strValue +  ' and A.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And IsNull(M1.acmMemo, M.acmMemo) Like '%" + replaceString(document.all("TBMemo").value, "'", "''") + "%'";
            }

            if (document.all("TBAcvMemo").value != "") {
                //strValue= strValue +  ' and A.acmMemo Like ' + "'" + document.all("TBMemo").value + "%'";
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And IsNull(V1.acvMemo, V.acvMemo) Like '%" + replaceString(document.all("TBacvMemo").value, "'", "''") + "%'";
            }

            if (document.all("TBStaff").value != "") {
                //strValue= strValue +  ' and A.acmWorkUserNo Like ' + "'" + document.all("TBStaff").value + "%'";
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And IsNull(M1.acmWorkUserNo, M.acmWorkUserNo) Like '" + replaceString(document.all("TBStaff").value, "'", "''") + "%'";
            }



            if (document.all("TBMoney").value != "") {

                //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And IsNull(M1.acmMoney, M.acmMoney) = " + document.all("TBMoney").value;


            }
            if (document.all("TBacvMoney").value != "") {

                //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
                //if ( strValue !="" ){strValue += '|';}			
                strValue += " And IsNull( V1.acvMoney,  V.acvMoney) = " + document.all("TBacvMoney").value;


            }


            if (document.all("DDLLevelKind").value != "") {

                //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
                //if ( strValue !="" ){strValue += '|';}

                strValue += " And IsNull(IsNull(M1.acmProdLevelKind , M.acmProdLevelKind),'0') ='" + document.all("DDLLevelKind").value + "'";

                //strValue += " And V.acvMoney = "  +  document.all("DDLLevelKind").value;


            }



            if (document.all("TBAcmWordNum").value != "") {

                //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
                //if ( strValue !="" ){strValue += '|';}

                strValue += " And IsNull(M.acmWordNum,'') Like '" + replaceString(document.all("TBAcmWordNum").value, "'", "''") + "%'";

                //strValue += " And V.acvMoney = "  +  document.all("DDLLevelKind").value;


            }

            if (document.all("DDLFinalKind").value != "") {

                //strValue= strValue +  ' and A.acmMoney = ' +  document.all("TBMoney").value ;
                //if ( strValue !="" ){strValue += '|';}

                strValue += " And IsNull(M.acmFinalKind,'0')  ='" + document.all("DDLFinalKind").value + "'";

                //strValue += " And V.acvMoney = "  +  document.all("DDLLevelKind").value;


            }




            window.returnValue = strValue;
            //        window.returnValue=" And V.acvMoney > 0 ";



        }


        window.returnValue = "Cancel";




        function replaceString(sString, sReplaceThis, sWithThis) {
            if (sReplaceThis != "" && sReplaceThis != sWithThis) {
                var counter = 0;
                var start = 0;
                var before = "";
                var after = "";

                while (counter < sString.length) {
                    start = sString.indexOf(sReplaceThis, counter);
                    if (start == -1) {
                        break;
                    }
                    else {
                        before = sString.substr(0, start);
                        after = sString.substr(start + sReplaceThis.length, sString.length);
                        sString = before + sWithThis + after;
                        counter = before.length + sWithThis.length;
                    }
                }
            }

            return sString;
        }





        function check_Num() {
            //alert("a");
            if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
                return true;
            }
            else { event.keyCode = 0; false; }
        }
		

    
    
    
    
    
    
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
 		<table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="550">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
										<tr>
											<td align="right" width="80"><FONT face="新細明體">門別</FONT></td>
											<td align="left">
												<asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList></td>
											<td align="right" width="80"><FONT face="新細明體">預算來源</FONT></td>
											<td align="left" width="150"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList></FONT></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">經費單位</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtDep" runat="server" AutoPostBack="True"></asp:DropDownList></FONT></td>
											<td align="right" width="80"><FONT face="新細明體">承辦單位</FONT></td>
											<td align="left" width="150">
												<asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">承辦業務</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLWorkUnit" runat="server"></asp:DropDownList></FONT></td>
											<td align="right" width="80">
												簽證月份</td>
											<td align="left" width="150"><FONT face="新細明體">
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
										<tr>
											<td align="right" width="80"><FONT face="新細明體">計畫</FONT></td>
											<td align="left" colspan="3">
												<asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">用途別</FONT></td>
											<td align="left" colspan="2">
												<asp:DropDownList id="DDLOul" runat="server" Width="270px"></asp:DropDownList></td>
											<td align="left" width="150">
												<font face="新細明體">
                                                    </font></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">付款方式</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLPayKind" runat="server">
														<asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="0">實付款</asp:ListItem>
														<asp:ListItem Value="1">暫付款</asp:ListItem>
													</asp:DropDownList></FONT></td>
											<td align="right" width="80">承辦人員</td>
											<td align="left" width="150">
												<asp:TextBox id="TBStaff" runat="server" Width="116px"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="80">主檔事由</td>
											<td align="left">
												<asp:TextBox id="TBMemo" runat="server" Width="150px"></asp:TextBox></td>
											<td align="right" width="80">主檔金額</td>
											<td align="left" width="150"><asp:TextBox id="TBMoney" runat="server" Width="116px" onFocus="this.select();" onkeypress="return check_Num();"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" width="80">用途說明</td>
											<td align="left">
												<asp:TextBox id="TBAcvMemo" runat="server" Width="150px"></asp:TextBox></td>
											<td align="right" width="80">
                                                用途金額</td>
											<td align="left" width="150">
												<asp:TextBox id="TBacvMoney" runat="server" Width="116px" onFocus="this.select();" onkeypress="return check_Num();"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="80">動支編號</td>
											<td >
                                                <asp:TextBox ID="TBAcmWordNum" runat="server" Width="120px"></asp:TextBox></td>
											<td  align="right" width="80">結案狀態</td>
											<td>
											    <asp:dropdownlist id="DDLFinalKind" runat="server" AutoPostBack="False" Width="100px">
														<asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="0">未結案</asp:ListItem>
														<asp:ListItem Value="1">已結案</asp:ListItem>														
											    </asp:dropdownlist>
										    </td>
										</tr>
										<tr style="display:none">
											<td align="right" width="80" style="display:none">簽文資料</td>
											<td  >
												<font face="新細明體">
                                                    <asp:DropDownList ID="DDLLevelKind" runat="server">
                                                    <asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="1">簽文資料</asp:ListItem>
														<asp:ListItem Value="0">非簽文資料</asp:ListItem>
                                                    </asp:DropDownList></font></td>
											<td  align="right" width="80">&nbsp;</td>
											<td></td>
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

