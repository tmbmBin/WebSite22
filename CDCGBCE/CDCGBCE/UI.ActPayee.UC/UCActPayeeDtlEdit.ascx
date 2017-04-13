<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayeeDtlEdit.ascx.vb"
    Inherits="UI.ActPayee.UC.UCActPayeeDtlEdit" %>
<table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse"
    bordercolor="#666668" cellpadding="5" width="650" bgcolor="#dadee9" border="1">
    <tr>
        <td>
            <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff"
                cellpadding="1" width="100%" border="1">
                <tr>
                    <td>
                        <table style="border-collapse: collapse" width="100%" border="0" cellpadding="1"
                            cellspacing="0">
                            <tr>
                                <td>
                                    <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="100%">
                                        <tr>
                                            <td width="90px" align="right">
                                                年度：
                                            </td>
                                            <td width="110px" align="left">
                                                <asp:TextBox ID="ctl_AceYear" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                                                    onkeypress="javascript:NumberOnly();" MaxLength="2" runat="server" Text='<%# Val(DataBinder.Eval(Container, "DataItem.aceYear") &"") %>'
                                                    Width="100px" Enabled="True" DBFieldName="aceYear"></asp:TextBox>
                                            </td>
                                            <td width="90px" align="right">
                                                流水號：
                                            </td>
                                            <td width="110px" align="left">
                                                <asp:TextBox ID="ctl_AceNo" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                                                    runat="server" Text='<%# Val(DataBinder.Eval(Container, "DataItem.aceNo") &"") %>'
                                                    Width="100px" Enabled="True" DBFieldName="aceNo"></asp:TextBox>
                                            </td>
                                            <td width="90px" align="right">
                                                明細號：
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="ctl_AcdNo" Style="text-align: center" onfocus="this.blur();" BackColor="Transparent"
                                                    runat="server" Text='<%#  Val(DataBinder.Eval(Container, "DataItem.acdNo") &"")  %>'
                                                    Width="100px" Enabled="True" DBFieldName="acdNo"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; text-align: center; background-color: Green" colspan="6">
                                                員工資訊
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="90px" align="right">
                                                薪資代碼：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ctl_AcnEmpCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpCode") %>'
                                                    Width="75px" Enabled="True" DBFieldName="acnEmpCode"></asp:TextBox>
                                                <asp:Button ID="btnSearch" runat="server" Text="..." 
                                                    ToolTip="查詢左邊輸入的員工代碼相關資訊" Width="20px" />
                                            </td>
                                            <td width="90px" align="right">員工姓名：</td>
                                            <td>
                                                <asp:TextBox ID="ctl_AcnEmpName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpName") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnEmpName"></asp:TextBox>
                                            </td>
                                            <td align="right">部門名稱：</td>
                                            <td>
                                                <asp:DropDownList ID="ctl_AcnDepCode" runat="server" DBFieldName="acnDepCode" Width="110px"
                                                    Enabled="True">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="90px" align="right">電子信箱：</td>
                                            <td colspan="3">
                                            <asp:TextBox ID="ctl_acnEMail" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEMail") %>'
                                                    Width="299px" Enabled="True" DBFieldName="acnEMail"></asp:TextBox></td>
                                                    <td>
                                                &nbsp;</td>
                                            <td width="90px" align="right">
                                                &nbsp;</td>

                                        </tr>
                                        <tr>
                                            <td style="width: 100px; text-align: center; background-color: Green" colspan="6">
                                                受款人資訊
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">
                                                總行代碼：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ctl_AcnBankCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnBankCode") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnBankCode"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                分行代碼：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ctl_AcnBranchCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnBranchCode") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnBranchCode"></asp:TextBox>
                                            </td>
                                            <td width="100px" align="right">銀行帳號：</td>
                                            <td><asp:TextBox ID="ctl_AcnDepositorNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepositorNo") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnDepositorNo" Height="19px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">銀行名稱：</td>
                                            <td><asp:TextBox ID="ctl_AcnBankName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnBankName") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnBankName"></asp:TextBox>
                                            </td>
                                            <td width="100px" align="right">
                                                
                                                身分證號：</td>
                                            <td>
                                               
                                                <asp:TextBox ID="ctl_AcnPayID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnPayID") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnPayID"></asp:TextBox>
                                               
                                            </td>
                                            <td align="right">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/UI.ActPayee.Web/images/info_icon.png"
                                                    ToolTip="戶名如果跟員工姓名一致可以不用輸入。" />
                                                戶名：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ctl_AcnDepositor" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepositor") %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnDepositor"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">
                                                &nbsp;應付金額：</td>
                                            <td>
                                                <asp:TextBox ID="ctl_AcnMoney" onfocus="this.value=replaceString(this.value,',','');this.select()"
                                                    Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                                                    MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acnMoney") &"")) %>'
                                                    Width="100px" Enabled="True" DBFieldName="acnMoney"></asp:TextBox>
                                            </td>
                                            <td width="100px" align="right">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td align="right">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <input id="ctl_AcnPayCode" runat="server" type="hidden" value='<%# DataBinder.Eval(Container, "DataItem.acnPayCode") %>' DBFieldName="acnPayCode" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; text-align: center; background-color: Green" colspan="6">
                                                會計科目
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">
                                                計畫名稱：
                                            </td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="ctl_AcvPlanCode" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">
                                                用途別：
                                            </td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="ctl_AcvOutlayCode" runat="server" onChange="RelOulAcnSubKind(this);">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; text-align: center; background-color: Green" colspan="6">
                                                其他資訊
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">
                                                費用種類：
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ctl_AcnSubKind" runat="server" Width="100px" Enabled="True"
                                                    DBFieldName="acnSubKind">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ctl_AcnPayKind" runat="server" DBFieldName="acnPayKind" Width="110px"
                                                    Enabled="True" Visible="False">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100px" align="right">
                                                備註：
                                            </td>
                                            <td colspan="5">
                                                <asp:TextBox ID="ctl_AcnMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnMemo") %>'
                                                    Width="510px" Enabled="True" DBFieldName="acnMemo"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="border-collapse: collapse" width="100%" border="0" cellpadding="1"
                            cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Button ID="BtnSave" runat="server" Height="22" Text="確認變更資料" />
                                    <asp:Button ID="BtnSaveAndAdd" runat="server" Height="22" Text="存檔後繼續新增" />
                                </td>
                            </tr>
                            </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input id="ctl_acnInputSourFlag" runat="server" type="hidden" DBFieldName="acnInputSourFlag" value='<%# DataBinder.Eval(Container, "DataItem.acnInputSourFlag") %>'/>