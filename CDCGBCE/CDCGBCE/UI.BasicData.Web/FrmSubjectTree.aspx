<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSubjectTree.aspx.vb" Inherits="UI.BasicData.Web.FrmSubjectTree" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="No-cache">
		<script language="javascript" type="text/javascript">


		function UCCDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBCreateDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}

		function UCSDate_Change(calendar){
			var lbl_acmTrlStaySDate = document.getElementById("TBStopDate");
			var vDay = new Date(calendar.GetSelectedDate());
			lbl_acmTrlStaySDate.value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
		}


		</script>

</head>
<body>
    <form id="form1" runat="server">
<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5"
				width="600" bgcolor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						valign="top" align="left">
						<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
									<table border="0" cellpadding="2" cellspacing="0" width="100%">
										<tr>
											<td align="right" style="width: 90px">科目年度：</td>
											<td width="120"><asp:DropDownList ID="DDLOulYear" runat="server"></asp:DropDownList></td>
											<td align="right" style="width: 90px">科目代碼：</td>
											<td>
                                                <asp:TextBox ID="TBSubjectCode" runat="server" MaxLength="1" Width="60px"></asp:TextBox></td>
										</tr>
										<tr>
											<td align="right" style="width: 90px"></td>
											<td width="120"></td>
											<td align="right" style="width: 90px">
                                                科目名稱：</td>
											<td><asp:textbox id="TBSubjectName" runat="server" MaxLength="1" Width="60px"></asp:textbox></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
								<ComponentArt:TreeView id="TVSubject" runat="server" Height="365" Width="100%" style="margin-bottom: -2"
						            AutoPostBackOnSelect="false"
						            DragAndDropEnabled="false"
						            DragAndDropAcrossTreesEnabled="false"
						            NodeEditingEnabled="false"
						            KeyboardEnabled="false"
						            CssClass="TreeView"
						            NodeCssClass="TreeNode"
						            SelectedNodeCssClass="SelectedTreeNode"
						            HoverNodeCssClass="HoverTreeNode"
						            NodeEditCssClass="NodeEdit"
						            LineImageWidth="19"
						            LineImageHeight="20"
						            DefaultImageWidth="16"
						            DefaultImageHeight="16"
						            NodeLabelPadding="3"
						            ParentNodeImageUrl="../images/planRelation/folders.gif"
						            LeafNodeImageUrl="../images/planRelation/folder.gif"
						            ShowLines="true"
						            LineImagesFolderUrl="images/planRelation/lines/"
						            EnableViewState="true"
						            ExpandNodeOnSelect="False"
						            CollapseNodeOnSelect="False"
						            BackColor="#EEEEEE" BorderColor="#D4D0C8"
						            ClientSideOnNodeSelect="nodeSelect" >
						            <ClientTemplates>
							            <ComponentArt:ClientTemplate Id="InfoItemsTemplate">
								            <Template>
									            ## DataItem.GetProperty('Text') ##<font color="red">
									            [## DataItem.GetProperty('Info') ##]</font>
								            </Template>
							            </ComponentArt:ClientTemplate>
						            </ClientTemplates>
						            <ClientEvents>
							            <NodeSelect EventHandler="tv_Plan_onNodeSelect" />
						            </ClientEvents>
					            </ComponentArt:TreeView>
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
</html>
