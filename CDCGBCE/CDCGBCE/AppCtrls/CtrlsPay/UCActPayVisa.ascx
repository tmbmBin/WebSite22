<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayVisa.ascx.vb" Inherits="AppCtrls.UCActPayVisa" %>
<script language="javascript">
<!--

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
  var objTargetName = "TBAcmMoney"; 
  var strKid = "<%=strCtrlAcmKidNum %>";



  //if (strKid=="ProdEx"  || strKid=="TrlOS")
//  if (strKid.toLowerCase() == "prodex" || strKid.toLowerCase() == "trlos" || strKid.toLowerCase() == "other" || strKid.toLowerCase() == "otherext" || strKid.toLowerCase() == "travel" || strKid.toLowerCase() == "strl" || strKid.toLowerCase() == "extra")
//  {
//		objTargetName="TBAcmMoney";
//  }
//  else
//  {
//		objTargetName="TBPayMoney";
//			   //objTargetName="TBAcmMoney";

//  }
  //alert(parObj.id);
  var arrCtlName = parObj.id.split("_")
  
  for (var i=0;i<document.forms[0].elements.length;i++)
  {
		var e=document.forms[0].elements[i];
		//if ( e.getAttribute("MyName") == "TBPayMoney")
		if ( e.getAttribute("MyName") == objTargetName ) {

		    objTarget = e;
		   
		}
		if ( e.getAttribute("MyName") == "TBdgMoney" && e.value !="")
		{


		   var objName;
		   var intRecNo;
		   intRecNo= eval(e.getAttribute("MyIndex")) + eval(2) +'';


		   if (intRecNo.length ==1)
		   { intRecNo='0'+ intRecNo
		   }

		   //objName =   "ctl06_DataGrid2_ctl" + intRecNo + "_CBdgDel"
		   objName = arrCtlName[0] + "_DataGrid2_ctl" + intRecNo + "_CBdgDel"
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


	   function autowidth(parObj) {


	       if (!parObj.style.width) return;
	       //		    window.status =""
	       //alert(this.style.width);
	       parObj._onchange = parObj.onchange;
	       parObj.onchange = null;

	       if (!parObj._oldwidth) parObj._oldwidth = parObj.style.width;
	       //parObj.style.position = "absolute";
	       if (parObj._offsetWidth >= 500) {
	           parObj.style.width = "500";
	       }
	       else {
	           parObj.style.width = "";
	           parObj._offsetWidth = parObj.offsetWidth;
	           //window.status=parObj.offsetWidth;
	       }
	       //		 if (parObj.offsetWidth > 500) {		     
	       //		         parObj.style.width = "500";   
	       //		 }
	       //document.all("Label1").innerText=parObj.offsetWidth;
	       //parentNode.width="";
	       parObj.onchange = parObj._onchange;

	       //window.status= parObj.onchange;
	   }

	   function defwith(parObj) {
	       parObj.style.width = parObj._oldwidth; //"200";
	   }


	   function showAcvBgtSourCnt(parObjName) {
	       //alert(document.getElementById(parObjName).value);
	       var strCtrlName = replaceString(parObjName, "DDLdgBgtSource", "TBAcvBgtSourCnt");
	       var strCtrlName1 = replaceString(parObjName, "DDLdgBgtSource", "LBAcvBgtSourTitle");
	       //var strCtrlName = replaceString(parObjName, "DDLdgbgtSource", "TBAcvBgtSourNo");
	       //if (document.getElementById(parObjName).value == "20" || document.getElementById(parObjName).value == "30") {
	           if ( document.getElementById(parObjName).value == "30") {

	           document.getElementById(strCtrlName).style.display = "block";
	           document.getElementById(strCtrlName1).style.display = "block";
	       }
	       else {
	           document.getElementById(strCtrlName).style.display = "none";
	           document.getElementById(strCtrlName1).style.display = "none";
	       }
	   }

//-->
</script>

<table _ondblclick="alert('14:UCActPayVisa.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
	<tr>
		<td>
		<!-- ↓折疊項目(14) -->
		<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
						<td width="1%" align="right"><img id="img_FoldTitle_14" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_14', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
						<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_14')">預算動支項目<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_14" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 5px">

				<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
					<tr>
						<td width="150" align="right"><img id="img14" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img14.fireEvent("onclick")'>預算動支項目</span></td>
						<td width="440" align="right" style="padding-right: 0px">
						<table border="0" cellpadding="0" style="border-collapse: collapse">
							<tr>
								<td><font size="2"><asp:CheckBox id="CBOtherBgtDep" runat="server" ForeColor="#FF0000" Text ="使用其他單位經費" AutoPostBack="True" Enabled="False" /></font></td>
								<td style="display:none"><font size="2">經費所屬單位｜</font></td>
								<td style="display:none">&nbsp;</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
						<div id="div_UCActPayVisa" class="DIV1_width" alt="DIV1" style="BEHAVIOR: url(<%= resolveurl(scrollposurl)%>)" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>"><input type="hidden" id="savescrollpos" name="savescrollpos" runat="server">
							<asp:datagrid id="DataGrid2" runat="server" AutoGenerateColumns="False">
								<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
								<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
								<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
								<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
								<Columns>
									<asp:TemplateColumn>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap=false  ></ItemStyle>
										<ItemTemplate>
											<asp:Image ID="IMdlacvExchNo" runat="server" ImageUrl="~/Images/034.gif"/>
											<asp:Label id="LBdgNo" MyName ="LBdgNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" text='<%# Container.ItemIndex + 1  %>' onclick="setShowBudget(this)">
										</asp:Label>
									</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="年度">
										<HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcvBgtYear" runat="server" Width="30px" Style="TEXT-ALIGN: Center">195</asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="月份">
										<HeaderStyle Width="30px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcvBgtMonth" runat="server" Width="30px" Style="TEXT-ALIGN: Center" MyName="TBdbMonth" MyIndex='<%# Container.ItemIndex %>' >12</asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="門別">
										<HeaderStyle Width="80px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
										<ItemTemplate>
											<asp:DropDownList id="DDLdgKind" runat="server" Width="80" Style="background-color: #ffffe0" MyName="DDLdgKind" MyIndex='<%# Container.ItemIndex %>' OnChange="setShowBudget(this)" >
											</asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="預算來源">
										<HeaderStyle Width="90px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgBgtSource" runat="server" Width="90" Style="background-color: #FFFFE0" MyName="DDLdgbgtSource" MyIndex='<%# Container.ItemIndex %>' onChange="showAcvBgtSourCnt(this.id);" ></asp:DropDownList>
                                            <table id="TBAcvBgtSour" border="0" style="table-layout:fixed; border-collapse:collapse; font-size:10px;">
                                                <tr>
                                                    <td><asp:Label ID="LBAcvBgtSourTitle" style="display:none" runat="server" Text="次數："></asp:Label></td>
                                                    <td><asp:TextBox  ID="TBAcvBgtSourCnt" style="display:none" runat="server" Width="30px" MyName="TBAcvBgtSourCnt" MyIndex='<%# Container.ItemIndex %>' ></asp:TextBox></td>
                                                </tr>
                                            </table>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="經費單位" >
										<HeaderStyle Width="90px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgBgtDepCode" runat="server" Width="90" Style="background-color: #FFFFE0" MyName="DDLdgBgtDepCode" MyIndex='<%# Container.ItemIndex %>' AutoPostBack="true" >
												<asp:ListItem Value=""></asp:ListItem>
											</asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="控帳業務">
										<HeaderStyle Width="90px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgBiz" runat="server" Width="90" Style="background-color: #FFFFE0" MyName="DDLdgBiz" MyIndex='<%# Container.ItemIndex %>' AutoPostBack="True" >
												<asp:ListItem Value=""></asp:ListItem>
											</asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>

									<asp:TemplateColumn HeaderText="選取" Visible="false" >									
										<HeaderStyle Width="100px" Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False"></ItemStyle>
										<ItemTemplate>
										   <input type="button" id="BtnPlanPicker" runat="server" style="WIDTH: 16px; HEIGHT: 22px"  value="..." title="選取科目" />
									    </ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="計畫科目">
										<HeaderStyle Width="200px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgPlan" runat="server" Style="background-color: #FFFFE0" Width="200" AutoPostBack="False"  MyName="DDLdgPlan" MyIndex='<%# Container.ItemIndex %>' CssClass='<%# Container.ItemIndex %>' EnableViewState="True"  onmousedown="tranSeleGroup(this,'*');autowidth(this);"  onblur="defwith(this);" ></asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>								
									<asp:TemplateColumn HeaderText="用途別科目">
										<HeaderStyle Width="150px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgOul" style="BACKGROUND-COLOR: #ffffe0; " runat="server" Width="150" MyName="DDLdgOul" MyIndex='<%# Container.ItemIndex %>' onmousedown="autowidth(this);"   onblur="defwith(this);" EnableViewState=true></asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="動支金額">
										<HeaderStyle Width="80px" Font-Size="X-Small" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<HeaderTemplate>
											<asp:Label ID="LBdgTitle" runat="server" >動支金額</asp:Label>
										</HeaderTemplate>
										<ItemStyle Wrap="False"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgMoney" runat="server" Width="80px" Style="TEXT-ALIGN: right;background-color: #FFFFE0"   onFocus="this.select()" onkeypress="return check_Num()" MyName="TBdgMoney" MyIndex='<%# Container.ItemIndex %>' onblur="GetTotalAcvMoney(this);" ></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
                                    <%--20160115 [mdf]:因配合105年CGBA上線GBC系統之調整,暫付改預付--%>
									<%--<asp:TemplateColumn HeaderText="暫付">--%>
                                    <asp:TemplateColumn HeaderText="預付">
										<HeaderStyle Wrap="False" />
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
											<asp:CheckBox id="CBdgPrePay" runat="server"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="就地審計">
										<HeaderStyle Width="30px" Font-Size="XX-Small" HorizontalAlign="Center" 
                                            VerticalAlign="Middle"  ></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
										<ItemTemplate>&nbsp;<asp:CheckBox id="CBdgInspect" runat="server"  MyName="CBdginspect" MyIndex='<%# Container.ItemIndex %>' ></asp:CheckBox>&nbsp;</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="移除">
										<HeaderStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
											<asp:CheckBox id="CBdgDel" runat="server" onclick="GetTotalAcvMoney(this);"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="傳票資料" Visible="false">
										<HeaderStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
										    <asp:Label ID="LBdgTranID" runat="server" Text="Label"></asp:Label>
										    <asp:Label ID="LBdgTranBNo" runat="server" Text="Label"></asp:Label>
										    <asp:Label ID="LBdgTranDTime" runat="server" Text="Label"></asp:Label>
										    <asp:Label ID="LBdgTranUser" runat="server" Text="Label"></asp:Label>
										    <asp:Label ID="LBdgExchNo" runat="server" Text="Label"></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid>
						</div>
						</td>
					</tr>
				</table>
				<table cellpadding="3" style="border-collapse: collapse; margin-bottom: -2px; width: 100%" border="0">
					<tr>
						<td>
							<asp:Button id="BtnAddRow" runat="server" Width="75px" Height="22px" Text="增加列數" Enabled="False" /><asp:Button id="Btn1" runat="server" Width="75px" Height="22px" Text="移除刪除列" Enabled="False" />
							<font size="2">
                            <asp:TextBox ID="TBQty" runat="server" onkeypress="return check_Num()" 
                                style="text-align:center" ToolTip="指定增加列數1~5列" Width="60px" 
                                Enabled="False">1</asp:TextBox>
                            <asp:CheckBox id="CBCopy" runat="server" Text="複製上筆資料" Enabled="False" /></font>
						</td>
						<td align="right"> </td>
					</tr>
				</table>
				<!-- Insert 項目內容 here -->
				</td>
			</tr>
		</table>
		<!-- 折疊項目(14)↑ -->
		</td>
	</tr>
</table>