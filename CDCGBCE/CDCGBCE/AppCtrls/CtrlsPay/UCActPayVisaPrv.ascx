<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayVisaPrv.ascx.vb" Inherits="AppCtrls.UCActPayVisaPrv" %>
 <script language="javascript" type="text/javascript">
function fnCallRptDtl(parObj){

    var strPars;
    var tmpArray = parObj.cssclass.split(":")     
    strPars = "acmyear=" + tmpArray[0] + "&acmno=" + tmpArray[1] + "&acvno=" + tmpArray[2]  + "&acmno1=" + tmpArray[3] + "&acvno1=" + tmpArray[4] + "&acmno2=" + tmpArray[5] + "&acvno2=" + tmpArray[6] + "&acppayyear=" + tmpArray[7] + "&acppayno=" & tmpArray[8] + "&acvsubno=" +  tmpArray[9] + "&acmmemo=" +  escape(tmpMemo);//+ "&acppayno1=" + tmpArray(10) + "&acvsubno1=" + tmpArray(11);
    //window.open("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars);
		//var strReturnVal=
		showModalDialog("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars ,window,"dialogWidth:850px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
		
//		if (strReturnVal != "Cancel" )
//			{
//				document.all(thisName).value=document.all(thisName).value + strReturnVal;
//			}
		}		


function GetTotalAcvMoney(parObj)
{
  var tmpVal=0;
  var objTarget;
  var objTargetName;
  var strKid = "<%=strCtrlAcmKidNum %>";
 
   

  //if (strKid=="ProdEx"  || strKid=="TrlOS")
  if (strKid.toLowerCase() =="prodex"  || strKid.toLowerCase() =="trlos" || strKid.toLowerCase() =="other"  || strKid.toLowerCase() =="otherext" )
  { 
        objTargetName="TBAcmMoney";
  }
  else
  { 
        objTargetName="TBPayMoney";
               //objTargetName="TBAcmMoney";
 
  }
 
  for (var i=0;i<document.forms[0].elements.length;i++)
  {
        var e=document.forms[0].elements[i];
        //if ( e.getAttribute("MyName") == "TBPayMoney")
        if ( e.getAttribute("MyName") == objTargetName )
        {   
            objTarget=e;   
        }
        if ( e.getAttribute("MyName") == "TBdgMoney" && e.value !="")
        {         
        
        
           var objName;
           var intRecNo;
           intRecNo= eval(e.getAttribute("MyIndex")) + eval(2) +'';
           
         
           if (intRecNo.length ==1)
           { intRecNo='0'+ intRecNo
           }
             
           objName="ctl06_DataGrid2_ctl"+ intRecNo +"_CBdgDel"           
            if (document.all(objName).checked==false)
            {
                
                tmpVal += parseFloat(replaceString(e.value,",",""));        
            }
            
            
        
          
            
        }
   }
     
	objTarget.value = tmpVal;

}




function GetTotalPassAcvMoney(parObj)
{
 var tmpVal=0;
  var objTarget;
  var objTargetName;
  var strKid = "<%=strCtrlAcmKidNum %>";
 
    
  if (strKid.toLowerCase() =="prodex"  || strKid.toLowerCase() =="trlos" || strKid.toLowerCase() =="other"  || strKid.toLowerCase() =="otherext" )
  { 
        objTargetName="TBAcmPassMoney";
  }
  else
  { 
        objTargetName="TBPayMoney";
  }
    
  for (var i=0;i<document.forms[0].elements.length;i++)
  {
        var e=document.forms[0].elements[i];
        //if ( e.getAttribute("MyName") == "TBPayMoney")
        if ( e.getAttribute("MyName") == objTargetName )
        {   
            objTarget=e;   
        }
        if ( e.getAttribute("MyName") == "TBdgPassMoney" && e.value !="")
        { 
            tmpVal += parseFloat(replaceString(e.value,",",""));        
        }
   }
   
 
	objTarget.value = tmpVal;


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



function GetDataMemo(parObj)
{

//alert(parObj.value);
    if (parObj.value !="")
    {
        
        var dblSubTotal=0;
        var tmpVal = parObj.value.split(",");
        var objTarget ;
        var bolT=false;
        var bolS=false;
         
         for (var j=0;j<=tmpVal.length-1;j++)
         {
             for (var i=0;i<document.forms[0].elements.length;i++)
             {
                var e=document.forms[0].elements[i];
                if (e.getAttribute("MyName") == "TBdgMoney" && bolT==false)
                {
                    
                    objTarget=e;
                    bolT=true;
                }

                if (e.getAttribute("MyName") == "TBdgTotal" && e.getAttribute("MyIndex")==tmpVal[j]-1   )
                {
                    
                    if (isNaN( parseFloat(replaceString(e.value,",","")) ) )                    
                    {      
                    }
                    else
                    {
                    dblSubTotal+=parseFloat(replaceString(e.value,",",""));
                    bolS=true;
                    }
                   // break i;
                }             
             
//                 if (bolS==true && bolT==true )
//                 { bolS=true;
//                   break;
//                 }
             }
            
         }
        
        objTarget.value = dblSubTotal;
        
    }
    


}



	function check_Num(){
			if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
				return true;}
			else{event.keyCode=0;false;}
	}


        function CheckPassMoney(parObj)
        {
            //var objAcmTarget;
            // 
            //var bolAcmFlag =false;
            for (var i=0;i<document.forms[0].elements.length;i++)
            {
                var e=document.forms[0].elements[i];
                //if ( e.getAttribute("MyName") == "TBPayMoney")
                if ( e.getAttribute("MyName") == "TBdgMoney" && e.getAttribute("MyIndex")==parObj.MyIndex  )
                {
                    if(  parseFloat(replaceString( parObj.value ,",","")) >  parseFloat(replaceString( e.value ,",","")) )
                    {
                        parObj.value=e.value;
                        parObj.focus(); 
                        alert("審核金額不得大於動支報支金額，系統自動更正為動支報支金額。");
                       break; 
                    }             
                }
            }
       }


	function autowidth(parObj)
		{
		  //alert(this.style.width);
		 parObj._oldwidth=parObj.style.width;
		 parObj.style.width="";
//		 window.status=parObj.offsetWidth;
		 if(parObj.offsetWidth>500)
		    parObj.style.width=500;
		 //document.all("Label1").innerText=parObj.offsetWidth;
		 //parentNode.width="";
		}
		
		function defwith(parObj) 
		{
		 parObj.style.width=parObj._oldwidth;//"200";
		}
		
		


</script>
<TABLE cellSpacing="1" cellPadding="1" width="600" border="0">
        <tr>
                <td>
                        <table border=0 cellspacing=0   width =100% style="table-layout:fixed">
                                <tr>
                                        <td   ><font size="2">預算動支項目</font></td>                                       
                                        <td  Width="100px" style="text-align: right"><font size="2">經費所屬單位</font> </td>
                                        <td   Width="150px"  ><asp:DropDownList ID="DDLBgtDep" runat="server" Width="150px" AutoPostBack="True" Enabled="False" MyName="DDLBgtDep"></asp:DropDownList></td>
                                </tr>
                        </table>
                </td>
        </tr>
        <tr>
                <td   > 
                <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
                <DIV id=MyDiv  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW-x:scroll ; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: auto"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>">
                <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
													<asp:datagrid id="DataGrid2" runat="server" Width="1100px" AutoGenerateColumns="False">
														<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
														<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
														<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle  ></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap=false  ></ItemStyle>
																<ItemTemplate>
																    <asp:Image ID="IMdlacvExchNo" runat="server" ImageUrl="~/Images/034.gif"/>
																	<asp:Label id="LBdgNo" MyName ="LBdgNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" text='<%# Container.ItemIndex + 1  %>' onclick="setShowBudget(this)">
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="年度">
																<HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
																<ItemTemplate>
																	<asp:TextBox id="TBdgAcvBgtYear" runat="server" Width="30px" Style="TEXT-ALIGN: Center">195</asp:TextBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="月份">
																<HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																	<asp:TextBox id="TBdgAcvBgtMonth" runat="server" Width="30px" Style="TEXT-ALIGN: Center" MyName="TBdbMonth" MyIndex='<%# Container.ItemIndex %>' >12</asp:TextBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="門別">
																<HeaderStyle Width="80px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
																<ItemTemplate>
																	<asp:DropDownList id="DDLdgKind" runat="server" Width="80" Style="background-color: #ffffe0" MyName="DDLdgKind" MyIndex='<%# Container.ItemIndex %>' OnChange="setShowBudget(this)" >
																	</asp:DropDownList>
																</ItemTemplate>
                                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="預算來源">
															<HeaderStyle Width="90px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																	<asp:DropDownList id="DDLdgBgtSource" runat="server" Width="90" Style="background-color: #FFFFE0" MyName="DDLdgbgtSource" MyIndex='<%# Container.ItemIndex %>' >
																	</asp:DropDownList>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="控帳業務"  Visible=false >
															<HeaderStyle Width="140px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																	<asp:DropDownList id="DDLdgBiz" runat="server" Width="140" Style="background-color: #FFFFE0" MyName="DDLdgWorkUnit" MyIndex='<%# Container.ItemIndex %>' >
																		<asp:ListItem Value=""></asp:ListItem>
																	</asp:DropDownList>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="計畫科目">
															<HeaderStyle Width="300px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
															<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																	<asp:DropDownList id="DDLdgPlan" runat="server" Style="background-color: #FFFFE0" Width="300" AutoPostBack="False"  MyName="DDLdgPlan" MyIndex='<%# Container.ItemIndex %>' CssClass='<%# Container.ItemIndex %>'>
																	</asp:DropDownList>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="用途別科目">
																<HeaderStyle Wrap="False" Width="200px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
																<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="200px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
																<ItemTemplate>
																<asp:DropDownList id="DDLdgOul" style="BACKGROUND-COLOR: #ffffe0" runat="server" Width="200" MyName="DDLdgOul" MyIndex='<%# Container.ItemIndex %>'  onfocus="autowidth(this);" onblur="defwith(this);"></asp:DropDownList> 																 
																</ItemTemplate>																
															</asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="動支金額/審核金額">
                                                            <HeaderStyle Width="80px"   VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
                                                            	<ItemStyle Wrap="False"></ItemStyle>
																<ItemTemplate>
																	<asp:TextBox id="TBdgMoney" runat="server" Width="80px" Style="TEXT-ALIGN: right;background-color: #FFFFE0"   onFocus="this.select()" onkeypress="return check_Num()" MyName="TBdgMoney" MyIndex='<%# Container.ItemIndex %>' onblur="GetTotalAcvMoney(this);" ></asp:TextBox>
																	<asp:TextBox id="TBdgPassMoney" runat="server" Width="80px" Style="TEXT-ALIGN: right;background-color: #FFCCFF"   onFocus="this.select()" onkeypress="return check_Num()" MyName="TBdgPassMoney" MyIndex='<%# Container.ItemIndex %>' onblur="CheckPassMoney(this);GetTotalPassAcvMoney(this);"  ></asp:TextBox>
																</ItemTemplate>                                                           
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="LBdgTitle" runat="server" Font-Size=Small >動支金額</asp:Label>
                                                                </HeaderTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="出差日期(請填左方編號)">
                                                                 <HeaderStyle Width="120px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
                                                            	<ItemTemplate>
                                                                    <asp:TextBox ID="TBacvDateMemo" runat="server" Width="120px"  onblur="GetDataMemo(this);GetTotalAcvMoney(this)"   MyName="TBacvDateMemo" MyIndex='<%# Container.ItemIndex %>' ></asp:TextBox>
                                                                </ItemTemplate>
                                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="用途說明">
                                                            	 <HeaderStyle Width="100px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
                                                            	<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
																<ItemTemplate>
																<asp:TextBox id="TBdgAcvMemo" runat="server" Width="100px" Style="background-color: #FFFFE0"   MyName="TBdgAcvMemo" MyIndex='<%# Container.ItemIndex %>' ></asp:TextBox>
																</ItemTemplate>
															</asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="暫付">
                                                            	<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																<ItemTemplate><asp:CheckBox id="CBdgPrePay" runat="server"></asp:CheckBox></ItemTemplate>
                                                                <HeaderStyle Wrap="False" />
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="就地審計">
                                                            	<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																<ItemTemplate><asp:CheckBox id="CBdgInspect" runat="server"></asp:CheckBox></ItemTemplate>
                                                                <HeaderStyle  Wrap="False" />
                                                            </asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="明細資料" Visible="false" >
                                                            	<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																<ItemTemplate>
																    <input id="BtnRptDtl" runat="server" type="button"  value="..." onclick="fnCallRptDtl(this)" style="height:22px" />																	
															    </ItemTemplate>
                                                                <HeaderStyle  Wrap="False" />
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="移除">
																<HeaderStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBdgDel" runat="server" onclick="GetTotalAcvMoney(this);"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
														</Columns>
													</asp:datagrid></DIV>
													</td>
        </tr>
       <tr>
               <td>
                   <asp:Button ID="BtnAddRow" runat="server" Text="增加列數" Enabled="False" />
                   <asp:Button ID="Btn1" runat="server" Text="移除刪除列" Enabled="False" /></td>
       </tr> 
</table>