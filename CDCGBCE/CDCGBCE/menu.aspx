<%@ Page Language="VB" Debug="true" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ import Namespace="System.Data.OleDb" %>
<script runat="server">
'author:nickey
'version:v2.0
'date:96.5.18
	Sub Page_Load(Sender As Object, E As EventArgs)
		If Not IsPostBack Then
			BuildTree(DB.sysMenu.DAT.sysMenuDT.GetMenuDT())
		End If
		'TreeView1.ExpandAll() '全部展開
		'TreeView1.CollapseAll() '全部縮合
		'TreeView1.ExpandSinglePath = True '僅展開單一節點
	End Sub

	'依傳入之資料表,建立選單[PK_MnuNo選單編號][ParentPK_MnuNo上一節點][mnuName選單名稱][mnuUrl網址][mnuTarget目標框架][mnuHelp說明]
	Sub BuildTree(ByVal DT as System.Data.DataTable)
        if DT is Nothing Then
           Return
        End if
        If Not DT.Columns.Contains("ParentPK_MnuNo") Then '如未提供上一節點值的欄位,則自動建立
          DT=ToolsFun.DBFun.TableAddPrv(DT,"PK_MnuNo","ParentPK_MnuNo")
        End If
		Dim ds As New System.Data.DataSet()
		ds.Tables.Add(DT)
		ds.Relations.Add("NodeRelation", ds.Tables(0).Columns("PK_MnuNo"), ds.Tables(0).Columns("ParentPK_MnuNo"))

		Dim dbRow As System.Data.DataRow
		For Each dbRow In ds.Tables(0).Rows
			If (dbRow.IsNull("ParentPK_MnuNo")) Then 'root
				Dim newNode As ComponentArt.Web.UI.TreeViewNode
				newNode = CreateNode(dbRow("mnuName").ToString(), true, IIF(dbRow("mnuUrl").ToString() &"" ="", "", dbRow("mnuUrl").ToString() &"?MenuID="& dbRow("PK_MnuNo").ToString()), dbRow("mnuTarget").ToString(), dbRow("mnuHelp").ToString())
				TreeView1.Nodes.Add(newNode)
				PopulateSubTree(dbRow, newNode) '建立newNode的子節點
			End If
		Next dbRow
	End Sub
    '建立子節點
	Sub PopulateSubTree(dbRow As System.Data.DataRow, node As ComponentArt.Web.UI.TreeViewNode)
		Dim childRow As System.Data.DataRow
		For Each childRow In	dbRow.GetChildRows("NodeRelation")
			'Dim childNode As ComponentArt.Web.UI.TreeViewNode = CreateNode(childRow("mnuName").ToString(), True, childRow("mnuUrl").ToString() &"?MenuID="& dbRow("PK_MnuNo").ToString() , childRow("mnuTarget").ToString(), childRow("mnuHelp").ToString())
			Dim childNode As ComponentArt.Web.UI.TreeViewNode = CreateNode(childRow("mnuName").ToString(), False, iif(childRow("mnuUrl").ToString() &""="", "",childRow("mnuUrl").ToString() &"?MenuID="& childRow("PK_MnuNo").ToString()), childRow("mnuTarget").ToString(), childRow("mnuHelp").ToString())
			node.Nodes.Add(childNode)
			PopulateSubTree(childRow, childNode)
		Next childRow
	End Sub
    '建立一個節點
    Function CreateNode(ByVal text As String, ByVal expanded As Boolean, ByVal url As String, ByVal target As String, ByVal tip As String) As ComponentArt.Web.UI.TreeViewNode

        Dim node As New ComponentArt.Web.UI.TreeViewNode()
        node.Text = text

        If node.Text.IndexOf("說明") <> -1 Then
            node.RowCssClass = "FontColorForManual"
        Else
            node.RowCssClass = "DefaultFontColor"
        End If



        node.Expanded = expanded
        node.NavigateUrl = url
        If target = "" Then
            node.Target = "main"
        Else
            node.Target = target
        End If
        node.ToolTip = tip

        Return node
    End Function
</script>
<html>
<head>
<title><%= System.Configuration.ConfigurationSettings.AppSettings("OrgFullName") %></title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="CSSFiles/menu.css" type="text/css" rel="stylesheet" />
<style>
BODY1	{scrollbar-face-color: #D4D0C8; scrollbar-highlight-color: #FFFFFF; scrollbar-shadow-color: #CCCCCC; scrollbar-3dlight-color: #CCCCCC; scrollbar-darkshadow-color: #999999; scrollbar-arrow-color: #464646; scrollbar-track-color: #E6E6E6;}
</style>
<script type="text/javascript">
//<![CDATA[
function TreeView1_onNodeSelect(sender, eventArgs){
	try{
	    //		parent.topFrame.document.all("lit_Title").innerHTML=eventArgs.get_node().get_text();
	    updateSelectedPath();
	}catch(e){;}
}


function updateSelectedPath() {
    var hid_SelectedPath = "";
    var i = 0;
    var s0 = "<b><font color='gold'>";
    var s1 = "</font></b>";
    var curNode = TreeView1.SelectedNode;
    while (curNode != null) {
        //忽略樹根 undefined
        if (curNode != null) {
            if (i == 0) {
                hid_SelectedPath = s0 + curNode.get_text() + s1 + "﹨" + hid_SelectedPath;
                i += 1;
            }
            else
                hid_SelectedPath = curNode.get_text() + "﹨" + hid_SelectedPath;
        }
        curNode = curNode.ParentNode;
    }

//alert(realSize());

    var tmp_selectedPath = hid_SelectedPath;
    tmp_selectedPath = tmp_selectedPath.substr(0, tmp_selectedPath.length - 1);

    var shiftVal;
	if(screen.width >= 628 && screen.width <= 640){
		shiftVal = 15;
	} else if(screen.width >= 788 && screen.width <= 800){
		shiftVal = 20;
	} else if(screen.width >= 1012 && screen.width <= 1024){
		shiftVal = 35;
	} else if(screen.width >= 1268 && screen.width <= 1280){
		shiftVal = 50;
	} else {
		shiftVal = 50;
	}


    if(tmp_selectedPath.length-33 > shiftVal){
		tmp_selectedPath = "..." + jRight(tmp_selectedPath, 33 + shiftVal);
    }

    parent.topFrame.document.all("lit_Title").innerHTML = tmp_selectedPath;
}

function jRight(text, numb){
	var str = text;
	str = str.substring(str.length-numb, str.length);
	return str;
}

//A40917
window.onload=window.onresize=function (){
	var menuWidth = document.documentElement.offsetWidth;
	try{
		top.topFrame.document.all("menuTop").style.width = menuWidth;
		document.all("tab1").width = menuWidth;
	}catch(e){;}
}

//]]>
</script>
<title>menu</title>
<base target="main">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="#808080" style="overflow-x: hidden">
	<form runat="server">
	<table id="tab1" border="0" cellspacing="0" cellpadding="0" width="100%" height="100%" style="border-right: 1px solid #000000; padding-right:1px">
		<tr>
			<td>
			<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" style="border-right: 1px solid #D4D0C8">
				<tr>
					<td valign="top">
					<ComponentArt:TreeView id="TreeView1"
						Width="197"
						DragAndDropEnabled="false"
						NodeEditingEnabled="false"
						KeyboardEnabled="true"
						CssClass="TreeView"
						NodeCssClass="TreeNode"
						SelectedNodeCssClass="SelectedTreeNode"
						HoverNodeCssClass="HoverTreeNode"
						HoverNodeRowCssClass="HoverTreeNodeRow"
						NodeEditCssClass="NodeEdit"
						LineImageWidth="19"
						LineImageHeight="20"
						ItemSpacing="0"
						NodeLabelPadding="0"
						ShowLines="true"
						LineImagesFolderUrl="images/lines/"
						ImagesBaseUrl="images/"
						borderstyle="none"
						EnableViewState="false"
						AutoScroll="false"
						runat="server">
							<ClientEvents>
								<NodeSelect EventHandler="TreeView1_onNodeSelect" />
							</ClientEvents>
					</ComponentArt:TreeView>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	<!-- Insert content here -->
	</form>
</body>
</html>