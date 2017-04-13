<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmBudget.aspx.vb" Inherits="UI.Budget.Web.FrmBudget" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    	<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript">


		    function fnCallSearchDialog(){
		        var tmpStr;
		        tmpStr= "FrmSortBudget.aspx?mod=" + <%=strModFlag %> + "&showtype=1"

		        var strReturnVal=showModalDialog(tmpStr,window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		        //window.open(tmpStr, 'cp', 'height=480,width=640,scrollbars=yes,resizable=yes,location=no,status=yes,toolbar=no,menubar=no');

		        if (strReturnVal != "Cancel" )
		        {
                    //<%--從FrmSortBudget取得SQL語法而且還代' 這種字元，真天才--%>
		            document.all("TBFindSql").value=strReturnVal;
		        }
		        //Form1.TBFindSql.value=strReturnVal;
		    }





		function fnCallPhraseDialog(){

		var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel" )
			{
				document.all("TBMemo").value=document.all("TBMemo").value+strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}






	function UCDate_Change(calendar)
	{
		var lbl_acmTrlStaySDate = document.getElementById("TBDate");
		var vDay = new Date(calendar.GetSelectedDate());
		lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
	}


function JFormatNumber(srcStr,nAfterDot){
　　var srcStr,nAfterDot;
　　var resultStr,nTen;
　　srcStr = ""+srcStr+"";
　　strLen = srcStr.length;
　　dotPos = srcStr.indexOf(".",0);
　　if (dotPos == -1){
　　　　resultStr = srcStr+"";
　　　　for (i=0;i<nAfterDot;i++){
　　　　　　resultStr = resultStr+"0";
　　　　}
　　　　return resultStr;
　　}
　　else{
　　　　if ((strLen - dotPos - 1) >= nAfterDot){
　　　　　　nAfter = dotPos + nAfterDot + 1;
　　　　　　nTen =1;
　　　　　　for(j=0;j<nAfterDot;j++){
　　　　　　　　nTen = nTen*10;
　　　　　　}
　　　　　　resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
　　　　　　return resultStr;
　　　　}
　　　　else{
　　　　　　resultStr = srcStr;
　　　　　　for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
　　　　　　　　resultStr = resultStr+"0";
　　　　　　}
　　　　　　return resultStr;
　　　　}
　　}
}






// Removes leading whitespaces
function LTrim( value ) {

	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");

}

// Removes ending whitespaces
function RTrim( value ) {

	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");

}

// Removes leading and ending whitespaces
function trim( value ) {

	return LTrim(RTrim(value));

}







function GetTotalMonthly(){
	var dblTotal;
		dblTotal = 0;
		for (var i=0;i<document.forms[0].elements.length;i++)
		{
			var e=document.forms[0].elements[i];
			if (e.getAttribute("MyName") == "TBMyMoney")
			{
				if (trim(e.value) == ''){ e.value ="0";}
				if (isNaN(e.value) == false )
				{
					//alert(e.value);
					//alert(parseInt(e.value));
					dblTotal += eval(e.value);
					//alert(totalmoney);
				}
			}
		}
		//document.all("TBBudget").value =totalmoney;
		//alert(dblTotal);
		//document.all("TBTotal").value = JFormatNumber(dblTotal,0);
		//document.all("TBTotal").value = ShowFormatNumber(dblTotal,0);
		//document.all("TBTotal").value = parseFloat(dblTotal).toFixed(0);

		return dblTotal;
}











function  GetDealMonthlyMoney(parObj)
{


		var bValue
		var fValue
		var lValue
		var dValue
		var i
		var msgStr



		if (parObj.value == "2") {

			dValue = "2" ;    //將半年分配轉成2

			}
		else
		{
			dValue = parObj.value;

		}


	//----------先將金額商數跟餘數處理好----------------------------------------------------------
		bValue= parseFloat(replaceString(document.all("TBBudget").value,",","")).toFixed(0);



		lValue=bValue % dValue;  //取餘數
		fValue=Math.floor(bValue / dValue);  //取商數



	//-------全部先歸零----------------------------

		for (var i=0;i<document.forms[0].elements.length;i++)
		{
			var e=document.forms[0].elements[i];
			if (e.getAttribute("MyName") == "TBMyMoney")
			{
				e.value=0;
			}
		}




//--------switch 開始--------------------------------------------

		switch(dValue) {

		case "1":  //年分配
				//document.all("DataList1__ctl1_TBMonthMoney").value= bvalue
				//950428:改成2.0
				//GetByID("DataList1__ctl1_TBMonthMoney").value= bvalue
			for (var i=0;i<document.forms[0].elements.length;i++)
			{
				var e=document.forms[0].elements[i];
					if (e.getAttribute("MyName") == "TBMyMoney" && e.getAttribute("MyNameIndex") == "1" )
					{
						e.value=  bValue ;
					}
			}

			break;
		case "4":  //季分配


			//document.all("DataList1__ctl1_TBMonthMoney").value=fvalue
			//document.all("DataList1__ctl4_TBMonthMoney").value=fvalue
			//document.all("DataList1__ctl7_TBMonthMoney").value=fvalue
			//document.all("DataList1__ctl10_TBMonthMoney").value= fvalue



				for (var i=0;i<document.forms[0].elements.length;i++)
				{
				var e=document.forms[0].elements[i];
					if (e.getAttribute("MyName") == "TBMyMoney" )
					{
						for (var j=1;j<=dValue;j++)
						{
						//myNameindex =1,4,7,10時給商數
							if (e.getAttribute("MyNameIndex") == (j * (12/ dValue))-2)
							{
								e.value= fValue ;
							}
						}

						//myNameindex =1,4,7,10時給餘數
						for (var j=1;j<=Math.abs(lValue);j++)
						{

						if (e.getAttribute("MyNameIndex") == (j * (12/ dValue))-2)
							{
								e.value = 	parseFloat(e.value) + parseFloat(lValue/Math.abs(lValue)) ;
							}
						}


					}
				}



					break;

		case "2":  //將半年分配轉成2






		for (var i=0;i<document.forms[0].elements.length;i++)
				{
				var e=document.forms[0].elements[i];
					if (e.getAttribute("MyName") == "TBMyMoney")
					{

						for (var j=1;j<=dValue;j++)
						{
						//myNameindex =1,7時給商數

							if (e.getAttribute("MyNameIndex") == (j * (12/ dValue))-5)
							{
								e.value= fValue ;
							}
						}

						//myNameindex =1,7時給餘數
						for (var j=1;j<=Math.abs(lValue);j++)
						{

						if (e.getAttribute("MyNameIndex") == (j * (12/ dValue))-5)
							{
								e.value = 	parseFloat(e.value) + parseFloat(lValue/Math.abs(lValue)) ;
							}
						}


					}
				}

			break;

			//GetByID("DataList1__ctl1_TBMonthMoney").value=fvalue + lvalue
			//GetByID("DataList1__ctl7_TBMonthMoney").value= fvalue
		case "12":   //月分配




			for (var i=0;i<document.forms[0].elements.length;i++)
				{
				var e=document.forms[0].elements[i];
					if (e.getAttribute("MyName") == "TBMyMoney"   )
					{

						//for (var j=1;j<=dValue;j++)
						//{

						//myNameindex =1,4,7,10時給商數
							//if (e.getAttribute("MyNameIndex") = (j * (12/ dValue)))
							//{
								e.value= fValue ;
							//}
						//}

						//給餘數
						for (var j=1;j<=Math.abs(lValue);j++)
						{

						if (e.getAttribute("MyNameIndex") == j)
							{
							e.value = 	parseFloat(e.value) + parseFloat(lValue/Math.abs(lValue)) ;
							}
						}


					}
				}


		break;

		}

	//--------switch 結束--------------------------------------------











	if ( <%= strShowType & ""  %> != "0" )  //如果不是分配調整作業，要判斷預算分配要比暫列數多
	{

		for (var i=1; i<=3; i++)
		{
		var hideValue;
		var msgStr;
		msgStr="";
		hideValue=0;


			for (var j=0; j<document.forms[0].elements.length;j++)
			{
				var e=document.forms[0].elements[j];

						if (e.getAttribute("MyNameIndex") == i )
							{
								hideValue = e.title ;
								//空字串轉為0
								if (hideValue == "")
								{
									hideValue = 0;
								}

								//分配數小於暫列數，提出警告
								if (parseFloat( replaceString(document.all("TBBudget").value, ",", "")) - hideValue < 0)
								{
									if (msgStr == "" )
									{
										msgStr &=  i ;
									}
									else
									{
										msgStr &= "、" &  i  ;
									}
								}

								//break;
							}

			} // next j


		} // next i


		if (msgStr != "" )
		{
			alert( msgStr + " 月份的分配數比暫列數少，請重新分配。");
		}
	} //end if



} //End Function









	function CheckTmpBudget(parObj)
	{

//alert("1");
		if (<%=strShowType &"" %> == 3 )
		{
		//alert("2");
			if ( parObj.MyNameIndex <= 3  && parObj.title !="" )
			{
			//alert("3");
				if ( parseFloat(replaceString(parObj.value,",","")) - parseFloat( parObj.title) < 0)
				{
				//alert("4");
					alert( parObj.MyNameIndex + " 月份的分配數比暫列數少，請重新分配。");
				}

			}
		} //end if
	} //End function


















function getByID(ID,NewName)
{var Obj;
try{
 if(NewName) Obj=document.all(getNew2_0ID(ID,0,NewName));
 else Obj=document.all(ID);
} catch(e){;}
 if(!Obj)
  for(var i=1;i<=3;i++)
  { try{
      Obj=document.all(getNew2_0ID(ID,i,NewName));
       if(Obj) break;
      } catch(e){;}
   }
   return Obj;
}
function getNew2_0ID(ID,ZeroCnt,NewName) //1.1 to 2.0
{var OneStr="__ctl";//1.1
 var OneStr2_0="_ctl";//2.0
 var TwoStr="_";
 var i,j;

 var Ary=ID.split(OneStr);
 if(Ary.length<=1) //2.0
 {Ary=ID.split(OneStr2_0);
   ZeroCnt=0;  //not to 2.0
 }
 else
 if(!ZeroCnt) //not to 2.0
 {OneStr2_0=OneStr;
  ZeroCnt=0;
 }
 var newID=Ary[0];
 var Ary2;
 for(j=1;j<Ary.length;j++)
 { newID+=OneStr2_0;
    Ary2=Ary[j].split(TwoStr);
    for(i=0;i<ZeroCnt;i++)  newID+="0";
    newID+=Ary2[0];
    if(j+1==Ary.length&&NewName)
       newID+=TwoStr+NewName;
    else
    { for(i=1;i<Ary2.length;i++)   newID+=TwoStr+Ary2[i];}
  }
  return newID;
}






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
		<script language="vbscript">

Sub GetDealMoney(parObj)

	GetDealMonthlyMoney(parObj)

	document.all("TBTotal").value=	FormatNumber(GetTotalMonthly(),  0, , , true)
end sub







sub GetMonthTotalUp(parObj)

		document.all("TBBudget").value=	FormatNumber(GetTotalMonthly(),  0, , , true)
        document.all("TBTotal").value=	FormatNumber(GetTotalMonthly(),  0, , , true)
End sub




sub sumtotal(parObj)


		document.all("TBTotal").value=	FormatNumber(GetTotalMonthly(),  0, , , true)


end sub





		</script>
</head>
<body>
    <form id="form1" runat="server">
   	<table cellSpacing="0" cellPadding="0" border="0">
				<tr>
					<td vAlign="top">
						<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668"
							cellPadding="0" bgColor="#dadee9" border="1">
							<tr>
								<td>
									<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" border="1">
										<tr style="display:none">
											<td>
												<table style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" border="0">
													<tr>
														<td width="100">&nbsp;</td>
														<td width="100">&nbsp;</td>
														<td width="100"><asp:label id="LBBgtNo" runat="server" Visible="False"></asp:label></td>
														<td width="100"></td>
														<td width="100"></td>
														<td align="right" width="100"><asp:checkbox id="CBAccount" runat="server" 
                                                                Visible="true"  Text="主計室審核" TextAlign="Left"
																Font-Size="Small" Enabled="false"></asp:checkbox></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table style="WIDTH: 600px; HEIGHT: 184px" cellSpacing="0" cellPadding="5" border="0">
													<tr>
														<td align="right" width="100">預算年度</td>
														<td width="150"><asp:textbox id="tb_year" style="BACKGROUND-COLOR: #dadee9; TEXT-ALIGN: center" runat="server"
																width="30px"></asp:textbox></td>
														<td align="right" width="100">&nbsp;</td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td align="right" width="100"><FONT face="新細明體">預算來源</FONT></td>
														<td width="150"><asp:dropdownlist id="DDLBgtSource" runat="server"></asp:dropdownlist></td>
														<td align="right" width="100">預備金次數</td>
														<td><asp:TextBox ID="TBBgtSourCnt" runat="server" Width="50px"></asp:TextBox></td>
													</tr>
													<tr>
														<td align="right" width="100">經費單位</td>
														<td width="150"><asp:dropdownlist id="DDLDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
														<td align="right" width="100">承辦單位</td>
														<td><asp:dropdownlist id="DDLWorkDep" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td align="right" width="100">經資門別</td>
														<td width="150"><asp:dropdownlist id="DDLAccKind" runat="server"></asp:dropdownlist></td>
														<td align="right" width="100">承辦業務別</td>
														<td><asp:dropdownlist id="DDLBiz" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td align="right" width="100">計畫年度與科目</td>
														<td colSpan="3">
															<asp:DropDownList id="DDLOulYear" runat="server" AutoPostBack="True" Width="50px"></asp:DropDownList><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="410px"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td align="right" width="100">用途別科目</td>
														<td colSpan="3"><asp:dropdownlist id="DDLOutlay" runat="server" Width="460px"></asp:dropdownlist><br>
															<font size="2">
																<asp:checkbox id="CBUP" runat="server" Visible="False" Text="不計入上層(獨立)"></asp:checkbox></font></td>
													</tr>
													<tr style="display:none">
													    <td align="right" width="100">保留類型</td>
													    <td>
													        <asp:DropDownList ID="DDLBgtKindSet" runat="server" >
													            <asp:ListItem Value="">......</asp:ListItem>
													            <asp:ListItem Value="1">應付歲出款</asp:ListItem>
													            <asp:ListItem Value="2">保留準備數</asp:ListItem>
													        </asp:DropDownList>
                                                        </td>
													    <td></td>
													    <td></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="5" border="0">
													<tr>
														<td align="right" width="100">日期</td>
														<td width="460">
															<table cellSpacing="0" cellPadding="2" border="0">
																<tr>
																	<td><asp:textbox id="TBDate" ondblclick="JavaScript:UCDate.Show();" style="IME-MODE: disabled; TEXT-ALIGN: center"
																			runat="server" Width="60px"></asp:textbox><COMPONENTART:CALENDAR id="UCDate" runat="server" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader"
																			DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif"
																			PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCDate_Change"
																			cultureid="1028"></COMPONENTART:CALENDAR></td>
																	<td>預算數</td>
																	<td><asp:textbox id="TBBudget" style="TEXT-ALIGN: right" runat="server" Width="70px"></asp:textbox></td>
																	<td><asp:label id="LBUnitName" runat="server" Font-Size="Small">(單位：千元)</asp:label></td>
																	<td style="DISPLAY:none"><asp:dropdownlist id="DDLKind" runat="server">
																			<asp:ListItem Value="0">經費調整</asp:ListItem>
																			<asp:ListItem Value="1">個人</asp:ListItem>
																			<asp:ListItem Value="2">預算暫列數</asp:ListItem>
																			<asp:ListItem Value="3">預算及分配</asp:ListItem>
																		</asp:dropdownlist></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td align="right" width="100">備註</td>
														<td width="460">
															<table cellSpacing="0" cellPadding="0" border="0">
																<tr>
																	<td><asp:textbox id="TBMemo" style="TEXT-ALIGN: left" runat="server" Width="430px" text=""></asp:textbox></td>
																	<td><INPUT id="BtnPhrase" style="WIDTH: 22px; HEIGHT: 22px" onclick="fnCallPhraseDialog();"
																			type="button" value="..." name="Button1" runat="server"></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table style="TABLE-LAYOUT: fixed; WIDTH: 600px; HEIGHT: 46px" cellSpacing="0" cellPadding="3"
													border="0">
													<tr>
														<td width="100"><asp:button id="BtnAddDetail" runat="server" Text="預算分配" Width="75px" Height="22px"></asp:button></td>
														<td width="400">
															<table cellSpacing="0" cellPadding="0" border="0">
																<tr>
																	<td><INPUT id="BtnWholeYear" title="自動年分配" style="WIDTH: 22px; HEIGHT: 22px" onclick="vbscript:GetDealMoney(me)"
																			type="button" value="1" name="BtnWholeYear" runat="server"></td>
																	<td><INPUT id="BtnHalfYear" title="自動半年分配" style="WIDTH: 22px; HEIGHT: 22px" onclick="vbscript:GetDealMoney(me)"
																			type="button" value="2" name="BtnHalfYear" runat="server"></td>
																	<td><INPUT id="BtnSeason" title="自動季分配" style="WIDTH: 22px; HEIGHT: 22px" onclick="vbscript:GetDealMoney(me)"
																			type="button" value="4" name="BtnSeason" runat="server"></td>
																	<td><INPUT id="BtnMonth" title="自動月分配" style="WIDTH: 22px; HEIGHT: 22px" onclick="vbscript:GetDealMoney(me)"
																			type="button" value="12" name="BtnMonth" runat="server"></td>
																	<td>&nbsp;<INPUT id="BtnMonthTotalUp" title="加總分配數" style="WIDTH: 22px; HEIGHT: 22px" onclick="vbscript:GetMonthTotalUp(me)"
																			type="button" value="0" name="BtnMonth" runat="server"></td>
																	<td><font style="FONT-SIZE: 12pt" size="2">分配總計</font>
																		<asp:textbox id="TBTotal" style="TEXT-ALIGN: right" runat="server" Width="128px" ReadOnly="True"
																			BackColor="Transparent"></asp:textbox></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
												<table style="TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" border="0">
													<tr>
														<td width="602" colSpan="6">
															<div id="freezingDiv2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: 93px"><asp:datalist id="DataList1" runat="server" width="100%" cellPadding="0" cellSpacing="0" RepeatColumns="6"
																	RepeatDirection="Horizontal">
																	<HeaderTemplate>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<TABLE style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" cellSpacing="0" cellPadding="0"
																			bgColor="#ffffff" border="1">
																			<TR>
																				<TD noWrap align="center" bgColor="#003366"><FONT color="#ffffff" size="2"><%# Container.ItemIndex +1  & "月份"%></FONT></TD>
																			</TR>
																			<TR>
																				<TD bgColor="#f5f5f5">
																					<asp:TextBox id=TBMonthMoney onblur="vbscript:sumtotal(me)" style="TEXT-ALIGN: right" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.bgtmMoney","{0:#,0}") %>' Width="95%" onchange="javascript:CheckTmpBudget(this);" MyName ="TBMyMoney" MyNameIndex="<%# Container.ItemIndex +1 %>" >
																					</asp:TextBox></TD>
																			</TR>
																		</TABLE>
																	</ItemTemplate>
																</asp:datalist></div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td style="PADDING-LEFT: 5px; PADDING-TOP: 10px" vAlign="top" width="200"><iframe border=0 name=iFrame src="<%=strShowPath%>" frameBorder=0 width="100%" scrolling=no height=500 >您的瀏覽器不支援內置框架或目前的設定為不顯示內置框架。</iframe></td>
				</tr>
			</table>
			<table style="MARGIN-TOP: 5px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668" cellPadding="0" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" border="0">
										<tr>
											<td><asp:button id="BtnAdd" runat="server" Text="新增" Width="50px" Height="22px"></asp:button></td>
											<td><asp:button id="BtnEdit" runat="server" Text="修改" Width="50px" Height="22px"></asp:button></td>
											<td><asp:button id="BtnDelete" runat="server" Text="刪除" Width="50px" Height="22px"></asp:button></td>
											<td><asp:button id="BtnSave" runat="server" Text="儲存" Width="50px" Height="22px"></asp:button></td>
											<td><asp:button id="BtnCancel" runat="server" Text="取消" Width="50px" Height="22px"></asp:button></td>
											<td><asp:button id="BtnSearch" runat="server" Text="查詢" Width="50px" Height="22px"></asp:button></td>
											<td style="DISPLAY: none"><asp:button id="BtnPrint" runat="server" Text="列印" Width="50px" Height="22px"></asp:button></td>
											<td style="DISPLAY: none"><asp:dropdownlist id="DDLRpt" style="FONT-SIZE: 10px" runat="server"></asp:dropdownlist></td>
											<td style="DISPLAY: none"><asp:dropdownlist id="DDLPassKind" style="FONT-SIZE: 10px" runat="server">
													<asp:ListItem Value="0">不區分</asp:ListItem>
													<asp:ListItem Value="1">未審</asp:ListItem>
													<asp:ListItem Value="2">已審</asp:ListItem>
												</asp:dropdownlist></td>
											<td style="DISPLAY: none"><INPUT id="TBFindSql" style="WIDTH: 25px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql"
													runat="server"> <INPUT id="TBOrderTxt" style="WIDTH: 25px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt"
													runat="server">
											</td>
											<td><font size="2"><asp:checkbox id="CBClear" runat="server" Text="複製"></asp:checkbox></font></td>
											<td><asp:button id="BtnShowBgt" runat="server" Visible="False" Text="支用情形" Width="80px" Height="22px"></asp:button></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<div id="_freezingDiv" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: auto"><asp:datagrid id="DataGrid1" runat="server" Width="100%" BackColor="White" DataKeyField="bgtNo"
											AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" CellSpacing="1" CellPadding="3" GridLines="None" AllowSorting="True">
											<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
											<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
											<HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<ItemTemplate>
														<asp:CheckBox id=CBdgSelect runat="server" AutoPostBack="True" CommandName="Select" OnCheckedChanged="CBdgSelect_CheckedChanged" CssClass="<%# Container.ItemIndex %>">
														</asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="bgtNo" SortExpression="bgtNo" HeaderText="編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="bgtYear" SortExpression="bgtYear" HeaderText="年度"></asp:BoundColumn>
												<asp:BoundColumn DataField="DepName" SortExpression="DepName" HeaderText="單位"></asp:BoundColumn>
												<asp:BoundColumn DataField="PlanName" SortExpression="PlanName" HeaderText="計劃科目"></asp:BoundColumn>
												<asp:BoundColumn DataField="OulName" SortExpression="OulName" HeaderText="用途別科目"></asp:BoundColumn>
												<asp:BoundColumn DataField="bgtMoney" SortExpression="bgtMoney" HeaderText="預算數" DataFormatString="{0:#0}">
													<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="bgtDate" SortExpression="bgtDate" HeaderText="核定日期">
													<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="bgtMemo" SortExpression="bgtMemo" HeaderText="備註"></asp:BoundColumn>
												<asp:BoundColumn DataField="bgtPlanCode" HeaderText="計畫代碼" Visible="False"></asp:BoundColumn>
												<asp:BoundColumn DataField="bgtOutlayYear" HeaderText="用途別年度" Visible="False"></asp:BoundColumn>
												<asp:BoundColumn DataField="bgtOutlayCode" HeaderText="用途別代碼" Visible="False"></asp:BoundColumn>
												<asp:BoundColumn DataField="bgtDepCode" HeaderText="部門代碼" Visible="False"></asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<!-- Insert content here -->
    </form>
</body>
</html>
