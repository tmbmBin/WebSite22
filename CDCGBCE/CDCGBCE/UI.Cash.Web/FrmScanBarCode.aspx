<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmScanBarCode.aspx.vb" Inherits="UI.Cash.Web.FrmScanBarCode" %>

<html>
<head runat="server">
    <title>條碼掃描作業</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script type="text/javascript">
        function checkAll(alt) {

            var a = document.getElementsByTagName("input");
            var n = a.length;
            for (var i = 0; i < n; i++)
                if (a[i].type == "checkbox" && a[i].alt == alt && a[i].disabled != true) {
                a[i].checked = window.event.srcElement.checked;
                GetTotalCnt(a[i]);
            }
        }

        function GetTotalCnt(parObj) {

            var tmpArray = parObj.id.split("_");
            var intIndex = tmpArray[1];
            intIndex = intIndex.substring(3, intIndex.length);
            var tmpName = "DataGrid2_ctl" + intIndex + "_LBdgMoney"
            if (parObj.checked == true) {
                document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value, ",", "")) + 1;
                document.all("TBCsmMoney").value = parseFloat(replaceString(document.all("TBCsmMoney").value, ",", "")) + parseFloat(replaceString(document.all(tmpName).innerText, ",", ""))
          }
            else {
                document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value, ",", "")) - 1;
                document.all("TBCsmMoney").value = parseFloat(replaceString(document.all("TBCsmMoney").value, ",", "")) - parseFloat(replaceString(document.all(tmpName).innerText, ",", ""))

            }
        }

        function replaceString(sString, sReplaceThis, sWithThis) {
            if (sReplaceThis != "" && sReplaceThis != sWithThis) {
                var counter = 0;
                var start = 0;
                var before = "";
                var after = "";

                while (counter < sString.length) {
                    start = sString.indexOf(sReplaceThis, counter);
                    if (start == -1) {
                        break;
                    }
                    else {
                        before = sString.substr(0, start);
                        after = sString.substr(start + sReplaceThis.length, sString.length);
                        sString = before + sWithThis + after;
                        counter = before.length + sWithThis.length;
                    }
                }
            }

            return sString;
        }

        function responseInfo() {
            returnValue = document.all("txt_infoStream").value + "|" + document.all("TBCsmCnt").value + "|" + document.all("TBCsmMoney").value;
            //	alert(returnValue);
            window.close();
        }
        returnValue = "Cancel";
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellpadding="5" width="600" bgcolor="#dadee9">
	<tr>
		<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" width="600" valign="top" align="left">
			<table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">	
				<tr>
					<td>
                        <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout:fixed">
                            <tr>
                                <td style="width: 75px; text-align: right;">領用數量</td>
                                <td style="width: 110px"><asp:TextBox ID="TBCsmCnt" runat="server" Width="100px" 
                                        BackColor="Transparent" onfocus="this.blur();"  style="text-align:center" 
                                        MyName ="TBAcmMoney"></asp:TextBox></td>
                                <td align="right" style="width: 70px">領用金額</td>
                                <td style="width: 120px"><asp:TextBox ID="TBCsmMoney" runat="server" Width="100px" BackColor="Transparent" onfocus="this.blur();"  style="text-align:right" MyName ="TBAcmMoney"></asp:TextBox></td>
                                <td align="right" style="width: 85px">帳 &nbsp; &nbsp; &nbsp; &nbsp;別</td>
                                <td><asp:DropDownList ID="ddl_SortList" runat="server" Width="110px" 
                                        style="BACKGROUND-COLOR: #ffffe0" AutoPostBack="True" Enabled="False">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
		                        <td style="width: 75px; text-align: right;">條碼掃描</td>
		                        <td colspan="5"><asp:TextBox ID="txt_acmWordNum" runat="server" AutoPostBack="True"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="使用條碼掃描器，請保持游標在左方空格內閃爍!" 
                                        ForeColor="Red"></asp:Label>
                                </td>
		                    </tr> 
		                </table>   
		            </td>
		        </tr>
                <tr>
                    <td>
                        <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
                        <div id=MyDiv  style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 600px; BORDER-BOTTOM: 1px groove; HEIGHT: 350px"    scrollpos="<%= savescrollpos.value %>"   persistid="<%= savescrollpos.uniqueid %>">
                        <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
                            <asp:datagrid id="DataGrid2" runat="server" Width="1000px" 
                                AutoGenerateColumns="False" PageSize="15">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>
                                    <Columns>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                <ItemTemplate>
                                                    <input id="CBdgSelect" type="checkbox" runat="server" checked="checked" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支編號" >
                                                <HeaderStyle Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>                                                    
                                                    <asp:LinkButton ID="lbtn_acmWordNum" runat="server" CausesValidation="False" ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' OnClick="BtnSetCode_Click" CssClass="<%# Container.ItemIndex %>" ><%# DataBinder.Eval(Container, "DataItem.acmWordNum") %></asp:LinkButton>
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
                                                    Font-Underline="False" HorizontalAlign="left" Width="170px" />
                                            </asp:TemplateColumn>                                  
                                            <asp:TemplateColumn HeaderText="金額" >
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPassMoney", "{0:#,#}") %>' MyName="LBdgMoney" MyIndex="<%# Container.ItemIndex %>"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="申請人"><HeaderStyle Width="80px" Wrap="False" /></asp:BoundColumn>
                                           <asp:BoundColumn DataField="acvMemo" HeaderText="用途說明">
                                               <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                           </asp:BoundColumn>
                                           <asp:TemplateColumn HeaderText="acmYear-7" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacmYear" runat="server" Text='<%# Eval("acmYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo-8" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacmNo" runat="server" Text='<%# Eval("acmNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo-9" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacvNo" runat="server" Text='<%# Eval("acvNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo1-10" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacmNo1" runat="server" Text='<%# Eval("acmNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo1-11" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacvNo1" runat="server" Text='<%# Eval("acvNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo2-12" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacmNo2" runat="server" Text='<%# Eval("acmNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo2-13" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacvNo2" runat="server" Text='<%# Eval("acvNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayYear-14" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacpPayYear" runat="server" Text='<%# Eval("acpPayYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayNo-15" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacpPayNo" runat="server" Text='<%# Eval("acpPayNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo-16" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacvSubNo" runat="server" Text='<%# Eval("acvSubNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="OrderFlag-17" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labOrderFlag" runat="server" Text='<%# Eval("OrderFlag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayNo1-18" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacpPayNo1" runat="server" Text='<%# Eval("acpPayNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo1-19" Visible="false">
                                                <ItemTemplate>                                                    
                                                    <asp:Label ID="labacvSubNo1" runat="server" Text='<%# Eval("acvSubNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                           <asp:TemplateColumn Visible="False" >
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmYear" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                                    <asp:Label ID="LBdgPlnPlanCode" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.plnPlanCode") %>'></asp:Label>
                                                    <asp:Label ID="LBdgUnitNo" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.UnitNo") %>'></asp:Label>
                                                    <asp:Label ID="LBtmpOrderNo" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.tmpOrderNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                    </Columns>
                            </asp:datagrid>                           
                        </div>
                    </td>
                </tr>
                <tr>
            <td>
                <asp:Button ID="btn_Input" runat="server" Text="確認回傳" />
                <asp:TextBox id="txt_infoStream" runat="server" style="display: none" Width="360" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
            </table>
            </td>
        </tr>        
    </table>
    <script language="javascript" type="text/javascript">
	<!--
        if (document.all('txt_infoStream').value != '') { responseInfo(); }
	//-->
	</script> 
    </form>
</body>
</html>
