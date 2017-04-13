<%@ Page  Language="vb"  AutoEventWireup="false" CodeBehind="FrmRptExtraDtl.aspx.vb" Inherits="UI.CDCFun1.Web.FrmRptExtraDtl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>預算報表明細資料</title>
        <meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<base target="_self" />

		<script language=javascript>
		    function setTBVal(parObj)
		    {
		        var tbname;
//		        alert( parObj.id.substr(2,3));
		        tbname="TB" + parObj.id.substr(2,3);
		        if (parObj.checked == true )
		        {
		            document.all(tbname).value="V";
		        }
		        else
		        {
		            document.all(tbname).value="";
		        }
		    }
		
		function GetAcmMemoFrmUrl(parName)
		{
		
		    var sURL = window.document.URL.toString();
            var tmpMemo ="";
            if (sURL.indexOf("?") > 0)
            {
	            var arrParams = sURL.split("?");
            		
	            var arrURLParams = arrParams[1].split("&");
            	
//	            var arrParamNames = new Array(arrURLParams.length);
//	            var arrParamValues = new Array(arrURLParams.length);
            	
	            var i = 0;
	            for (i=0;i<arrURLParams.length;i++)
	            {
		            var sParam =  arrURLParams[i].split("=");
		            if (sParam[0] == "acmmemo")
		            {
		                tmpMemo=sParam[1];
		            }
 	            }
            	
 
            }
		     document.all(parName).value= unescape(tmpMemo);
		}
		
		
		
        
		</script>
	    	
   	    	
    </head>
		
<body>
    <form id="form1" runat="server">
			<table  runat="server" id="TabRpt6" style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668" cellPadding="5" width="1200" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
							    <td>
                                    <table border="1" cellpadding="0" cellspacing="0"  style="border-collapse: collapse; border-style: solid; border-width: 1px" bordercolor=#999966>
	                                    <tr>
		                                    <td align="center" colspan="19">委託辦理計畫（事項）經費報告表</td>
	                                    </tr>
	                                    <tr>
		                                    <td align="Right" colspan="3">委託辦理事項</td>
		                                    <td colspan="16" align="Left"><asp:TextBox ID="TB151" runat="server" Width="501px" 
                                                    MaxLength="30"></asp:TextBox>
		                                        <input id="BtnCopy1" type="button" value="拷貝事由" 
                                                    onclick='GetAcmMemoFrmUrl("TB151");' /></td>
	                                    </tr>
	                                    <tr>
	                                    	<td align="center" rowspan="3">合 約金 額</td>
	                                    	<td align="center" rowspan="3">訂約<br>日期</td>
	                                    	<td align="center" colspan="2">完成時間</td>
		                                    <td colspan="2" align="center">按政府採購法辦理 </td>
		                                    <td colspan="3" align="center">委託辦理事項類別(請勾選)</td>
		                                    <td colspan="2" align="center">報告</td>
		                                    <td colspan="2" align="center">評審</td>
		                                    <td colspan="3" align="center">委託事項(報告)處理</td>
		                                    <td colspan="2" align="center">是否派員就地抽查</td>
		                                    <td rowspan="3" align="center">備註</td>
	                                    </tr>
	                                    <tr>
	                                    	<td rowspan="2" align="center">預定</td>
	                                    	<td rowspan="2" align="center">實際</td>
		                                    <td rowspan="2" align="center">是</td>
		                                    <td rowspan="2" align="center">否</td>
		                                    <td colspan="2" align="center">委託研究計畫</td>
		                                    <td rowspan="2" align="center">其他委託事項</td>
		                                    <td rowspan="2" align="center">有</td>
		                                    <td rowspan="2" align="center">無</td>
		                                    <td rowspan="2" align="center">有</td>
		                                    <td rowspan="2" align="center">無</td>
		                                    <td rowspan="2" align="center">存參</td>
		                                    <td rowspan="2" align="center">納入計畫實施</td>
		                                    <td rowspan="2" align="center">其他</td>
		                                    <td rowspan="2" align="center">是</td>
		                                    <td rowspan="2" align="center">否</td>
	                                    </tr>
	                                    <tr>
		                                    <td align="center">行政及政策類</td>
		                                    <td align="center">科學及技術類</td>
	                                    </tr>
	                                    <tr>
	                                    	<td align="center">
		                                    <asp:TextBox ID="TBV2Money" runat="server" width ="60px"></asp:TextBox></td>
	                                    	<td align="center">
		                                    <asp:TextBox ID="TBContractDate" runat="server" width ="60px"></asp:TextBox></td>
	                                    	<td align="center">
		                                    <asp:TextBox ID="TBContractBDate" runat="server" width ="60px"></asp:TextBox></td>
	                                    	<td align="center">
		                                    <asp:TextBox ID="TB154" runat="server" width ="80px"></asp:TextBox></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB101" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB102" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB103" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB104" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB105" runat="server" Text=" " onclick="setTBVal(this);" /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB106" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB107" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB108" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB109" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB110" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB111" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB112" runat="server" Text=" " onclick="setTBVal(this);"  />
		                                    <asp:TextBox ID="TB152" runat="server"></asp:TextBox></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB113" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CB114" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
		                                    <td align="center"><asp:TextBox ID="TB153" runat="server"></asp:TextBox></td>
	                                    </tr>
                                    </table>
                                 </td>
							</tr>
							<tr>
							    <td><asp:Button ID="BtnSaveRpt6" runat="server" Text="存檔" />
                                    <asp:CheckBox ID="CBRpt6" runat="server" Text="套用整筆動支單" />
                                    <asp:Button ID="BtnSaveRpt8" runat="server" Text="刪除已存的整筆套用資料" Width="155px" />
                                </td>
							</tr>
							<tr>
							    <td>
                                    <asp:Label ID="LBRpt6" runat="server" ForeColor="Red" Text="此資料為預設值，此筆資料尚未存檔。" 
                                        Visible="False"></asp:Label>
                                </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br />
			<table runat="server" id="TabRpt7" style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668" cellPadding="5" width="900" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
							<tr>
							    <td>
                                    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-style: solid; border-width: 1px" bordercolor=#999966>

                                        <tr>
	                                        <td colspan="13" align="center">補、捐（獎）助其他政府機關或團體私人經費報告表</td>
                                        </tr>
                                        <tr>
	                                        <td colspan="3" align="center">補、捐 (獎)助 計畫 名稱</td>
	                                        <td colspan="10" align="left">
	                                            <asp:TextBox ID="TB251" runat="server" Width="476px" MaxLength="30"></asp:TextBox>
	                                            <input id="BtnCopy2" type="button" value="拷貝事由" onclick='GetAcmMemoFrmUrl("TB251");' />
	                                        </td>
                                        </tr>
                                        <tr>	                                        
	                                        <td colspan="2" align="center">是否明定補助之條件標準</td>
	                                        <td colspan="2" align="center" width="120px" >計畫執行情形</td>
	                                        <td colspan="3" align="center">是否納入受補助單位預算</td>
	                                        <td rowspan="2" align="center" width="150">計畫未完成原因</td>
	                                        <td colspan="3" align="center" width="250">是否明定成果考核方式<br/>並確實執行</td>
	                                        <td rowspan="2" align="center">備註</td>
	                                        <td  runat="server" id="td1"  rowspan="2" align="center">043702 對團體捐助<br />非財團法人</td>
	                                    </tr>
                                        <tr>
	                                        <td align="center" >是</td>
	                                        <td align="center" >否</td>
	                                        <td align="center" width="60px">已完成</td>
	                                        <td align="center" width="60px">未完成</td>
	                                        <td align="center" >是</td>
	                                        <td align="center" >否</td>
											<td align="center" >兩者不勾選</td>
	                                        <td align="center" >是</td>
	                                        <td align="center" >否</td>
											<td align="center" >兩者不勾選</td>											
                                        </tr>
                                        <tr >	                                        
	                                        <td align="center" ><asp:CheckBox ID="CB201" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" ><asp:CheckBox ID="CB202" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" ><asp:CheckBox ID="CB203" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" ><asp:CheckBox ID="CB204" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" ><asp:CheckBox ID="CB205" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" ><asp:CheckBox ID="CB206" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
											<td align="center" ><asp:CheckBox ID="CB2060" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" width="150" ><asp:TextBox ID="TB252" runat="server" width="150px"></asp:TextBox></td>
	                                        <td align="center" ><asp:CheckBox ID="CB207" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" ><asp:CheckBox ID="CB208" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
											<td align="center" ><asp:CheckBox ID="CB2070" runat="server" Text=" " onclick="setTBVal(this);"  /></td>
	                                        <td align="center" width="150" ><asp:TextBox ID="TB253" runat="server" width="150px"></asp:TextBox></td>
	                                        <td runat="server" id="td2" align="center"><asp:CheckBox ID="CB209" runat="server" Text=" "/></td>
                                        </tr>
                                    </table>
								</td>
							</tr>
							<tr>
							    <td><asp:Button ID="BtnSaveRpt7" runat="server" Text="存檔" />
                                    <asp:CheckBox ID="CBRpt7" runat="server" Text="套用整筆動支單" Visible="False" />
                                    <asp:Button ID="BtnSaveRpt9" runat="server" Text="刪除已存的整筆套用資料" Width="155px" />
                                </td>
							</tr>
							<tr>
							    <td>
                                    <asp:Label ID="LBRpt7" runat="server" ForeColor="Red" Text="此資料為預設值，此筆資料尚未存檔。" 
                                        Visible="False"></asp:Label>
                                </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			
			
			
			<table  border="0" cellpadding="0" cellspacing="0" style="display:none">
			<tr><td><asp:TextBox ID="TB101" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB102" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB103" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB104" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB105" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB106" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB107" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB108" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB109" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB110" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB111" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB112" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB113" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB114" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB201" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB202" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB203" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB204" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB205" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB206" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB207" runat="server"></asp:TextBox></td></tr>
	        <tr><td><asp:TextBox ID="TB208" runat="server"></asp:TextBox></td></tr>
	        </table>
	</form> 
</body>
</html>
