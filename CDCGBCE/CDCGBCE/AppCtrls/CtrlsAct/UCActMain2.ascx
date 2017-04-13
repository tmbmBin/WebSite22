<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActMain2.ascx.vb" Inherits="AppCtrls.UCActMain2" %>
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
        
function UCBidDate_Change(calendar)
        { 
                var vDay = new Date(calendar.GetSelectedDate());
                //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

                for (var i=0;i<document.forms[0].elements.length;i++)
               {
                    var e=document.forms[0].elements[i];
                    if (e.getAttribute("MyName")=="TBBidDate")
                    {
                            e.value= (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
                           break; 
                    }
               } 
   
        }

   function UCConBDate_Change(calendar)
        { 
                var vDay = new Date(calendar.GetSelectedDate());
                //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

                for (var i=0;i<document.forms[0].elements.length;i++)
               {
                    var e=document.forms[0].elements[i];
                    if (e.getAttribute("MyName")=="TBConBDate")
                    {
                            e.value= (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
                           break; 
                    }
               } 
   
        }

 function UCSignDate_Change(calendar)
        { 
                var vDay = new Date(calendar.GetSelectedDate());
                //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

                for (var i=0;i<document.forms[0].elements.length;i++)
               {
                    var e=document.forms[0].elements[i];
                    if (e.getAttribute("MyName")=="TBSignDate")
                    {
                            e.value= (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
                           break; 
                    }
               } 
   
        }
 function UCConEDate_Change(calendar)
        { 
                var vDay = new Date(calendar.GetSelectedDate());
                //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

                for (var i=0;i<document.forms[0].elements.length;i++)
               {
                    var e=document.forms[0].elements[i];
                    if (e.getAttribute("MyName")=="TBConEDate")
                    {
                            e.value= (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
                           break; 
                    }
               } 
   
        }
 function UCQuotDate_Change(calendar)
        { 
                var vDay = new Date(calendar.GetSelectedDate());
                //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

                for (var i=0;i<document.forms[0].elements.length;i++)
               {
                    var e=document.forms[0].elements[i];
                    if (e.getAttribute("MyName")=="TBQuotDate")
                    {
                            e.value= (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
                           break; 
                    }
               } 
   
        }  
        
        
</script>
<table border=0 cellpadding=1 cellspacing=1 width="600px" style="table-layout:fixed">
    <tr>
        <td align="right" style="width: 80px">決標日期</td>
        <td style="width: 110px"><asp:TextBox ID="TBAcmMarkDate1" MyName="TBAcmMarkDate1"  style="BACKGROUND-COLOR: #ffffe0; text-align:center" runat="server" Width="100px"  ondblclick="JavaScript: UCM1Date.Show();" Enabled="False"  ></asp:TextBox></td>
        <td align="right" style="width: 70px"> 決標金額</td>
        <td style="width: 120px"><asp:TextBox ID="TBAcmMoney1" runat="server" Width="113px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney1"></asp:TextBox></td>
        <td align="right" style="width: 85px">決標次數</td>
        <td style="width: 133px"> <asp:DropDownList ID="DDLAcmNo2" runat="server" Width="120px" AutoPostBack="True"><asp:ListItem Value="">未決標</asp:ListItem></asp:DropDownList></td>
    </tr>
    <tr>
        <td align="right" style="width: 80px">廠商名稱</td>
        <td colspan=5 ><asp:TextBox ID="TBPayName"  runat="server" Width="490px" Enabled="False"></asp:TextBox>
        </tr>
       <tr>
        <td style="width: 80px; text-align: right;">事由(名稱)</td>
        <td colspan="5">
            <asp:TextBox ID="TBAcmSubMemo" style="BACKGROUND-COLOR: #ffffe0" runat="server" 
                Width="480px" Enabled="False" MyName="TBAcmMemo" Rows="2" TextMode="MultiLine"></asp:TextBox>
            <input id="BtnSubPhrase" runat="server" type="button" value="..." disabled="disabled" />
        </td>
    </tr>
    <tr >
        <td style="width: 80px; text-align: right;">控帳事由</td>
        <td colspan="5">
            <asp:TextBox ID="TBAcmMemo" runat="server" Width="480px" Enabled="False" MyName="TBAcmMemo" Rows="2" TextMode="MultiLine"></asp:TextBox><input id="BtnPhrase" runat="server" type="button" value="..." disabled="disabled" />
       </td>
    </tr>
    <tr>
        <td colspan=6>
        									<table>
										<tr>
											<td style="FONT-SIZE: 12pt; WIDTH: 63px" rowSpan="2"><b><asp:checkbox id="CBContract" runat="server" Text="合約" onclick="HasContract(this);"></asp:checkbox></b></td>
											<td style="FONT-SIZE: 12pt; WIDTH: 72px" align="right">合約編號</td>
											<td><asp:textbox id="TBContractNo" runat="server" Width="120px"  Enabled="False"></asp:textbox></td>
											<td style="FONT-SIZE: 12pt; WIDTH: 75px" align="right">開標日期</td>
											<td><asp:textbox id="TBBidDate" runat="server" Width="80px" MaxLength="10"  Enabled="False"></asp:textbox></td>
											<td style="FONT-SIZE: 12pt; WIDTH: 90px" align="right">合約起始日</td>
											<td><asp:textbox id="TBConBDate" runat="server" Width="80px" MaxLength="10"  Enabled="False"></asp:textbox></td>
										</tr>
										<tr>
											<td style="FONT-SIZE: 12pt; WIDTH: 72px" align="right">合約名稱</td>
											<td><asp:textbox id="TBContractName" runat="server" Width="120px"  Enabled="False"></asp:textbox></td>
											<td style="FONT-SIZE: 12pt; WIDTH: 75px" align="right">簽約日期</td>
											<td><asp:textbox id="TBSignDate" runat="server" Width="80px" MaxLength="10"  Enabled="False"></asp:textbox></td>
											<td style="FONT-SIZE: 12pt; WIDTH: 90px" align="right">合約結束日</td>
											<td><asp:textbox id="TBConEDate" runat="server" Width="80px" MaxLength="10"  Enabled="False"></asp:textbox></td>
										</tr>
									</table>

        </td>
    </tr>        </table>
<COMPONENTART:CALENDAR id="UCM1Date" runat="server" ClientSideOnSelectionChanged="UCM1Date_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCBidDate" runat="server" ClientSideOnSelectionChanged="UCBidDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCConBDate" runat="server" ClientSideOnSelectionChanged="UCConBDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCSignDate" runat="server" ClientSideOnSelectionChanged="UCSignDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCConEDate" runat="server" ClientSideOnSelectionChanged="UCConEDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCQuotDate" runat="server" ClientSideOnSelectionChanged="UCQuotDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>
<asp:dropdownlist id="DDLSubCat"  runat="server" Width="120px" Enabled="False" 
    Visible="False"></asp:dropdownlist>
