<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmAccCode.aspx.vb" Inherits="UI.BasicData.Web.FrmAccCode" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>FrmAccCode</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <meta http-equiv="Pragma" content="No-cache">
    <script language="javascript">
		<!--

    function fnCallSearchDialog() {

        var strReturnVal = showModalDialog("FrmSortPlanDep.aspx?showtype=2", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        if (strReturnVal != "Cancel") {

            Form1.TBFindSql.value = strReturnVal;
        }

        //Form1.TBFindSql.value=strReturnVal;

    }


    function Mark(setObj, PrvFlag) {
        try {
            var Val = "";
            if (typeof (setObj) == "string") setObj = document.all[setObj];
            if (setObj.selectedIndex >= 0)
                Val = setObj.options[setObj.selectedIndex].value;
            for (var i = 0; i < setObj.options.length; i++)
                if (PrvFlag) {
                    if (Val.indexOf(setObj.options[i].value) == 0)
                        setObj.options[i].selected = true;
                }
                else
                    if (setObj.options[i].value.indexOf(Val) == 0)
                        setObj.options[i].selected = true;
        } catch (e) {; }
    }


    function go_left_top() {
        gift.style.left = document.body.scrollLeft;
        gift.style.top = document.body.scrollTop;
    }
    //-->

    </script>
</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668"
            cellpadding="0" width="600" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td>
                                <table style="table-layout: fixed" cellpadding="1" width="100%" border="0">
                                    <tr>
                                        <td valign="bottom" align="left"></td>
                                        <td valign="bottom" align="left"></td>
                                        <td valign="bottom" align="left"></td>
                                        <td valign="bottom" align="left"></td>
                                        <td valign="bottom" align="left"></td>
                                        <td valign="bottom" align="right"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="2" width="100%" border="0">
                                    <tr>
                                        <td style="width: 132px" valign="bottom" align="right">�����W��</td>
                                        <td valign="bottom" align="left">
                                            <asp:DropDownList ID="DDLDep" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 132px" valign="bottom" align="right">�p�e�W��</td>
                                        <td valign="bottom" align="left">
                                            <asp:DropDownList ID="DDLPlan" runat="server" AutoPostBack="True" Width="530px"></asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td style="width: 275px" valign="bottom" align="center"><font size="2">�w����</font></td>
                                        <td style="width: 50px" valign="bottom" align="left"></td>
                                        <td style="width: 275px" valign="bottom" align="center"><font size="2">�i����</font></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                                            <div style="margin-top: 0px; overflow-y: scroll; margin-left: 10px; width: 275px; height: 300px">
                                                <asp:DataGrid ID="DGSelect" runat="server" ForeColor="Black" GridLines="None" CellPadding="2"
                                                    BackColor="LightGoldenrodYellow" BorderWidth="1px" BorderColor="Tan" Width="250px" AutoGenerateColumns="False">
                                                    <FooterStyle BackColor="Tan"></FooterStyle>
                                                    <SelectedItemStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedItemStyle>
                                                    <AlternatingItemStyle Font-Size="X-Small" BackColor="PaleGoldenrod"></AlternatingItemStyle>
                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <HeaderStyle Font-Size="X-Small" Font-Bold="True" BackColor="Tan"></HeaderStyle>
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <HeaderStyle Width="25px"></HeaderStyle>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBSelect" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="oulOutlayName" SortExpression="oulOutlayName" HeaderText="�γ~�O���"></asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="accOutlayCode" SortExpression="accOutlayCode" HeaderText="�γ~�O�N�X"></asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="����">
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBStop" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn Visible="False" DataField="accCreateDate" SortExpression="accCreateDate" HeaderText="�إߤ��"></asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="accStopDate" SortExpression="accStopDate" HeaderText="���Τ��"></asp:BoundColumn>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkSlateBlue" BackColor="PaleGoldenrod" PageButtonCount="5"></PagerStyle>
                                                </asp:DataGrid>
                                            </div>
                                        </td>
                                        <td valign="middle" align="center">
                                            <asp:Button ID="BtnSelectAll" runat="server" Height="22px" Text="<<" ToolTip="�[�J��������" Width="50px"></asp:Button><br>
                                            <br>
                                            <asp:Button ID="BtnSelect" runat="server" Height="22px" Text="<" ToolTip="�[�J��ܶ���" Width="50px"></asp:Button><br>
                                            <br>
                                            <asp:Button ID="BtnRemove" runat="server" Height="22px" Text=">" ToolTip="������ܶ���" Width="50px"></asp:Button><br>
                                            <br>
                                            <asp:Button ID="BtnRemoveall" runat="server" Height="22px" Text=">>" ToolTip="������������" Width="50px"></asp:Button></td>
                                        <td valign="top" align="left">
                                            <div style="margin-top: 0px; overflow-y: scroll; margin-left: 10px; width: 275px; height: 300px">
                                                <asp:DataGrid ID="DGUnSelect" runat="server" GridLines="Horizontal" CellPadding="3" BackColor="White"
                                                    BorderWidth="1px" BorderColor="#E7E7FF" Width="250px" BorderStyle="None" AutoGenerateColumns="False">
                                                    <FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                                                    <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
                                                    <AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
                                                    <ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
                                                    <HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <HeaderStyle Width="25px"></HeaderStyle>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CBUnSelect" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="oulOutlayName" SortExpression="oulOutlayName" HeaderText="�γ~�O���">
                                                            <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                                                            <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn Visible="False" DataField="oulOutlayCode" SortExpression="oulOutlayCode" HeaderText="�γ~�O�N�X"></asp:BoundColumn>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="bottom" align="right">
                                            <input id="BtnSelectedDown" onclick="Mark(LBSelect);" type="button" value="��U�h" name="BtnSelectedDown"
                                                runat="server">
                                            <input id="BtnSelectedUp" onclick="Mark(LBSelect, true);" type="button" value="��W�h" name="BtnSelectedUp"
                                                runat="server"></td>
                                        <td valign="bottom" align="left"><font face="�s�ө���"></font></td>
                                        <td valign="bottom" align="left">
                                            <input id="BtnUnSelectUp" onclick="Mark(LBUnSelect, true);" type="button" value="��W�h" name="BtnUnSelectUp"
                                                runat="server">
                                            <input id="BtnUnSelectDown" onclick="Mark(LBUnSelect);" type="button" value="��U�h" name="BtnUnSelectDown"
                                                runat="server">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="5" width="100%"
                        border="1">
                        <tr>
                            <td valign="bottom" align="left">
                                <table cellpadding="1" border="0">
                                    <tr>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnAdd" runat="server" Height="22" Text="�s�W"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnEdit" runat="server" Height="22" Text="�ק�"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnDelete" runat="server" Height="22" Text="�R��"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSave" runat="server" Height="22" Text="�x�s"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnCancel" runat="server" Height="22" Text="����"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSearch" runat="server" Height="22" Text="�d��"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnPrint" runat="server" Height="22" Text="�C�L"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnExit" runat="server" Height="22" Text="���}"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <input id="TBFindSql" style="width: 56px; height: 22px" type="hidden" size="4" name="TBFindSql"
                                                runat="server"><asp:Button ID="BtnImport" runat="server" Height="22" Text="�פJ" ToolTip="�פJ�W�~�׸��"></asp:Button></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
                                        BackColor="#003366"></HeaderStyle>
                                    <Columns>
                                        <asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select">
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:ButtonColumn>
                                        <asp:BoundColumn DataField="dptName" SortExpression="dptName" HeaderText="���W��">
                                            <HeaderStyle Width="200px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="plnPlanName" SortExpression="plnPlanName" HeaderText="�p�e�W��"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="accDepCode" SortExpression="accTeaCode" HeaderText="�����N�X">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="accCodeVer" SortExpression="accCodeVer" HeaderText="��ئ~�קO"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="accPlanCode" SortExpression="accPlanCode" HeaderText="�p�e�N�X">
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:BoundColumn>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
