<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmExportToGBA.aspx.vb" Inherits="UI.GBA2.Web.FrmExportToGBA" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script type="text/javascript" src="../ScriptFiles/setAllCtrl.js"></script>
    <style type="text/css">
        .Freezing11 {
            z-index: 10;
            position: relative;
            table-layout: fixed;
            top: expression(this.offsetParent.scrollTop+0);
            height: 24px;
        }

        .Freezing {
            position: relative;
            table-layout: fixed;
            top: expression(this.offsetParent.scrollTop);
            z-index: 10;
        }

            .Freezing th {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
                padding: 2px;
            }

        .FreezingCol0 {
            BORDER-RIGHT: 0px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol1 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol2 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }
    </style>
    <script language="javascript">
        function fnCallFilterDialog() {
            var strReturnVal = showModalDialog("FrmFilterSql.aspx?showtype=1", window, "dialogWidth:630px;dialogHeight:350px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                Form1.TBFilterSql.value = strReturnVal;
                //document.all("TextBox1").value=strReturnVal;
            }
        }


        function fnCallSearchDialog() {

            var strReturnVal = showModalDialog("FrmSearch.aspx?showtype=1", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                form1.TBFindSql.value = strReturnVal;
            }


        }

        function fnCallReportMenu() {
            var strParams = "";
            strParams = "&GBAEndLevelFlag=" + <%=strGBAEndLevelFlag %> + "&acmyear=" + <%=Session("default_Year") %> + "&TranBNo=" + document.all("TBTranBatchDate").value + "&TranSubNo=" + document.all("TBTranBatchNum").value + "&page1qty=6&page2qty=43";
            window.open("../UI.GBARpt.Web/FrmRptMenu02.aspx?visastage=P" + strParams, '', 'resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no');


        }
        function fnCallEditDtlPage() {


            var strParams = "";
            strParams = "&acmyear=" + <%=Session("default_Year") %> + "&TranBatchDate=" + document.all("TBTranBatchDate").value + "&TranBatchNum=" + document.all("TBTranBatchNum").value + "&SessionID=" + document.getElementById("TBSessionID").value;
            //	 window.open("FrmChooseActData.aspx?visastage=P" + strParams , '','resizable=yes, scrollbars=yes, menubar=yes, toolbar=no, status=no, location=no') ;

            var strReturnVal = showModalDialog("FrmChooseActData.aspx?visastage=P" + strParams, window, "dialogWidth:1050px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                form1.TBSessionID.value = strReturnVal;
            }

        }




    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5"
            width="950" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    bordercolor="#666668">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td>
                                <table style="table-layout: fixed" cellpadding="1" width="100%" border="0">
                                    <tr>
                                        <td style="width: 50px" valign="bottom" align="right">日期</td>
                                        <td style="width: 100px" valign="bottom" align="left">
                                            <asp:TextBox ID="TBTranBatchDate" runat="server" Width="96px" MaxLength="7"></asp:TextBox></td>
                                        <td style="width: 50px" valign="bottom" align="right">批號</td>
                                        <td valign="bottom" align="left">
                                            <asp:TextBox ID="TBTranBatchNum" runat="server"
                                                Width="40px" MaxLength="2"></asp:TextBox><asp:Label ID="Label1" runat="server" ForeColor="Blue" Font-Size="X-Small">日期不輸入時，系統會以今天的日期自動產生會出編號。</asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DDLAcmYear" runat="server" Width="100px"></asp:DropDownList>
                                <asp:Button ID="BtnFilter" runat="server" Text="過濾資料" Height="22px"
                                    Visible="False"></asp:Button>
                                <input id="TBSessionID" runat="server" type="hidden" />
                                <asp:Button ID="btnEditDetail" runat="server" Text="開啟過濾資料頁面" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 418px"><% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
                                <div id="MyDiv" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove; width: 950px; border-bottom: 1px groove; height: 400px" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>">
                                    <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
                                    <input id="TBFilterSql" type="hidden" name="Hidden1" runat="server">
                                    <asp:DataGrid ID="DataGrid2" runat="server" Width="100%" AutoGenerateColumns="False"
                                        GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#E7E7FF">
                                        <FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                                        <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
                                        <AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
                                        <ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
                                        <HeaderStyle Font-Size="X-Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7" CssClass="Freezing"
                                            BackColor="#4A3C8C"></HeaderStyle>
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="選取">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False" Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect',this.checked);" runat="server"
                                                        ToolTip="打勾全選" Visible="false"></asp:CheckBox>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBdgSelect" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmYear" HeaderText="年度">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False" Width="30px"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acpGroupNo" SortExpression="acpGroupNo" HeaderText="匯出批號">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmWordNum" SortExpression="acmWordNum" HeaderText="動支編號">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="accKindName" SortExpression="acvAccKind" HeaderText="經資別">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False" Width="50px"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="orgName" SortExpression="acvBgtSourceCode" HeaderText="預算來源">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False" Width="60px"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="trnEntryNo" HeaderText="會計分錄">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="WorkPlanName" SortExpression="WorkPlanCode" HeaderText="工作計畫">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="SubPlanName" SortExpression="SubPlanCode" HeaderText="分支計畫">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="oulOutlayName" SortExpression="acvOutlayCode" HeaderText="用途別名稱">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMoney" HeaderText="金額" DataFormatString="{0:#,0}">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small" HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMemo" HeaderText="備註">
                                                <HeaderStyle Font-Size="X-Small" Wrap="False"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acmNo" HeaderText="acmNo-12"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acmNo1" HeaderText="acmNo1-13"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acmNo2" HeaderText="acmNo2-14"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvNo" HeaderText="acvNo-15"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvNo1" HeaderText="acvNo1-16"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvNo2" HeaderText="acvNo2-17"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acpPayYear" HeaderText="acpPayYear-18"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="true" DataField="acpPayNo" HeaderText="報支號"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvSubNo" HeaderText="acvSubNo-20"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="true" DataField="acpPayNo1" HeaderText="轉正號"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvSubNo1" HeaderText="acvSubNo1-22"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acpGroupNo" HeaderText="acpGroupNo-23"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvOutlayCode" HeaderText="用途別代碼-24"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvPlanCode" HeaderText="計畫代碼-25"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvOutlayYear" HeaderText="科目年度別-26"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvWTranID" HeaderText="匯入序號-27"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="acvWTranBNo" HeaderText="批號-28"></asp:BoundColumn>
                                            <asp:BoundColumn Visible="False" DataField="SelectFlag" HeaderText="SeectlFlag-29"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvWExchNo" HeaderText="傳票號碼"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvWExchNo1" HeaderText="繳回傳票號碼"></asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="位置" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBLocatoin" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" height="10"></td>
            </tr>
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    bordercolor="#666668">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="5" width="100%"
                        border="1">
                        <tr>
                            <td valign="bottom" align="left">
                                <table cellpadding="1" border="0">
                                    <tr>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnAdd" runat="server" Text="新增" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnEdit" runat="server" Text="修改" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnDelete" runat="server" Text="刪除" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSave" runat="server" Text="儲存" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnCancel" runat="server" Text="取消" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSearch" runat="server"
                                                Text="查詢" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <input type="button" id="BtnPrint1"
                                                runat="server" style="width: 50px; height: 22px" value="列印"
                                                onclick="fnCallReportMenu();" visible="True" /><asp:Button ID="BtnPrint" runat="server" Text="列印" Height="22" Visible="false"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnExit" runat="server" Text="離開" Height="22" Visible="False"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnExport" runat="server" Text="匯出" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:TextBox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()"
                                                ID="TBSearchSql" onblur='if(this.value==""){this.value="尋找匯出編號";}' Style="text-align: center" onfocus="this.select()" onclick='this.value=""'
                                                runat="server" Width="100px" AutoPostBack="True">尋找匯出編號</asp:TextBox><input style="font-size: 8pt; width: 16px; font-family: Webdings; height: 22px" type="button"
                                                    value="s"></td>
                                        <td>
                                            <input id="TBFindSql" style="width: 23px; height: 22px" type="hidden" size="1" name="Hidden1"
                                                runat="server"><input id="TBOrderTxt" style="width: 23px; height: 22px" type="hidden" size="1" name="Hidden1"
                                                    runat="server">
                                        </td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnImport" runat="server"
                                                Text="傳票號碼匯入" Visible="False"></asp:Button></td>
                                        <td valign="bottom" align="center"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True"
                                    PageSize="5">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                    <Columns>
                                        <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:ButtonColumn>
                                        <asp:BoundColumn DataField="acvWTranBNo" SortExpression="acvTranBNo" HeaderText="匯出編號">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvWTranIDCnt" SortExpression="acvTranIDCnt" HeaderText="應開傳票數">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvWExchNoCnt" SortExpression="acvExchNoCnt" HeaderText="已開傳票數">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="OutputCnt" SortExpression="OutputCnt" HeaderText="已匯出">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                        </asp:BoundColumn>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <table style="border-collapse: collapse" cellpadding="0" border="0">
                                    <tr>
                                        <td><font size="2">只列出｜</font></td>
                                        <td>&nbsp;
												<asp:DropDownList ID="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
                                                    <asp:ListItem Value=""></asp:ListItem>
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
                                                </asp:DropDownList></td>
                                        <td>
                                            <asp:DropDownList ID="DDLSortDep" runat="server" Visible="False" AutoPostBack="True"></asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
