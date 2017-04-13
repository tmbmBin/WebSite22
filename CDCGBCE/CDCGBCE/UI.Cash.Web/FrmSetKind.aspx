<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSetKind.aspx.vb" Inherits="UI.Cash.Web.FrmSetKind" %>

<html>
<head runat="server">
    <title>帳別管理設定</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" /> 
    <script type="text/javascript">
    function GetIEVer() {
        var x;
        for (i = 0; i < 10; i++) {
            for (z = 0; z < 10; z++) {
                if (navigator.appVersion.match("MSIE " + i + "." + z) != null)
                    x = i + "." + z;
            }
        }
        return x;
    }

    function fnCallChoooseDep(thisName,FrmName) {
        var url = "../AppCtrlSet/FrmChooseDep.aspx?selectedData=" + escape(document.all(thisName).value) + "&openFrm=" + FrmName
        var strReturnVal;

        if (parseFloat(GetIEVer()) > 6)
            strReturnVal = showModalDialog(url, window, "dialogWidth: 303px; dialogHeight: 278px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        else	//W:-8; H:-47
            strReturnVal = showModalDialog(url, window, "dialogWidth: 311px; dialogHeight: 325px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        if (strReturnVal != "Cancel") {
            // document.all(thisName).value = document.all(thisName).value + strReturnVal;
            document.all(thisName).value = strReturnVal;
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
		<tr>
			<td>
			<table cellpadding="5" style="border-collapse: collapse;width:100%" border="1" bordercolor="#FFFFFF">
				<tr>
					<td>
					<table cellpadding="0" cellspacing="0" border="0">
					    <tr>
					        <td>管理人員：</td>
					        <td>
                                <asp:DropDownList ID="ddl_cskUser" runat="server" style="background-color: #FFFFE0" Width="120px">
                                </asp:DropDownList>
                            </td>
					    </tr>
					    <tr>
					        <td align="right">管理名單：</td>
					        <td>
                                <asp:DropDownList ID="ddl_Roster" runat="server" style="OVERFLOW-Y: visible; background-color: #FFFFE0" Width="120px">
                                </asp:DropDownList>
                            </td>
					    </tr>
					    <tr>
					        <td align="right">所屬帳別：</td>
					        <td>
                                <asp:DropDownList ID="ddl_Sort" runat="server" style="OVERFLOW-Y: visible; background-color: #FFFFE0" Width="120px">
                                </asp:DropDownList>
                            </td>
					    </tr>
					    <tr style="display:none">
					        <td align="right">管理單位：</td>
					        <td><asp:TextBox id="txt_csuUnit" runat="server" 
                                    style="OVERFLOW-Y: visible; background-color: #FFFFE0" Width="230px" 
                                    TextMode="MultiLine" Rows="5" Enabled="False"></asp:TextBox><input type="button" id="BtnOpenUnit" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..." onclick="fnCallChoooseDep(previousSibling.id,'D')" disabled="true" /></td>			        
					    </tr>
					    <tr style="display:none">
					        <td align="right">單位審核：</td>
					        <td>
                                <asp:RadioButton ID="rb_UnitPassFlag" runat="server" Text="需經單位審核" />
                            </td>
					    </tr>
					    <tr style="display:none">
					        <td align="right">審核人員：</td>
					        <td><asp:TextBox id="txt_cupCskUser" runat="server" 
                                    style="OVERFLOW-Y: visible" Width="230px" 
                                    TextMode="MultiLine" Rows="5" Enabled="False" AutoPostBack="True"></asp:TextBox><input type="button" id="btnOpenUser" runat="server" style="HEIGHT: 22px; WIDTH: 18px" value="..." onclick="fnCallChoooseDep(previousSibling.id,'U')" disabled="true" /></td>
					    </tr>
					</table>
	                </td>
	            </tr>
	        </table>
	        </td>
	    </tr>
	</table>			
    <!-- ↓歷史資料 -->
	<table cellpadding="0" style="border-collapse: collapse; margin-top: 5" border="1" bordercolor="#666668" bgcolor="#DADEE9">
		<tr>
			<td>
			<table cellpadding="5" style="border-collapse: collapse;width:100%" border="1" bordercolor="#FFFFFF">
				<tr>
					<td>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td><asp:Button id="btn_new" runat="server" Text="新增" Width="50px" Height="22px" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_edit" runat="server" Text="修改" Width="50px" Height="22px" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_delete" runat="server" Text="刪除" Width="50px" Height="22px" CausesValidation="False"></asp:Button></td>
							<td><asp:Button id="btn_update" runat="server" Text="儲存" Width="50px" Height="22px"></asp:Button></td>
							<td><asp:Button id="btn_cancel" runat="server" Text="取消" Width="50px" Height="22px" CausesValidation="False"></asp:Button></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><asp:TextBox id="text_goto" runat="server" style="TEXT-ALIGN: center" Width="95px" AutoPostBack="True" onblur="if(this.value==''){this.value='尋找管理人員'};" onclick='this.value=""'>尋找管理人員</asp:TextBox><input type="button" value="s" name="btn_goto" style="font-family: Webdings; width: 16; height: 22; font-size:8pt"></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<div id="_freezingDiv" class="DIV2_width">
					<asp:DataGrid id="grid_Main" runat="server"
						 	DataKeyField="cskKind"
							CellSpacing="1" CellPadding="3" GridLines="None"
							BorderColor="White" BackColor="White"
							AutoGenerateColumns="False"
							AllowPaging="True" PageSize="5"
							AllowSorting="True"
							Width="100%">
						<HeaderStyle font-size="X-Small" wrap="False" horizontalalign="Center" forecolor="White" backcolor="#003366"></HeaderStyle>
						<ItemStyle font-size="X-Small" backcolor="WhiteSmoke"></ItemStyle>
						<AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
						<SelectedItemStyle font-bold="True" backcolor="DarkOrange"></SelectedItemStyle>
						<Columns>
							<asp:TemplateColumn>
								<ItemStyle horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:CheckBox id="CheckBox1" runat="server" 
                                        CssClass="<%# Container.ItemIndex %>" AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged"></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="種類" SortExpression="cskKind">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="False" horizontalalign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_cskKind" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.cskKindName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.cskKind") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="管理人員" SortExpression="cskUser">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="True" horizontalalign="Center"  ></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_cskUser" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.cskUser") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.cskUser") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="管理名單" SortExpression="crCode">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="True" horizontalalign="Center"  ></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_crCode" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.crName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.crCode") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="帳別" SortExpression="csCode">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="True" horizontalalign="Center"  ></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_csCode" runat="server" text='<%# DataBinder.Eval(Container, "DataItem.csName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csCode") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="是否需單位審核" Visible="false">
								<HeaderStyle wrap="False"></HeaderStyle>
								<ItemStyle font-size="X-Small" font-names="Verdana" wrap="True" HorizontalAlign="Center"></ItemStyle>
								<ItemTemplate>
									<asp:Label id="lab_cskUnitPassFlag" runat="server" text="" ToolTip=""></asp:Label>
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
						<PagerStyle horizontalalign="Center" forecolor="DarkOrange" backcolor="#666668" mode="NumericPages" position="Bottom"></PagerStyle>
					</asp:DataGrid>
					</div>
					</td>
				</tr>
				<tr>
					<td align="right">
					<table cellpadding="0" style="border-collapse: collapse" border="0">
						<tr>
                            <td style="font-size:X-Small" valign="bottom">
                                <asp:Literal ID="li_gridCnt" runat="server"></asp:Literal>
                            </td>
							<td valign="bottom"><font size="2">只列出｜</font></td>
							<td>
								<asp:DropDownList id="ddl_default_month" runat="server" AutoPostBack="True" Visible="False">
									<asp:ListItem Value="">…</asp:ListItem>
									<asp:ListItem Value="1">&nbsp;&nbsp;1月</asp:ListItem>
									<asp:ListItem Value="2">&nbsp;&nbsp;2月</asp:ListItem>
									<asp:ListItem Value="3">&nbsp;&nbsp;3月</asp:ListItem>
									<asp:ListItem Value="4">&nbsp;&nbsp;4月</asp:ListItem>
									<asp:ListItem Value="5">&nbsp;&nbsp;5月</asp:ListItem>
									<asp:ListItem Value="6">&nbsp;&nbsp;6月</asp:ListItem>
									<asp:ListItem Value="7">&nbsp;&nbsp;7月</asp:ListItem>
									<asp:ListItem Value="8">&nbsp;&nbsp;8月</asp:ListItem>
									<asp:ListItem Value="9">&nbsp;&nbsp;9月</asp:ListItem>
									<asp:ListItem Value="10">10月</asp:ListItem>
									<asp:ListItem Value="11">11月</asp:ListItem>
									<asp:ListItem Value="12">12月</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>&nbsp;</td>
                            <td>
                                <asp:DropDownList ID="ddlKind" runat="server" AutoPostBack="True">
                                    <asp:ListItem Value="">...</asp:ListItem>
                                    <asp:ListItem Value="0">零用金</asp:ListItem>
                                    <asp:ListItem Value="1">電子支付</asp:ListItem>
                                    <asp:ListItem Value="2">支付廠商</asp:ListItem>
                                </asp:DropDownList>
                            </td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
<!--歷史資料↑ -->
    </form>
</body>
</html>
