<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActMain.ascx.vb" Inherits="UI.Act.UC.UCActMain" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script language="javascript">
<!--

	function fnCallPhraseDialog(thisName){
		var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		if (strReturnVal != "Cancel" )
			{
				document.all(thisName).value=document.all(thisName).value + strReturnVal;
			}
	}

	function UCMDate_Change(calendar)
		{
			var vDay = new Date(calendar.GetSelectedDate());
			//document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			 var tmpYear;
			 tmpYear= "0"+ (vDay.getYear()-1911);
			 tmpYear = tmpYear.substring(tmpYear.length-3, tmpYear.Length);

			 var tmpMonth= "0"+ (vDay.getMonth()+1);
			 tmpMonth=tmpMonth.substring(tmpMonth.length-2, tmpMonth.Length);

			  var tmpDay= "0"+  vDay.getDate();
			 tmpDay=tmpDay.substring(tmpDay.length-2, tmpDay.Length);

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];
				if ( e.getAttribute("MyName") == "TBAcmMarkDate")
				{

					e.value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
					break;

				}
			}
			 //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
		}

		 function UCPassDate_Change(calendar)
		{
			var vDay = new Date(calendar.GetSelectedDate());
			//document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			 var tmpYear;
			 tmpYear= "0"+ (vDay.getYear()-1911);
			 tmpYear = tmpYear.substring(tmpYear.length-3, tmpYear.Length);

			 var tmpMonth= "0"+ (vDay.getMonth()+1);
			 tmpMonth=tmpMonth.substring(tmpMonth.length-2, tmpMonth.Length);

			  var tmpDay= "0"+  vDay.getDate();
			 tmpDay=tmpDay.substring(tmpDay.length-2, tmpDay.Length);

			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];
				if ( e.getAttribute("MyName") == "TBAcmPassDate")
				{
					e.value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
					break;
				}
			}
			 //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
		}

		function setEmpName(parObj)
		{
			document.all("TBEmpName").value=parObj.options[parObj.selectedIndex].innerText;
		}
		function UCReturnDate_Change(calendar) {
//		    var vDay = new Date(calendar.GetSelectedDate());
		    //		    document.getElementById("TBAcpReturnDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();

		    var vDay = new Date(calendar.GetSelectedDate());
		    //document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		    var tmpYear;
		    tmpYear = "0" + (vDay.getYear() - 1911);
		    tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

		    var tmpMonth = "0" + (vDay.getMonth() + 1);
		    tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

		    var tmpDay = "0" + vDay.getDate();
		    tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

		    for (var i = 0; i < document.forms[0].elements.length; i++) {
		        var e = document.forms[0].elements[i];
		        if (e.getAttribute("MyName") == "TBAcpReturnDate") {
		            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
		            break;
		        }
		    }
		    //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;


		}

		function UCPrePayDate_Change(calendar) {
//		    var vDay = new Date(calendar.GetSelectedDate());
		    //		    document.getElementById("TBAcpPrePayDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();

		    var vDay = new Date(calendar.GetSelectedDate());
		    //document.getElementById("UCTravelData_TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		    var tmpYear;
		    tmpYear = "0" + (vDay.getYear() - 1911);
		    tmpYear = tmpYear.substring(tmpYear.length - 3, tmpYear.Length);

		    var tmpMonth = "0" + (vDay.getMonth() + 1);
		    tmpMonth = tmpMonth.substring(tmpMonth.length - 2, tmpMonth.Length);

		    var tmpDay = "0" + vDay.getDate();
		    tmpDay = tmpDay.substring(tmpDay.length - 2, tmpDay.Length);

		    for (var i = 0; i < document.forms[0].elements.length; i++) {
		        var e = document.forms[0].elements[i];
		        if (e.getAttribute("MyName") == "TBAcpPrePayDate") {
		            e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
		            break;
		        }
		    }
		    //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;



		}


//-->
</script>

							<!-- ↓審核原因-- >
							
							<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%; display:none" border="1" bordercolor="#FFFFFF">
								<tr>
									<td style="padding: 0px">
									<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
										<tr>
											<td width="100" align="right"  style="color: #FF0000">核支日期</td>
											<td width="100"><asp:TextBox id="TBAcmPassDate" runat="server" MyName="TBAcmPassDate" style="text-align: center; background-color: #FFE0C0" Width="90px" ondblclick="JavaScript: UCPassDate.Show();"></asp:TextBox></td>
											<td width="100" align="right">　</td>
											<td width="100">　</td>
											<td width="100" align="right" style="color: #FF0000"><span style="<%=strShowByPassFlag%>">核支金額</span></td>
											<td width="100" style="border-top: #FFFFFF 1pt solid"><span style="<%=strShowByPassFlag%>"><asp:TextBox id="TBAcmPassMoney" runat="server" MyName="TBAcmPassMoney" style="text-align: right; background-color: #FFE0C0" Width="90px" onfocus="this.blur();"></asp:TextBox></span></td>
										</tr>
										<tr>
											<td width="100" align="right" style="color: #FF0000">核退原因</td>
											<td width="500" colspan="5"><asp:TextBox id="TBAcmPassMemo" runat="server" style="background-color: #FFE0C0" Width="472px"></asp:TextBox><input type="button" id="BtnPassPhrase" style="HEIGHT: 22px; WIDTH: 18px" runat="server" value="..." onclick="fnCallPhraseDialog('TBAcmPassMemo');" /></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<!-- 審核原因↑ -->

<table _ondblclick="alert('14:UCActMain.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width:600px" border="1" bordercolor="#FFFFFF">
	<tr>
		<td style="padding: 0px">
		<table cellpadding="2" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
		    <tr style="display: none">
				<td width="100" align="right">　</td>
				<td width="100">　</td>
				<td width="100" align="right">　</td>
				<td width="100"></td>
				<td width="100" align="right">　</td>
				<td width="100">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="100" align="right">動支編號</td>
				<td width="100"><asp:TextBox id="TBAcmWordNum" runat="server" style="text-align: center" BackColor="Transparent" Width="90px" onfocus="this.blur();">09601234</asp:TextBox></td>
				<td width="100" align="right">報支金額</td>
				<td width="100"><asp:TextBox id="TBAcmMoney" runat="server" MyName="TBAcmMoney" style="text-align: right" BackColor="Transparent" Width="90px" onfocus="this.blur();" onpropertychange="checkVisaKind(this.value);"></asp:TextBox></td>
				<td width="100" align="right"  id="TDAddVisaData1">原簽單號</td>
				<td width="100"  id="TDAddVisaData2"><asp:TextBox id="TBAcmTopWordNum" runat="server" Width="90px" Enabled="False"></asp:TextBox></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="100" align="right">請示日期</td>
				<td width="100"><asp:TextBox id="TBAcmMarkDate" runat="server" MyName="TBAcmMarkDate" style="text-align: center; background-color: #FFFFE0" Width="90px" ondblclick="JavaScript: UCMDate.Show();" Enabled="False"></asp:TextBox></td>
				<td width="100" align="right">承辦單位</td>
				<td width="100"><asp:DropDownList id="DDLWorkDep" runat="server" style="background-color: #FFFFE0" Width="90px" Enabled="False" AutoPostBack="True"></asp:DropDownList></td>
				<td width="100" align="right">承辦人員</td>
				<td width="100"><asp:TextBox id="TBEmpName" runat="server" style="background-color: #FFFFE0" Width="90px" Enabled="False"></asp:TextBox></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="right">群組編號</td>
				<td><asp:TextBox ID="TBAcpGroupNo" runat="server" MaxLength="10" Width="90px" Enabled="False"></asp:TextBox></td>
				<td align="right" style="<%= strShowETCFlag %>">電支付號</td>
				<td style="<%= strShowETCFlag %>"><asp:TextBox ID="TBAcpEtcPayWordNum" runat="server" MaxLength="20" Width="130px" Enabled="False"></asp:TextBox></td>
				<td align="right">&nbsp;</td>
				<td><asp:TextBox id="TBAcmCateGrpFlag" runat="server" Width="90px" Visible="false"></asp:TextBox></td>
				<td>&nbsp;</td>
			</tr>
			<tr style="<%= strShowPayNameFlag %>">
				<td width="100" align="right">廠商名稱</td>
				<td width="500" colspan="5"><asp:TextBox id="TBPayName" runat="server" Width="490px" MaxLength="100"  Enabled="False"></asp:TextBox></td>
				<td width="500">&nbsp;</td>
			</tr>
			<tr>
				<td width="100" align="right">核銷事由</td>
				<td width="500" colspan="5">
                    <asp:TextBox ID="TBAcmSubMemo" style="BACKGROUND-COLOR: #ffffe0" runat="server" 
                        Width="470px" Enabled="False" MyName="TBAcmSubMemo" Rows="2" 
                        TextMode="MultiLine"></asp:TextBox><input id="BtnSubPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" type="button" value="..." disabled="disabled" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
                <td style="text-align: right;">控帳事由</td>
                <td colspan="5"><asp:TextBox id="TBAcmMemo" runat="server" MyName="TBAcmMemo"   Width="470px" 
                        MaxLength="250" Enabled="False" Rows="2" TextMode="MultiLine"></asp:TextBox><input type="button" id="BtnPhrase" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..."  disabled="disabled"/></td>
                        <td>&nbsp;</td>
            </tr>
			<tr style="display: none">
				<td width="100" align="right">匯出批號</td>
				<td width="100"><asp:TextBox id="TBGroupNo" runat="server" Width="90px" MaxLength="10" Enabled="False"></asp:TextBox></td>
				<td width="100" align="right">附單據</td>
				<td width="100"><asp:TextBox id="TBPayCnt" runat="server" style="text-align: right" Width="90px" onkeypress="return check_Num()" Enabled="False"></asp:TextBox></td>
				<td width="100" align="right">　</td>
				<td width="100"><asp:TextBox id="TBAcmNoPrv" runat="server" Width="90px"></asp:TextBox></td>
				<td>&nbsp;</td>
			</tr>
			<tr id="TRTmpPayData"  >
                <td width="100" align="right" style="display:none">支付日期</td>
		        <td width="100" style="display:none"><asp:TextBox id="TBAcpPrePayDate"  MyName="TBAcpPrePayDate"  runat="server" Width="90px" ondblclick="JavaScript: UCPrePayDate.Show();" Enabled="False"></asp:TextBox></td>
		        <td width="100" align="right" style="display:none">支付時間</td>
		        <td width="100" style="display:none"><asp:TextBox id="TBAcpPayHour"  MyName="TBAcpPayHour" runat="server" Width="50px" onkeypress="return check_Num()" Enabled="False"></asp:TextBox>(小時)</td>
                <td width="100" align="right" style="<%= strShowETCFlag %>" >轉正日期</td>
                <td width="100" style="<%= strShowETCFlag %>"><asp:TextBox id="TBAcpReturnDate" MyName="TBAcpReturnDate" runat="server" Width="90px" ondblclick="JavaScript: UCReturnDate.Show();" Enabled="False"></asp:TextBox> </td>
	        </tr>
		</table>
		</td>
	</tr>
</table>
<COMPONENTART:CALENDAR id="UCMDate"         runat="server" ClientSideOnSelectionChanged="UCMDate_Change"        PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCPassDate"      runat="server" ClientSideOnSelectionChanged="UCPassDate_Change"     PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<ComponentArt:CALENDAR id="UCReturnDate"    runat="server" ClientSideOnSelectionChanged="UCReturnDate_Change"   PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>
<ComponentArt:CALENDAR id="UCPrePayDate"    runat="server" ClientSideOnSelectionChanged="UCPrePayDate_Change"   PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>