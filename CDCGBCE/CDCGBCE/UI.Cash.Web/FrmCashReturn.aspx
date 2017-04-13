<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashReturn.aspx.vb" Inherits="UI.Cash.Web.FrmCashReturn" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" /> 
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
   	<style type="text/css">
   	    
   	    .Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
		.FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		.FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		.FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
	
	</style>
 
    <script language="javascript" type="text/javascript">

        function wFind() {
            var WshShell = new ActiveXObject("WScript.Shell");
            WshShell.SendKeys("(^f)");

        }

        function OpenActData(parObj) {

            //var arrID = parObj.title.split("-");
            var arrID = parObj.split("-");
            var strParams;

            strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=" + arrID[0] + "&acmno1=" + arrID[1] + "&acppayno=" + arrID[2] + "&acppayno1=" + arrID[3] + "&mod=" + arrID[4];
            //strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=09900001"


            var strReturnVal = showModalDialog(strParams, window, "dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            //var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");






        }
        
        function UCSDate_Change(calendar)
        {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBCsmSDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
           // CssClass="Freezing"
        }
        
        function UCEDate_Change(calendar)
        {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBCsmEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
           // CssClass="Freezing"
        }
        
    function GetTotalCnt(parObj)
    {

        var tmpArray=parObj.id.split("_");
        var intIndex = tmpArray[1];
        intIndex=intIndex.substring(3,intIndex.length);
        var tmpName =  "DataGrid2_ctl"+ intIndex +"_LBdgMoney"
        if (parObj.checked ==true)
        {
           document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) + 1;
           document.all("TBCsmMoney").value = parseFloat(replaceString(document.all("TBCsmMoney").value, ",", "")) + parseFloat(replaceString(document.all(tmpName).innerText, ",", ""));     
        } 
        else 
        {
           document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) - 1 ;
           document.all("TBCsmMoney").value = parseFloat(replaceString(document.all("TBCsmMoney").value, ",", "")) - parseFloat(replaceString(document.all(tmpName).innerText, ",", ""));
        }
    }

    function GetTotalCntV1(parObj) {

        var tmpArray = parObj.id.split("_");
        var intIndex = tmpArray[1];
        intIndex = intIndex.substring(3, intIndex.length);
        var tmpName = "DataGrid2_ctl" + intIndex + "_LBdgMoney"


        if (parObj.checked == true) {
            document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value, ",", "")) + 1;
            document.all("TBCsmMoney").value = parseFloat(replaceString(document.all("TBCsmMoney").value, ",", "")) + parseFloat(replaceString(document.all(tmpName).innerText, ",", ""));
        }
        else {
            document.all("TBCsmCnt").value = 0;
            document.all("TBCsmMoney").value = 0;

        }
    }           

	function replaceString(sString, sReplaceThis, sWithThis) 
	{ 
		if (sReplaceThis != "" && sReplaceThis != sWithThis)
		{
			var counter = 0;
			var start = 0;
			var before = "";
			var after = "";
			
			while (counter<sString.length)
			{
				start = sString.indexOf(sReplaceThis, counter);
				if (start == -1)
				{
					break;
				}
				 else
				 {
					before = sString.substr(0, start);
					after = sString.substr(start + sReplaceThis.length, sString.length);
					sString = before + sWithThis + after;
					counter = before.length + sWithThis.length;
				}
			}
		}
		
		return sString;
	}

	function fnCallSearchDialog() {

	    var strReturnVal = showModalDialog("FrmSearchCash1.aspx?", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

	    if (strReturnVal != "Cancel") {
	        

	        document.all("TBFindSql").value = strReturnVal;
	    }

    }

    function setCB_CheckedFlag(obj) {
    
        //DataGrid2_ctl02_txt_RejectCause
        var tmpArray = obj.id.split("_");
        var intIndex = tmpArray[1];
        intIndex = intIndex.substring(3, intIndex.length);

        var tmpCBPass = "DataGrid2_ctl" + intIndex + "_CBdgPassFlag";
        var tmpTxtRejectCause = "DataGrid2_ctl" + intIndex + "_txt_RejectCause";

        if (document.all(tmpTxtRejectCause).value != "") {
            document.all(tmpCBPass).checked = "";
        }
        else{
            document.all(tmpCBPass).checked = "checked";
        }
    }

    function checkAll(alt) {

        var a = document.getElementsByTagName("input");
        var n = a.length;

        document.all("TBCsmCnt").value = 0;
        document.all("TBCsmMoney").value = 0;

        for (var i = 0; i < n; i++)
            if (a[i].type == "checkbox" && a[i].MyName == alt && a[i].disabled != true) {
            a[i].checked = window.event.srcElement.checked;
            GetTotalCntV1(a[i]);
        }
    }

    //會計人員明細審核打勾全選
    function checkAll2(alt) {

        var a = document.getElementsByTagName("input");
        var n = a.length;

        //document.all("TBCsmCnt").value = 0;
        //document.all("TBCsmMoney").value = 0;

        for (var i = 0; i < n; i++)
            if (a[i].type == "checkbox" && a[i].MyName == alt && a[i].disabled != true) {
            a[i].checked = window.event.srcElement.checked;
            //GetTotalCntV1(a[i]);
        }
    }
    
    function checkSelect(alt) {

        var a = document.getElementsByTagName("input");
        var n = a.length;
        for (var i = 0; i < n; i++)
            if (a[i].type == "checkbox" && a[i].alt == alt && a[i].disabled != true) {
            a[i].checked = window.event.srcElement.checked;
            GetTotalCnt(a[i]);
        }
    }

    //會計人員明細審核，不改變撥還數量及撥還金額
    function checkSelectPass(alt) {

        var a = document.getElementsByTagName("input");
        var n = a.length;
        for (var i = 0; i < n; i++)
            if (a[i].type == "checkbox" && a[i].alt == alt && a[i].disabled != true) {
            a[i].checked = window.event.srcElement.checked;
            //GetTotalCnt(a[i]);
        }
    }

    function fnFromScan(thisName) {

        var csCode = document.all("ddl_SortList").value;
        var crCode = document.all("ddl_cashRoster").value;
        var intDefYear = document.all("TBCsmYear").value;
        var csmKind = document.all("txt_csmKind").value;
        var point = document.all("txt_Point").value;

        if (parseFloat(GetIEVer()) > 6)
            var strReturnVal = showModalDialog("../UI.Cash.Web/FrmScanBarCode.aspx?intDefYear=" + intDefYear + "&csCode=" + csCode + "&crCode=" + crCode + "&csmKind=" + csmKind + "&Phase=1" + "&point=" + point, window, "dialogWidth: 640px; dialogHeight: 474px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        else	//W:-8; H:-47
            var strReturnVal = showModalDialog("../UI.Cash.Web/FrmScanBarCode.aspx?intDefYear=" + intDefYear + "&csCode=" + csCode + "&crCode=" + crCode + "&csmKind=" + csmKind + "&Phase=1" + "&point=" + point, window, "dialogWidth: 650px; dialogHeight: 568px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        if (strReturnVal != "Cancel") {
            var tmpArray = strReturnVal.split("|");
            document.all(thisName).value = tmpArray[0];
            var intTmpCnt = val(document.all("TBCsmCnt").value);
            document.all("TBCsmCnt").value = intTmpCnt + parseInt(tmpArray[1]);
            var intTmpMoney = Val(document.all("TBCsmMoney").value);
            document.all("TBCsmMoney").value = intTmpMoney + parseInt(tmpArray[2]);
            document.all(thisName).onchange();
        } else {
            document.all(thisName).value = "";
        }

    }

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

    function OpenSearchMore(cskKind) {
        var returnVal = showModalDialog("../UI.Cash.Web/FrmSearchMore.aspx?mod="+ <%=strModFlag %>+ "&cskKind=" + cskKind + "&cnPhase=1", window, "dialogWidth: 700px; dialogHeight: 474px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        if (returnVal != "Cancel") {
            document.getElementById('TBSearchSql').value = returnVal;
            document.getElementById('TBSearchSql').onchange();
        }
    }
	
     </script>
     <script type="text/vbscript">

        Function Val(thisValue)
	        On Error Resume next
	        Val = CDbl(thisValue)
	        If Err.Number <> 0 then
		        Val = 0
		        Err.Clear
	        End If
        End Function
    </script>  
</head>
<body>
    <form id="form1" runat="server">
  <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="600" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">	
			    <tr>
			        <td>
						<table border=0 cellpadding=2 cellspacing=0 width=100% style="table-layout:fixed">
							<tr>
								<td  style="font-size:10pt"> </td>
								<td  style="font-size:10pt"> 
                                    <asp:Label ID="LBFK_VisaNo" runat="server" Text="" Visible=false></asp:Label>
                                </td>
								<td  style="font-size:10pt; text-align:right"> 審核日期</td>
								<td  style="font-size:10pt"> 
                                    <asp:TextBox ID="TXTpassDate" runat="server" Width="80px" BackColor="#D0E8FF" 
                                        style="text-align:center"></asp:TextBox>
                                </td>
								<td  style="font-size:10pt"> <asp:CheckBox ID="CBAccUnitPassFlag" runat="server" 
                                        Text="單位審核" TextAlign="Left" AutoPostBack="True" /> </td>
								<td style="font-size:10pt"><asp:CheckBox ID="CBAccPassFlag" runat="server" Text="會計室審核" TextAlign="Left" AutoPostBack="True" /></td>
							</tr>
						</table>

			        </td>
			    </tr>
				<tr>
					<td>
						<table border="0" cellpadding="1" cellspacing="1" style="table-layout:fixed">
						    <tr   >
						        <td align="right" style="width: 75px">
                                    撥還年度</td>
						        <td style="width: 110px"><asp:TextBox ID="TBCsmYear" runat="server" Width="105px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
						        <td align="right" style="width: 70px">
                                    撥還數量</td>
						        <td style="width: 120px"><asp:TextBox ID="TBCsmCnt" runat="server" Width="80px" 
                                        BackColor="Transparent" onfocus="this.blur();"  style="text-align:center" 
                                        MyName ="TBAcmMoney"></asp:TextBox></td>
						        <td align="right" style="width: 85px">
                                    撥還金額</td>
								<td style="width:100px"><asp:TextBox ID="TBCsmMoney" runat="server" Width="95px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney"></asp:TextBox></td>
						    </tr>
							<tr>
								<td align="right" style="width: 75px">撥還日期</td>
								<td colspan="3" valign="middle" style="width: 300px">
								    <table border="0"  cellpadding="0" cellspacing="0" >
    								    <tr>
                                                <td><asp:TextBox ID="TBCsmSDate" runat="server" ondblclick="JavaScript: UCSDate.Show();" Width="105px" style="text-align:center;BACKGROUND-COLOR: #ffffe0"></asp:TextBox></td>
                                                <td>&nbsp;～</td>
                                                <td>&nbsp;<asp:TextBox ID="TBCsmEDate" runat="server" ondblclick="JavaScript: UCEDate.Show();" Width="105px" style="text-align:center;BACKGROUND-COLOR: #ffffe0"></asp:TextBox></td> 
    								    </tr>
    								</table>
								</td>
								<td align="right" style="width: 85px">撥還批號</td>
								<td style="width:100px"><asp:TextBox ID="TBCsmBatchNo" runat="server" Width="95px"  BackColor="Transparent" onfocus="this.blur();"  style="text-align:center"></asp:TextBox></td>
							</tr>
							<tr>
							    <td style="width: 75px; text-align: right;">帳 &nbsp; &nbsp; &nbsp; &nbsp;別</td>
							    <td style="width: 110px">
                                    <asp:DropDownList ID="ddl_SortList" runat="server" Width="110px" 
                                        style="BACKGROUND-COLOR: #ffffe0" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
							    <td colspan="6" style="width: 305px">
							        <asp:CheckBox ID="cbCskUser" runat="server" Font-Size="Small" Visible="false"
                                        Text="編輯時，清單僅載入同申請人支付過的資料" AutoPostBack="True" />
                                </td>
							</tr>
							<tr style="display:none">
							    <td style="width: 75px; text-align: right;">
                                    <asp:TextBox ID="txt_Point" runat="server" Width="50px"></asp:TextBox>
                                </td>
							    <td style="width: 110px">
                                    <asp:TextBox ID="txt_csmKind" runat="server" Width="50px"></asp:TextBox>
                                </td>
							    <td style="width: 70px; text-align: right;">名 &nbsp; &nbsp; &nbsp; &nbsp;單</td>
							    <td colspan="5" style="width: 305px">
                                    <asp:DropDownList ID="ddl_cashRoster" runat="server" Width="110px" 
                                        style="BACKGROUND-COLOR: #ffffe0" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
							</tr>
							<tr>
							    <td style="width: 75px; text-align: right;">備 &nbsp; &nbsp; &nbsp; &nbsp;註</td>
							    <td colspan="5" style="width: 305px"><asp:TextBox ID="TBMemo" runat="server" Width="480px" ></asp:TextBox>
                                    <input id="BtnPhrase" runat="server" type="button" value="..." 
                                        disabled="disabled" style="display:none" /></td>
							</tr>
							<tr>
							    <td colspan="6" >
							        <asp:TextBox ID="txt_acmWordNum" runat="server" AutoPostBack="True" style="display:none"></asp:TextBox>
                                    <input type="button" id="ibtn_FromScan" runat="server" style="width: 120px; height: 22px" value="使用條碼掃描器"  onclick="fnFromScan('txt_acmWordNum');"  />
                                    <asp:Button ID="btn_Reload" runat="server" style="width: 80px; height: 22px" 
                                        Text="清單重載" />
                                            <asp:Label ID="Label1" runat="server" Text="←如果有異動到核銷資料(含轉正)請按此鈕，重新載入資料。" 
                                                Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>

                                </td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
				    <td>
                        <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
                        <div id=MyDiv  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: 350px"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>" >
                        <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
                            <asp:datagrid id="DataGrid2" runat="server" Width="1000px" AutoGenerateColumns="False">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>
                                    <Columns>
                                            <asp:TemplateColumn HeaderText="選取">
                                                <HeaderStyle Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign=Middle></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBdgSelectAll1" runat="server" name="C1"
                                                        onclick="checkAll('C1');" ToolTip="打勾全選" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input id="CBdgSelect" type="checkbox" runat="server" title ='<%# DataBinder.Eval(Container, "DataItem.csmNo1") %>' value ='<%# DataBinder.Eval(Container, "DataItem.csmNo1") %>' MyName="C1" />                                                    
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="撥還">
                                                <HeaderStyle Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign=Middle></ItemStyle>
                                                <HeaderTemplate>撥還
                                                    <asp:CheckBox ID="CBdgSelectAll2" runat="server" name="C2"
                                                        onclick="checkAll2('C2');" ToolTip="打勾全選" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input id="CBdgPassFlag" type="checkbox" runat="server" disabled="disabled" MyName="C2" />                                                    
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="核退原因">
                                                <HeaderStyle Width="70px" HorizontalAlign="Center"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txt_RejectCause" runat="server" Width="70px" Enabled="false" Text='<%# DataBinder.Eval(Container, "DataItem.csmRejectCause") %>' ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <HeaderStyle Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:HyperLink id="linkacmWordNum" runat="server" CausesValidation="False" text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' NavigateUrl='<%# "javascript:OpenActData(" & Chr(39) & DataBinder.Eval(Container, "DataItem.acmWordNum") & "-" & strModFlag &  Chr(39) & ");" %>' CssClass="<%# Container.ItemIndex %>"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="計畫名稱" >
                                                <ItemTemplate>
                                                    <asp:Label ID="lab_plnPlanName" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.plnPlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="180px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="left" Width="180px" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別名稱" >
                                                <ItemTemplate>
                                                    <asp:Label ID="lab_oulOutlayName" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.oulOutlayName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="left" Wrap="False" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="金額">
                                                <HeaderStyle Width="70px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMoney" runat="server" Text='<%# format(Val( DataBinder.Eval(Container, "DataItem.acvPassMoney")&""), "#,0")%>'  MyName="LBdgMoney"  MyIndex='<%# Container.ItemIndex %>'  ></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="申請人"><HeaderStyle Width="70px" Wrap="False" /></asp:BoundColumn>
                                            
                                           <asp:BoundColumn DataField="acvMemo" HeaderText="用途說明">
                                               <HeaderStyle HorizontalAlign="Center" Width="400px" Wrap="False" />
                                           </asp:BoundColumn>                                       
                                           <asp:TemplateColumn Visible="False" >
                                           <ItemTemplate>
                                              <asp:Label ID="LBdgAcmYear"   runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acmYear")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acmNo")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNoPrv" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acmNoPrv")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acvNo")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo1"   runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acmNo1")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acvNo1")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcmNo2" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acmNo2")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvNo2"   runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acvNo2")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcpPayYear" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acpPayYear")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acpPayNo")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acvSubNo")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acpPayNo1")%>'></asp:Label>
                                              <asp:Label ID="LBdgAcvSubNo1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acvSubNo1")%>'></asp:Label>
                                              <asp:Label ID="LBdgPlnPlanCode" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.plnPlanCode")%>'></asp:Label>
                                              <asp:Label ID="LBdgUnitNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitNo")%>'></asp:Label>
                                              <asp:Label ID="lbAcpGroupNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.acpGroupNo")%>'></asp:Label>
                                            </ItemTemplate>
                                          </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemTemplate>
                                               <asp:Label ID="LBdgFK_DetailNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FK_DetailNo")%>' Visible="false"></asp:Label>                                              
                                            </ItemTemplate>
                                        </asp:TemplateColumn>                                            
                                    </Columns>
                            </asp:datagrid>
						</div>
                   </td>
				</tr>
			</table>
		</td>
		<td valign="top" width="200" bgcolor="#ffffff" rowspan="3"><iframe id="iFrame" border="0" name="iFrame"  src="<%=strShowCashPath %>" frameborder="0" width="200" scrolling="no" height="500"></iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" height="10"></td>
	</tr>
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
				<tr>
					<td valign="bottom" align="left">
						<table cellpadding="1" border="0">
							<tr>
								<td valign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Text="新增" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Text="修改" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Text="刪除" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnSave" runat="server" Text="儲存" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Text="取消" Height="22"></asp:button></td>
								<td valign="bottom" align="center">
                                    <asp:button id="BtnSearch" runat="server" 
                                        Text="查詢" Height="22" Visible="False"></asp:button></td>
								<td valign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:button></td>
								<td valign="bottom" align="center"><asp:Button ID="btnDetailPass" runat="server" Text="明細審核" Height="22" /></td>
								<td valign="bottom" align="center"></td>
								<td valign="bottom" align="center">
									<asp:textbox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" id="TBSearchSql" onblur="if(this.value==''){this.value='尋找撥還批號';}" style="TEXT-ALIGN: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找撥還批號</asp:textbox>
									<input style="FONT-SIZE: 8pt; WIDTH: 16px; FONT-FAMILY: Webdings; HEIGHT: 22px" type="button" value="s">
								</td>
								<td><input id="TBFindSql" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBFindSql" runat="server"></td>
								<td>
									<input id="TBOrderTxt" style="WIDTH: 23px; HEIGHT: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server">
								</td>
								<td>
								    <input id="ibtnSearchAcmWordNum" type="button" value="尋找動支編號" runat="server" /></td>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="DataGrid1" runat="server" Width="600px" AutoGenerateColumns="False" AllowSorting="True"
										AllowPaging="True" PageSize="5">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>										    
											<asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select" >
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                <HeaderStyle Width="30px" />
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="csmYear" HeaderText="年度">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle   HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn   DataField="csmNo" HeaderText="領用編號" Visible="false">
												<HeaderStyle Width="60px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"  ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmSDate" HeaderText="撥還日期">
												<HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemStyle   HorizontalAlign="Center" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmBatchNo" HeaderText="撥還批號">
												<HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemStyle   HorizontalAlign="Center" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmCnt" HeaderText="撥還數量">
												<HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmMoney" HeaderText="撥還金額" DataFormatString="{0:#,0}">
												<HeaderStyle Width="100px"></HeaderStyle>
                                                <ItemStyle  HorizontalAlign="Right" Wrap="False" />
											</asp:BoundColumn>
											<asp:BoundColumn DataField="csmMemo" HeaderText="備註">
											</asp:BoundColumn>
											<asp:BoundColumn DataField="CICount" HeaderText="CICount-9" Visible="False" >
											</asp:BoundColumn>											
											<asp:TemplateColumn HeaderText="申請人">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBCreateUser" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CreateUser") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.UnitPassFlag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="帳別">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBSort" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csName") %>' ToolTip= '<%# DataBinder.Eval(Container, "DataItem.csCode") & "," & DataBinder.Eval(Container, "DataItem.crCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
										    <asp:TemplateColumn HeaderText="設定控帳事由">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "../UI.CDCFun4.Web/FrmUpdateAcpMemo.aspx?csmYear=" & DataBinder.Eval(Container, "DataItem.csmYear") &"&csmNo="& DataBinder.Eval(Container, "DataItem.csmNo") &"&csmBatchNo=" & DataBinder.Eval(Container, "DataItem.csmBatchNo")  %>' Target='_blank'>設定控帳事由</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
				</tr> 
				<tr>
					<td align="right"><table style="BORDER-COLLAPSE: collapse" cellPadding="0" border="0">
                <tr>
                    <td><font size="2">只列出｜</font></td>
                    <td>&nbsp;<asp:dropdownlist id="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
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
                                            </asp:dropdownlist>
                    </td>
                    <td><asp:DropDownList ID="ddl_Sort" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                    <td>
                        <asp:DropDownList ID="ddl_PassFlag" runat="server" AutoPostBack="true">
                            <asp:ListItem Value="">不區分</asp:ListItem>                                   
                            <asp:ListItem Value="0">未審核</asp:ListItem>
                            <asp:ListItem Value="1">已審核</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td><asp:dropdownlist id="DDLSortDep" runat="server" AutoPostBack="True" 
                            DataSourceID="sqlds_Unit" DataTextField="dptName" DataValueField="csuUnit" 
                            Visible="False"></asp:dropdownlist></td>
                </tr>  
                </table>
                </td>
                </tr>    
			</table>
		</td>
	</tr>
</table>
        <ComponentArt:Calendar ID="UCSDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCSDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBCsmSDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
             <ComponentArt:Calendar ID="UCEDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCEDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBCsmEDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar> 
    <asp:SqlDataSource ID="sqlds_Unit" runat="server"></asp:SqlDataSource>
&nbsp;</form>
</body>
</html>
