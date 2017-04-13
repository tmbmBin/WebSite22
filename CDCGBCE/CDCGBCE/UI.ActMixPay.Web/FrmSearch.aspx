<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearch.aspx.vb" Inherits="UI.ActMixPay.Web.FrmSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script language="javascript" type="text/javascript">
// <![CDATA[

function BtnOK_onclick() {

}

function BtnOK_onclick() {

}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <table cellpadding="5" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" bgcolor="#dadee9" width="550">
				<tr>
					<td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
										<tr>
											<td align="right" width="80"><FONT face="新細明體">門別</FONT></td>
											<td align="left">
												<asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList></td>
											<td align="right" width="80"><FONT face="新細明體">預算來源</FONT></td>
											<td align="left" width="150"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList></FONT></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">經費單位</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLBgtDep" runat="server" AutoPostBack="True"></asp:DropDownList></FONT></td>
											<td align="right" width="80"><FONT face="新細明體">承辦單位</FONT></td>
											<td align="left" width="150">
												<asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">承辦業務</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLWorkUnit" runat="server"></asp:DropDownList></FONT></td>
											<td align="right" width="80">
												簽證月份</td>
											<td align="left" width="150"><FONT face="新細明體">
													<asp:dropdownlist id="DDLMonth" runat="server" AutoPostBack="True" Width="50px">
														<asp:ListItem Value="">......</asp:ListItem>
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
													</asp:dropdownlist></FONT></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">計畫</FONT></td>
											<td align="left" colspan="3">
												<asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">用途別</FONT></td>
											<td align="left" colspan="2">
												<asp:DropDownList id="DDLOul" runat="server" Width="270px"></asp:DropDownList></td>
											<td align="left" width="150">
												<font face="新細明體">
                                                    </font></td>
										</tr>
										<tr>
											<td align="right" width="80"><FONT face="新細明體">付款方式</FONT></td>
											<td align="left"><FONT face="新細明體">
													<asp:DropDownList id="DDLPayKind" runat="server">
														<asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="0">實付款</asp:ListItem>
														<asp:ListItem Value="1">暫付款</asp:ListItem>
													</asp:DropDownList></FONT></td>
											<td align="right" width="80">承辦人員</td>
											<td align="left" width="150">
												<asp:TextBox id="TBStaff" runat="server" Width="116px"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="80">主檔事由</td>
											<td align="left">
												<asp:TextBox id="TBMemo" runat="server" Width="150px"></asp:TextBox></td>
											<td align="right" width="80">主檔金額</td>
											<td align="left" width="150"><asp:TextBox id="TBMoney" runat="server" Width="116px" onFocus="this.select();" onkeypress="return check_Num();"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" width="80">用途說明</td>
											<td align="left">
												<asp:TextBox id="TBAcvMemo" runat="server" Width="150px"></asp:TextBox></td>
											<td align="right" width="80">
                                                用途金額</td>
											<td align="left" width="150">
												<asp:TextBox id="TBacvMoney" runat="server" Width="116px" onFocus="this.select();" onkeypress="return check_Num();"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" width="80">動支編號</td>
											<td >
                                                <asp:TextBox ID="TBAcmWordNum" runat="server" Width="120px"></asp:TextBox></td>
											<td  align="right" width="80">結案狀態</td>
											<td>
											    <asp:dropdownlist id="DDLFinalKind" runat="server" AutoPostBack="False" Width="100px">
														<asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="0">未結案</asp:ListItem>
														<asp:ListItem Value="1">已結案</asp:ListItem>														
											    </asp:dropdownlist>
										    </td>
										</tr>
										<tr style="display:none">
											<td align="right" width="80" style="display:none">簽文資料</td>
											<td  >
												<font face="新細明體">
                                                    <asp:DropDownList ID="DDLLevelKind" runat="server">
                                                    <asp:ListItem Value="">......</asp:ListItem>
														<asp:ListItem Value="1">簽文資料</asp:ListItem>
														<asp:ListItem Value="0">非簽文資料</asp:ListItem>
                                                    </asp:DropDownList></font></td>
											<td  align="right" width="80">&nbsp;</td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
                                    <input id="BtnOK" runat="server" name="BtnOK" 
                                        onclick="fnGetInfo();window.close();" style="WIDTH: 60px; HEIGHT: 22px" 
                                        type="button" value="確認" width="60px" onclick="return BtnOK_onclick()" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
