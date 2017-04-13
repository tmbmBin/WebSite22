<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPlanAccToAct.aspx.vb" Inherits="UI.BasicData.Web.FrmPlanAccToAct" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <base target="_self" />
    <link href="../CSSFiles/planRelation.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">

        function tv_Plan_onNodeSelect(sender, eventArgs)
        {
	        checkAllChildNodes(eventArgs.get_node());
        }

        function checkAllChildNodes(node)
        {
	        document.all('text_infoStream').value = node.get_text().replace(node.get_toolTip().split(":")[1]+' ','') + ";" + node.get_toolTip().replace("｜","|");	//5K1.52 購置無形資產;97:5K1|52
        }

        //ClientSideOnNodeSelect="nodeSelect"
        function nodeSelect(node)
        {
	        //97:5K1｜52 = 5K1.52 購置無形資產
	        document.all("hid_SelectedItem").value = node.GetProperty("ToolTip") + "‖" + node.GetProperty("Text");
	        updateSelectedPath();
        }

        function updateSelectedPath()
        {
	        document.all("hid_SelectedPath").value = "";
	        var curNode = tv_Plan.SelectedNode;
	        while (curNode != null){
		        //忽略樹根 undefined
		        if(curNode.GetProperty("ToolTip") != undefined){
			        //document.all("hid_SelectedPath").value = curNode.GetProperty("ToolTip") + "｜" + curNode.GetProperty("Text") + "∖" + document.all("hid_SelectedPath").value;
			        document.all("hid_SelectedPath").value = curNode.GetProperty("Text") + "∖" + document.all("hid_SelectedPath").value;
		        }
		        curNode = curNode.ParentNode;
	        }
	        var tmp_selectedPath = document.all("hid_SelectedPath").value;
	        document.all("hid_SelectedPath").value = tmp_selectedPath.substr(0,tmp_selectedPath.length-1);
        }

</script>
    
</head>
<body>
    <form id="form1" runat="server">
					<ComponentArt:TreeView id="tv_Plan" runat="server" Height="365" Width="100%" style="margin-bottom: -2"
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
						ParentNodeImageUrl="images/planRelation/folders.gif"
						LeafNodeImageUrl="images/planRelation/folder.gif"
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
    </form>
</body>
</html>
