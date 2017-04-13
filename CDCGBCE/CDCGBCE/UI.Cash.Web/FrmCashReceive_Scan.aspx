<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashReceive_Scan.aspx.vb" Inherits="UI.Cash.Web.FrmCashReceive_Scan" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
   	<style type="text/css">.Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
	.FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
	.FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
	.FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		</style>
 
    <script>


        function UCDate_Change(calendar)
        {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBCsmDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
           // CssClass="Freezing"
        }

    function GetTotalCnt(parObj)
   {
  
            var tmpArray=parObj.id.split("_");
            var intIndex = tmpArray[1];
            intIndex=intIndex.substring(3,intIndex.length);
            var tmpName =  "DataGrid2_ctl"+ intIndex +"_LBdgMoney"
            if (parObj.check ==true)
            {
                    document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) + 1;
//                    alert(tmpName);
//               alert( document.all(tmpName).innerText      );
               document.all("TBCsmMoney").value =   parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) + parseFloat(replaceString( document.all(tmpName).innerText ,",",""))     
//                    for (var i=0;i<document.forms[0].elements.length;i++)
//                    {
//                            var e=document.forms[0].elements[i];			

//                            if ( e.MyName == "LBdgMoney" && e.MyIndex== parseFloat(intIndex)-2)
//                            {alert( parseFloat(intIndex)-2); 
//                                    if (e.value !="" )
//                                    {  alert(intIndex); 
//                                         document.all("TBCsmMoney").value  = parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) +   parseFloat(replaceString(e.innerText,",",""));
//                                    }
//                                    break; 
//                            }
//                     } // next i
            } 
            else 
            {
                    document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) - 1 ;
                     document.all("TBCsmMoney").value =   parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) - parseFloat(replaceString( document.all(tmpName).innerText ,",",""))     

//                    for (var i=0;i<document.forms[0].elements.length;i++)
//                    {
//                            var e=document.forms[0].elements[i];			

//                            if ( e.MyName == "LBdgMoney"  && e.MyIndex==  parseFloat(intIndex)-2 )
//                            {
//                                    if (e.value !="" )
//                                    {  alert(intIndex); 
//                                         document.all("TBCsmMoney").value  = parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) -  parseFloat(replaceString(e.innerText,",","")) ;
//                                    }
//                                    break; 
//                            }
//                     } // next i
            } 
   } 
   
   
   
       function GetTotalCntV1(parObj)
   {
  
            var tmpArray=parObj.id.split("_");
            var intIndex = tmpArray[1];
            intIndex=intIndex.substring(3,intIndex.length);
            var tmpName =  "DataGrid2_ctl"+ intIndex +"_LBdgMoney"
            if (parObj.checked ==true)
            {
                    document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) + 1;
//                    alert(tmpName);
//               alert( document.all(tmpName).innerText      );
               document.all("TBCsmMoney").value =   parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) + parseFloat(replaceString( document.all(tmpName).innerText ,",",""))     
//                    for (var i=0;i<document.forms[0].elements.length;i++)
//                    {
//                            var e=document.forms[0].elements[i];			

//                            if ( e.MyName == "LBdgMoney" && e.MyIndex== parseFloat(intIndex)-2)
//                            {alert( parseFloat(intIndex)-2); 
//                                    if (e.value !="" )
//                                    {  alert(intIndex); 
//                                         document.all("TBCsmMoney").value  = parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) +   parseFloat(replaceString(e.innerText,",",""));
//                                    }
//                                    break; 
//                            }
//                     } // next i
            } 
            else 
            {
                    document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) - 1 ;
                     document.all("TBCsmMoney").value =   parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) - parseFloat(replaceString( document.all(tmpName).innerText ,",",""))     

//                    for (var i=0;i<document.forms[0].elements.length;i++)
//                    {
//                            var e=document.forms[0].elements[i];			

//                            if ( e.MyName == "LBdgMoney"  && e.MyIndex==  parseFloat(intIndex)-2 )
//                            {
//                                    if (e.value !="" )
//                                    {  alert(intIndex); 
//                                         document.all("TBCsmMoney").value  = parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) -  parseFloat(replaceString(e.innerText,",","")) ;
//                                    }
//                                    break; 
//                            }
//                     } // next i
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
	



     </script>  
</head>
<body>
    <form id="form1" runat="server">
  <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="100%" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="100%" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">	
				<tr>
					<td style="width:60%">
						<table border=0 cellpadding=1 cellspacing=1 width=100% style="table-layout:fixed">
						    <tr   >
						        <td align="right" style="width: 75px">領用年度</td>
						        <td style="width: 110px"><asp:TextBox ID="TBCsmYear" runat="server" Width="105px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
						        <td align="right" style="width: 70px">領用數量</td>
						        <td style="width: 120px"><asp:TextBox ID="TBCsmCnt" runat="server" Width="115px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:center" MyName ="TBAcmMoney"></asp:TextBox></td>
						        <td align="right" style="width: 85px">領用金額</td>
								<td><asp:TextBox ID="TBCsmMoney" runat="server" Width="100px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney"></asp:TextBox></td>
						    </tr>
							<tr>
								<td align="right" style="width: 75px">領用日期</td>
								<td style="width: 110px"><asp:TextBox ID="TBCsmDate" runat="server" ondblclick="JavaScript: UCDate.Show();" Width="105px" style="text-align:center;BACKGROUND-COLOR: #ffffe0"></asp:TextBox></td>
								<td align="right" style="width: 70px"> </td>
								<td style="width: 120px"></td>
								<td align="right" style="width: 85px">領用編號</td>
								<td><asp:TextBox ID="TBCsmNo" runat="server" Width="100px"  BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
							</tr>
							<tr>
							    <td style="width: 75px; text-align: right;">備 &nbsp; &nbsp; &nbsp; &nbsp;註</td>
							    <td colspan="5"><asp:TextBox ID="TBMemo" runat="server" Width="480px" style="BACKGROUND-COLOR: #ffffe0"></asp:TextBox><input id="BtnPhrase" runat="server" type="button" value="..." /></td>
							</tr>
						</table>
					</td>
					<td valign="bottom">
					    <asp:Label ID="Label1" runat="server" Text="條碼:(條碼作業請保持游標在下面文字方塊內閃爍!)" 
                            Font-Size="Small"></asp:Label><br />
                        <asp:TextBox ID="txtBarCodeNum" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSendBarCodeNum" runat="server" Text="送出" />
                        
                    </td>
				</tr>
				<tr>
				    <td style="width:60%">
                        <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
                        <div id=MyDiv  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: 350px"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>">
                        <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
                            <asp:datagrid id="DataGrid2" runat="server" AutoGenerateColumns="False" Width="1000px">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>
                                    <Columns>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                <ItemTemplate><asp:CheckBox ID="CBdgSelect" runat="server" 
                                                        onclick="GetTotalCnt(this);" AutoPostBack="True" 
                                                        oncheckedchanged="CBdgSelect_CheckedChanged"   />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmWordNum" HeaderText="動支編號">
                                                <HeaderStyle Width="60px"  Wrap="False"  HorizontalAlign="Center" 
                                                    Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                    Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" /><ItemStyle   HorizontalAlign="Center" Wrap="False" /></asp:BoundColumn>
                                            <asp:BoundColumn DataField="plnPlanName" HeaderText="計畫名稱"><HeaderStyle Width="200px"   Wrap="False" /></asp:BoundColumn>
                                            <asp:BoundColumn DataField="oulOutlayName" HeaderText="用途別名稱">
                                                <HeaderStyle Width="120px"   Wrap="False" Font-Bold="False" Font-Italic="False" 
                                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                    HorizontalAlign="Center" VerticalAlign="Middle" /></asp:BoundColumn>                                  
                                            <asp:TemplateColumn HeaderText="金額" >
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPassMoney", "{0:#,#}") %>' MyName="LBdgMoney" MyIndex="<%# Container.ItemIndex %>"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="申請人"><HeaderStyle Width="80px" Wrap="False" /></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMemo" HeaderText="用途說明">
                                               <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                           </asp:BoundColumn>
                                          <%--<asp:BoundColumn DataField="acmYear" HeaderText="acmYear-7" Visible="False"></asp:BoundColumn>
                                           <asp:BoundColumn DataField="acmNo" HeaderText="acmNo-8" Visible="False"></asp:BoundColumn>
                                           <asp:BoundColumn DataField="acvNo" HeaderText="acvNo-9" Visible="False"></asp:BoundColumn> 
                                          <asp:BoundColumn DataField="acmNo1" HeaderText="acmNo1-10" Visible="False"></asp:BoundColumn>
                                           <asp:BoundColumn DataField="acvNo1" HeaderText="acvNo1-11" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmNo2" HeaderText="acmNo2-12" Visible="False"></asp:BoundColumn>
                                           <asp:BoundColumn DataField="acvNo2" HeaderText="acvNo2-13" Visible="False"></asp:BoundColumn>
                                             <asp:BoundColumn DataField="acpPayYear" HeaderText="acpPayYear-14" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acpPayNo" HeaderText="acpPayNo-15" Visible="False"></asp:BoundColumn>
                                           <asp:BoundColumn DataField="acvSubNo" HeaderText="acvSubNo-16" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="OrderFlag" HeaderText="OrderFlag-17" Visible="False"></asp:BoundColumn>--%>     
                                    </Columns>
                            </asp:datagrid>
						</div>
                   </td>
                   <td>
                        <div id=Div1  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: 350px"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>">
                        <input id="Hidden1" type="hidden" name="savescrollpos" runat="server">
                        <asp:DataGrid runat ="server" AutoGenerateColumns="False" Width="1000px"
                                ID="dgRight">
                            <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                            <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                            <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                            <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>
                            <Columns>
                                    <asp:TemplateColumn Visible="False">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        <ItemTemplate><asp:CheckBox ID="CBdgSelect" runat="server" onclick="GetTotalCnt(this);"   />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="acmWordNum" HeaderText="動支編號">
                                        <HeaderStyle Width="60px"  Wrap="False"  HorizontalAlign="Center" 
                                            Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                            Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" /><ItemStyle   HorizontalAlign="Center" Wrap="False" /></asp:BoundColumn>
                                    <asp:BoundColumn DataField="plnPlanName" HeaderText="計畫名稱"><HeaderStyle Width="200px"   Wrap="False" /></asp:BoundColumn>
                                    <asp:BoundColumn DataField="oulOutlayName" HeaderText="用途別名稱">
                                        <HeaderStyle Width="120px"   Wrap="False" Font-Bold="False" Font-Italic="False" 
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                            HorizontalAlign="Center" VerticalAlign="Middle" /></asp:BoundColumn>                                  
                                    <asp:TemplateColumn HeaderText="金額" >
                                        <ItemTemplate>
                                            <asp:Label ID="LBdgMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPassMoney", "{0:#,#}") %>' MyName="LBdgMoney" MyIndex="<%# Container.ItemIndex %>"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="申請人"><HeaderStyle Width="80px" Wrap="False" /></asp:BoundColumn>
                                    <asp:BoundColumn DataField="acvMemo" HeaderText="用途說明">
                                       <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                   </asp:BoundColumn>
                                  <%--<asp:BoundColumn DataField="acmYear" HeaderText="acmYear-7" Visible="False"></asp:BoundColumn>
                                   <asp:BoundColumn DataField="acmNo" HeaderText="acmNo-8" Visible="False"></asp:BoundColumn>
                                   <asp:BoundColumn DataField="acvNo" HeaderText="acvNo-9" Visible="False"></asp:BoundColumn> 
                                  <asp:BoundColumn DataField="acmNo1" HeaderText="acmNo1-10" Visible="False"></asp:BoundColumn>
                                   <asp:BoundColumn DataField="acvNo1" HeaderText="acvNo1-11" Visible="False"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="acmNo2" HeaderText="acmNo2-12" Visible="False"></asp:BoundColumn>
                                   <asp:BoundColumn DataField="acvNo2" HeaderText="acvNo2-13" Visible="False"></asp:BoundColumn>
                                     <asp:BoundColumn DataField="acpPayYear" HeaderText="acpPayYear-14" Visible="False"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="acpPayNo" HeaderText="acpPayNo-15" Visible="False"></asp:BoundColumn>
                                   <asp:BoundColumn DataField="acvSubNo" HeaderText="acvSubNo-16" Visible="False"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="OrderFlag" HeaderText="OrderFlag-17" Visible="False"></asp:BoundColumn>    --%> 
                            </Columns>
                        </asp:DataGrid>
                   </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="10"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid;width:100%" bordercolor="#666668">
			<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
				<tr>
					<td valign="bottom" align="left" style="width:600px">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="查詢" Height="22" Visible="False"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找領用編號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找領用編號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server">
								</td>
							</tr>
						</table>
					</td>
					<td></td>
				</tr>
				<tr>
					<td style="width:600px"><asp:datagrid id="DataGrid1" runat="server" Width="600px" AutoGenerateColumns="False" AllowSorting="True"
										AllowPaging="True" PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                <HeaderStyle Width="30px" />
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="csmYear" HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle   HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn   DataField="csmNo" HeaderText="領用編號">
												<HeaderStyle Width="60px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"  ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmSDate" HeaderText="領用日期">
												<HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemStyle   HorizontalAlign="Center" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmCnt" HeaderText="領用數量">
												<HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmMoney" HeaderText="領用金額" DataFormatString="{0:#,#}">
												<HeaderStyle Width="100px"></HeaderStyle>
                                                <ItemStyle  HorizontalAlign="Right" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmMemo" HeaderText="備註">
											</asp:BoundColumn>										
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
									<td><iframe id="iFrame" border="0" name="iFrame"  src="FrmShowCash.aspx" frameborder="0" width="200" scrolling="no"></iframe></td>
				</tr>
				<tr>
					<td align="right" style="width:600px"><table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0" width>
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
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
        <ComponentArt:Calendar ID="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
    </form>
</body>
</html>
