<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearch.aspx.vb" Inherits="UI.AdminVerify.Web.FrmSearch" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    	<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
        <meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<script language="javascript" type="text/javascript" >
		    function UCBDate_Change(calendar)
			    {
				    var vDay = new Date(calendar.GetSelectedDate());
				    document.getElementById("TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			    }
		    function UCEDate_Change(calendar)
			    {
				    var vDay = new Date(calendar.GetSelectedDate());
				    document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			    }
        </script>

</head>
<body>
<form id="form1" runat="server">
<table cellpadding="5" bordercolor="#666668" bgcolor="#dadee9" border="1" width="600" style="MARGIN-TOP: 5px; MARGIN-LEFT: 5px; BORDER-COLLAPSE: collapse">
	<tr>
		<td>
			<table border="1"  style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width=100%>
				<tr>
					<td>
						<table border="0" cellpadding="1" style="BORDER-COLLAPSE: collapse" width=100% >
							<tr>
								<td align="right" width="80">日期區間</td>
								<td colspan="3">
								    <asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
								    <asp:Label id="Label2" runat="server">(日期範例:095/09/28)</asp:Label>

								</td>
							</tr>
							<tr>
								<td align="right" width="80">門別</td>
								<td><asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList>
								</td>
								<td align="right" width="80">預算來源</td>
								<td><asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td align="right" width="80">經費單位</td>
								<td><asp:DropDownList id="DDLBgtDep" runat="server" AutoPostBack="True"></asp:DropDownList>
								</td>
								<td align="right" width="80">執行單位</td>
								<td><asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList>
								</td>
							</tr>
							<tr style="display:none">
								<td align="right" width="80">承辦業務</td>
								<td><asp:DropDownList id="DDLBizName" runat="server"></asp:DropDownList></td>
								<td align="right" width="80">&nbsp;</td>
								<td>
									&nbsp;</td>
							</tr>
							<tr>
								<td align="right" width="80">計畫</td>
								<td colspan="3"><asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" 
                                        Width="450px"></asp:DropDownList></td>
							</tr>
							<tr>
								<td align="right" width="80">用途別</td>
								<td colspan="3"><asp:DropDownList id="DDLOul" runat="server" Width="450px"></asp:DropDownList></td>
							</tr>
							<tr>
								<td align="right" width="80">簽證編號</td>
								<td><asp:TextBox id="TBAcmWordNum" runat="server" Width="150px"></asp:TextBox></td>
								<td align="right" width="80">承辦人員</td>
								<td>
                                    <asp:DropDownList ID="DDLStaffName" runat="server">
                                    </asp:DropDownList>
                                </td>
							</tr>
							<tr>
								<td align="right" width="80">付款方式</td>
								<td>
									<asp:DropDownList id="DDLPayKind" runat="server">
										<asp:ListItem Value="">......</asp:ListItem>
										<asp:ListItem Value="0">實付款</asp:ListItem>
										<asp:ListItem Value="1">暫付款</asp:ListItem>
									</asp:DropDownList></td><td align="right" width="80">
                                    審核狀態</td>
								<td>
								    <asp:Dropdownlist id="DDLPassFlag" runat="server" Width="98px">
                                        <asp:ListItem Value="">......</asp:ListItem>
                                        <asp:ListItem Value="0">未核支</asp:ListItem>
                                        <asp:ListItem Value="1">已核支</asp:ListItem>
                                    </asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td align="right" width="80">資料階段</td>
								<td>
				                    <asp:DropDownList id="DDLVisaStage" runat="server">
				                        <asp:ListItem Value="0">簽證請示</asp:ListItem>
				                        <asp:ListItem Value="11">簽證報支</asp:ListItem>
				                        <asp:ListItem Value="5">其他費用報支</asp:ListItem>
				                    </asp:DropDownList>
				                </td>
				                <td align="right" width="80" style="font-size:10pt">零用金支付</td>
								<td>
				                    
								    <asp:Dropdownlist id="DDLProdVisaKind" runat="server" Width="98px">
                                        <asp:ListItem Value="">......</asp:ListItem>
                                        <asp:ListItem Value="0">非零用金支付</asp:ListItem>
                                        <asp:ListItem Value="1">零用金支付</asp:ListItem>
                                    </asp:DropDownList>
				                    
								</td>

							</tr>
							<tr>
								<td align="right" width="80">事由說明</td>
								<td>
								    <asp:TextBox id="TBMemo" runat="server" Width="150px"></asp:TextBox>
								</td><td align="right" width="80">&nbsp;</td>
								<td></td>
							</tr>
							</table>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Button id="BtnList" runat="server" Text="列出資料"></asp:Button>
	        		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
    <COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR> 
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>
     </form>
</body>
</html>
