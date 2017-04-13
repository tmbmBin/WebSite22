<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmVerifyList.aspx.vb" Inherits="UI.AdminVerify.Web.FrmVerifyList" %>
 <%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="Microsoft.Security.Application" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript" type="text/javascript" src="../ScriptFiles/setAllCtrl.js"></script> 
				<style type="text/css">
                    .Freezing { Z-INDEX: 10; POSITION: relative; ; TOP: expression(this.offsetParent.scrollTop+0); HEIGHT: 24px }
                    .FreezingCol0 { BORDER-RIGHT: 0px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
                    .FreezingCol1 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
                    .FreezingCol2 { BORDER-RIGHT: 1px solid; BORDER-TOP: #ffffff 0px solid; Z-INDEX: 9; ; LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1); BORDER-LEFT: #003366 0px solid; BORDER-BOTTOM: 0px solid; POSITION: relative }
		        </style>
		        

		<script language="javascript" type="text/javascript" >
		    function UCBDate_Change(calendar)
			    {
				    var vDay = new Date(calendar.GetSelectedDate());
				    document.getElementById("TBPassDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			    }
		    function UCEDate_Change(calendar)
			    {
				    var vDay = new Date(calendar.GetSelectedDate());
				    document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
				}

				function OpenActData(parObj) {

				    //var arrID = parObj.title.split("-");
				    var arrID = parObj.split("-");
				    var strParams;
				    var intTmpAcmNo1=0;
				    var intTmpAcmNo2=0;
				    var intTmpAcpPayYear=0;
				    var intTmpAcpPayNo=0;
				    var intTmpAcpPayNo1=0;
				    

				    if (arrID.length == 2)
				    {
				        intTmpAcmNo1 = arrID[2];
				    }
				    else if (arrID.length == 3)
				    {
				        intTmpAcmNo1 = arrID[2];
				        intTmpAcmNo2 = arrID[3];
				    }
				    else if(arrID.length == 4)
				    {   
				        intTmpAcmNo1 = arrID[2];
				        intTmpAcmNo2 = arrID[3]; 
				        intTmpAcpPayNo = arrID[4]; 
				    }
				    else if(arrID.length == 5)
				    {
				        intTmpAcmNo1 = arrID[2];
				        intTmpAcmNo2 = arrID[3]; 
				        intTmpAcpPayNo = arrID[4]; 
				        intTmpAcpPayNo1 = arrID[5];
				    }				    
				    




				    

				    strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?mod=" + arrID[0] + "&acmWordNum=" + arrID[1] + "&acmno1=" + intTmpAcmNo1 + "&acppayno=" + intTmpAcpPayNo + "&acppayno1=" + intTmpAcpPayNo1;
				    //strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=09900001"


				    var strReturnVal = showModalDialog(strParams, window, "dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
				    //var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");






				}
        
        </script>

		        
</head>

<body>
    <form id="form1" runat="server">

<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5" width="1100" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%" border="1">
							<tr>
								<td>
									<table cellPadding="1" border="0">
										<tr>
											<td vAlign="bottom" align="center"></td> 
											<td vAlign="bottom" align="center">
        <table><tr><td>
            <asp:Label ID="Label2" runat="server" Text="核支日期"></asp:Label></td><td><asp:TextBox ID="TBPassDate" runat="server" Width="100px" ondblclick="JavaScript:UCBDate.Show();"></asp:TextBox></td></tr></table>
	</td>
											<td vAlign="bottom" align="center">
                                                &nbsp;<asp:button id="BtnSave" runat="server" Height="22" Text="核支存檔"></asp:button></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"></td>
											<td vAlign="bottom" align="center"><asp:label id="Label1" runat="server" ForeColor="Red">請存檔後再換頁。</asp:label></td>
											<td>每頁顯<asp:TextBox ID="TBPageQty" runat="server" Width="50px" AutoPostBack="True" style="text-align:center"></asp:TextBox>示筆資料</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
								    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF"  BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1100px">
                                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                        <AlternatingItemStyle BackColor="#F7F7F7" />
                                        <ItemStyle BackColor="#E7E7FF" Font-Names="新細明體" Font-Size="X-Small"  ForeColor="#4A3C8C" />
                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True"  Font-Names="新細明體" Font-Size="9pt" ForeColor="#F7F7F7" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="審核選取">
                                                <HeaderStyle Width="20px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBdgSelectAll1" runat="server" 
                                                        onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" ToolTip="打勾全選" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBdgSelect" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmYear" HeaderText="acmYear-1" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmNo" HeaderText="acmNo-2" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmNoPrv" HeaderText="acmNoPrv-3" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvNo" HeaderText="acvNo-4" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acpPayYear" HeaderText="acpPayYear-5" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acpPayNo" HeaderText="報支次號" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvSubNo" HeaderText="acvSubNo-7" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acpPayNo1" HeaderText="轉正次號" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvSubNo1" HeaderText="acvSubNo1-9" Visible="False"></asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="序號">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Container.ItemIndex + 1  %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="20px" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="零用金">
                                                <HeaderStyle Width="20px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBdgAcpProdVisaKindAll1" runat="server" onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" ToolTip="打勾全選" Visible=false  />
                                                    <asp:Label ID="Label3" runat="server" Text="零用金"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBdgAcpProdVisaKind" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBAcmWordNum" runat="server" Visible="false" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>'></asp:Label>
                                                    <asp:HyperLink id="HLAcmWordNum" runat="server" CausesValidation="False" text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' NavigateUrl='<%# "javascript:OpenActData(" & Chr(39) &  strModFlag & "-" & AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.FullAcmWordNum").ToString()) &  Chr(39) & ");" %>' CssClass="<%# Container.ItemIndex %>"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="BgtDepName" HeaderText="經費單位"  SortExpression="BgtDepName">
                                                <HeaderStyle Width="100px" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="PlanName" HeaderText="計畫名稱"  SortExpression="PlanName">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="OulName" HeaderText="用途別科目"  SortExpression="OulName">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMoney" DataFormatString="{0:#,0}"  HeaderText="金額" SortExpression="acvMoney">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmMemo" HeaderText="用途說明" SortExpression="acvMemo">
                                                <HeaderStyle Wrap="False" />                                               
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvOutlayYear" HeaderText="計畫代碼"  SortExpression="acvOutlayYear" Visible="False" >
                                                <HeaderStyle Width="200px" Wrap="False"   />
                                            </asp:BoundColumn>
                                              <asp:BoundColumn DataField="acvPlanCode" HeaderText="計畫代碼"  SortExpression="acvPlanCode"  Visible="False">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvOutlayCode" HeaderText="用途別代碼"  SortExpression="acvOutlayCode" Visible="False">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="單位審核">
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small" />                                      
                                                <ItemTemplate>
                                                    <asp:Label ID="LBUnitPass" runat="server" style="text-align:center"  Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmUnitPassFlag").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmUnitPassUser").ToString()) & "｜" & AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmUnitPassDate").ToString()) %>' Width="100%"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="秘書審核">
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small"/>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBSecPass"  runat="server" style="text-align:center"  Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmSecPassFlag").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmProdAssUser").ToString()) & "｜" & AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmProdAssDate").ToString()) %>' Width="100%"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="會計審核">
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small"/>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBAccPass"  runat="server" style="text-align:center"  Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmAccPassFlag").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmAccPassUser").ToString()) & "｜" & AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmAccPassDate").ToString()) %>' Width="100%"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="報支次數">
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small"/>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBPCnt" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.PCnt").ToString()) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="報支核支">
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small"/>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBPayPass"  runat="server" style="text-align:center" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPassFlag").ToString()) %>'  ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPassUser").ToString()) & "｜" & AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPassDate").ToString()) %>' Width="100%"></asp:Label>
                                                </ItemTemplate>                                                
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="零用金" Visible="False" >
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small"/>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBAcpProdVisaKind"  runat="server" style="text-align:center" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpProdVisaKind").ToString()) %>'   Width="100%"></asp:Label>
                                                </ItemTemplate>                                                
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="撥還階段" >
                                            <HeaderStyle Font-Bold="True" Font-Size="XX-Small"/>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBCashTableCnt"  runat="server" style="text-align:center" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.cashTableCnt").ToString()) %>'   Width="100%"></asp:Label>
                                                </ItemTemplate>                                                
                                            </asp:TemplateColumn>

                                        </Columns>
                                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" 
                                            Mode="NumericPages" />
                                    </asp:DataGrid>
                                </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
	        <componentart:calendar id="UCBDate" runat="server" calendarcssclass="calendar" calendartitlecssclass="title"
            clientsideonselectionchanged="UCBDate_Change" cultureid="1028" daycssclass="day"
            dayheadercssclass="dayheader" dayhovercssclass="dayhover" monthcssclass="month"
            nextimageurl="../../images/cal_nextMonth.gif" othermonthdaycssclass="othermonthday"
            pickerformat="Long" popup="Custom" popupexpandcontrolid="TBPassDate" previmageurl="../../images/cal_prevMonth.gif"
            selecteddaycssclass="selectedday"></componentart:calendar>    		
</form>
</body>
</html>
