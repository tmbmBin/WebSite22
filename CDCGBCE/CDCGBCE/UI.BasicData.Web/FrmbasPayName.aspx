<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmbasPayName.aspx.vb" Inherits="UI.BasicData.Web.FrmbasPayName"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>basPayName</title>
<base target="_self" />

   <meta http-equiv="Pragma" content="No-cache" />
   <meta http-equiv="Cache-Control" content="no-cache" /> 
<script language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>
<script language="javascript" type="text/javascript">




function fnCallSearchDialog(){

		var strReturnVal=showModalDialog("FrmSearchPayName.aspx?showtype=1",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel")
			{
				document.all("TBFindSql").value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}
		
	

function fnGetInfo( ){
//var sData = dialogArguments;
//sData.sUserName = bnkSubNo;
//sData.fnUpdate();
//alert(document.all("TBpayTel1").value);
returnValue=document.all("TBpayTel1").value;


 //returnValue=bnkSubNo;
}


 returnValue="Cancel";
function fnCancel(){
//var sData = dialogArguments;
//sData.sUserName = "";
//sData.fnUpdate();
}


		
</script>
</head>
<body>
<form id="form1" runat="server">
         <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"  valign="top" align="left">
                       <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                           <tr>
                               <td>
 <table style="table-layout:fixed" border=0 cellpadding=0 cellspacing=0 width=100%>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >���ڤH�N�X</td>
                                       <td style="WIDTH: 160px"><asp:textbox id="TBpayCode" runat="server" MaxLength="12" 
                                               Width="100px"></asp:textbox></td>
                                      <td style="WIDTH: 110px; padding-right:2px" align="right" >���ڤH����</td>
                                       <td>
                                           <asp:DropDownList ID="DDLPayKind" runat="server">
                                               <asp:ListItem Value="0">��L</asp:ListItem>
                                               <asp:ListItem Value="1">���u</asp:ListItem>
                                               <asp:ListItem Value="2">�M��</asp:ListItem>
                                               <asp:ListItem Value="3">���v�H</asp:ListItem>
                                           </asp:DropDownList>
                                       </td>
                           </tr>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >�����Ҹ�(�νs)</td>
                                       <td style="WIDTH: 160px"><asp:textbox id="TBpayID" runat="server" MaxLength="12" 
                                               Width="100px"></asp:textbox></td>
                                      <td style="WIDTH: 110px; padding-right:2px" align="right" >���ڤH����</td>
                                       <td><asp:textbox id="TBpayGroup" runat="server" MaxLength="6" Width="100px"></asp:textbox></td>
                           </tr>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >���ڤH�W��</td>
                                       <td colspan="3">
                                           <asp:textbox id="TBpayName" runat="server" MaxLength="120" 
                                               Width="420px"></asp:textbox></td>
                           </tr>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >�a�}</td>
                                       <td colspan="3"><asp:textbox id="TBpayZipCode" runat="server" MaxLength="10" Width="50px" ToolTip="�l���ϸ�"></asp:textbox>
                                           <asp:textbox id="TBpayAddress" runat="server" MaxLength="86" Width="340px"></asp:textbox></td>
                           </tr>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >���ڤH²��</td>
                                       <td style="WIDTH: 160px">
                                           <asp:textbox id="TBpayAliasNo" runat="server" 
                                               MaxLength="14" Width="150px"></asp:textbox></td>
                                      <td style="WIDTH: 110px; padding-right:2px" align="right" >�q�l�H�c</td>
                                       <td><asp:textbox id="TBpayEMail" runat="server" MaxLength="50" Width="150px"></asp:textbox></td>
                           </tr>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >�s���H(�@)</td>
                                       <td style="WIDTH: 160px">
                                           <asp:textbox id="TBpayTalk1" runat="server" MaxLength="20" 
                                               Width="150px"></asp:textbox></td>
                                      <td style="WIDTH: 110px; padding-right:2px" align="right" >�s���q��(�@)</td>
                                       <td><asp:textbox id="TBpayTel1" runat="server" MaxLength="20" Width="150px"></asp:textbox></td>
                           </tr>
                                   <tr>
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >�s���H(�G)</td>
                                       <td style="WIDTH: 160px"><asp:textbox id="TBpayTalk2" runat="server" MaxLength="20" 
                                               Width="150px"></asp:textbox></td>
                                      <td style="WIDTH: 110px; padding-right:2px" align="right" >�s���q��(�G)</td>
                                       <td><asp:textbox id="TBpayTel2" runat="server" MaxLength="20" Width="150px"></asp:textbox></td>
                           </tr>
     <tr>
         <td align="right" style="padding-right: 2px; width: 120px">
             �����W��</td>
         <td style="width: 160px">
             <asp:DropDownList ID="DDLDepName" runat="server" TabIndex="8" Width="150px">
             </asp:DropDownList></td>
         <td align="right" style="padding-right: 2px; width: 110px">
             �u�@���W</td>
         <td>
             <asp:DropDownList ID="DDLDepWorkName" runat="server" TabIndex="8" Width="150px">
             </asp:DropDownList></td>
     </tr>
     <tr>
         <td align="right" style="padding-right: 2px; width: 120px">
             ¾�٦W��</td>
         <td style="width: 160px">
             <asp:DropDownList ID="DDLRankName" runat="server" TabIndex="8" Width="150px">
             </asp:DropDownList></td>
         <td align="right" style="padding-right: 2px; width: 110px">
         </td>
         <td>
         </td>
     </tr>
                                   <tr style="display:none">
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >���ɳ]�w</td>
                                       <td style="WIDTH: 160px">
												<asp:DropDownList id="DDLpayShareKind" runat="server">
												    <asp:ListItem Value="2">�Ҧ��H��</asp:ListItem>
													<asp:ListItem Value="0">�֦���</asp:ListItem>
													<asp:ListItem Value="1">�ȦP�b�O��</asp:ListItem>													
												</asp:DropDownList></td>
                                      <td    align="right" >���ʳ]�w</td>
                                       <td>
												<asp:DropDownList id="DDLpayEditKind" runat="server">
												    <asp:ListItem Value="2">�Ҧ��H��</asp:ListItem>
													<asp:ListItem Value="0">�֦���</asp:ListItem>
													<asp:ListItem Value="1">�ȦP�b�O��</asp:ListItem>													
												</asp:DropDownList></td>
                           </tr>
                                   <tr style="display:none">  
                                      <td style="WIDTH: 120px; padding-right:2px" align="right" >�R���]�w</td>
                                       <td style="WIDTH: 160px">
												<asp:DropDownList id="DDLpayDelKind" runat="server">
													<asp:ListItem Value="2">�Ҧ��H��</asp:ListItem>
													<asp:ListItem Value="0">�֦���</asp:ListItem>
													<asp:ListItem Value="1">�ȦP�b�O��</asp:ListItem>													
												</asp:DropDownList></td>
                                      <td style="WIDTH: 110px; padding-right:2px" align="right" >�@</td>
                                       <td>�@</td>
                           </tr>
                                   </table>

                               </td>
                           </tr>

                       </table>
                   </td>
               </tr>
               <tr>
                   <td bgcolor="#ffffff" height="10"><font forecolor="red" ><input id="BtnTel" type="button" value="�s�觹���^���ʳ椸" runat="server"  onclick='fnGetInfo();window.close();' /></font></td>
               </tr>
               <tr>
                   <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
                       <table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
                           <tr>
                               <td valign="bottom" align="left">
                                   <table cellpadding="1" border="0">
                                       <tr>
                                           <td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="�s�W" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="�ק�" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="�R��" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="�x�s" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="����" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Text="�d��" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="�C�L" Visible="False" Height="22"></asp:button></td>
                                           <td valign="bottom" align="center" style="width: 3px">
                                               </td>
                                           <td valign="bottom" align="center"></td>
                                           <td valign="bottom" align="center">
                                               <asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;}" id="TBSearchSql" onblur="if(this.value==''){this.value='�M��s��';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">�M��s��</asp:textbox>
                                               <input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
                                           </td>
                                           <td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
                                           <td><input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server"></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr>
                               <td>
                                    <asp:datagrid id="DataGrid1" runat="server" Width="100%" 
                                                                      AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" > 
                                     <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle> 
                                     <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>  
                                     <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>  
                                     <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>   
                                     <Columns>
                                         <asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select" >
                                             <HeaderStyle Width="30px" />
                                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                         </asp:ButtonColumn>
                                         <asp:BoundColumn DataField="payCode" HeaderText="���ڤH�N�X"   SortExpression="payCode"  >
                                             <HeaderStyle Width="90px" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="payID" HeaderText="�����Ҹ�(�νs)"   SortExpression="payID"  >
                                             <HeaderStyle Width="100px" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="payName" HeaderText="���ڤH�W��"   SortExpression="payName"  ></asp:BoundColumn>
                                         <asp:BoundColumn DataField="payCreateUser" HeaderText="�إߤH��"   SortExpression="payCreateUser"  >
                                             <HeaderStyle Width="80px" />
                                         </asp:BoundColumn>
                                         <asp:BoundColumn DataField="payKind" HeaderText="���ڤH����"   SortExpression="payKind" Visible=false></asp:BoundColumn>
                                         <asp:BoundColumn DataField="payGroup" HeaderText="���ڤH����"   SortExpression="payGroup" Visible=false></asp:BoundColumn>
                                    </Columns>  
                                   <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                               </asp:datagrid>  

                               </td>
                           </tr>
                           <tr>
                               <td align="right"></td>
                           </tr>
                       </table>
                   </td>
               </tr>
           </table>
</form>
</body>
</html>