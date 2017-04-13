<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmPlanOutlay.aspx.vb" Inherits="UI.BasicData.Web.FrmPlanOutlay"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmPlanOutlay</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table border="1" cellpadding="0" style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				bgcolor="#dadee9" bordercolor="#666668" width="600">
				<tr>
					<td>
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="TABLE-LAYOUT: fixed">
										<tr>
											<td vAlign="bottom" align="left">
											</td>
											<td vAlign="bottom" align="left">
											</td>
											<td vAlign="bottom" align="left">
											</td>
											<td vAlign="bottom" align="left">
											</td>
											<td vAlign="bottom" align="left">
											</td>
											<td vAlign="bottom" align="right">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="2" cellspacing="0">
										<tr>
											<td vAlign="bottom" align="right" style="WIDTH: 132px">部門名稱</td>
											<td vAlign="bottom" align="left"><asp:DropDownList id="DDLDep" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right" style="WIDTH: 132px; height: 26px;">計畫名稱</td>
											<td vAlign="bottom" align="left" style="height: 26px"><asp:DropDownList id="DDLPlan" runat="server"></asp:DropDownList></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td vAlign="bottom" align="center" style="WIDTH: 250px"><font size="2">已選科目</font></td>
											<td vAlign="bottom" align="left" style="WIDTH: 100px"></td>
											<td vAlign="bottom" align="center" style="WIDTH: 250px"><font size="2">可選科目</font></td>
										</tr>
										<tr>
											<td vAlign="bottom" align="left"><FONT face="新細明體">
													<asp:listbox id="LBSelect" runat="server" Height="250px" Width="100%" SelectionMode="Multiple"></asp:listbox></FONT></td>
											<td vAlign="middle" align="center">
												<asp:button id="BtnSelectAll" runat="server" Width="50px" Height="22px" Text="<<" ToolTip="加入全部項目"></asp:button><br>
												<asp:button id="BtnSelect" runat="server" Width="50px" Height="22px" Text="<" ToolTip="加入選擇項目"></asp:button><br>
												<asp:button id="BtnRemove" runat="server" Width="50px" Height="22px" Text=">" ToolTip="移除選擇項目"></asp:button><br>
												<asp:button id="BtnRemoveall" runat="server" Width="50px" Height="22px" Text=">>" ToolTip="移除全部項目"></asp:button>
											</td>
											<td vAlign="bottom" align="left"><FONT face="新細明體">
													<asp:listbox id="LBUnSelect" runat="server" Height="250px" Width="100%" SelectionMode="Multiple"></asp:listbox></FONT></td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right">
												<INPUT id="BtnSelectedDown" onclick="Mark(LBSelect);" type="button" value="選下層" runat="server">
												<INPUT id="BtnSelectedUp" onclick="Mark(LBSelect,true);" type="button" value="選上層" runat="server"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left">
												<INPUT id="BtnUnSelectUp" onclick="Mark(LBUnSelect,true);" type="button" value="選上層" runat="server">
												<INPUT id="BtnUnSelectDown" onclick="Mark(LBUnSelect);" type="button" value="選下層" runat="server">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1" cellpadding="5" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td vAlign="bottom" align="left">
									<table border="0" cellpadding="1">
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
								<td>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
