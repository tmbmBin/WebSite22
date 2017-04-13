<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmChooseTrlData.aspx.vb" Inherits="UI.TrlBatch.Web.FrmChooseTrlData" %>

<%@ Import Namespace="MyExtensionsTools" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script language="javascript">

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
        <div>
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
                                            <td align="right" width="90">&nbsp;</td>
                                            <td align="left" width="150">
                                                <asp:RadioButton ID="RBBarCode" runat="server" GroupName="SearchType"
                                                    Text="條碼掃描" AutoPostBack="True" />
                                            </td>
                                            <td align="right" colspan="2">

                                                <asp:RadioButton ID="RBSearch" runat="server" GroupName="SearchType"
                                                    Text="條件設定查詢" AutoPostBack="True" />
                                            </td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td width="150">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tManaulSearch" runat="server" style="table-layout: fixed; width: 600px">
                                        <tr>
                                            <td align="right" width="90">執行單位：</td>
                                            <td align="left" width="150">
                                                <asp:DropDownList ID="DDLWorkDep" runat="server" Width="144px"></asp:DropDownList></td>
                                            <td align="right" width="90">經費單位：</td>
                                            <td align="left" width="150">
                                                <asp:DropDownList ID="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:DropDownList></td>
                                            <td align="right" width="90">承辦人：</td>
                                            <td width="150">
                                                <asp:TextBox ID="TBAcmWorkUserNo" runat="server"
                                                    Width="120px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">動支編號：</td>
                                            <td width="150">
                                                <asp:TextBox ID="TBacmWordNum" runat="server" Width="120px"></asp:TextBox></td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td align="left" width="150">&nbsp;</td>
                                            <td align="right">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">計畫科目：</td>
                                            <td colspan="3">
                                                <asp:DropDownList ID="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td align="left" colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="90">用途別：</td>
                                            <td colspan="3">
                                                <asp:DropDownList ID="DDLOul" runat="server"
                                                    Width="300px" Height="16px">
                                                </asp:DropDownList></td>
                                            <td align="right" width="90">&nbsp;</td>
                                            <td align="left" colspan="3">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <table id="tBarCodeSearch" runat="server" style="table-layout: fixed; width: 600px">
                                        <tr>
                                            <td align="right" width="90">動支編號：</td>
                                            <td align="left" width="150">
                                                <asp:TextBox ID="TBAcmWordBarCode" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td align="right" width="80">&nbsp;
                                            </td>
                                            <td align="left" width="150">&nbsp;
                                            </td>
                                            <td align="right" width="90">&nbsp;
                                            </td>
                                            <td width="150">&nbsp;
                                            </td>
                                            <td>&nbsp;
                                            </td>
                                            <td>&nbsp;
                                            </td>
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
                                    <div id="MyDiv" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove; width: 950px; border-bottom: 1px groove; height: 200px" persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>">
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
                                                        <input id="ctl_CsmNo" runat="server" type="hidden" dbfieldname="csmNo" value='<%# Val(DataBinder.Eval(Container, "DataItem.csmNo") &"") %>' />
                                                        <input id="ctl_CsdNo" runat="server" type="hidden" dbfieldname="csdNo" value='<%# Val(DataBinder.Eval(Container, "DataItem.csdNo") &"") %>' />
                                                        <input id="ctl_CsmSourKeys" runat="server" type="hidden" dbfieldname="csmSourKeys" value='<%# DataBinder.Eval(Container, "DataItem.csmSourKeys") %>' />
                                                        <input id="ctl_ActKeys" runat="server" type="hidden" dbfieldname="actKeys" value='<%# DataBinder.Eval(Container, "DataItem.actKeys")  %>' />
                                                        <input id="ctl_AcmWordNum" runat="server" type="hidden" dbfieldname="acmWordNum" value='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' />
                                                        <input id="ctl_acmNo1" runat="server" type="hidden" dbfieldname="acmNo1" value='<%# Val(DataBinder.Eval(Container, "DataItem.acmNo1") &"") %>' />
                                                        <input id="ctl_acpPayNo" runat="server" type="hidden" dbfieldname="acpPayNo" value='<%# Val(DataBinder.Eval(Container, "DataItem.acpPayNo") &"") %>' />
                                                        <input id="ctl_csmOrderFlag" runat="server" type="hidden" dbfieldname="csmOrderFlag" value='<%# DataBinder.Eval(Container, "DataItem.csmOrderFlag")  %>' />
                                                        <asp:CheckBox ID="CBdgSelect" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="年度">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgCsmYear" runat="server" DBFiledName="acmYear" Text='<%# DataBinder.Eval(Container, "DataItem.CsmYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="動支編號">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") &"-"& DataBinder.Eval(Container, "DataItem.acmNo1") &"-"& DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="出差人員">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpTrlEmpName" runat="server" DBFiledName="acpTrlEmpName" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlEmpName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="出差開始日">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcdTrlDate" runat="server" DBFiledName="acdTrlDate" Text='<%# Format(DataBinder.Eval(Container, "DataItem.acdTrlDate"), "yyyy/MM/dd") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="出差結束日">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcdTrlEDate" runat="server" DBFiledName="acdTrlEDate" Text='<%# Format(DataBinder.Eval(Container, "DataItem.acdTrlEDate"), "yyyy/MM/dd") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="計畫名稱">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgPlanName" runat="server" DBFiledName="PlanName" Text='<%# DataBinder.Eval(Container, "DataItem.PlanName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="200px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用途別名稱">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgOulName" runat="server" DBFiledName="OulName" Text='<%# DataBinder.Eval(Container, "DataItem.OulName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="150px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="金額">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMoney" runat="server" DBFiledName="acvMoney" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="90px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="備註">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMemo" runat="server" DBFiledName="acvMemo" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label>
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
                                            <HeaderStyle Font-Size="X-Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7" CssClass="Freezing"
                                                BackColor="#4A3C8C"></HeaderStyle>
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="選取">
                                                    <HeaderStyle Font-Size="X-Small" Wrap="False" Width="20px"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="CBSelectAll2"
                                                            onclick="AllCheck('DataGrid2_,,CBdgSelect',this.checked);" runat="server"
                                                            ToolTip="打勾全選" Visible="false"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <input id="ctl_CsmNo" runat="server" type="hidden" dbfieldname="csmNo" value='<%# Val(DataBinder.Eval(Container, "DataItem.csmNo") &"") %>' />
                                                        <input id="ctl_CsdNo" runat="server" type="hidden" dbfieldname="csdNo" value='<%# Val(DataBinder.Eval(Container, "DataItem.csdNo") &"") %>' />
                                                        <input id="ctl_CsmSourKeys" runat="server" type="hidden" dbfieldname="csmSourKeys" value='<%# DataBinder.Eval(Container, "DataItem.csmSourKeys")  %>' />
                                                        <input id="ctl_ActKeys" runat="server" type="hidden" dbfieldname="actKeys" value='<%# DataBinder.Eval(Container, "DataItem.actKeys")  %>' />
                                                        <input id="ctl_AcmWordNum" runat="server" type="hidden" dbfieldname="acmWordNum" value='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' />
                                                        <input id="ctl_acmNo1" runat="server" type="hidden" dbfieldname="acmNo1" value='<%# Val(DataBinder.Eval(Container, "DataItem.acmNo1") &"") %>' />
                                                        <input id="ctl_acpPayNo" runat="server" type="hidden" dbfieldname="acpPayNo" value='<%# Val(DataBinder.Eval(Container, "DataItem.acpPayNo") &"") %>' />
                                                        <input id="ctl_csmOrderFlag" runat="server" type="hidden" dbfieldname="csmOrderFlag" value='<%# DataBinder.Eval(Container, "DataItem.csmOrderFlag")  %>' />
                                                        <asp:CheckBox ID="CBdgSelect" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="年度">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgcsmYear" runat="server" DBFiledName="csmYear"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>' ToolTip='<%# Eval("csdNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="動支編號">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmWordNum" runat="server"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") &"-"& DataBinder.Eval(Container, "DataItem.acmNo1") &"-"& DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="出差人員">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpTrlEmpName" runat="server" DBFiledName="acpTrlEmpName"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlEmpName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="出差開始日">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcdTrlDate" runat="server" DBFiledName="acdTrlDate" Text='<%# Format(DataBinder.Eval(Container, "DataItem.acdTrlDate"), "yyyy/MM/dd") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="出差結束日">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcdTrlEDate" runat="server" DBFiledName="acdTrlEDate" Text='<%# Format(DataBinder.Eval(Container, "DataItem.acdTrlEDate"), "yyyy/MM/dd") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="計畫名稱">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgPlanName" runat="server" DBFiledName="PlanName"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.PlanName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="200px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用途別名稱">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgOulName" runat="server" DBFiledName="OulName"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.OulName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="150px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="金額">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMoney" runat="server" DBFiledName="acvMoney"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="90px" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="備註">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMemo" runat="server" DBFiledName="acvMemo"
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label>
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
        </div>
    </form>
</body>
</html>
