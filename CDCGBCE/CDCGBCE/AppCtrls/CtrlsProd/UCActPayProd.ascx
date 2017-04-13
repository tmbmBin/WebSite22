<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayProd.ascx.vb" Inherits="AppCtrls.UCActPayProd" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script language="javascript">
<!--

		function fnCallPhraseDialog(thisName)
		{
				var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

				if (strReturnVal != "Cancel" )
				{
						document.all(thisName).value=document.all(thisName).value + strReturnVal;
				}
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

		function UCAcmProdDate_Change(calendar) {
		    var vDay = new Date(calendar.GetSelectedDate());
		    //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

		    for (var i = 0; i < document.forms[0].elements.length; i++) {
		        var e = document.forms[0].elements[i];
		        if (e.getAttribute("MyName") == "TBAcmProdDate") {
		            e.value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		            break;
		        }
		    }

		}


		function UCAcmRequireDate_Change(calendar) {
		    var vDay = new Date(calendar.GetSelectedDate());
		    //document.getElementById("TBAcmMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();

		    for (var i = 0; i < document.forms[0].elements.length; i++) {
		        var e = document.forms[0].elements[i];
		        if (e.getAttribute("MyName") == "TBAcmRequireDate") {
		            e.value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		            break;
		        }
		    }

		}

		function ContractStatus(parObj)
		{

			if (parObj.checked==true)
			{
				for (var i=0;i<document.forms[0].elements.length;i++)
				{
					var e=document.forms[0].elements[i];
					if (e.getAttribute("MyName")=="TBContractNo")
					{

						   e.disabled=false;
					}
					 if (e.getAttribute("MyName")=="TBBidDate")
					{

						   e.disabled=false;
					}
					 if (e.getAttribute("MyName")=="TBConBDate")
					{

						   e.disabled=false;
					}



					if (e.getAttribute("MyName")=="TBContractName")
					{

						   e.disabled=false;
					}
					if (e.getAttribute("MyName")=="TBSignDate")
					{

						   e.disabled=false;
					}
					if (e.getAttribute("MyName")=="TBConEDate")
					{

						   e.disabled=false;

					}
				}


			}
			else
			{

				if(confirm('取消合約選項，合約資料將會清空，確定要取消?'))
				{
					for (var i=0;i<document.forms[0].elements.length;i++)
					{
						var e=document.forms[0].elements[i];
						if (e.getAttribute("MyName")=="TBContractNo")
						{
							   e.value="";
							   e.disabled=true;
						}
						 if (e.getAttribute("MyName")=="TBBidDate")
						{
								e.value="";
							   e.disabled=true;
						}
						 if (e.getAttribute("MyName")=="TBConBDate")
						{
								 e.value="";
							   e.disabled=true;
						}



						if (e.getAttribute("MyName")=="TBContractName")
						{
								 e.value="";
							   e.disabled=true;
						}
						if (e.getAttribute("MyName")=="TBSignDate")
						{
								 e.value="";
							   e.disabled=true;
						}
						if (e.getAttribute("MyName")=="TBConEDate")
						{
								 e.value="";
							   e.disabled=true;

						}
					}
				 }
				 else
				 {parObj.checked=true;}

			}
		}

//-->
</script>

<table _ondblclick="alert('1B:UCActPayProd.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
	<tr>
		<td>
		<!-- ↓折疊項目(11) -->
		<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
						<td width="1%" align="right"><img id="img_FoldTitle_1B" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_1B', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
						<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_1B')">請購內容<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_1B" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 0px">
				<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed; display:none" border="0">
					<tr>
						<td width="100" align="right"><asp:checkbox id="CBContract" runat="server" Text="合約" onclick="ContractStatus(this);"></asp:checkbox></td>
						<td width="100">　</td>
						<td width="100" align="right">　</td>
						<td width="100">　</td>
						<td width="100" align="right">估價日期</td>
						<td width="100"><asp:textbox id="TBQuotDate" runat="server" MyName="TBQuotDate" Width="90px" MaxLength="10" ondblclick="JavaScript:UCQuotDate.Show();"></asp:textbox></td>
					</tr>
					<tr>
						<td width="100" align="right">合約編號</td>
						<td width="100"><asp:textbox id="TBContractNo" runat="server" MyName="TBContractNo" Width="90px"></asp:textbox></td>
						<td width="100" align="right">開標日期</td>
						<td width="100"><asp:textbox id="TBBidDate" runat="server" MyName="TBBidDate" Width="90px" MaxLength="10" ondblclick="JavaScript:UCBidDate.Show();"></asp:textbox></td>
						<td width="100" align="right">合約起始日</td>
						<td width="100"><asp:textbox id="TBConBDate" runat="server" MyName="TBConBDate" Width="90px" MaxLength="10" ondblclick="JavaScript:UCConBDate.Show();"></asp:textbox></td>
					</tr>
					<tr>
						<td width="100" align="right">合約名稱</td>
						<td width="100"><asp:textbox id="TBContractName" runat="server" MyName="TBContractName" Width="90px"></asp:textbox></td>
						<td width="100" align="right">簽約日期</td>
						<td width="100"><asp:textbox id="TBSignDate" runat="server" MyName="TBSignDate" Width="90px" MaxLength="10" ondblclick="JavaScript:UCSignDate.Show();"></asp:textbox></td>
						<td width="100" align="right">合約結束日</td>
						<td width="100"><asp:textbox id="TBConEDate" runat="server" MyName ="TBConEDate" Width="90px" MaxLength="10" ondblclick="JavaScript:UCConEDate.Show();"></asp:textbox></td>
					</tr>
				</table>
				<!-- Insert 項目內容 here -->
				 <table cellpadding="2" cellspacing="0"  border="0">
	                    <tr>
	                        <td >採購方式：</td>
	                        <td>
                                <asp:TextBox ID="TBAcmProdMethod" runat="server" Width="250px"></asp:TextBox>
                            </td>
	                    </tr>	                
	                    <tr>
	                        <td >辦理結果：</td>
	                        <td>
                                <asp:TextBox ID="TBAcmProdResult" runat="server" Width="250px" Enabled="false"></asp:TextBox>
                            </td>
	                    </tr>
	                    <tr>
	                        <td >採購日期：</td>
	                        <td>
                                <asp:TextBox ID="TBAcmProdDate" runat="server"  MyName ="TBAcmProdDate" Width="90px" MaxLength="10" Enabled="false" ondblclick="JavaScript:UCAcmProdDate.Show();"></asp:TextBox>
                            </td>
	                    </tr>
	                    <tr>
	                        <td >需要日期：</td>
	                        <td>
                                <asp:TextBox ID="TBAcmRequireDate" runat="server"  MyName ="TBAcmRequireDate" Width="90px" MaxLength="10" Enabled="false" ondblclick="JavaScript:UCAcmRequireDate.Show();"></asp:TextBox>
                            </td>
	                    </tr>

	                </table>
	                </td>
			</tr>
		</table>
		<!-- 折疊項目(11)↑ -->
		</td>
	</tr>

</table>
 
<COMPONENTART:CALENDAR id="UCBidDate"  runat="server" ClientSideOnSelectionChanged="UCBidDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCConBDate" runat="server" ClientSideOnSelectionChanged="UCConBDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCSignDate" runat="server" ClientSideOnSelectionChanged="UCSignDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCConEDate" runat="server" ClientSideOnSelectionChanged="UCConEDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></COMPONENTART:CALENDAR>
<COMPONENTART:CALENDAR id="UCQuotDate" runat="server" ClientSideOnSelectionChanged="UCQuotDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>
<COMPONENTART:CALENDAR id="UCAcmProdDate" runat="server" ClientSideOnSelectionChanged="UCAcmProdDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>
<COMPONENTART:CALENDAR id="UCAcmRequireDate" runat="server" ClientSideOnSelectionChanged="UCAcmRequireDate_Change" PopUp="Custom" PopUpExpandControlId="" CalendarCssClass="calendar" PrevImageUrl="~/images/cal_prevMonth.gif" NextImageUrl="~/images/cal_nextMonth.gif" PickerFormat="Long" SelectedDayCssClass="selectedday" OtherMonthDayCssClass="othermonthday" MonthCssClass="month" DayHoverCssClass="dayhover" DayHeaderCssClass="dayheader" DayCssClass="day" CalendarTitleCssClass="title" CultureId="1028"></ComponentArt:CALENDAR>