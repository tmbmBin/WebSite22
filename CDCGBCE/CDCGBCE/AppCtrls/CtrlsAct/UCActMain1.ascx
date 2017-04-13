<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActMain1.ascx.vb" Inherits="AppCtrls.UCActMain1" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script language="javascript" >

    function UCM1Date_Change(calendar)
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
                if ( e.getAttribute("MyName") == "TBAcmMarkDate1")
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


        function UCRequireDate_Change(calendar) {
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
                if (e.getAttribute("MyName") == "TBAcmRequireDate") {

                    e.value = tmpYear + '/' + tmpMonth + '/' + tmpDay;
                    break;

                }
            }
            //document.getElementById("UCTravelData_TBBDate").value =  tmpYear + '/' + tmpMonth + '/' + tmpDay;
        }



        function UCReturnDate_Change(calendar) {
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




        function setEmpName(parObj)         
        {
            document.all("TBEmpName").value=parObj.options[parObj.selectedIndex].innerText;
        }

//        function UCReturnDate_Change(calendar) {
//            var vDay = new Date(calendar.GetSelectedDate());
//            document.getElementById("TBAcpReturnDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
//        }

//        function UCPrePayDate_Change(calendar) {
//            var vDay = new Date(calendar.GetSelectedDate());
//            document.getElementById("TBAcpPrePayDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
//        }

</script>
<table border=0 cellpadding=1 cellspacing=1 width="600px" style="table-layout:fixed">
	<tr>
        <td align="right" style="width: 80px">&nbsp;</td>
        <td style="width: 110px">&nbsp;</td>
        <td align="right" style="width: 70px">&nbsp;</td>
        <td style="width: 120px">&nbsp;</td>
        <td align="right" style="width: 85px">
			<asp:Literal ID="ltCateGrpText" runat="server" Text="本局/分局" Visible="false"></asp:Literal>
		</td>
        <td>
			<asp:DropDownList ID="CBCateGrpFlag" runat="server" AutoPostBack="true" Width="100%" Visible="false">
				<asp:ListItem Text="本局流程" Value="0"></asp:ListItem>
				<asp:ListItem Text="分局流程" Value="1"></asp:ListItem>
			</asp:DropDownList>
		</td>
    </tr>
    <tr>
        <td align="right" style="width: 80px">&nbsp;</td>
        <td style="width: 110px">&nbsp;</td>
        <td align="right" style="width: 70px"><asp:Label ID="LBMoneyTitle" runat="server" Text="再簽金額" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None"></asp:Label></td>
        <td style="width: 120px"><asp:TextBox ID="TBAcmMoney1" runat="server" Width="113px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney1"></asp:TextBox></td>
        <td align="right" style="width: 85px"><asp:Label ID="LBCountTitle" runat="server" Text="再簽次數" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None"></asp:Label></td>
        <td> <asp:DropDownList ID="DDLAcmNo1" runat="server" Width="120px" AutoPostBack="True"><asp:ListItem  Value="">未再簽</asp:ListItem></asp:DropDownList></td>
    </tr>
    <tr>
        <td align="right" style="width: 80px"><asp:Label ID="LBDateTitle" runat="server" Text="再簽日期" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None"></asp:Label></td>
        <td style="width: 110px"><asp:TextBox ID="TBAcmMarkDate1" MyName="TBAcmMarkDate1"  style="BACKGROUND-COLOR: #ffffe0; text-align: center" runat="server" Width="100px"  ondblclick="JavaScript: UCM1Date.Show();" Enabled="False"  ></asp:TextBox></td>
        <td align="right" style="width: 70px"> 執行單位</td>
        <td style="width: 120px"><asp:DropDownList ID="DDLWorkDep"  style="BACKGROUND-COLOR: #ffffe0" runat="server" Width="120px" Enabled="False"></asp:DropDownList></td>
        <td align="right" style="width: 85px">承辦人員</td>
        <td><asp:TextBox ID="TBEmpName" runat="server" Width="110px" style="BACKGROUND-COLOR: #ffffe0" Enabled="False" ></asp:TextBox></td>
    </tr>
    <tr>
        <td align="right" style="width: 80px">廠商名稱</td>
        <td colspan=5 style="width: 300px" ><asp:TextBox ID="TBPayName" runat="server" 
                Width="505px" Enabled="False" MaxLength="100"></asp:TextBox></td>        
    </tr>
    <tr>
        <td style="width: 80px; text-align: right;">事由(名稱)</td>
        <td colspan="5">
            <asp:TextBox ID="TBAcmSubMemo" style="BACKGROUND-COLOR: #ffffe0" runat="server" Width="480px" Enabled="False" MyName="TBAcmSubMemo" Rows="2" TextMode="MultiLine"></asp:TextBox>
            <input id="BtnSubPhrase" runat="server" type="button" value="..." disabled="disabled" />
        </td>
    </tr>
    <tr >
        <td style="width: 80px; text-align: right;">控帳事由</td>
        <td colspan="5">
            <asp:TextBox ID="TBAcmMemo"  runat="server" Width="480px" Enabled="False" MyName="TBAcmMemo" Rows="2" TextMode="MultiLine"></asp:TextBox><input id="BtnPhrase" runat="server" type="button" value="..." disabled="disabled" />
       </td>
    </tr>
 <tr id="TRTmpPayData"  >
        <td width="100" align="right" style="display:none">支付日期</td>
		<td width="100" style="display:none"><asp:TextBox id="TBAcpPrePayDate" runat="server" Width="90px" 
                ondblclick="JavaScript: UCPrePayDate.Show();" Enabled="False"></asp:TextBox></td>
		<td width="100" align="right" style="display:none">支付時間</td>
		<td width="100" style="display:none">
            <asp:TextBox id="TBAcpPayHour" runat="server" Width="50px" 
                onkeypress="return check_Num()" Enabled="False"></asp:TextBox>(小時)</td>
		<td width="100" align="right">轉正日期</td>
		<td width="100"> <asp:TextBox id="TBAcpReturnDate"  MyName="TBAcpReturnDate" runat="server" Width="90px" 
                ondblclick="JavaScript: UCReturnDate.Show();" Enabled="False"></asp:TextBox> </td>
	</tr>
	<tr style="<%= strShowRequreDateFlag %>">
	    <td style="text-align:right">需求日期</td>
	    <td><asp:TextBox id="TBAcmRequireDate" MyName="TBAcmRequireDate" runat="server" style="background-color: #FFFFE0" Width="90px" Enabled="False" ondblclick="JavaScript: UCRequireDate.Show();"></asp:TextBox></td>
	    <td></td>
	    <td></td>
	    <td></td>
	    <td><asp:TextBox id="TBAcmCateGrpFlag"  MyName="TBAcpReturnDate" runat="server" Width="90px" 
                ondblclick="JavaScript: UCReturnDate.Show();" Enabled="False" 
                Visible="false"></asp:TextBox>
		</td>
	</tr>
     <tr style="display:none">
        <td align="right"  style="color: #FF0000; width: 80px;BORDER-TOP: #ffffff 1pt solid;">審核日期</td>
        <td style="width: 110px;BORDER-TOP: #ffffff 1pt solid;" ><asp:TextBox ID="TBAcmPassDate" runat="server" Width="100px" Enabled="False" style="BACKGROUND-COLOR: #ffe0c0; text-align: center" MyName="TBAcmPassDate"></asp:TextBox></td>
        <td align="right" style="color: #FF0000;width: 75px;BORDER-TOP: #ffffff 1pt solid;display:none">審核事由</td>
        <td style="width: 120px;BORDER-TOP: #ffffff 1pt solid;display:none"><asp:TextBox ID="TBAcmPassMemo" style="BACKGROUND-COLOR: #ffe0c0"  runat="server" Width="110px" Enabled="False"></asp:TextBox></td>
        <td align="right" style="color: #FF0000;width: 85px;BORDER-TOP: #ffffff 1pt solid;display:none">審核金額</td> 
        <td style="BORDER-TOP: #ffffff 1pt solid;display:none"><asp:TextBox ID="TBAcmPassMoney" runat="server" Width="115px" Enabled="False"   style="BACKGROUND-COLOR: #ffe0c0" MyName="TBAcmPassMoney" ></asp:TextBox></td>
    </tr>
</table>
<COMPONENTART:CALENDAR id="UCM1Date" runat="server" ClientSideOnSelectionChanged="UCM1Date_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCPassDate" runat="server" ClientSideOnSelectionChanged="UCPassDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<ComponentArt:CALENDAR id="UCReturnDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCReturnDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpReturnDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:CALENDAR>
<ComponentArt:CALENDAR id="UCPrePayDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCPrePayDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpPrePayDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:CALENDAR>
<ComponentArt:CALENDAR id="UCRequireDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title" ClientSideOnSelectionChanged="UCRequireDate_Change" CultureId="1028" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday" PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmRequireDate" PrevImageUrl="../images/cal_prevMonth.gif" SelectedDayCssClass="selectedday"></ComponentArt:CALENDAR>
