<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActVisa1.ascx.vb" Inherits="AppCtrls.UCActVisa1" %>
<script language="javascript" type="text/javascript">

  function fnCallRptDtl(parObj){

    var strPars;
    var tmpArray = parObj.cssclass.split(":")
    var tmpMemo;
    var tmpOulVal="";
    var bolMemoExit =false;
    var bolOulExit=false ;
    for (var i=0;i<document.forms[0].elements.length;i++)
    {
        var e=document.forms[0].elements[i];
        if (e.getAttribute("MyName")=="TBAcmMemo")
        {
            tmpMemo=e.value;
            bolMemoExit=true;
        }
        if (e.getAttribute("MyName")=="DDLdlOulName" && e.getAttribute("MyParentIndex")==parObj.MyParentIndex && e.getAttribute("MyIndex")==parObj.MyIndex)
        {
            tmpOulVal=e.value;
            bolOulExit=true;
        }
        if (bolMemoExit==true && bolOulExit==true)
        {
            break;
        }
    }

    
    strPars = "acmyear=" + tmpArray[0] + "&acmno=" + tmpArray[1] + "&acvno=" + tmpArray[2]  + "&acmno1=" + tmpArray[3] + "&acvno1=" + tmpArray[4] + "&acmmemo=" +  escape(tmpMemo) + "&oulcode=" + tmpOulVal; //+ "&acmno2=" + tmpArray(5) + "&acvno2=" + tmpArray(6) + "&acppayyear=" + tmpArray(7) + "&acppayno=" & tmpArray(8) + "&acvsubno=" +  tmpArray(9) + "&acppayno1=" + tmpArray(10) + "&acvsubno1=" + tmpArray(11);
    //window.open("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars);
		//var strReturnVal=
		showModalDialog("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars ,window,"dialogWidth:950px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		
//		if (strReturnVal != "Cancel" )
//			{
//				document.all(thisName).value=document.all(thisName).value + strReturnVal;
//			}
		}		


    function GetTotalAcvMoney()
    {
            var e=document.forms[0].elements[i];
            if  ( e.getAttribute("MyName")=="TBdgProdQry"  )
            {
            
            }

    }

	function check_Num(){
			if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
				return true;}
			else{event.keyCode=0;false;}
	}




    function GetAutoAdjMoney(parObj, parIndex)
    {

            var dblTotal
            dblTotal=0;

            //紀錄動支金額剩於數
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

                    //找動支數
                    if (bolFlag== 0)
                    {
                            objDG =document.forms[0].elements[i];

                            if ( e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parIndex)
                            {					
                                    bolFlag=1;
                            }
                     }

                    //找調整數
                    if (bolAdjFlag== 0)
                    {
                            objAdj =document.forms[0].elements[i];

                            if ( e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parIndex)
                            {					
                                    bolAdjFlag=1;
                            }
                    }

                    //找出明細總和	
                    if ( e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parIndex)
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

                    if ( e.getAttribute("MyName") == "TBdlAcvMoney")
                    {
                            if (e.value !="" )
                            {
                                    dblTotal += parseFloat(replaceString(e.value,",",""));
                            }
                    }
                    
                    if (e.getAttribute("MyName")=="TBAcmMoney1")
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

            for (var i=0;i<document.forms[0].elements.length;i++)
            {
                    var e=document.forms[0].elements[i];
                    if (bolFlag== 0)
                    {
                            objDG =document.forms[0].elements[i];

                            if ( e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parObj.MyParentIndex)
                            {
                                    bolFlag=1;
                            }
                    }
                    
                    if (e.getAttribute("MyName")=="BtnSplit" && bolFlag1==0 && e.getAttribute("MyIndex")== parObj.MyParentIndex)
                    {
                        objBtnSplit=e;
                    }

                    if ( e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parObj.MyParentIndex)
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
                    alert("動支序號為 " + tmpNo  + " 報支金額總數大於原動支金額。請重新修改。");
                    objBtnSplit.disabled=true;
                    parObj.onfocus;
            }
            else
            {
                 if (parseFloat(replaceString(objDG.value,",","")) - dblTotal==0) 
                 {
                    objBtnSplit.disabled=true;
                 }
                 else
                 {
                    objBtnSplit.disabled=false;
                 }
            }
            //document.all("TBacmMoney1").value=dblTotal;

    }







</script>
<table cellSpacing="1" cellPadding="1" width="600" border="0">
        <tr>
                <td>
                        <table border=0 cellspacing=0   width =100% style="table-layout:fixed;display:none">
                                <tr>
                                        <td   ><font size="2">預算動支項目</font></td>                                       
                                        <td  Width="100px" style="text-align: right"><font size="2">經費所屬單位</font> </td>
                                        <td   Width="150px"  ><asp:DropDownList ID="DDLBgtDep" MyName="DDLBgtDep"  runat="server" Width="150px" AutoPostBack="True" Enabled="False"></asp:DropDownList></td>
                                </tr>
                        </table>
                </td>
        </tr>
        <tr>
                <td   > 
                <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
                <div id="MyDiv"  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); overflow-x: scroll; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT:atuo"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>">
                
                <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
													<asp:datagrid id="DataGrid2" runat="server" Width="1200px" AutoGenerateColumns="False">
														<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
														<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
														<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle Width="15px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																	<asp:Label id="LBdgAcvNo" MyName ="LBdgAcvNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" text='<%# Container.ItemIndex + 1  %>' onclick="setShowBudget(this)">
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="年度">
																<HeaderStyle Width="30px"  Font-Size="X-Small"  HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="false"></ItemStyle>
																<ItemTemplate>
																    <asp:CheckBox id="CBdgNextYearFlag" tooltip="非本年度預算" runat="server"></asp:CheckBox>
																	<asp:TextBox id="TBdgBgtYear" runat="server" Width="30px" Style="TEXT-ALIGN: Center"  onfocus="this.blur();"></asp:TextBox>
																</ItemTemplate>
															</asp:TemplateColumn>														
                                                            <asp:TemplateColumn>
                                                                <HeaderTemplate>
                                                                    <table  style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 width ="1170px" >
                                                                        <tr>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; COLOR: #ffffff; TEXT-ALIGN: center">月份</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 70px; COLOR: #ffffff; TEXT-ALIGN: center">門別</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center">預算來源</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; COLOR: #ffffff; TEXT-ALIGN: center">預算單位</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 140px; COLOR: #ffffff; TEXT-ALIGN: center">控帳業務</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 300px; COLOR: #ffffff; TEXT-ALIGN: center">計畫科目</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 200px; COLOR: #ffffff; TEXT-ALIGN: center">用途別科目</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 100px; COLOR: #ffffff; TEXT-ALIGN: center">動支金額</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 160px; COLOR: #ffffff; TEXT-ALIGN: center;display:none">用途說明</td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; COLOR: #ffffff; TEXT-ALIGN: center">暫付</td>
                                                                            <td style=" FONT-SIZE: 10pt; WIDTH: 60px; COLOR: #ffffff; TEXT-ALIGN: center" >就地審計</td>
                                                                            <td style="display:none;BORDER-RIGHT: #ffffff 1px solid;FONT-SIZE: 10pt; WIDTH: 60px; COLOR: #ffffff; TEXT-ALIGN: center" >明細資料</td>
                                                                        </tr>
                                                                    </table>                                                                   
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                <table style="table-layout:fixed;height:100%; margin-left:-5px" border=0 cellpadding=0 cellspacing=0 width ="1170" >
                                                                    <tr><td>
                                                                    <table style="table-layout:fixed;height:100%; margin-left:-1px" border=0 cellpadding=0 cellspacing=0 width ="1160" >
                                                                        <tr>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgBgtMonth" runat="server" Width="20px" onfocus="this.blur();" Style=" text-align:center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtMonth" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 70px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgAccKindName" runat="server" Width="60px" onfocus="this.blur();"  MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAccKindName" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgBgtSourName" runat="server" Width="110px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtSourName" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgAcvBgtDepName" runat="server" Width="110px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvBgtDepName" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 140px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgBizName" runat="server" Width="130px" onfocus="this.blur();"    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBizName" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 300px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgPalnName" runat="server" Width="290px"  onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgPalnName"  ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 200px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgOulName" runat="server" Width="190px"  onfocus="this.blur();"  MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgOulName" ></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 100px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdgAcvMoney" runat="server"  Width="90px"  onfocus="this.blur();"  style="text-align:right" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvMoney"></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 160px; TEXT-ALIGN: center;display:none" valign=top><asp:TextBox ID="TBdgAcvMemo" runat="server"  Width="150px"  onfocus="this.blur();" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvMemo"></asp:TextBox></td>
                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center " valign=top><asp:CheckBox ID="CBdgPrePayFlag" runat="server"  Enabled="false"  /></td>
                                                                            <td style="  FONT-SIZE: 10pt; WIDTH: 60px; TEXT-ALIGN: left" valign="top"><asp:CheckBox ID="CBdgInpsect" runat="server"  Enabled="false"  /></td>
                                                                            <td style="display:none;BORDER-RIGHT: #ffffff 1px solid;FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center" valign=top><input id="BtndgRptDtl" runat="server" type="button"  value="..."  visible=false  style="height:22px" /></td>
                                                                            
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan=11>
                                                                                <asp:DataList ID="DataList1" runat="server" style="MARGIN-RIGHT: -1px"  OnItemCreated="DataList1_ItemCreated"  OnItemDataBound="DataList1_ItemDataBound"  >
                                                                                <ItemTemplate>
                                                                                    <table style="table-layout:fixed;height:100%;MARGIN-left:-1px" border=0 cellpadding=0 cellspacing=0 width ="1140px" > 
                                                                                         <tr>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px;TEXT-ALIGN: center" valign=top></td> 
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 70px; TEXT-ALIGN: center" valign=top></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; TEXT-ALIGN: center" valign=top></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 120px; TEXT-ALIGN: center" valign=top></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 140px; TEXT-ALIGN: center" valign=top></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 300px; TEXT-ALIGN: right" valign=top><asp:Label  ID="LBdlNo" runat="server" style="text-align:center; CURSOR: help" Width="25px"  onclick="setShowBudget(this)"><%# Container.ItemIndex +1 %></asp:Label><asp:CheckBox id="CBdlNextYearFlag" tooltip="非本年度預算" runat="server"></asp:CheckBox><asp:TextBox ID="TBdlYear" runat="server"  Width="30px"  onfocus="this.select();" style="background-color: #FFFFE0;text-align:center"  onkeypress="return check_Num()"   MyName="TBdlYear"  ></asp:TextBox><asp:TextBox ID="TBdlMonth" runat="server"  Width="30px"  onfocus="this.select();" style="background-color: #FFFFE0;text-align:center"  onkeypress="return check_Num()"   MyName="TBdlMonth"  ></asp:TextBox></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 200px; TEXT-ALIGN: center" valign=top><asp:DropDownList ID="DDLdlOulName" runat="server" Width="196px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex  %>" MyName="DDLdlOulName" ></asp:DropDownList></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 100px; TEXT-ALIGN: center" valign=top><asp:TextBox ID="TBdlAcvMoney"   runat="server"  Width="90px"  onblur="CheckUpLevlMoney(this);GetTotalPayMoney();"  onfocus="this.select();" style="background-color: #FFFFE0;text-align:right"  onkeypress="return check_Num()"   MyName="TBdlAcvMoney"  ></asp:TextBox></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 160px; TEXT-ALIGN: center;display:none" valign=top><asp:TextBox ID="TBdlAcvMemo" runat="server"  Width="150px"  style="background-color: #FFFFE0"  ></asp:TextBox></td>
                                                                                            <td style="BORDER-RIGHT: #ffffff 1px solid; FONT-SIZE: 10pt; WIDTH: 30px; TEXT-ALIGN: center" valign=top><asp:CheckBox ID="CBdlPrePayFlag" runat="server" /></td>
                                                                                            <td style=" FONT-SIZE: 10pt; WIDTH: 60px;  TEXT-ALIGN: center" valign=top><asp:CheckBox ID="CBdlInpsect" runat="server"  /></td>
                                                                                            <td style="display:none;BORDER-RIGHT: #ffffff 1px solid;FONT-SIZE: 10pt; WIDTH: 30px;  TEXT-ALIGN: center" valign=top><input id="BtnRptDtl" runat="server" type="button"  value="..." onclick="fnCallRptDtl(this)" style="height:22px" MyIndex="<%# Container.ItemIndex  %>" /></td>
                                                                                         </tr>
                                                                                    </table>
                                                                                </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </td>                                                                        
                                                                        </tr>
                                                                    </table>
                                                                    </td>
                                                                    <td style="FONT-SIZE: 10pt; WIDTH: 20px; TEXT-ALIGN: right" valign=bottom ><asp:Button id=BtnSplit  runat="server" Text="+" CssClass="<%# Container.ItemIndex %>" MyName="BtnSplit" MyIndex="<%# Container.ItemIndex %>" OnClick="BtnSplit_Click"></asp:Button></td></tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="1290px" />
                                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                                            </asp:TemplateColumn>															
                                                            <asp:TemplateColumn HeaderText="結案">
                                                            <HeaderStyle Width="100px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
                                                                <ItemTemplate>
                                                                <table border=0 cellpadding=0 cellspacing=0>
                                                                    <tr>
                                                                        <td align=center ><asp:CheckBox ID="CBdgClose" runat="server"   /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><asp:TextBox ID="TBdgAdjustMoney" MyName="TBdgAdjustMoney" MyIndex="<%# Container.ItemIndex %>" style="text-align:right" runat="server" Width="80px"></asp:TextBox></td>
                                                                    </tr>
                                                                </table>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="False" />
                                                            </asp:TemplateColumn>
														</Columns>
													</asp:datagrid></DIV>
													</td>
        </tr>
       <tr>
               <td>
                   </td>
       </tr> 
</table>