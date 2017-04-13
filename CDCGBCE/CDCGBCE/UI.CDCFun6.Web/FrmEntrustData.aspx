<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmEntrustData.aspx.vb" Inherits="UI.CDCFun6.Web.FrmEntrustData" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register Assembly="Sys.FileUploadManager" Namespace="Sys.FileUploadManager.ServerControl" TagPrefix="TM" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
       	<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script src="../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../jQuery/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script language="javascript" src="../ScriptFiles/JSStrFun.js" type="text/javascript"></script>
		<script language="javascript">

		    function UCContractDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBContractDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }
		    function UCContractBDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBContractBDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }
		    function UCContractEDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBContractEDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }


		    function fnCallMemoDialog(thisName) {

		        var strReturnVal = showModalDialog("../UI.CDCFun5.Web/FrmMemoPicker.aspx?rptflag=6&memokeys=" + document.getElementById("TBMemoKeys").value + "&", window, "dialogWidth:820px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

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


		    //		    function replaceString(sString, sReplaceThis, sWithThis) {
		    //		        if (sReplaceThis != "" && sReplaceThis != sWithThis) {
		    //		            var counter = 0;
		    //		            var start = 0;
		    //		            var before = "";
		    //		            var after = "";

		    //		            while (counter < sString.length) {
		    //		                start = sString.indexOf(sReplaceThis, counter);
		    //		                if (start == -1) {
		    //		                    break;
		    //		                }
		    //		                else {
		    //		                    before = sString.substr(0, start);
		    //		                    after = sString.substr(start + sReplaceThis.length, sString.length);
		    //		                    sString = before + sWithThis + after;
		    //		                    counter = before.length + sWithThis.length;
		    //		                }
		    //		            }
		    //		        }

		    //		        return sString;
		    //		    }




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
		            else { document.getElementById("TBmemo1").value += parMemoName; }

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
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="MyCalendar" style="behavior:url('../Behavior/Calendar.htc');" separator="/" rocdate counter></div>
    <table  runat="server" id="Table1" style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" borderColor="#666668" cellPadding="5" width="1200" bgColor="#dadee9" border="1">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td>
                                        <asp:Button id="BtnSave" runat="server" Text="儲存資料" Width="128px" Height="22px"></asp:Button></td>
                                    <td>&nbsp;</td>
								</tr>
								<tr>
									<td >
                                        <asp:Label ID="LBMsg" runat="server" ForeColor="#CC0000"></asp:Label>
                                    </td> <td>&nbsp;</td>
								</tr>
								<tr>
									<td >
                                        <asp:Label ID="LBGrpSetMsg" runat="server" ForeColor="#CC0000"></asp:Label>
                                    </td> <td>
                                        <asp:Button ID="btnSetAllWorkUserName" runat="server" Text="套用至相同承辦人案件" Visible="False" />
                                    </td>
								</tr>
							</table>
            </td>
        </tr>
    </table>
    <br />
            <asp:Label ID="Label1" runat="server" Text="動支編號："></asp:Label>
        <asp:Label ID="LBAcmWordNum" runat="server" Text=""></asp:Label>
        <br />
			<table  runat="server" id="TabRpt6" style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" borderColor="#666668" cellPadding="5" width="1200" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style=" border-collapse:collapse; border-color:#ffffff; padding:1; width:100%; border:1">
							<tr>
							    <td>
                                    <table border="1" cellpadding="0" cellspacing="0"  style="border-collapse: collapse; border-style: solid; border-width: 1px" bordercolor=#999966>
	                                    <tr>
		                                    <td align="center" colspan="19">委託辦理計畫（事項）經費報告表</td>
	                                    </tr>
	                                    <tr style="display:none">
		                                    <td style="text-align:right"  colspan="19" >
                                                <input id="TBMemoKeys" runat="server" type="text" />
                                                <asp:TextBox ID="TBPrjCaseNo" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="TBPrjYear" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="TBAcvPlanCode" runat="server"></asp:TextBox>

		                                    </td>
	                                    </tr>
	                                    <tr>
		                                    <td style="text-align:right; padding:5px; font-size:16px"  colspan="3" >接受委託單位或個人名稱</td>
		                                    <td colspan="13" align="left">
                                                <asp:TextBox ID="TBPayName" runat="server" Width="501px" 
                                                    MaxLength="30" ></asp:TextBox>
		                                        </td>
                                                <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                <td>
                                                        <asp:CheckBox ID="CBAccPass" runat="server" Text="會計審核" />
                                            </td>
	                                    </tr>
	                                    <tr>
		                                    <td style="text-align:right; padding:5px"  colspan="3" >委託辦理事項</td>
		                                    <td colspan="13" align="left">
                                                <asp:TextBox ID="TBacmMemo" runat="server" Width="501px" 
                                                    MaxLength="30" ></asp:TextBox>
                                                </td>
                                                <td></td>
                                                 <td></td>
                                                <td>&nbsp;</td>
	                                    </tr>
	                                    <tr>
	                                    	<td align="center" rowspan="3">合 約金 額</td>
	                                    	<td style="width:60px" align="center" rowspan="3">訂約<br>日期</td>
	                                    	<td align="center" colspan="2">完成時間</td>
		                                    <td style="width:80px" colspan="2" align="center">按政府採購法辦理</td>
		                                    <td colspan="3" align="center">委託辦理事項類別(請勾選)</td>
		                                    <td colspan="2" align="center">報告</td>
		                                    <td colspan="2" align="center">評審</td>
		                                    <td colspan="3" align="center">委託事項(報告)處理</td>
		                                    <td colspan="2" align="center">是否派員就地抽查</td>
		                                    <td rowspan="3" align="center">備註<br /><font color="#FF0000" size="2">(請詳讀說明一後填寫本欄)</font>
                                               <br /><input id="btnOpenMemo" type="button" value="選取" onclick="fnCallMemoDialog('TBmemo1');" runat="server"/></td>
	                                    </tr>
	                                    <tr>
	                                    	<td style="width:60px" rowspan="2" align="center">預定</td>
	                                    	<td style="width:60px" rowspan="2" align="center">實際</td>
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
		                                        <asp:TextBox ID="TBV2Money" runat="server" width ="60px" DBFieldName="V2Money"></asp:TextBox><br />
                                                <asp:CheckBox ID="CBNoV2MoneyFlag" DBFieldName="NoV2MoneyFlag" runat="server" Font-Size="10px" Font-Bold="true" 
                                                    Text="無合約金額" />
                                            </td>
	                                    <td style="width:60px" align="center">
		                                    <asp:TextBox ID="TBContractDate" runat="server" width ="60px" DBFieldName="ContractDate" ondblclick="JavaScript: UCContractDate.Show();"></asp:TextBox>
                                            <input visible="false" id="Button2"  onclick="javascript: document.all.MyCalendar.Open('TBContractDate');" type="button" value="..." name="Button2" runat="server" />
                                                <asp:CheckBox ID="CBNoContractDateFlag" DBFieldName="NoV2MoneyFlag" 
                                                runat="server" Font-Size="10px" Font-Bold="true" 
                                                    Text="無訂約日期" />
                                            </td>
	                                    	<td  style="width:60px" align="center">
		                                    <asp:TextBox ID="TBContractBDate" runat="server" width ="60px"  DBFieldName="ContractBDate"  ondblclick="JavaScript: UCContractBDate.Show();"></asp:TextBox>
                                            <input visible="false" id="Button1"  onclick="javascript: document.all.MyCalendar.Open('TBContractBDate');" type="button" value="..." name="Button1" runat="server" />
                                                <asp:CheckBox ID="CBNoContractBDateFlag" DBFieldName="NoContractBDateFlag" 
                                                    runat="server" Font-Size="10px" Font-Bold="true" 
                                                    Text="無預定日期" />
                                            </td>
	                                    	<td style="width:60px" align="center">
		                                    <asp:TextBox ID="TBContractEDate" runat="server" width ="60px" BFieldName="ContractEDate" ondblclick="JavaScript: UCContractEDate.Show();"></asp:TextBox>
                                            <input visible="false" id="Button3"  onclick="javascript: document.all.MyCalendar.Open('TBContractEDate');" type="button" value="..." name="Button3" runat="server" />
                                                <asp:CheckBox ID="CBNoContractEDateFlag" DBFieldName="NoContractEDateFlag" 
                                                    runat="server" Font-Size="10px" Font-Bold="true" 
                                                    Text="無實際日期" />
                                            </td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBgov_y" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBgov_n" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBauth_a" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBauth_s" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBauth_o" runat="server" Text=" "  /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBreport_y" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBreport_n" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBjudge_y" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBjudge_n" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBproc_s" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBproc_p" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBproc_o" runat="server" Text=" "   />
		                                    <asp:TextBox ID="TBproc_o" runat="server" Rows="3" TextMode="MultiLine" 
                                                    Visible="False"></asp:TextBox></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBcheck_y" runat="server" Text=" "   /></td>
		                                    <td align="center">
		                                    <asp:CheckBox ID="CBcheck_n" runat="server" Text=" "   /></td>
		                                    <td align="center"><asp:TextBox ID="TBmemo1" runat="server" Rows="5" 
                                                    TextMode="MultiLine" onfocus="this.blur();"></asp:TextBox></td>
	                                    </tr>
                                    </table>
                                 </td>
							</tr>
							<tr>
                                <td>
                                    <table style="table-layout:fixed; border-collapse:collapse" border="1">
                                        <tr>
                                            <td style="text-align:right; width:100px">
                                             檔案上傳：
                                            </td>
                                            <td>
                                                <TM:FileUploadManagerX ID="FileUploadManagerX1" runat="server" EnableFileManage="True" EnableRemoveConfirm="true"
                                                                        EnableRemoveConfirmWithFileName="true" Filter="*.*" FilterDescript="All Files (*.*)" MaxLengthLimit="4096000"
                                                                        MaxQueueLimit="5" MaxUploadLimit="1" RemoveConfirmText="是否確定刪除檔案?" Visible="True" />
                                                                    <TM:FileUploadedList ID="FileUploadedList1" 
                                                    runat="server" Visible="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
							</tr>
							<tr>
							    <td class="auto-style1"><font color="#0000FF">
			<span style="font-size: 12.0pt; font-family: 新細明體">
			說明一：“委辦計畫未依約完成、未按政府採購法辦理、未提報告、未作評審、未納入施政計畫實施、未派員查核、未於年度開始<span lang="EN-US">6</span>個月完成簽約手續等原因，均應於備註欄詳為說明。”</span></font></td>
							</tr>
							<tr>
							    <td><span style="font-size: 12.0pt; font-family: 新細明體"><font color="#0000FF">說明二： 非科技計畫，則「報告」「評審」「委託事項報告處理」三項皆不用設定。</font></span></td>
							</tr>
							<tr>
							    <td>
                                    &nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

      <br />
			<table runat="server" id="Table2" style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" borderColor="#666668" cellPadding="5" width="1200" bgColor="#dadee9" border="1">
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

                <div>
        <COMPONENTART:CALENDAR id="UCContractDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBContractDate" PopUp="Custom" ClientSideOnSelectionChanged="UCContractDate_Change"></COMPONENTART:CALENDAR>
                    <COMPONENTART:CALENDAR id="UCContractBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBContractBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCContractBDate_Change"></COMPONENTART:CALENDAR>
     <COMPONENTART:CALENDAR id="UCContractEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBContractEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCContractEDate_Change"></COMPONENTART:CALENDAR>

    </div>

    </form>
</body>
</html>
