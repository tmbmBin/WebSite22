<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmOffSet.aspx.vb" Inherits="UI.OffSet.Web.FrmOffSet" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache"> 
<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
<script language="javascript" src="../ScriptFiles/HideBgtWeb/ShowPayBudgetNew.js"></script>
<script language=javascript type="text/javascript">

 function fnCallRptDtl(parObj){

    var strPars;
    var tmpArray = parObj.cssclass.split(":")  
    var tmpMemo;
    tmpMemo=document.all("TBPayMemo").value;   
 
     strPars = "acmyear=" + tmpArray[0] + "&acmno=" + tmpArray[1] + "&acvno=" + tmpArray[2]  + "&acmno1=" + tmpArray[3] + "&acvno1=" + tmpArray[4] + "&acmno2=" + tmpArray[5] + "&acvno2=" + tmpArray[6] + "&acppayyear=" + tmpArray[7] + "&acppayno=" + tmpArray[8] + "&acvsubno=" +  tmpArray[9]  + "&acppayno1=" + tmpArray[10] + "&acvsubno1=" + tmpArray[11] + "&acmmemo=" +  escape(tmpMemo);

    
    //window.open("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars);
		//var strReturnVal=
		showModalDialog("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars ,window,"dialogWidth:850px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		
//		if (strReturnVal != "Cancel" )
//			{
//				document.all(thisName).value=document.all(thisName).value + strReturnVal;
//			}
		}		

function fnCallSearchDialog(){
 
		var strReturnVal=showModalDialog("FrmSearchPay1.aspx?showtype=1&strDTable=PV&strMTable=P",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
          
		if (strReturnVal != "Cancel")
			{  
				//Form1.TBFindSql.value=strReturnVal;
				//document.all("TBtmp").value=strReturnVal;
				document.all("TBFindSql").value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}

        function UCDate_Change(calendar){
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcpMarkDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
        }
       
           function UCPassDate_Change(calendar){
        var vDay = new Date(calendar.GetSelectedDate());
        document.getElementById("TBAcpPassDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
        }
       
        
	function check_Num(){
			if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
				return true;}
			else{event.keyCode=0;false;}
	}

function fnCallPhraseDialog(thisName){
		var strReturnVal=showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		if (strReturnVal != "Cancel" )
		{
			document.all(thisName).value=document.all(thisName).value+strReturnVal;
		}
	}


    function GetAutoAdjMoney(parObj, parIndex)
    {

            var dblTotal
            dblTotal=0;

            //紀錄簽證金額剩於數
            var objDG 
            var bolFlag
            bolFlag=0;

            //紀錄調整數，找到調整數物件，並記錄起來
            var objAdj
            var bolAdjFlag
            bolAdjFlag=0;

            for (var i=0;i<document.forms[0].elements.length;i++)
            {
                    var e=document.forms[0].elements[i];

                    //找簽證數
                    if (bolFlag== 0)
                    {
                            objDG =document.forms[0].elements[i];

                            if ( e.MyName == "TBdgAcvMoney" && e.MyIndex == parIndex)
                            {			 
                                    bolFlag=1;
                            }
                     }

                    //找調整數
                    if (bolAdjFlag== 0)
                    {
                            objAdj =document.forms[0].elements[i];

                            if ( e.MyName == "TBdgAdjustMoney" && e.MyIndex == parIndex)
                            {				 
                                    bolAdjFlag=1;
                            }
                    }

                    //找出明細總和	
                    if ( e.MyName == "TBdlAcvMoney" && e.MyParentIndex == parIndex)
                    {
                            if (e.value !="" )
                            { 
                                dblTotal += parseFloat(replaceString(e.value,",",""));
                            }
                    }
            } // next i



            if (parObj.checked==true)
            {
                    objAdj.value=parseFloat(replaceString(objDG.value,",","")) - dblTotal;
                    parObj.checked=true;				
            }
            else
            {
                    objAdj.value=0;
                    //parObj.checked=true;
            }
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



    function GetTotalPayMoney(parObj)
    {
            var dblTotal
            var objPayMoney;
            dblTotal=0;

            for (var i=0;i<document.forms[0].elements.length;i++)
            {
                    var e=document.forms[0].elements[i];			

                    if ( e.MyName == "TBdlAcvMoney")
                    {
                            if (e.value !="" )
                            {
                                    dblTotal += parseFloat(replaceString(e.value,",",""));
                            }
                    }
                    
                    if (e.MyName=="TBPayMoney")
                    {
                            objPayMoney=e;
                    }
            } // next i


            objPayMoney.value=dblTotal;
    }

 function GetTotalPassPayMoney(parObj)
    {
            var dblTotal
            var objPayMoney;
            dblTotal=0;

            for (var i=0;i<document.forms[0].elements.length;i++)
            {
                    var e=document.forms[0].elements[i];			

                    if ( e.MyName == "TBdlAcvPassMoney")
                    {
                            if (e.value !="" )
                            {
                                    dblTotal += parseFloat(replaceString(e.value,",",""));
                            }
                    }
                    
                    if (e.MyName=="TBAcpPassMoney")
                    {
                            objPayMoney=e;
                    }
            } // next i


            objPayMoney.value=dblTotal;
    }


    function CheckUpLevlMoney(parObj)
    {
            var dblTotal
            dblTotal=0;
            var objDG 
            var bolFlag
            bolFlag=0;
            var bolFlag1=0;
            var objBtnSplit;
            
            var bolAdjFlag
            bolAdjFlag=0;

            for (var i=0;i<document.forms[0].elements.length;i++)
            {
                    var e=document.forms[0].elements[i];
                    if (bolFlag== 0)
                    {
                            objDG =document.forms[0].elements[i];

                            if ( e.MyName == "TBdgAcvMoney" && e.MyIndex == parObj.MyParentIndex)
                            {
                                    bolFlag=1;
                            }
                    }
                    
                    if (e.MyName=="BtnSplit" && bolFlag1==0 && e.MyIndex== parObj.MyParentIndex)
                    {
                        objBtnSplit=e;
                    }


                      //找調整數
                    if (bolAdjFlag== 0)
                    {
                            objAdj =document.forms[0].elements[i];

                            if ( e.MyName == "TBdgAdjustMoney" && e.MyIndex == parObj.MyParentIndex)
                            {				  
                                    dblTotal += parseFloat(replaceString(objAdj.value,",",""));
                                    bolAdjFlag=1;
                            }
                    }


                    if ( e.MyName == "TBdlAcvMoney" && e.MyParentIndex == parObj.MyParentIndex)
                    {
                            if (e.value !="" )
                            {
                                    dblTotal += parseFloat(replaceString(e.value,",",""));
                            }
                    }
            } // next i

           if (parseFloat(replaceString(objDG.value,",","")) - dblTotal < 0)
            {
                    var tmpNo 
                    tmpNo= parseFloat(parObj.MyParentIndex) + 1;
                    alert("簽證序號為 " + tmpNo  + " 報支金額總數大於原簽證金額。請重新修改。");
                    objBtnSplit.disabled=true;
                    parObj.onfocus;
            }
            else
            {
                 objBtnSplit.disabled=false;
            }
            //document.all("TBacmMoney1").value=dblTotal;

    }




</script>
</head>
<body>
    <form id="form1" runat="server">
     <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="900" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="700" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				<tr>
					<td >
						<table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
							<tr>
								<td  style="font-size:10pt"> <asp:CheckBox ID="CBAllowanceFalg" runat="server"  Text="零用金支付"   TextAlign="Right" Visible="True" Enabled="False" /></td>
								<td  style="font-size:10pt"> <asp:CheckBox ID="CBSeparateFlag" runat="server"  Text="分期付款"     TextAlign="Right" Visible="True" Enabled="False" /></td>
								<td  style="font-size:10pt"> <asp:CheckBox ID="CBDocFlag" runat="server"  Text="簽文" TextAlign="Right"    Visible="True" Enabled="False" /></td>
								<td  style="font-size:10pt">&nbsp;</td>
								<td  style="font-size:10pt">&nbsp;<asp:CheckBox ID="CBSecrearyFlag" runat="server"  Text="秘書室審核"  TextAlign="Left" Visible="False" Enabled="False" /></td>
								<td style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CBAccPassFlag" runat="server" Text="會計室審核" TextAlign="Left" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
				<td >
				<table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
							<tr >
								<td align="right" style="width: 75px">動支編號</td>
								<td style="width: 105px">
								    <asp:TextBox ID="TBAcmWordNum" runat="server" Width="70px" BackColor="Transparent" onfocus="this.blur();"  ></asp:TextBox>
								    <asp:TextBox ID="TBWordSubNum" runat="server" Width="15px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
								<td align="right" style="width: 75px">請示日期</td>
								<td style="width: 85px"><asp:TextBox ID="TBAcmMarkDate" runat="server" Width="80px"  onfocus="this.blur();" style="text-align:center" BackColor="Transparent"  ></asp:TextBox></td>
								<td align="right" style="width: 80px">動支金額</td>
								<td><asp:TextBox ID="TBAcmMoney" runat="server" Width="80px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney"></asp:TextBox></td>
								<td align="right" style="width: 80px">報支年度</td>
								<td ><asp:TextBox ID="TBPayYear" runat="server" BackColor="Transparent"  onfocus="this.blur();" onkeypress="return check_Num()"  Style="text-align: center" Width="32px"></asp:TextBox></td>
							</tr>
                        </table>
				</td>
				</tr>				
				<tr>
				<td >
				 <table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
                                 <tr>
                                        <TD style="width: 75px" align="right">轉正日期</TD>
                                        <TD style="width: 105px">
                                            <asp:TextBox id="TBAcpMarkDate" style="background-color: #ffffe0; text-align:center"  runat="server" Width="90px"  Enabled="False" ondblclick="JavaScript: UCDate.Show();"  ></asp:TextBox></TD>
                                        <TD width="75" align="right">匯出批號</TD>
                                        <TD width="85"><asp:TextBox ID="TBGroupNo" runat="server" Width="80px"></asp:TextBox></TD>
                                        <TD align="right" style="width: 80px">轉正金額</TD>
                                        <TD><asp:TextBox id="TBPayMoney" runat="server" Width="80px" onfocus="this.blur();" onkeypress="return check_Num()" BackColor="Transparent"  style="text-align:right" MyName="TBPayMoney"></asp:TextBox></TD>
                                        <td width="75" align="right">轉正次數</td>
                                        <td><asp:DropDownList ID="DDLPayNo" runat="server" Width="85px" AutoPostBack="True"></asp:DropDownList></td>
                                </tr>                               
                                <tr >
                                        <TD width="75" align="right">報支事由</TD>
                                        <TD colspan=7><asp:TextBox id="TBPayMemo"  style="background-color: #ffffe0"  runat="server" Width="590px"  Enabled="False" ></asp:TextBox><input id="BtnPhrase"  style="height:22px;  text-align:center; text-align:center" runat="server" type="button" value="..." onclick='fnCallPhraseDialog("TBPayMemo");'  /></TD>
                                 </tr>                                
                                </table> 
				</td>
				</tr>
				<tr  style="<%=strShowFlag %>">
				        <td>
                                <table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
                                    <tr>
                                        <td align="right" nowrap style="color: #FF0000; width: 75px;">核支日期</td>
                                        <td style="width: 70px">
                                            <asp:TextBox ID="TBAcpPassDate" runat="server" Enabled="False" ondblclick="JavaScript: UCPassDate.Show();" Style="background-color: #ffe0c0; text-align: center" Width="70px"></asp:TextBox></td>
                                        <td align="right" nowrap style="color: #FF0000; width: 70px;">核支金額</td>
                                        <td width="95">
                                            <asp:TextBox ID="TBAcpPassMoney" runat="server" BackColor="Transparent" MyName="TBAcpPassMoney" onfocus="this.blur();" onkeypress="return check_Num()" Style="background-color: #ffe0c0;text-align: right" Width="90px" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td align="right" style="color:#FF0000; width: 70px;" nowrap>核支批次</td>
                                        <td width="35" ><asp:TextBox ID="TBAcpPassBat" runat="server" Width="30px" style="background-color: #ffe0c0" Enabled="False"></asp:TextBox></td>
                                      <td align="right" nowrap style="color: #FF0000; width: 70px;">核支原因</td>
                                     <td><asp:TextBox ID="TBAcpPassMemo" runat="server" Width="185px" style="background-color: #ffe0c0" Enabled="False"></asp:TextBox></td> 
                                    </tr>
                              </table>
                        </td>
                </tr>
                <tr>
                    <td  >
                    <table cellSpacing="1" cellPadding="1" width="600" border="0">
                    <tr>
                        <td>
                                    <table border=0 cellspacing=0   width =100% style="table-layout:fixed">
                                        <tr>
                                            <td   ><font size="2">預算動支項目</font></td>                                       
                                            <td  Width="100px" style="text-align: right"><font size="2">經費所屬單位</font> </td>
                                            <td   Width="150px"  ><asp:DropDownList ID="DDLBgtDep" MyName="DDLBgtDep"   runat="server" Width="150px" AutoPostBack="True" Enabled="False"></asp:DropDownList></td>
                                        </tr>
                                    </table>
                            </td>
                    </tr>
                    <tr>
                <td> 
                <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
                <div id="MyDiv"  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 700px; BORDER-BOTTOM: 1px groove; HEIGHT: 300px"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>">
                <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
													<asp:datagrid id="DataGrid2" runat="server" Width="800px" AutoGenerateColumns="False">
														<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
														<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
														<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle Width="15px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																	<asp:Label id="LBdgAcvNo" MyName ="LBdgAcvNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center" Width="15px" text='<%# Container.ItemIndex + 1  %>' >
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>																						
                                                            <asp:TemplateColumn>
                                                                <HeaderTemplate>
                                                                    <table  style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 width ="805x" >
                                                                        <tr>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; COLOR: #ffffff; TEXT-ALIGN: center">年度</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; COLOR: #ffffff; TEXT-ALIGN: center">月份</td> 
                                                                            <td style=" FONT-SIZE: 10pt;  COLOR: #ffffff; TEXT-ALIGN: center" noWrap>門別/預算來源/承辦業務別/計畫科目/用途別科目/簽證金額/用途說明/暫付/就地審計<BR>計畫科目/用途別科目/報支金額/用途說明/暫付/明細資料</td>
                                                                        </tr>
                                                                    </table>                                                                   
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                <table style="table-layout:fixed;height:100%" border=0 cellpadding=0 cellspacing=0 width ="805" >
                                                                    <tr><td>
                                                                    <table style="table-layout:fixed;height:100%" border=0 cellpadding=0 cellspacing=0 width ="100%" >
                                                                        <tr>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN:  center" valign=top ><asp:TextBox ID="TBdgBgtYear" runat="server" Width="20px" onfocus="this.blur();" Style=" text-align:center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtYear" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center" valign=top  ><asp:TextBox ID="TBdgBgtMonth" runat="server" Width="20px" onfocus="this.blur();" Style=" text-align:center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtMonth" ></asp:TextBox></td>
                                                                            <td style="FONT-SIZE: 10pt; TEXT-ALIGN: left" noWrap >
                                                                                    <asp:TextBox ID="TBdgAccKindName" runat="server" Width="120px" onfocus="this.blur();"  MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAccKindName" ></asp:TextBox>/                                                                          
                                                                                    <asp:TextBox ID="TBdgBgtSourName" runat="server" Width="100px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtSourName" ></asp:TextBox>/                                                                                     
                                                                                     <asp:TextBox ID="TBdgPlanName" runat="server" Width="400px"  onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgPlanName"  ></asp:TextBox></td>
                                                                        </tr>
                                                                        <tr>
                                                                             <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center" valign=top></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center" valign=top></td>
                                                                            <td style="FONT-SIZE: 10pt; TEXT-ALIGN: left" noWrap>
                                                                                    <asp:TextBox ID="TBdgBizName" runat="server" Width="120px" onfocus="this.blur();"    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBizName" ></asp:TextBox>/
                                                                                    <asp:TextBox ID="TBdgOulName" runat="server" Width="190px"  onfocus="this.blur();"  MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgOulName" ></asp:TextBox>/
                                                                                    <asp:TextBox ID="TBdgAcvMoney" runat="server"  Width="90px"  onfocus="this.blur();"  style="text-align:right" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvMoney"></asp:TextBox>/
                                                                                    <asp:TextBox ID="TBdgAcvMemo" runat="server"  Width="150px"  onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvMemo"></asp:TextBox>/
                                                                                    <asp:CheckBox ID="CBdgPrePayFlag" runat="server"  Enabled="false"  ToolTip="暫付"  />
                                                                                    <asp:CheckBox ID="CBdgInspect" runat="server"  Enabled="false"  ToolTip="就地審計" Visible=true  />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan=3 align=left>
                                                                                <asp:DataList ID="DataList1" runat="server" style="MARGIN-RIGHT: -1px"  OnItemCreated="DataList1_ItemCreated"  OnItemDataBound="DataList1_ItemDataBound" Width=100%  >
                                                                                <ItemTemplate>
                                                                                    <table style="table-layout:fixed;height:100%;MARGIN-left:-1px" border=0 cellpadding=0 cellspacing=0 width ="100%" > 
                                                                                         <tr>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 60px;TEXT-ALIGN: right" valign=top> <asp:Image ID="IMdlacvExchNo" runat="server" ImageUrl="../images/034.gif" /><asp:Label  ID="LBdlNo" runat="server" Width="15px" style="CURSOR: help" onclick="setShowBudget(this)"><%# Container.ItemIndex +1 %></asp:Label></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 230px; TEXT-ALIGN: center" valign=top><asp:DropDownList ID="DDLdlPlanName" runat="server" Width="230px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex  %>" MyName="DDLdlPlanName"></asp:DropDownList></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 180px; TEXT-ALIGN: center" valign=top><asp:DropDownList ID="DDLdlOulName" runat="server" Width="180px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex  %>" MyName="DDLdlOulName" ></asp:DropDownList></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 100px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdlAcvMoney"   runat="server"  Width="95px"  onblur="CheckUpLevlMoney(this);GetTotalPayMoney();"  onfocus="this.select();" style="background-color: #FFFFE0;text-align:right"  onkeypress="return check_Num()"   MyName="TBdlAcvMoney"  ></asp:TextBox></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 100px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdlAcvMemo" runat="server"  Width="95px"  style="background-color: #FFFFE0"></asp:TextBox></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 20px; TEXT-ALIGN: center" valign=top><asp:CheckBox ID="CBdlPrePayFlag" runat="server" ToolTip="暫付" /></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 20px; TEXT-ALIGN: center" valign=top><asp:CheckBox ID="CBdlInspect" runat="server" ToolTip="就地審計" Visible =true /></td>
                                                                                            <td><asp:Button id="BtnGBA" runat="server" Text="GBA" OnClick="BtnGBA_Click" Visible=true ></asp:Button></td>
                                                                                            <td style="FONT-SIZE: 10pt; WIDTH: 20px;  TEXT-ALIGN: center" valign=top><input id="BtnRptDtl" runat="server" type="button"  value="..." onclick="fnCallRptDtl(this)" style="height:22px" title="按下進入其他資料設定頁面" />
                                                                                                    
                                                                                                    <asp:Label id="LBdlExchNo" runat="server" MyName ="LBdlExchNo" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
                                                                                                    <asp:Label id="LBdlTranID" runat="server" MyName ="LBdlTranID" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
                                                                                                    <asp:Label id="LBdlTranBNo" runat="server" MyName ="LBdlTranBNo" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
                                                                                                    <asp:Label id="LBdlTranDTime" runat="server" MyName ="LBdlTranDTime" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
                                                                                                    <asp:Label id="LBdlTranUser" runat="server" MyName ="LBdlTranUser" MyIndex='<%# Container.ItemIndex %>' Visible=False></asp:Label>
                                                                                            </td>                                                                                            
                                                                                         </tr>
                                                                                         <tr>
																							<td colspan="8">
																								<asp:DataList id="Datalist2" style="MARGIN-RIGHT: -1px" runat="server"  width=100%>
																									<ItemTemplate>
																										<table cellspacing="0" cellpadding="0" border="0" bordercolor="#ff9966" width=710>
																											<tr>
																												<td style="FONT-SIZE: 10pt; WIDTH: 15px;TEXT-ALIGN: center"><asp:Label id="LBdl2No" runat="server" style="TEXT-ALIGN: center; CURSOR: help" font-size="X-Small" Width="15px" Text='<%# Container.ItemIndex+1 %>' MyName ="LBdl2No" MyIndex='<%# Container.ItemIndex %>' ></asp:Label></td>
																												<td style="FONT-SIZE: 10pt; WIDTH: 270px"><asp:DropDownList id="DDLdl2Plan" runat="server" Style="background-color: #ccffff" width="270" MyName ="DDLdl2Plan" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																												<td style="FONT-SIZE: 10pt; WIDTH: 180px"><asp:DropDownList id="DDLdl2Oul" style="background-color: #ccffff" runat="server" Width="180" MyName ="DDLdl2Oul" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																												<td style="FONT-SIZE: 10pt; WIDTH: 110px"><asp:DropDownList id="DDLdl2Kind" runat="server" Width="110" Style="background-color: #ccffff" MyName ="DDLdl2Kind" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																												<td style="FONT-SIZE: 10pt; WIDTH: 110px"><asp:DropDownList id="DDLdl2bgtSource" runat="server" Width="110" Style="background-color: #ccffff" MyName ="DDLdl2bgtSource" MyIndex='<%# Container.ItemIndex %>'></asp:DropDownList></td>
																												<td style="Width:20px;background-color: #ccffff; text-align:left"><asp:CheckBox id="CBdl2PayKind" runat="server" BackColor="#ccffff" ToolTip="暫付" ></asp:CheckBox></td>
																											</tr>
																										</table>
																									</ItemTemplate>
																								</asp:DataList>
																							</td>
																						</tr>
                                                                                    </table>
                                                                                </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </td>                                                                        
                                                                        </tr>
                                                                    </table>
                                                                    </td>
                                                                    <td style="FONT-SIZE: 10pt; WIDTH: 20px; TEXT-ALIGN:left" valign=bottom ><asp:Button id=BtnSplit  runat="server" Text="+" CssClass="<%# Container.ItemIndex %>" MyName="BtnSplit" MyIndex="<%# Container.ItemIndex %>" OnClick="BtnSplit_Click"></asp:Button></td></tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <HeaderStyle  />
                                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                                            </asp:TemplateColumn>															
                                                            <asp:TemplateColumn HeaderText="結案">
                                                            <HeaderStyle    Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
                                                                <ItemTemplate>
                                                                <table border=0 cellpadding=0 cellspacing=0>
                                                                    <tr>
                                                                        <td align=center ><asp:CheckBox ID="CBdgClose" runat="server"  MyName="CBdgClose"  MyIndex='<%# Container.ItemIndex %>' Enabled=False   /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><asp:TextBox ID="TBdgAdjustMoney" style="text-align:right" runat="server" Width="60px" MyName="TBdgAdjustMoney"  ToolTip="繳回款"  MyIndex='<%# Container.ItemIndex %>' Enabled=False></asp:TextBox></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><asp:TextBox ID="TBdgAcvRePayNo" style="text-align:right" runat="server" Width="60px" MyName="TBdgAcvRePayNo"  ToolTip="繳回號" MyIndex='<%# Container.ItemIndex %>' Enabled=False></asp:TextBox></td>
                                                                    </tr>
                                                                </table>
                                                                </ItemTemplate>
                                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="False" />
                                                            </asp:TemplateColumn>
														</Columns>
													</asp:datagrid></DIV>
													</td>
        </tr>
    </table>
    </td>
				</tr>
			</table>
		</td>
		<td valign="top" width="200" bgcolor="#ffffff" rowspan="3">
			<iframe id="iFrame" border="0" name="iFrame" frameborder="0" width="200" scrolling="no" height="500">
			</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="10"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
				<tr>
					<td valign="bottom" align="left">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" 
                                        Text="列印" Height="22" Visible="False"></asp:button></td>
								<td valign="bottom" align="center" style="width: 3px;display:none">
                                    <asp:DropDownList ID="DDLReport" runat="server">
                                        <asp:ListItem>......</asp:ListItem>                                        
                                        <asp:ListItem Value="Gen01">支出憑證黏存單</asp:ListItem>
                                        <asp:ListItem Value="Gen06">暫付款申請單</asp:ListItem>
                                    </asp:DropDownList></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找動支編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找動支編號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server">
								</td>
							</tr>
						</table>
                </tr>
				<tr>
					<td><asp:datagrid id="DataGrid1" runat="server" Width="700px" AutoGenerateColumns="False" AllowSorting="True"
										AllowPaging="True" PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
											<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="acmYear" HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="動支系統號">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmMarkDate" HeaderText="請示日期">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmWordNum" HeaderText="動支編號">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="WorkDepName" HeaderText="承辦單位">
												<HeaderStyle Width="60px" Wrap="False"></HeaderStyle>
                                                <ItemStyle   Wrap="False" />
                                                <FooterStyle Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmWorkUserNo" HeaderText="承辦人員">
												<HeaderStyle Width="60px"  Font-Size="Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle  Wrap="False" />
                                                <FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmMoney" HeaderText="暫付金額" DataFormatString="{0:#,#}">
												<HeaderStyle Width="70px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acmMemo" HeaderText="動支事由"></asp:BoundColumn>
											<asp:BoundColumn DataField="acpModifyUser" HeaderText="最後異動">
												<HeaderStyle Width="50px"  Font-Size="X-Small"  ></HeaderStyle>
											</asp:BoundColumn>
												<asp:BoundColumn DataField="acmNo1" HeaderText="再簽次號" Visible="false">
												<HeaderStyle Width="25px"  Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="acpPayNo" HeaderText="報支次號">
												<HeaderStyle Width="25px"  Font-Size="X-Small" ></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="acmBgtKind" HeaderText="結轉-12">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
				</tr>
				<tr>
					<td align="right">
					            <table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                                    <tr>
                                    <td><font size="2">只列出｜</font></td>
                                    <td>&nbsp;<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
                                                                    <asp:ListItem Value="0">......</asp:ListItem>
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
                                                            </asp:dropdownlist>
                                    </td>
                                    <td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
                                    </tr>
                            </table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
        <ComponentArt:Calendar ID="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
            <ComponentArt:Calendar ID="UCPassDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCPassDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcpPassDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar> 
			<script language="javascript"> setShowBudget();</script>
    </form>
</body>
</html>
