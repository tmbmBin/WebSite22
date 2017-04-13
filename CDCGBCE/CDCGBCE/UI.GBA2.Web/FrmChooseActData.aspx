<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmChooseActData.aspx.vb" Inherits="UI.GBA2.Web.FrmChooseActData" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self">
    <style type="text/css">
        .Freezing {
            position: relative;
            table-layout: fixed;
            top: expression(this.offsetParent.scrollTop);
            z-index: 10;
        }
    </style>
    <script>

        function fnGetInfo() {
            strValue = document.all("TBSessionID").value;
            returnValue = strValue;

        }


        returnValue = "Cancel";
        function fnCancel() {
            //var sData = dialogArguments;
            //sData.sUserName = "";
            //sData.fnUpdate();
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
                                <table style="table-layout: fixed">
                                    <tr>
                                        <td align="right" width="90">年 度</td>
                                        <td align="left" width="150">
                                            <asp:DropDownList ID="DDLAcmYear" runat="server" Width="144px"></asp:DropDownList></td>
                                        <td align="right" width="80">執行單位</td>
                                        <td align="left" width="150">
                                            <asp:DropDownList ID="DDLWorkDep" runat="server" Width="144px"></asp:DropDownList></td>
                                        <td align="right" width="90">經費單位</td>
                                        <td width="150">
                                            <asp:DropDownList ID="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:DropDownList></td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">動支編號</td>
                                        <td width="150">
                                            <asp:TextBox ID="TBacmWordNum" runat="server" Width="120px"></asp:TextBox></td>
                                        <td align="right" width="80">群組號</td>
                                        <td align="left" width="150">
                                            <asp:TextBox ID="TBAcpGroupNo" runat="server"
                                                Width="120px"></asp:TextBox></td>
                                        <td align="right">經資門別</td>
                                        <td>
                                            <asp:DropDownList ID="DDLAccKind" runat="server" Width="120px"></asp:DropDownList></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">計畫科目</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></td>
                                        <td align="right" width="80">用途別</td>
                                        <td align="left" colspan="3">
                                            <asp:DropDownList ID="DDLOul" runat="server"
                                                Width="300px">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="BtnFilter" runat="server" Text="過濾資料" Height="22px"></asp:Button></td>
                        </tr>
                        <tr>
                            <td><% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
                                <div id="MyDiv" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove; width: 950px; border-bottom: 1px groove; height: 300px" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>">
                                    <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
                                    <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False"
                                        GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None"
                                        BorderColor="#E7E7FF">
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
                                            <asp:TemplateColumn HeaderText="年度">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="群組編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="經資別">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvAccKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="預算來源">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvBgtSourName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="會計分錄">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgTrnEntryNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.trnEntryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="工作計畫">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgWorkPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WorkPlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="分支計畫">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgSubPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubPlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgOulName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.oulOutlayName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="金額">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="備註">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo-12" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmNo" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo1-13" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmNo1" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo2-14" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmNo2" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo-15" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvNo" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo1-16" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvNo1" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo2-17" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvNo2" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayYear-18" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="報支號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo-20" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="轉正號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo1-22" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvSubNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別代碼-24" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvOutlayCode" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="計畫代碼-25" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvPlanCode" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="科目年度別-26" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvOutlayYear" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="匯入序號-27" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWTranID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="批號-28" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWTranBNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranBNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="SeectlFlag-29" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgSelectFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SelectFlag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="傳票號碼">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWExchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="繳回傳票號碼">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWExchNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="ActKeys" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgActKeys" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.actKeys") %>'></asp:Label>
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
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="ReMoveAll" runat="server" Text="全部移除" /></td>
                            <td>
                                <asp:Button ID="Remove" runat="server" Text="移除" /></td>
                            <td>
                                <asp:Button ID="Selected" runat="server" Text="選取" />
                            </td>
                            <td>
                                <asp:Button ID="SelectedAll" runat="server" Text="選取全部" />
                                <input id="TBSessionID" runat="server" type="hidden" />
                                <input id="btnOK" runat="server" type="button" value="傳回選取資料" onclick="fnGetInfo(); window.close();" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" height="10">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    bordercolor="#666668">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="5" width="100%"
                        border="1">
                        <tr>
                            <td>
                                <div id="DIV2" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove; width: 950px; border-bottom: 1px groove; height: 300px" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>">
                                    <asp:DataGrid ID="DataGrid2" runat="server" Width="100%" AutoGenerateColumns="False"
                                        GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None"
                                        BorderColor="#E7E7FF">
                                        <FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                                        <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
                                        <AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
                                        <ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
                                        <HeaderStyle Font-Size="X-Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7"
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
                                            <asp:TemplateColumn HeaderText="年度">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="群組編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="經資別">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvAccKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="預算來源">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvBgtSourName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="會計分錄">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgTrnEntryNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.trnEntryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="工作計畫">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgWorkPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WorkPlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="分支計畫">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgSubPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubPlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgOulName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.oulOutlayName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="金額">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="備註">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo-12" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmNo" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo1-13" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmNo1" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo2-14" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmNo2" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo-15" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvNo" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo1-16" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvNo1" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo2-17" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvNo2" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayYear-18" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="報支號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo-20" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="轉正號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo1-22" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvSubNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別代碼-24" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvOutlayCode" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="計畫代碼-25" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvPlanCode" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="科目年度別-26" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvOutlayYear" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="匯入序號-27" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWTranID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="批號-28" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWTranBNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranBNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="SeectlFlag-29" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgSelectFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SelectFlag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="傳票號碼">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWExchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="繳回傳票號碼">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvWExchNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="ActKeys" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgActKeys" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.actKeys") %>'></asp:Label>
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
        </table>
        <div>
        </div>
    </form>
</body>
</html>
