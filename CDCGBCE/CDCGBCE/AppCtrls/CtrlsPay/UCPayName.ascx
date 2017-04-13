<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCPayName.ascx.vb" Inherits="AppCtrls.UCPayName" %>
<script language="javascript">
<!--

function fnCallPayNameDialog(parObj){

	var bol1, bol2, bol3, bol4, bol5;

	var strReturnVal = showModalDialog("../UI.Comm.Web/FrmSearchPayName.aspx?showtype=1&strDTable=PV&strMTable=P", window, "dialogWidth:740px;dialogHeight:400px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

	if (strReturnVal != "Cancel") {
		var tmpArray = strReturnVal.split("|")

		for (var i = 0; i < document.forms[0].elements.length; i++) {
			var e = document.forms[0].elements[i];
			if (e.getAttribute("MyName") == "TBdgAcnPayName" && e.getAttribute("MyIndex") == parObj.MyIndex) {
				e.value = tmpArray[0];
				bol1 = true;
			}

			if (e.getAttribute("MyName") == "TBdgAcnBank" && e.getAttribute("MyIndex") == parObj.MyIndex) {
				e.value = tmpArray[2];
				bol2 = true;
			}

			if (e.getAttribute("MyName") == "TBdgAcnBankNo" && e.getAttribute("MyIndex") == parObj.MyIndex) {
				e.value = tmpArray[1];
				bol3 = true;
			}

			if (e.getAttribute("MyName") == "TBdgAcnDepositor" && e.getAttribute("MyIndex") == parObj.MyIndex) {
				e.value = tmpArray[3];
				bol4 = true;
			}

			if (e.getAttribute("MyName") == "TBdgAcnDepositorNo" && e.getAttribute("MyIndex") == parObj.MyIndex) {
				e.value = tmpArray[4];
				bol5 = true;
			}

			if (bol1 == true && bol2 == true && bol3 == true && bol4 == true && bol5 == true) {
				break;
			}
		}

	}

}

function check_Num(){
	if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
		return true;}
	else{event.keyCode=0;false;}
}

//-->
</script>

<table _ondblclick="alert('16:UCPayName.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
	<tr>
		<td>
		<!-- ↓折疊項目(16) -->
		<table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
			<tr>
				<td height="20" class="sFoldTitle">
				<table cellpadding="0" style="border-collapse: collapse" border="0">
					<tr>
						<td width="1%" align="right"><img id="img_FoldTitle_16" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_16', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
						<td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_16')">受款人清單<font color="red" size="2pt">←請展開</font></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="FoldTitle_16" style="display: block" onpropertychange="sync_title_img(this)">
				<td style="padding: 5px">

				<table cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
					<tr>
						<td width="130" align="right"><img id="img16" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img16.fireEvent("onclick")'>受款人清單</span></td>
						<td width="460" align="right" style="padding-right: 0px"></td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><% Dim scrollPosURL3 As String = "../Behavior/ScrollPos.htc" %>
						<div id="div_UCPayName" class="DIV3_width" alt="DIV3" style="BEHAVIOR: url(<%= resolveurl(scrollPosURL3)%>)" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>"><input type="hidden" id="savescrollpos" name="savescrollpos" runat="server">
							<asp:datagrid id="DataGrid3" runat="server" Width="100%" AutoGenerateColumns="False" >
								<HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
								<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
								<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
								<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
								<Columns>
									<asp:TemplateColumn>
										<HeaderStyle Width="15px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:Label id="LBdgNo" runat="server" Width="15px" MyName="LBdgNo" MyIndex="<%# Container.ItemIndex %>"  style="CURSOR: hand;"  ondblclick='fnCallPayNameDialog(this);' ><%# Container.ItemIndex + 1  %></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="受款人">
										<HeaderStyle Width="100px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcnPayName" runat="server" Width="100px" Style="TEXT-ALIGN: Left" MyName="TBdgAcnPayName" MyIndex="<%# Container.ItemIndex %>"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="金融機構代號">
										<HeaderStyle Width="80px"></HeaderStyle>
										<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcnBankNo" runat="server" Width="80px" Style="TEXT-ALIGN: Left" MyName="TBdgAcnBankNo" MyIndex="<%# Container.ItemIndex %>"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="金融機構名稱">
										<HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcnBank" runat="server" Width="200px" Style="TEXT-ALIGN: Left" MyName="TBdgAcnBank" MyIndex="<%# Container.ItemIndex %>"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="戶  名">
										<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcnDepositor" runat="server" Width="100px" Style="TEXT-ALIGN: Left" MyName="TBdgAcnDepositor" MyIndex="<%# Container.ItemIndex %>"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="帳 號">
										<HeaderStyle Wrap="False" Width="150px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcnDepositorNo" runat="server" Width="150px" Style="TEXT-ALIGN: Left" MyName="TBdgAcnDepositorNo" MyIndex="<%# Container.ItemIndex %>"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="金額">
										<HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
										<ItemTemplate>
											<asp:TextBox id="TBdgAcnMoney" runat="server" Width="80px" Style="TEXT-ALIGN: Right" onkeypress="return check_Num()" MyName="TBdgAcnMoney" MyIndex="<%# Container.ItemIndex %>"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="移除">
										<HeaderStyle Wrap="False" Width="40px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></ItemStyle>
										<ItemTemplate>
											<asp:CheckBox id="CBdgDel" runat="server"></asp:CheckBox>
										</ItemTemplate>
										<FooterStyle Wrap="False" />
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
							<asp:Button id="BtnAddPayName" runat="server" Width="75px" Height="22px" Text="增加列數" Enabled="False"></asp:Button>
							<asp:Button id="BtnDelPayName" runat="server" Width="75px" Height="22px" Text="刪除列數" Enabled="False"></asp:Button>
						</td>
						<td align="right">　</td>
					</tr>
				</table>
				<!-- Insert 項目內容 here -->
				</td>
			</tr>
		</table>
		<!-- 折疊項目(16)↑ -->
		</td>
	</tr>
</table>