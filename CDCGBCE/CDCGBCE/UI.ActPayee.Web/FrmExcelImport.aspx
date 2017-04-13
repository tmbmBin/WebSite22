<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmExcelImport.aspx.vb" Inherits="UI.ActPayee.Web.FrmExcelImport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <script language="javascript" src="../ScriptFiles/setAllCtrl.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSInputCheck.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSNumFun.js"></script>
    <script type="text/javascript" language="javascript" src="../ScriptFiles/JSStrFun.js"></script>
    <script type="text/javascript" language="javascript" src="../UI.ActPayee.UC/ScriptFiles/UCActPayeeDtlEdit.js"></script>
    <script language="javascript">
        function checkAll(alt) {

            var a = document.getElementsByTagName("input");
            var n = a.length;
            alert(n);
            alert(a[100].getAttribute("MyName"));
            alert(a[100].name);
            for (var i = 0; i < n; i++)
                if (a[i].type == "checkbox" && a[i].getAttribute("MyName") == alt && a[i].disabled != true) {
                    a[i].checked = window.event.srcElement.checked;
                }
        }
        function btnOK_onclick() {

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <input id="TBRawDataGUIDKey" type="hidden" runat="server" />

        <input id="TBSessionKey" type="hidden" runat="server" />

        <table id="Table1" runat="server" style="display: block; border-collapse: collapse; border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" cellpadding="5" width="600" bgcolor="#dadee9">
            <tr>
                <td>
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td style="text-align: center">
                                <asp:Label ID="lbUnitTitle" runat="server" Font-Bold="True" Style="font-size: 20px; color: Blue">檔案資料匯入</asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>科目設定</legend>
                                    <table style="border-collapse: collapse; table-layout: fixed" border="0" width="100%">
                                        <tr>
                                            <td style="width: 100px; text-align: right">計畫名稱：</td>
                                            <td colspan="3">
                                                <asp:DropDownList ID="DDLPlanName" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; text-align: right">用途別：</td>
                                            <td>
                                                <asp:DropDownList ID="ctl_AcvOutlayCode" runat="server" onChange="RelOulAcnSubKind(this);"></asp:DropDownList></td>
                                            <td style="width: 100px; text-align: right">費用種類：</td>
                                            <td>
                                                <asp:DropDownList ID="ctl_acnSubKind" runat="server"></asp:DropDownList></td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>選取上傳資料</legend>
                                    <table style="border-collapse: collapse; table-layout: fixed" border="0" width="100%">
                                        <tr>
                                            <td width="100px" align="right">檔案格式：</td>
                                            <td width="">
                                                <asp:DropDownList ID="DDLExcelVersion" runat="server">
                                                    <asp:ListItem Value="1">薪資系統匯出格式</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">檔案名稱：</td>
                                            <td>
                                                <asp:FileUpload ID="fuFile" runat="server" Width="300px" />
                                                <asp:Button ID="btnUpload" runat="server" Text="上傳" Height="20px"
                                                    Width="50px" />
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td align="right">檔案路徑：</td>
                                            <td>
                                                <asp:Label ID="lbFilePath" runat="server" ForeColor="red" Font-Size="8pt"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="right">工作表：</td>
                                            <td>
                                                <asp:DropDownList ID="ddl_WorkSheet" runat="server"></asp:DropDownList>
                                                <asp:Label ID="Message" runat="server" EnableViewState="false" Font-Size="12pt"
                                                    ForeColor="#FF9900"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right">&nbsp;</td>
                                            <td>
                                                <asp:CheckBox ID="ctl_DelSelectData" runat="server" Text="上傳時清除已選資料區資料"
                                                    Visible="False" />
                                            </td>
                                        </tr>

                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <table id="Table2" runat="server" style="display: none; border-collapse: collapse; border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
            cellpadding="5" width="800" bgcolor="#dadee9">
            <tr>
                <td>
                    <table style="display: none; border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td style="text-align: center">
                                <fieldset>
                                    <legend>待選資料</legend>
                                    <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow"
                                        BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                        EnableModelValidation="True" GridLines="None"
                                        AutoGenerateColumns="False" ForeColor="Black">
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="ctl_SelectAll" runat="server" name="c1" onclick="AllCheck('GridView1_,,ctl_Select',this.checked);" ToolTip="打勾全選" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="ctl_Select" runat="server" MyName="c1" /><input id="ctl_AutoDataNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.AutoDataNo") %>' dbfieldname="AutoDataNo" /><input id="ctl_AceYear" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.aceYear") %>' dbfieldname="aceYear" /><input id="ctl_AceNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.aceNo") %>' dbfieldname="aceNo" /><input id="ctl_acdNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.acdNo") %>' dbfieldname="acdNo" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="員工代碼">
                                                <ItemTemplate>
                                                    <asp:Label ID="ctl_acnEmpCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpCode")  %>' DBFieldName="acnEmpCode"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="員工姓名">
                                                <ItemTemplate>
                                                    <asp:Label ID="ctl_acnEmpName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpName") %>' DBFieldName="acnEmpName"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="部門名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="ctl_AcnDepName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepName")  %>' DBFieldName="acnDepName"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="金額">
                                                <ItemTemplate>
                                                    <asp:Label ID="ctl_AcnMoneny" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnMoney") %>' DBFieldName="acnMoney"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="銀行帳號">
                                                <ItemTemplate>
                                                    <asp:Label ID="ctl_AcnDepositorNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepositorNo")  %>' DBFieldName="acnDepositorNo"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="計畫名稱">
                                                <ItemTemplate>
                                                    <input id="ctl_acvOutlayYear" type="hidden" runat="server" dbfieldname="acvOutlayYear" value='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear")  %>' />
                                                    <input id="ctl_acvPlanCode" type="hidden" runat="server" dbfieldname="acvPlanCode" value='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode")  %>' />
                                                    <asp:Label ID="ctl_AcvPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanName")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="用途別名稱">
                                                <ItemTemplate>
                                                    <input id="ctl_acvOutlayCode" type="hidden" runat="server" dbfieldname="acvOutlayCode" value='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode")  %>' />
                                                    <asp:Label ID="ctl_AcvOutlayName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayName")  %>' onChange="RelOulAcnSubKind(this);"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="人員種類">
                                                <ItemTemplate>
                                                    <input id="ctl_acnPayKind" type="hidden" runat="server" dbfieldname="acnPayKind" value='<%# DataBinder.Eval(Container, "DataItem.acnPayKind")  %>' />
                                                    <asp:Label ID="ctl_acnPayKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnPayKindName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="費用種類">
                                                <ItemTemplate>
                                                    <input id="ctl_acnSubKind" type="hidden" runat="server" dbfieldname="acnSubKind" value='<%# DataBinder.Eval(Container, "DataItem.acnSubKind")  %>' />
                                                    <asp:Label ID="ctl_acnSubKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnSubKindName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="Tan" />
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue"
                                            HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    </asp:GridView>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="table-layout: fixed;" border="0">
                                    <tr>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td colspan="5">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px">&nbsp;</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px">&nbsp;</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td colspan="5">
                                            <asp:DropDownList ID="ctl_acnPayKind" runat="server" Visible="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
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
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="BtnSave" runat="server" Text="傳回選取資料" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>已選資料</legend>
                                    <table style="border-collapse: collapse; table-layout: fixed" border="0" width="100%">
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            <asp:GridView ID="GridView2" runat="server" BackColor="LightGoldenrodYellow"
                                                BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                                EnableModelValidation="True" GridLines="None"
                                                AutoGenerateColumns="False" ForeColor="Black">
                                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="ctl_SelectAll" runat="server" name="c1"
                                                                onclick="AllCheck('GridView1_,,ctl_Select',this.checked);" ToolTip="打勾全選" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="ctl_Select" runat="server" MyName="c1" />
                                                            <input id="ctl_AutoDataNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.AutoDataNo") %>' dbfieldname="AutoDataNo" />
                                                            <input id="ctl_AceYear" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.aceYear") %>' dbfieldname="aceYear" />
                                                            <input id="ctl_AceNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.aceNo") %>' dbfieldname="aceNo" />
                                                            <input id="ctl_acdNo" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.acdNo") %>' dbfieldname="acdNo" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="員工代碼">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_acnEmpCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpCode")  %>' DBFieldName="acnEmpCode"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="員工姓名">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_acnEmpName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpName") %>'
                                                                DBFieldName="acnEmpName"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="部門名稱">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcnDepName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acnDepName")  %>'
                                                                DBFieldName="acnDepName"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="金額">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcnMoneny" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acnMoney") %>'
                                                                DBFieldName="acnMoney"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="銀行帳號">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ctl_AcnDepositorNo" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acnDepositorNo")  %>'
                                                                DBFieldName="acnDepositorNo"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="計畫名稱">
                                                        <ItemTemplate>
                                                            <input id="ctl_acvOutlayYear" type="hidden" runat="server" dbfieldname="acvOutlayYear" value='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear")  %>' />
                                                            <input id="ctl_acvPlanCode" type="hidden" runat="server" dbfieldname="acvPlanCode" value='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode")  %>' />
                                                            <asp:Label ID="ctl_AcvPlanName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanName")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="用途別名稱">
                                                        <ItemTemplate>
                                                            <input id="ctl_acvOutlayCode" type="hidden" runat="server" dbfieldname="acvOutlayCode" value='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode")  %>' />
                                                            <asp:Label ID="ctl_AcvOutlayName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayName")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="人員種類">
                                                        <ItemTemplate>
                                                            <input id="ctl_acnPayKind" type="hidden" runat="server" dbfieldname="acnPayKind" value='<%# DataBinder.Eval(Container, "DataItem.acnPayKind")  %>' />
                                                            <asp:Label ID="ctl_acnPayKindName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acnPayKindName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="費用種類">
                                                        <ItemTemplate>
                                                            <input id="ctl_acnSubKind" type="hidden" runat="server" dbfieldname="acnSubKind" value='<%# DataBinder.Eval(Container, "DataItem.acnSubKind")  %>' />
                                                            <asp:Label ID="ctl_acnSubKindName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container, "DataItem.acnSubKindName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="Tan" />
                                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
