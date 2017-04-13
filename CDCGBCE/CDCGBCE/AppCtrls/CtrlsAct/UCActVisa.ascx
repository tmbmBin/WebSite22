<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActVisa.ascx.vb" Inherits="AppCtrls.UCActVisa" %>
<script language="javascript">
<!--

	function fnCallRptDtl(parObj){

	var strPars;
	var tmpOulVal="";
	var tmpArray = parObj.cssclass.split(":")
			 for (var i=0;i<document.forms[0].elements.length;i++)
			 {
				var e=document.forms[0].elements[i];
				if (e.getAttribute("MyName") == "DDLdgOul" && e.getAttribute("MyIndex")==parObj.MyIndex )
				{
					tmpOulVal =e.value;
					break;
				}
			 }

	strPars = "acmyear=" + tmpArray[0] + "&acmno=" + tmpArray[1] + "&acvno=" + tmpArray[2] + "&acmmemo=" +  escape(document.all("TBAcmMemo").value)+ "&oulcode=" + tmpOulVal; //+ "&acmno1=" + tmpArray(3) + "&acvno1=" + tmpArray(4) + "&acmno2=" + tmpArray(5) + "&acvno2=" + tmpArray(6) + "&acppayyear=" + tmpArray(7) + "&acppayno=" & tmpArray(8) + "&acvsubno=" +  tmpArray(9) + "&acppayno1=" + tmpArray(10) + "&acvsubno1=" + tmpArray(11);
	//window.open("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars);
		//var strReturnVal=
		showModalDialog("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars ,window,"dialogWidth:950px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

//		if (strReturnVal != "Cancel" )
//			{
//				document.all(thisName).value=document.all(thisName).value + strReturnVal;
//			}
		}

function GetTotalAcvMoney(parObj)
{
  var tmpVal=0;
  var objTarget;
  var chkflag="0";
  var objChk;
  for (var i=0;i<document.forms[0].elements.length;i++)
  {
		var e=document.forms[0].elements[i];
		if ( e.getAttribute("MyName") == "TBAcmMoney")
		{

			objTarget=e;

		}



		if ( e.getAttribute("MyName") == "TBdgAcvMoney" && e.value !="")
		{

		   var objName;
		   var intRecNo;
		   intRecNo= eval(e.getAttribute("MyIndex")) + eval(2) +'';


		   if (intRecNo.length ==1)
		   { intRecNo='0'+ intRecNo
		   }
			 var tmpName =e.id.split("_");

		   objName=tmpName[0] + "_DataGrid2_ctl"+ intRecNo +"_CBdgDel"
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
//  var tmpVal=0;
//  var objTarget;
//  for (var i=0;i<document.forms[0].elements.length;i++)
//  {
//        var e=document.forms[0].elements[i];
//        if ( e.getAttribute("MyName") == "TBPayMoney")
//        {
//            objTarget=e;
//        }
//        if ( e.getAttribute("MyName") == "TBdgMoney" && e.value !="")
//        {
//
//            tmpVal += parseFloat(replaceString(e.value,",",""));
//
//        }
//	objTarget.value = tmpVal
//   }

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
		//alert(tmpVal.length-1);
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


					dblSubTotal+=parseFloat(replaceString(e.value,",",""));
					bolS=true;
				   // break i;
				}

				 if (bolS==true && bolT==true )
				 { bolS=true;
				   break;
				 }
			 }

		 }
		//alert(dblSubTotal);
		objTarget.value = dblSubTotal;
	}



}

		function check_Num(){
				if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
					return true;}
				else{event.keyCode=0;false;}
		}




		function CheckDelDataMoney(parObj)
		{

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
			    //parObj.style.position = "";
		 parObj.style.width=parObj._oldwidth;//"200";
		}

//-->
</script>

<table _ondblclick="alert('12:UCActVisa.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
	<tr>
		<td>
		<!-- ↓折疊項目(12) -->
		<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
						<td width="1%" align="right"><img id="img_FoldTitle_12" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_12', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
						<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_12')">預算動支項目<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_12" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 5px">

				<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
					<tr>
						<td width="150" align="right"><img id="img12" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img12.fireEvent("onclick")'>預算動支項目</span></td>
						<td width="440" align="right" style="padding-right: 0px">
						<table border="0" cellpadding="0" style="border-collapse: collapse">
							<tr>
								<td><font size="2"><asp:CheckBox id="CBOtherBgtDep" runat="server" ForeColor="#FF0000" Text ="使用其他單位經費" AutoPostBack="True" Enabled="False" /></font></td>
								<td style="display:none"><font size="2">經費所屬單位｜</font></td>
								<td style="display:none" >&nbsp;</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><% Dim scrollPosURL As String = "../../Behavior/ScrollPos.htc"%>
						<div id="div_UCActVisa" class="DIV1_width" alt="DIV1" style="BEHAVIOR: url(<%= resolveurl(scrollposurl)%>)" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>"><input type="hidden" id="savescrollpos" name="savescrollpos" runat="server" />
							<asp:datagrid id="DataGrid2" runat="server" Width="100%" 
                                AutoGenerateColumns="False" >
								<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
								<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
								<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
								<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
								<Columns>
									<asp:TemplateColumn>
										<HeaderStyle Width="15px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:Label id="LBdgAcvNo" MyName ="LBdgNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" style="TEXT-ALIGN: center; CURSOR: help" Width="15px" text='<%# Container.ItemIndex + 1  %>' onclick='setShowBudget(this);' ></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="年度">
										<HeaderStyle Width="50px" Font-Size="X-Small"  HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="False"></ItemStyle>
										<ItemTemplate>
											<asp:CheckBox id="CBNextYearFlag" tooltip="非本年度預算" runat="server"></asp:CheckBox>
											<asp:TextBox id="TBdgAcvBgtYear" runat="server" Width="30px" Style="TEXT-ALIGN: Center" MyName="TBdgAcvBgtYear" MyIndex='<%# Container.ItemIndex %>' Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtYear") %>'  onkeypress="return check_Num()"  ></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="月份">
										<HeaderStyle Width="30px"   Font-Size="X-Small"  HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcvBgtMonth" runat="server" Width="30px" Style="TEXT-ALIGN: Center" MyName="TBdgAcvBgtMonth" MyIndex='<%# Container.ItemIndex %>'  onkeypress="return check_Num()"   ></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="經資門別">
										<HeaderStyle Width="70px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"  ></HeaderStyle>
										<ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
										<ItemTemplate>
											<asp:DropDownList id="DDLdgKind" runat="server" Width="70" Style="background-color: #ffffe0" MyName="DDLdgKind" MyIndex='<%# Container.ItemIndex %>' OnChange="setShowBudget(this)"  ></asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="預算來源">
										<HeaderStyle Width="70px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgbgtSource" runat="server" Width="70" Style="background-color: #FFFFE0" MyName="DDLdgbgtSource" MyIndex='<%# Container.ItemIndex %>'  >
											</asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="經費單位">
										<HeaderStyle Width="90px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgBgtDepCode" runat="server" Width="90" Style="background-color: #FFFFE0" MyName="DDLdgBgtDepCode" MyIndex='<%# Container.ItemIndex %>' AutoPostBack="True" >
												<asp:ListItem Value=""></asp:ListItem>
											</asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="控帳業務">
										<HeaderStyle Width="90px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgBiz" runat="server" Width="90" Style="background-color: #FFFFE0" MyName="DDLdgBiz" MyIndex='<%# Container.ItemIndex %>' AutoPostBack="False" >
												<asp:ListItem Value=""></asp:ListItem>
											</asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="選取" Visible="false" >									
										<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="false" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False"></ItemStyle>
										<ItemTemplate>
										    <input type="button" id="BtnPlanPicker" runat="server" style="WIDTH: 25px; HEIGHT: 22px"  value="..."  title="選取科目" />									   
									    </ItemTemplate>
									</asp:TemplateColumn>									
									<asp:TemplateColumn HeaderText="計畫科目">
										<HeaderStyle Width="200px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Wrap="False" ></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgPlan" runat="server" Style="background-color: #FFFFE0" Width="200" AutoPostBack="False"  MyName="DDLdgPlan" MyIndex='<%# Container.ItemIndex %>' CssClass='<%# Container.ItemIndex %>'   onmousedown="tranSeleGroup(this, '*');autowidth(this);" onblur="defwith(this);"  ></asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>								
									<asp:TemplateColumn HeaderText="用途別科目">
										<HeaderStyle Width="150px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
										<ItemTemplate>
											<asp:DropDownList id="DDLdgOul" style="BACKGROUND-COLOR: #ffffe0; " runat="server" Width="150" MyName="DDLdgOul" MyIndex='<%# Container.ItemIndex %>' onmousedown="autowidth(this);" onblur="defwith(this);" EnableViewState="true"></asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateColumn>								 
									<asp:TemplateColumn HeaderText="動支金額">
										<HeaderStyle Width="80px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcvMoney" runat="server" Width="80px" Style="TEXT-ALIGN: right;background-color: #FFFFE0"   onFocus="this.select()" onkeypress="return check_Num()" MyName="TBdgAcvMoney" MyIndex='<%# Container.ItemIndex %>' onblur="GetTotalAcvMoney(this);" ></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="用途說明" Visible="false">
										<HeaderStyle Width="100px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcvMemo" runat="server" Width="100px" Style="background-color: #FFFFE0"   MyName="TBdgAcvMemo" MyIndex='<%# Container.ItemIndex %>' ></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="就地審計">
										<HeaderStyle Width="120px" Font-Size="XX-Small" HorizontalAlign="Center" 
                                            VerticalAlign="Middle" Wrap="False" Font-Bold="False" Font-Italic="False" 
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
										    <asp:CheckBox id="CBdginspect" runat="server"  MyName="CBdginspect" MyIndex='<%# Container.ItemIndex %>' ></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="移除">
										<HeaderStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
											<asp:CheckBox id="CBdgDel" runat="server"  MyName="CBdgDel" MyIndex='<%# Container.ItemIndex %>' onclick="GetTotalAcvMoney(this);" ></asp:CheckBox>
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
		<!-- 折疊項目(12)↑ -->
		</td>
	</tr>
</table>