<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSubsidyData.aspx.vb" Inherits="UI.CDCFun5.Web.FrmSubsidyData" %>
<%@ Register Assembly="Sys.FileUploadManager" Namespace="Sys.FileUploadManager.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
        <script src="../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../jQuery/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/JSStrFun.js" type="text/javascript"></script>
	<script language="javascript" type="text/javascript">	    


	    function fnCallMemoDialog(thisName) {

	        var strReturnVal = showModalDialog("FrmMemoPicker.aspx?rptflag=7&memokeys=" + document.getElementById("TBMemoKeys").value + "&", window, "dialogWidth:820px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

	        if (strReturnVal != "Cancel") {

	            var arrData = strReturnVal.split("│");
	            document.getElementById("TBMemoKeys").value = arrData[0];
	            document.getElementById("TBmemo1").value = arrData[1];

	            //                   
	            //                    document.all(TBMemoKeys).value = strReturnVal;
	            //		            document.all(thisName).value = strReturnVal;
	        }
	    }


	    function GetAcmMemoFrmUrl(parName) {
	   
	        var sURL = window.document.URL.toString();
	        var tmpMemo = "";
	        if (sURL.indexOf("?") > 0) {
	            var arrParams = sURL.split("?");

	            var arrURLParams = unescape(arrParams[1]).split("&");

	            //	            var arrParamNames = new Array(arrURLParams.length);
	            //	            var arrParamValues = new Array(arrURLParams.length);

	            var i = 0;
	            for (i = 0; i < arrURLParams.length; i++) {
	                var sParam = arrURLParams[i].split("=");
	                if (sParam[0] == "acmmemo") {	                  
	                    tmpMemo = sParam[1];
	                }
	            }


	        }
	        document.all(parName).value = unescape(tmpMemo);
	    }



	    function SpeedChooseMemo(parObj, parMemoKeys, parMemoName) {
	        //		        alert(parObj.checked);
	        //		        alert(parMemoKeys);
	        var strMemo;
	        if (parObj.checked == true) {
	            strMemo = Trim(document.getElementById("TBMemoKeys").value);
	            //		            alert(strMemo.substr(strMemo.length - 1, 1));
	            if (strMemo != "" && strMemo.substr(strMemo.length - 1, 1) != ",") {
	                document.getElementById("TBMemoKeys").value += "," + parMemoKeys;
	            }
	            else {
	                document.getElementById("TBMemoKeys").value += parMemoKeys;
	            }

	            strMemo = document.getElementById("TBmemo1").value;
	            //		            alert(strMemo.substr(strMemo.length-1, 2));
	            if (strMemo != "") {
	                if (strMemo.substr(strMemo.length - 1, 2) == "、")
	                { document.getElementById("TBmemo1").value += parMemoName; }
	                else
	                { document.getElementById("TBmemo1").value += "、" + parMemoName; }


	            }
	            else
	            { document.getElementById("TBmemo1").value += parMemoName; }

	            //		        document.getElementById("TBMemoKeys").value = parKparMemoKeyseys;
	            //		        document.getElementById("TBmemo1").value = parMemoName;
	        }
	        else {

	            document.getElementById("TBMemoKeys").value = replaceString(document.getElementById("TBMemoKeys").value, parMemoKeys + ",", "");
	            document.getElementById("TBMemoKeys").value = replaceString(document.getElementById("TBMemoKeys").value, parMemoKeys, "");

	            document.getElementById("TBmemo1").value = replaceString(document.getElementById("TBmemo1").value, parMemoName + "、", "");
	            document.getElementById("TBmemo1").value = replaceString(document.getElementById("TBmemo1").value, parMemoName, "");

	        }



	    }
		
		</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table  runat="server" id="Table1" style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" borderColor="#666668" cellPadding="5" width="950" bgColor="#dadee9" border="1">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td><asp:button id="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px" 
                                            Visible="False"></asp:button></td>
									<td><asp:Button id="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:Button></td>
									<td></td>
									<td><asp:Button id="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
									<td><asp:Button id="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:Button></td>
									<td style="width:60px"></td>
									<td><asp:Button id="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:Button></td>
									<td><input type="hidden" id="TBFindSql" runat="server" name="TBFindSql" /></td>
									<td><input type="hidden" id="TBOrderTxt" runat="server" name="TBOrderTxt" /><input type="hidden" id="TBModFlag" runat="server" name="TBModFlag" /></td>
								</tr>
                                <tr>
									<td colspan="4">&nbsp;</td>
									<td style="width:60px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    <td style="width:60px">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
                                <tr>
									<td colspan="4">
                                        &nbsp;</td>
									<td style="width:60px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    <td style="width:60px">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							<tr>
									<td colspan="5">
                                        <asp:Button id="btnSetAcmWordNumPayName" runat="server" Text="套用同動支編號同廠商名稱" 
                                            Width="200px" Height="22px"></asp:Button></td>
                                    <td colspan="4">
                                        <asp:Button id="btnSetAcmWordNum" runat="server" Text="套用同動支編號" 
                                            Width="145px" Height="22px"></asp:Button></td>
								</tr>
								<tr>
									<td colspan="9">
                                        <asp:Label ID="LBMsg" runat="server" ForeColor="#CC0000"></asp:Label>
                                    </td>
								</tr>
								<tr>
									<td colspan="9">
                                        <asp:Label ID="LBGrpSetMsg" runat="server" ForeColor="#CC0000"></asp:Label>
                                    </td>
								</tr>
							</table>
            </td>
        </tr>
    </table>
    <br />
            <table  runat="server" id="Table9" style=" display:none;table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" borderColor="#666668" cellPadding="5" width="950" bgColor="#dadee9" border="1">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
								<tr>
                                    <td>步驟一</td>
								</tr>
                                <tr>
                                    <td></td>
								</tr>
							</table>
            </td>
        </tr>
    </table>
        <br />
        <asp:Label ID="Label1" runat="server" Text="動支編號："></asp:Label>
        <asp:Label ID="LBAcmWordNum" runat="server" Text=""></asp:Label>

			<table runat="server" id="TabRpt7" style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668" cellPadding="5" width="950" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
							<tr>
							    <td>
                                    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-style: solid; border-width: 1px" bordercolor=#999966>

                                        <tr>
	                                        <td colspan="9" align="center">補、捐（獎）助其他政府機關或團體私人經費報告表</td>
                                        </tr>
                                        <tr style="display:none">
		                                    <td style="text-align:right; padding:5px"  colspan="9" >
                                                <input id="TBMemoKeys" runat="server" type="text" />
                                                <asp:TextBox ID="TBPrjCaseNo" runat="server"></asp:TextBox>
                                            </td>
	                                    </tr>
                                        <tr>
	                                        <td colspan="3" align="center">受補、捐(獎)助單位名稱</td>
	                                        <td colspan="5" align="left">
	                                            <asp:TextBox ID="TBOulName" runat="server" Width="420px" MaxLength="30" 
                                                    ></asp:TextBox></td>
                                                    <td align="right" >
                                                        <asp:CheckBox ID="CBAccPass" runat="server" Text="會計審核" />
                                            </td>
                                                  
                                        </tr>
                                        <tr>
	                                        <td colspan="3" align="center">補、捐 (獎)助 計畫 名稱</td>
	                                        <td colspan="5" align="left">
	                                            <asp:TextBox ID="TBacmMemo" runat="server" Width="420px" MaxLength="30"></asp:TextBox>
                                                <input id="btnCopy" title="拷貝簽證動支事由" type="button" value="拷貝事由" onclick='GetAcmMemoFrmUrl("TBacmMemo");' runat="server" /></td>
                                                <td align="right" ></td>
                                                
                                        </tr>
                                        <tr>	                                        
	                                        <td colspan="2" align="center" width="120px" >計畫執行情形</td>
	                                        <td colspan="2" align="center">是否納入受補助單位預算</td>
	                                        <td rowspan="2" align="center" width="250">計畫未完成原因</td>
	                                        <td colspan="2" align="center" width="200">是否派員就地抽查</td>
	                                        <td rowspan="2" align="center" >備註<br/><font color="#FF0000" size="2">(請詳讀說明一後填寫本欄)</font><input id="btnOpenMemo" type="button" value="選取" onclick="fnCallMemoDialog('TBmemo1');" runat ="server" /></td>
	                                        <td  runat="server" id="td1"  rowspan="2" align="center"><font size="2">043702 對團體捐助<br />非財團法人</font><br/><font color="#FF0000" size="2">(請詳讀說明二後填寫本欄)</font></td>
	                                    </tr>
                                        <tr>
	                                        <td align="center" width="60px">已完成</td>
	                                        <td align="center" width="60px">未完成</td>
	                                        <td align="center" >是</td>
	                                        <td align="center" >否</td>
	                                        <td align="center">是</td>
	                                        <td align="center" >否</td>
                                        </tr>
                                        <tr >	                                        
	                                        <td align="center" ><asp:CheckBox ID="CBfinish_y" runat="server" Text=" " 
                                                      /></td>
	                                        <td align="center" ><asp:CheckBox ID="CBfinish_n" runat="server" Text=" " 
                                                      /></td>
	                                        <td align="center" ><asp:CheckBox ID="CBbgt_y" runat="server" Text=" " 
                                                      /></td>
	                                        <td align="center" ><asp:CheckBox ID="CBbgt_n" runat="server" Text=" " 
                                                      /></td>
	                                        <td align="center" width="150" >
                                                <asp:TextBox ID="TBunfinishmemo" runat="server" 
                                                    width="250px" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
	                                        <td align="center"><asp:CheckBox ID="CBcheck_y" runat="server" Text=" " 
                                                      /></td>
	                                        <td align="center" ><asp:CheckBox ID="CBcheck_n" runat="server" Text=" " 
                                                      /></td>
	                                        <td align="center" ><asp:TextBox ID="TBmemo1" runat="server" width="150px" Rows="5" 
                                                    TextMode="MultiLine" onfocus="this.blur();"></asp:TextBox></td>
	                                        <td runat="server" id="td2" align="center"><asp:CheckBox ID="CBsubsidykind" 
                                                    runat="server" Text=" "/></td>
                                        </tr>
                                    </table>
								</td>
							</tr>
							<tr>
							    <td><table style="table-layout:fixed; border-collapse:collapse" border="1">
                                        <tr>
                                            <td style="text-align:right; width:100px">
                                             檔案上傳：
                                            </td>
                                            <td>
                                                <TM:FileUploadManagerX ID="FileUploadManagerX1" runat="server" EnableFileManage="True" EnableRemoveConfirm="true"
                                                                        EnableRemoveConfirmWithFileName="true" Filter="*.*" FilterDescript="All Files (*.*)" MaxLengthLimit="4096000"
                                                                        MaxQueueLimit="5" MaxUploadLimit="1" RemoveConfirmText="是否確定刪除檔案?" Visible="True" />
                                                                    <TM:FileUploadedList ID="FileUploadedList1" runat="server" />
                                            </td>
                                        </tr>
                                    </table></td>
							</tr>
							<tr>
							    <td><font color="#0000FF">說明一：補助經費未納入受補助單位預算且支出原始憑證未送審(未經審計部同意)、原始憑證免送審且辦理就地查核等原因。<br />
                                        說明二：如果核銷的用途別為「043702 對團體捐助」且受捐助單位為「非財團法人」，請勾選本項設定。
                                     </font>
                                </td>
							</tr>
							<tr>
							    <td>
                                </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			
			<br />

            <table runat="server" id="Table2" style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" borderColor="#666668" cellPadding="5" width="950" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style=" border-collapse:collapse;width:100%;" cellpadding="1" bordercolor="#ffffff" border="1">
							<tr>
							    <td>
                                   快速選取備註內容。 <span style="color:Red"> 如果備註內容不在此處，請從上面「備註」名詞下方的﹝選取﹞按鈕進入後，再選取﹝新增編輯﹞按鈕，進行備註內容的新增。</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                    CellPadding="3" EnableModelValidation="True" GridLines="Vertical">
                                                    <AlternatingRowStyle BackColor="Gainsboro" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取">
                                                            <ItemTemplate>
                                                            
                                                                <asp:CheckBox ID="CBdgSelect" runat="server" onclick='<%# "SpeedChooseMemo(this, " & Chr(39) & DataBinder.Eval(Container, "DataItem.memoYear") &":"& DataBinder.Eval(Container, "DataItem.memoNo")  & Chr(39) & ","  & Chr(39) & "註" & DataBinder.Eval(Container, "DataItem.memoAliasNo") & Chr(39) &")" %>'  CssClass='<%# DataBinder.Eval(Container, "DataItem.memoYear") &":"& DataBinder.Eval(Container, "DataItem.memoNo")  & ",註" & DataBinder.Eval(Container, "DataItem.memoAliasNo")  %>'/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註年度" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoYear") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="系統號" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註號碼">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemoAliasNo" runat="server" Text='<%# "註" & DataBinder.Eval(Container, "DataItem.memoAliasNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.memoNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="備註內容">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LBdgMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.memo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                
                                            
                                            </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

			
    </div>
    </form>
</body>
</html>
