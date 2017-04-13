<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmAccCode1.aspx.vb" Inherits="UI.BasicData.Web.FrmAccCode1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <META http-equiv="Pragma" content="No-cache">
		<script language="javascript">
		<!--

		function fnCallSearchDialog(){

		var strReturnVal=showModalDialog("FrmSortPlanDep.aspx?showtype=2",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel" )
			{

				Form1.TBFindSql.value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}


		function Mark(setObj,PrvFlag)
		{try{
			var Val="";
			if(typeof(setObj)=="string") setObj=document.all[setObj];
				if(setObj.selectedIndex>=0)
					Val=setObj.options[setObj.selectedIndex].value;
						for(var i=0;i<setObj.options.length;i++)
							 if(PrvFlag)
								{if(Val.indexOf(setObj.options[i].value)==0)
										setObj.options[i].selected=true;
										}
										else
										if(setObj.options[i].value.indexOf(Val)==0)
											setObj.options[i].selected=true;  
									}catch(e){;}      
									}

	
		function go_left_top(){
			gift.style.left=document.body.scrollLeft;
			gift.style.top=document.body.scrollTop;}
		//-->

		</script>
</head>
<body>
    <form id="form1" runat="server">
<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668"
				cellPadding="0" width="600" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="right"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="2" width="100%" border="0">
										<tr>
											<td style="WIDTH: 132px" vAlign="bottom" align="right">部門名稱</td>
											<td vAlign="bottom" align="left"><asp:dropdownlist id="DDLDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="WIDTH: 132px" vAlign="bottom" align="right">計畫名稱</td>
											<td vAlign="bottom" align="left"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="530px"></asp:dropdownlist></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td style="WIDTH: 275px" vAlign="bottom" align="center"><font size="2">已選科目</font></td>
											<td style="WIDTH: 50px" vAlign="bottom" align="left"></td>
											<td style="WIDTH: 275px" vAlign="bottom" align="center"><font size="2">可選科目</font></td>
										</tr>
										<tr>
											<td vAlign="top" align="left">
												<div style="MARGIN-TOP: 0px; OVERFLOW-Y: scroll; MARGIN-LEFT: 10px; WIDTH: 275px; HEIGHT: 300px"><asp:datagrid id="DGSelect" runat="server" ForeColor="Black" GridLines="None" CellPadding="2"
														BackColor="LightGoldenrodYellow" BorderWidth="1px" BorderColor="Tan" Width="250px" AutoGenerateColumns="False">
														<FooterStyle BackColor="Tan"></FooterStyle>
														<SelectedItemStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedItemStyle>
														<AlternatingItemStyle Font-Size="X-Small" BackColor="PaleGoldenrod"></AlternatingItemStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Font-Bold="True" BackColor="Tan"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle Width="25px"></HeaderStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBSelect" runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="oulOutlayName" SortExpression="oulOutlayName" HeaderText="用途別科目"></asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="accOutlayCode" SortExpression="accOutlayCode" HeaderText="用途別代碼"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="停用">
																<HeaderStyle Width="30px"></HeaderStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBStop" runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn Visible="False" DataField="accCreateDate" SortExpression="accCreateDate" HeaderText="建立日期"></asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="accStopDate" SortExpression="accStopDate" HeaderText="停用日期"></asp:BoundColumn>
														</Columns>
														<PagerStyle HorizontalAlign="Center" ForeColor="DarkSlateBlue" BackColor="PaleGoldenrod" PageButtonCount="5"></PagerStyle>
													</asp:datagrid></div>
											</td>
											<td vAlign="middle" align="center"><asp:button id="BtnSelectAll" runat="server" Height="22px" Text="<<" ToolTip="加入全部項目" Width="50px"></asp:button><br>
												<br>
												<asp:button id="BtnSelect" runat="server" Height="22px" Text="<" ToolTip="加入選擇項目" Width="50px"></asp:button><br>
												<br>
												<asp:button id="BtnRemove" runat="server" Height="22px" Text=">" ToolTip="移除選擇項目" Width="50px"></asp:button><br>
												<br>
												<asp:button id="BtnRemoveall" runat="server" Height="22px" Text=">>" ToolTip="移除全部項目" Width="50px"></asp:button></td>
											<td vAlign="top" align="left">
												<div style="MARGIN-TOP: 0px; OVERFLOW-Y: scroll; MARGIN-LEFT: 10px; WIDTH: 275px; HEIGHT: 300px"><asp:datagrid id="DGUnSelect" runat="server" GridLines="Horizontal" CellPadding="3" BackColor="White"
														BorderWidth="1px" BorderColor="#E7E7FF" Width="250px" BorderStyle="None" AutoGenerateColumns="False">
														<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
														<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
														<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
														<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle Width="25px"></HeaderStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBUnSelect" runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="oulOutlayName" SortExpression="oulOutlayName" HeaderText="用途別科目">
																<HeaderStyle Font-Size="X-Small"></HeaderStyle>
																<ItemStyle Font-Size="X-Small"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="oulOutlayCode" SortExpression="oulOutlayCode" HeaderText="用途別代碼"></asp:BoundColumn>
														</Columns>
														<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
													</asp:datagrid></div>
											</td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right"><INPUT id="BtnSelectedDown" onclick="Mark(LBSelect);" type="button" value="選下層" name="BtnSelectedDown"
													runat="server"> <INPUT id="BtnSelectedUp" onclick="Mark(LBSelect,true);" type="button" value="選上層" name="BtnSelectedUp"
													runat="server"></td>
											<td vAlign="bottom" align="left"><FONT face="新細明體"></FONT></td>
											<td vAlign="bottom" align="left"><INPUT id="BtnUnSelectUp" onclick="Mark(LBUnSelect,true);" type="button" value="選上層" name="BtnUnSelectUp"
													runat="server"> <INPUT id="BtnUnSelectDown" onclick="Mark(LBUnSelect);" type="button" value="選下層" name="BtnUnSelectDown"
													runat="server">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" width="100%"
							border="1">
							<tr>
								<td vAlign="bottom" align="left">
									<table cellPadding="1" border="0">
										<tr>
											<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Height="22" Text="新增"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Height="22" Text="修改"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Height="22" Text="刪除"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="儲存"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Height="22" Text="取消"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Height="22" Text="查詢"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Height="22" Text="列印"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Height="22" Text="離開"></asp:button></td>
											<td vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
													runat="server"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="dptName" SortExpression="dptName" HeaderText="單位名稱">
												<HeaderStyle Width="200px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="plnPlanName" SortExpression="plnPlanName" HeaderText="計畫名稱"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="accDepCode" SortExpression="accTeaCode" HeaderText="部門代碼">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="accCodeVer" SortExpression="accCodeVer" HeaderText="科目年度別"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="accPlanCode" SortExpression="accPlanCode" HeaderText="計畫代碼">
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>    </form>
</body>
</html>
