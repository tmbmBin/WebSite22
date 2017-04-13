<%@ Page Language="VB" Debug="true" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="System.Data" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<!-- #include file="Default.bas" -->
<script runat="server">

	'Dim connectionString As String = "server='(local)'; user id='sa'; password='sqlsa'; database='AccWeb'"
	Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")
	Dim dbCon As New System.Data.SqlClient.SqlConnection(connectionString)

	'計畫
	Sub buildPlanTree(planYear As Integer, Optional LockFor As String = "")
		If dbCon.State.Closed Then dbCon.Open()

		Dim selectStr As String = "" & _
			"SELECT " & _
				"_plnPlanCode AS _計畫代碼, " & _
				"codCodeVer AS 科目年度別, " & _
				"plnPlanCode AS 計畫代碼, " & _
				"plnPlanName AS 計畫名稱, " & _
				"plnLevel AS 級別, " & _
				"ImageUrl, " & _
				"CAST(ISNULL(codCodeVer, '') AS varchar) + ':' + plnPlanCode AS uKey, " & _
				"0 AS uNum " & _
			"FROM ("

		Dim uStr As String = "" & _
				"SELECT " & _
					"CAST(NULL AS varchar) AS _plnPlanCode, " & _
					"CAST(" & planYear & " AS smallint) AS codCodeVer, " & _
					"CAST('0' AS varchar) AS plnPlanCode, " & _
					"CAST('明細科目' AS varchar) AS plnPlanName, " & _
					"CAST(0 AS smallint) AS plnLevel, " & _
					"NULL AS plnCodeSide, " & _
					"NULL AS plnAccKind, " & _
					"NULL AS plnCodeKind, " & _
					"NULL AS plnAbateKind, " & _
					"NULL AS plnCodeType, " & _
					"NULL AS plnCodeFinal, " & _
					"NULL AS plnCheckNo, " & _
					"NULL AS plnAliasNo, " & _
					"NULL AS plnAliasName, " & _
					"NULL AS plnCreateDate, " & _
					"NULL AS plnStopFlag, " & _
					"NULL AS plnStopDate, " & _
					"'images/planRelation/root.gif' AS ImageUrl " & _
				"UNION "

		Dim uStr1 As String = "" & _
				"SELECT " & _
					"CAST(NULL AS varchar) AS _plnPlanCode, " & _
					"CAST(" & planYear & " AS smallint) AS codCodeVer, " & _
					"CAST('0' AS varchar) AS plnPlanCode, " & _
					"CAST('明細科目' AS varchar) AS plnPlanName, " & _
					"CAST(0 AS smallint) AS plnLevel, " & _
					"'images/planRelation/root.gif' AS ImageUrl " & _
				"UNION "

		Dim queStr As String = "" & _
				"SELECT DISTINCT " & _
					"ISNULL((SELECT TOP 1 A2.plnPlanCode " & _
							"FROM codPlanCode C2 " & _
								"INNER JOIN codPlanCode A2 ON " & _
									"A2.plnPlanCode = C2.plnPlanCode AND " & _
									"(C2.codCodeVer = " & planYear & ") " & _
								"WHERE (C2.codCodeVer = " & planYear & ") AND " & _
									  "A.plnPlanCode LIKE A2.plnPlanCode + '_%' " & _
								"ORDER BY  A2.plnPlanCode DESC), '0') AS _plnPlanCode, " & _
					"A.*, 'images/planRelation/folders.gif' AS ImageUrl " & _
				"FROM codPlanCode C " & _
					"INNER JOIN codPlanCode A ON " & _
						"A.plnPlanCode = C.plnPlanCode AND " & _
						"(A.codCodeVer = " & planYear & ") " & _
				"WHERE (C.codCodeVer = " & planYear & ")"

		Dim queStr1 As String = "" & _
				"SELECT " & _
					"ISNULL(MAX(B.plnPlanCode), NULL) AS _plnPlanCode, " & _
					"A.codCodeVer, " & _
					"A.plnPlanCode, " & _
					"A.plnPlanName, " & _
					"A.plnLevel, " & _
					"'images/planRelation/folders.gif' AS ImageUrl " & _
				"FROM codPlanCode A " & _
					"LEFT OUTER JOIN codPlanCode B ON " & _
						"A.codCodeVer = B.codCodeVer AND " & _
						"A.plnPlanCode LIKE B.plnPlanCode + '_%' " & _
				"WHERE (A.codCodeVer = " & planYear & ") " & _
				"GROUP BY  A.codCodeVer, A.plnPlanCode, A.plnPlanName, A.plnLevel"

		Dim orderbyStr As String = ") D ORDER BY  計畫代碼, _計畫代碼"
'Response.Write(selectStr & uStr & queStr & orderbyStr)
'Response.Write(selectStr & uStr1 & queStr1 & orderbyStr)	'←速度較快
'Response.End
		Dim adapter As System.Data.SqlClient.SqlDataAdapter
			'adapter = New System.Data.SqlClient.SqlDataAdapter(selectStr & uStr & queStr & orderbyStr, dbCon)
			'速度較快↓
'			adapter = New System.Data.SqlClient.SqlDataAdapter(selectStr & queStr1 & orderbyStr, dbCon)
			'方法三↓
			selectStr = "SELECT codCodeVer AS 科目年度別, plnPlanCode AS 計畫代碼, plnPlanName AS 計畫名稱, " & _
							"plnLevel AS 級別, 'images/planRelation/folders.gif' AS ImageUrl, " & _
							"CAST(ISNULL(codCodeVer, '') AS varchar) + ':' + plnPlanCode AS uKey, 0 AS uNum " & _
						"FROM codPlanCode A " & _
						"WHERE (codCodeVer = " & planYear & ")" & _
						" AND (LEFT(A.plnPlanCode, 1) IN ('1', '2', '3', '4', '5')) "	'970922


			selectStr = "SELECT *, " & _
								"'images/planRelation/folders.gif' AS ImageUrl, " & _
								"0 AS uNum " & _
						"FROM" & _
							"(" & _
								"SELECT DISTINCT " & _
										"A.codCodeVer AS 科目年度別, " & _
										"plnPlanCode + (CASE WHEN ISNULL(C.oulOutlayCode, '') = '' THEN '' ELSE '.' + ISNULL(C.oulOutlayCode, '') END) AS 計畫代碼, " & _
										"ISNULL(C.oulOutlayName, plnPlanName) AS 計畫名稱, " & _
										"A.plnLevel + ISNULL(C.oulLevel, 0) AS 級別, " & _
										"LTRIM(A.codCodeVer) + ':' + plnPlanCode + (CASE WHEN ISNULL(C.oulOutlayCode, '') = '' THEN '' ELSE '｜' + ISNULL(C.oulOutlayCode, '') END) AS uKey " & _
								"FROM codPlanCode A " & _
									"JOIN codOutlayCode C ON A.codCodeVer = C.codCodeVer " & _
										"AND LEFT(C.oulOutlayCode, 1) <= (CASE WHEN A.plnPlanCode LIKE '50_%' THEN '7' WHEN A.plnPlanCode LIKE '5K%' THEN '5' ELSE '0' END) " & _
										"AND LEFT(C.oulOutlayCode, 1) >= (CASE WHEN A.plnPlanCode LIKE '50_%' THEN '7' WHEN A.plnPlanCode LIKE '5K%' THEN '1' ELSE '0' END) " & _
								"WHERE (A.codCodeVer = " & planYear & ") " & _
									"AND (plnplancode LIKE '" & LockFor & "%') " & _
								"UNION " & _
								"SELECT " & _
									"D.codCodeVer, " & _
									"D.plnPlanCode AS plnPlanCode, " & _
									"D.plnPlanName, " & _
									"D.plnLevel, " & _
									"(LTrim(D.codCodeVer) + ':' + D.plnPlanCode) AS uKey " & _
								"FROM codPlanCode D " & _
								"WHERE (D.codCodeVer = " & planYear & ") " & _
									"AND ('" & LockFor & "' LIKE plnplancode + '%' OR plnplancode LIKE '" & LockFor & "%')" & _
							") DS " & _
						"WHERE (LEFT(計畫代碼, 1) IN ('1', '2', '3', '4', '5')) " & _
						"ORDER BY  uKey"
' AND (LEN(plnPlanCode) = 4)

			adapter = New System.Data.SqlClient.SqlDataAdapter(selectStr, dbCon)
'Response.Write(selectStr)

		Dim ds As New System.Data.DataSet()
		adapter.Fill(ds)

			'方法三↓呼叫函數補上層
			TableAddPrv(ds.Tables(0), "計畫代碼", "_計畫代碼")

		ds.Relations.Add("NodeRelation", ds.Tables(0).Columns("計畫代碼"), ds.Tables(0).Columns("_計畫代碼"))

		Dim dbRow As System.Data.DataRow
		For Each dbRow In ds.Tables(0).Rows
			If(dbRow.IsNull("_計畫代碼")) Then
				Dim newNode As ComponentArt.Web.UI.TreeViewNode
				If dbRow("計畫代碼").ToString() = "0" Then
					newNode = CreateNode(dbRow("計畫名稱").ToString(), "", dbRow("ImageUrl").ToString(), true)
				Else
					newNode = CreateNode(dbRow("計畫代碼").ToString() & " " & dbRow("計畫名稱").ToString(), dbRow("uKey").ToString(), dbRow("ImageUrl").ToString(), true)
				End If
				tv_Plan.Nodes.Add(newNode)

				PopulateSubPlanTree(dbRow, newNode)
			End If
		Next dbRow
	End Sub

	'子計畫
	Sub PopulateSubPlanTree(dbRow As System.Data.DataRow, node As ComponentArt.Web.UI.TreeViewNode)
		Dim childRow As System.Data.DataRow
		For Each childRow In dbRow.GetChildRows("NodeRelation")
			Dim childNode As ComponentArt.Web.UI.TreeViewNode
			If Val(childRow("uNum")) > 0 Then
				childNode = CreateNode(childRow("計畫代碼").ToString() & " " & childRow("計畫名稱").ToString() & "|" & childRow("uNum"), childRow("uKey").ToString(), childRow("ImageUrl").ToString(), True)
			Else
				childNode = CreateNode(childRow("計畫代碼").ToString() & " " & childRow("計畫名稱").ToString(), childRow("uKey").ToString(), childRow("ImageUrl").ToString(), True)
			End If

			node.Nodes.Add(childNode)

			PopulateSubPlanTree(childRow, childNode)
		Next childRow
	End Sub

	'建立節點
	Function CreateNode(text As String, uKey As String, imageurl As String , expanded As Boolean, Optional showCB As Boolean = False, Optional checkCB As Boolean = False) As ComponentArt.Web.UI.TreeViewNode
		Dim node As New ComponentArt.Web.UI.TreeViewNode()

		If Split(text & "|", "|")(1) <> "" Then
			node.Text = Split(text & "|", "|")(0)
			node.Attributes.Add("Info", Split(text & "|", "|")(1))
			node.ClientTemplateId = "InfoItemsTemplate"
		Else
			node.Text = text
		End If
			'node.CssClass = Split(node.Text, " ")(1)
			node.ToolTip = uKey
			'node.ImageUrl = imageurl
			node.Expanded = expanded
			node.id = Split(uKey,":")(1)

		If text <> "計畫科目" And text <> "用途別科目" And showCB = True Then
			node.ShowCheckBox = True
			node.Checked = checkCB
			If checkCB = True Then
				node.Attributes.Add("Color", "Red")
			Else
				node.Attributes.Add("Color", "#000000")
			End If
			node.ClientTemplateId = "CheckedItemsTemplate"
		End If

		Return node
	End Function

	Function get_codPlanCodeVer() As System.Data.DataSet
		Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

		Dim queryString As String = "SELECT DISTINCT [codCodeVer] FROM [codPlanCode] ORDER BY 1"
		Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
		dbCommand.CommandText = queryString
		dbCommand.Connection = dbConnection

		Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
		dataAdapter.SelectCommand = dbCommand
		Dim dataSet As System.Data.DataSet = New System.Data.DataSet
		dataAdapter.Fill(dataSet)

		Return dataSet
	End Function

	Sub ddl_codeVer_SelectedIndexChanged(sender As Object, e As EventArgs)
			tv_Plan.Nodes.Clear
			hid_SelectedItem.Text = ""
			hid_SelectedPath.Text = ""
			text_infoStream.Text = ""

			buildPlanTree()
	End Sub

	Sub buildPlanTree()
		Try
			Try
				If PlanType = "AB" Then
					buildPlanTreeAB(ddl_codeVer.SelectedValue, LockFor)
				Else
					buildPlanTree(ddl_codeVer.SelectedValue, LockFor)
				End If
			Catch
				If PlanType = "AB" Then
					buildPlanTreeAB(ddl_codeVer.SelectedValue, LockFor)
				Else
					buildPlanTree(Session("default_Year"), LockFor)
				End If
			End Try

			If ExpandAll = "1" Then
				tv_Plan.ExpandAll()
			Else	'選單不先展開
				tv_Plan.CollapseAll()
			End If
		Catch
		Finally
			If dbCon.State.Open Then dbCon.Close()
		End Try
	End Sub

	Dim LockFor, ExpandAll, PlanType As String

	Sub Page_Load(Sender As Object, E As EventArgs)
'		If Session("default_UserName") Is Nothing Then Response.Redirect("../Default.aspx")

'		If Session("default_Year") = Nothing Then Session("default_Year") = System.DateTime.Now.Year - 1911

		If Request.QueryString("lock") <> Nothing Then LockFor = Trim(Request.QueryString("lock"))
		If Request.QueryString("exp") <> Nothing AndAlso Request.QueryString("exp") = "1" Then ExpandAll = "1"

		If Request.QueryString("type") <> Nothing AndAlso Request.QueryString("type") = "AB" Then PlanType = "AB"

		If Not Page.IsPostBack Then
			ddl_codeVer.DataSource = get_codPlanCodeVer()
			ddl_codeVer.DataBind()
			If ddl_codeVer.Items.Count > 0 Then
				Try
					Try
						ddl_codeVer.SelectedValue = Session("default_Year")
					Catch
					End Try

					buildPlanTree()
				Catch
				End Try
			End If

			'980422
			If Request.QueryString("code") <> Nothing AndAlso Len(Trim(Request.QueryString("code"))) > 0 Then
				Dim tmp_findCode As String = Trim(Request.QueryString("code"))
				If tmp_findCode.IndexOf(":") <> -1 Then
					text_findCode.Text = Split(tmp_findCode, ":")(1)
				Else
					text_findCode.Text = tmp_findCode
				End If
			Else
				text_findCode.Text = ""
			End If

		End If

'		AddHandler tv_Plan.NodeSelected, AddressOf tv_Plan_NodeSelected
	End Sub

	'980422
	Sub Page_PreRenderComplete(Sender As Object, E As EventArgs)
		If text_findCode.Text <> "" Then
			'附加 Script 至頁尾
			If (Not Me.IsStartupScriptRegistered("AutoFind")) Then
				Dim scriptString As String = "<script language='JavaScript'>FindNodeBy();<"
					scriptString &= "/"
					scriptString &= "script>"
				Me.RegisterStartupScript("AutoFind", scriptString)
			End If
		End If
	End Sub


	'點選計畫時
	Sub tv_Plan_NodeSelected(sender As object, e As ComponentArt.Web.UI.TreeViewNodeEventArgs)
		Dim tmpYear As Integer
			tmpYear = Val(Split(e.Node.ToolTip & ":", ":")(0))
		Dim tmpCode As String
			tmpCode = Trim(Split(e.Node.ToolTip & ":", ":")(1))

		'tv_Outlay.UnCheckAll()
'		tv_Outlay.Nodes.Clear()
'		buildOutlayTree(tmpYear, tmpCode)
		If dbCon.State.Open Then dbCon.Close()
	End Sub

	Sub btn_find_Click(sender As Object, e As EventArgs)
'		text_findCode.Text = Trim(text_findCode.Text)
'		text_findName.Text = Trim(text_findName.Text)
'		text_infoStream.Text = ""

'		If Len(text_findCode.Text) > 0 Or Len(text_findName.Text) > 0 Then

'		End If
	End Sub

	'財產
	Sub buildPlanTreeAB(planYear As Integer, Optional LockFor As String = "")
		If dbCon.State.Closed Then dbCon.Open()

		Dim selectStr As String

			selectStr = "SELECT *, " & _
								"'images/planRelation/folders.gif' AS ImageUrl, " & _
								"0 AS uNum " & _
						"FROM" & _
							"(" & _
								"SELECT DISTINCT " & _
										"A.codCodeVer AS 科目年度別, " & _
										"plnPlanCode + (CASE WHEN ISNULL(C.oulOutlayCode, '') = '' THEN '' ELSE '.' + ISNULL(C.oulOutlayCode, '') END) AS 計畫代碼, " & _
										"ISNULL(C.oulOutlayName, plnPlanName) AS 計畫名稱, " & _
										"A.plnLevel + ISNULL(C.oulLevel, 0) AS 級別, " & _
										"LTRIM(A.codCodeVer) + ':' + plnPlanCode + (CASE WHEN ISNULL(C.oulOutlayCode, '') = '' THEN '' ELSE '｜' + ISNULL(C.oulOutlayCode, '') END) AS uKey " & _
								"FROM codPlanCode A " & _
									"JOIN codOutlayCode C ON A.codCodeVer = C.codCodeVer " & _
										"AND LEFT(C.oulOutlayCode, 1) <= (CASE WHEN A.plnPlanCode LIKE '50_%' THEN '7' WHEN A.plnPlanCode LIKE '5K%' THEN '5' ELSE '0' END) " & _
										"AND LEFT(C.oulOutlayCode, 1) >= (CASE WHEN A.plnPlanCode LIKE '50_%' THEN '7' WHEN A.plnPlanCode LIKE '5K%' THEN '1' ELSE '0' END) " & _
								"WHERE (A.codCodeVer = " & planYear & ") " & _
									"AND (plnplancode LIKE '" & LockFor & "%') " & _
								"UNION " & _
								"SELECT " & _
									"D.codCodeVer, " & _
									"D.plnPlanCode AS plnPlanCode, " & _
									"D.plnPlanName, " & _
									"D.plnLevel, " & _
									"(LTrim(D.codCodeVer) + ':' + D.plnPlanCode) AS uKey " & _
								"FROM codPlanCode D " & _
								"WHERE (D.codCodeVer = " & planYear & ") " & _
									"AND ('" & LockFor & "' LIKE plnplancode + '%' OR plnplancode LIKE '" & LockFor & "%')" & _
							") DS " & _
						"WHERE (LEFT(計畫代碼, 1) IN ('A', 'B')) " & _
						"ORDER BY  uKey"

		Dim adapter As System.Data.SqlClient.SqlDataAdapter
			adapter = New System.Data.SqlClient.SqlDataAdapter(selectStr, dbCon)
'Response.Write(selectStr)

		Dim ds As New System.Data.DataSet()
		adapter.Fill(ds)

			'方法三↓呼叫函數補上層
			TableAddPrv(ds.Tables(0), "計畫代碼", "_計畫代碼")

		ds.Relations.Add("NodeRelation", ds.Tables(0).Columns("計畫代碼"), ds.Tables(0).Columns("_計畫代碼"))

		Dim dbRow As System.Data.DataRow
		For Each dbRow In ds.Tables(0).Rows
			If(dbRow.IsNull("_計畫代碼")) Then
				Dim newNode As ComponentArt.Web.UI.TreeViewNode
				If dbRow("計畫代碼").ToString() = "0" Then
					newNode = CreateNode(dbRow("計畫名稱").ToString(), "", dbRow("ImageUrl").ToString(), true)
				Else
					newNode = CreateNode(dbRow("計畫代碼").ToString() & " " & dbRow("計畫名稱").ToString(), dbRow("uKey").ToString(), dbRow("ImageUrl").ToString(), true)
				End If
				tv_Plan.Nodes.Add(newNode)

				PopulateSubPlanTree(dbRow, newNode)
			End If
		Next dbRow
	End Sub

</script>
<html>
<head>
<title>計畫科目</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<base target="_self">
<link href="planRelation.css" type="text/css" rel="stylesheet" />
<style>
.applyBorder	{ border: 2px buttonhighlight inset }
.removeBorder	{ border: none }

.btn	{border: 1px solid #D4D0C8; background-color:#EEEEEE;}
</style>
<script type="text/javascript">
//<![CDATA[

//						<ClientEvents>
//							<NodeSelect EventHandler="tv_Plan_onNodeSelect" />
//						</ClientEvents>
function tv_Plan_onNodeSelect(sender, eventArgs){
	checkAllChildNodes(eventArgs.get_node());
}

function checkAllChildNodes(node){
	//document.all('text_infoStream').value = node.get_toolTip().split(":")[0] + ":" + node.get_text().replace(node.get_toolTip().split(":")[0] + ' ','');
	//document.all('text_infoStream').value = node.get_toolTip();	//96:0-1161.R-0101
	//document.all('text_infoStream').value = node.get_text();	//0-1161.R-0101 電費
	//document.all('text_infoStream').value = node.get_text().replace(node.get_toolTip().split(":")[1]+' ','');	//電費
	//document.all('text_infoStream').value = node.get_toolTip() + ";" + node.get_text().replace(node.get_toolTip().split(":")[1]+' ','');	//96:0-1161.R-0101:電費
	//document.all('text_infoStream').value = node.get_text().replace(node.get_toolTip().split(":")[1]+' ','') + ";" + node.get_toolTip();	//電費;96:0-1161.R-0101
	document.all('text_infoStream').value = node.get_text().replace(node.get_toolTip().split(":")[1]+' ','') + ";" + node.get_toolTip().replace("｜","|");	//5K1.52 購置無形資產;97:5K1|52
}

//ClientSideOnNodeSelect="nodeSelect"
function nodeSelect(node){
	//97:5K1｜52 = 5K1.52 購置無形資產
	document.all("hid_SelectedItem").value = node.GetProperty("ToolTip") + "‖" + node.GetProperty("Text");
	updateSelectedPath();
}

function updateSelectedPath(){
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
//]]>
</script>
<script language="javascript" type="text/javascript">
<!--

function FindNodeBy(){
	if(document.all("text_findCode").value!=""||document.all("text_findName").value!=""){
		var nodeToExpand;
		if(document.all("text_findCode").value!=""){
			nodeToExpand = document.all("text_findCode").value.toUpperCase();
			document.all("text_findCode").value = nodeToExpand;
			nodeToExpand = nodeToExpand.replace(".","｜");
			nodeToExpand = nodeToExpand.replace("|","｜");
			var findedNode = tv_Plan.FindNodeById(nodeToExpand);
			if(findedNode != null){
				findedNode.expand(true);
				tv_Plan.selectNodeById(nodeToExpand);
			}else{
				alert("未尋獲");
				document.all("text_findCode").value="";
			}
		}else{
			nodeToExpand = document.all("text_findName").value;
			var findedNode = tv_Plan.findNodeByProperty('CssClass',nodeToExpand);
			tv_Plan.selectNodeById(findedNode.id);
		}
	}
}

function responseInfo(){
	//returnValue = document.all("text_infoStream").value;
	//傳回階層
	var infoArray = document.all("text_infoStream").value.split(";");
	var pathArray = document.all("hid_SelectedPath").value.split("∖");
	//alert(pathArray.length);
	if(pathArray.length >= 4){
		var j = 1;
		for(var i=pathArray.length-1; j<4; i--){
			//alert(i + ':' + pathArray[i]);
			if(i==pathArray.length-1){
				returnValue = pathArray[i];
			}
			else{
				returnValue = pathArray[i] + "∖" + returnValue;
			}
			j+=1;
		}
		returnValue += ";" + infoArray[1];
	}
	else{
		returnValue = document.all("hid_SelectedPath").value + ";" + infoArray[1];
	}
	//alert(returnValue);
//alert(document.getElementById("text_infoStream").value);
	window.close();
}
returnValue = "Cancel";

function test(){
alert('→<%= request.servervariables("HTTP_REFERER") %>←');
}

//-->
</script>
</head>
<body style="overflow:hidden" topmargin="5" leftmargin="5" rightmargin="5">
	<form runat="server">

		<table border="0" cellpadding="0" style="border:1px solid #808080; border-collapse: collapse">
			<tr>
				<td style="padding-left: 1px; padding-right: 0; padding-top: 1px; padding-bottom: 1px">
				<table style="TABLE-LAYOUT: fixed; border-collapse: collapse" cellpadding="0" cellspacing="0" border="1" bordercolor="#D4D0C8">
					<tr>
						<td height="20px" width="50" nowrap align="center" style="padding-top: 3px"><font size="2">年度</font></td>
						<td height="20px" width="45"><asp:DropDownList id="ddl_codeVer" runat="server"  DataTextField="codCodeVer" DataValueField="codCodeVer" Width="45px" AutoPostBack="True" OnSelectedIndexChanged="ddl_codeVer_SelectedIndexChanged"></asp:DropDownList></td>
						<td height="20px" width="50" nowrap align="center" style="padding-top: 3px"><font size="2">代碼</font></td>
						<td height="20px" width="95"><asp:TextBox id="text_findCode" runat="server" MaxLength="10" Width="95px" style="TEXT-ALIGN: left; HEIGHT: 21px; margin-top: -1; IME-MODE: disabled" onfocus="this.select();" onkeypress="if(event.keyCode==13){FindNodeBy();return false;}"></asp:TextBox></td>
						<td height="20px" width="50" nowrap align="center" style="display: none; padding-top: 3px"><font size="2">名稱</font></td>
						<td height="20px" width="95" style="display: none"><asp:TextBox id="text_findName" runat="server" MaxLength="30" Width="95px" style="TEXT-ALIGN: left; HEIGHT: 21px; margin-top: -1" onfocus="this.select();"></asp:TextBox></td>
					</tr>
				</table>
				</td>
				<td style="padding-left: 1px; padding-right: 1; padding-top: 1px; padding-bottom: 1px"><input type="button" id="btn_findBy" runat="server" class="btn" style="width: 68px; height: 22px; color: #808080" value="尋找" onclick="javascript:FindNodeBy();" /><asp:Button id="btn_find" runat="server" class="btn" style="margin-top: 0; margin-bottom: 0" Width="68px" Height="22px" Text="尋找" onclick="btn_find_Click" visible="false"></asp:Button></td>
			</tr>
		</table>
		<table style="TABLE-LAYOUT: fixed; border-collapse: collapse; border: 1px solid #808080; padding: 1px; margin-top: 5" border="0" cellpadding="0" width="100%">
			<tr>
				<td>
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
						ParentNodeImageUrl="../images/planRelation/folders.gif"
						LeafNodeImageUrl="../images/planRelation/folder.gif"
						ShowLines="true"
						LineImagesFolderUrl="../images/planRelation/lines/"
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
			<tr style="display: blank">
				<td>
				<table border="0" cellpadding="0" style="border-collapse: collapse; border: 1px solid #D4D0C8" width="100%">
					<tr>
						<td>
						<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%">
							<tr>
								<td><asp:TextBox id="text_infoStream" runat="server" class="removeBorder" Width="360" ReadOnly="True"></asp:TextBox></td>
								<td align="right" nowarp><input style="margin-top: 1; margin-bottom: 1; margin-right: 1; WIDTH: 68px; HEIGHT: 22px" type="button" class="btn" value="確定" onclick="javascript: if(document.all('text_infoStream').value!=''){responseInfo();}" /><input style="margin-top: 1; margin-bottom: 1; margin-right: 1; WIDTH: 68px; HEIGHT: 22px" type="button" class="btn" value="取消" onclick="javascript: window.close();" /><input style="margin-top: 1; margin-bottom: 1; margin-right: 1; WIDTH: 68px; HEIGHT: 22px" type="button" class="btn" value="清除" onclick="javascript: document.all('text_infoStream').value=';';responseInfo();" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<font style="margin-left: 10px" face="Verdana" size="1"><%=Environment.Version.ToString %></font>
		<!-- Insert content here -->
		<asp:TextBox id="hid_SelectedItem" runat="server" Width="100%" style="border-style: solid; border-width: 0" title="hid_SelectedItem"></asp:TextBox><br>
		<asp:TextBox id="hid_SelectedPath" runat="server" Width="100%" style="border-style: solid; border-width: 0" title="hid_SelectedPath"></asp:TextBox>
		<script language="javascript" type="text/javascript">
		<!--
			//if(document.all('text_infoStream').value!=''){responseInfo();}
		//-->
		</script>
	</form>
</body>
</html>