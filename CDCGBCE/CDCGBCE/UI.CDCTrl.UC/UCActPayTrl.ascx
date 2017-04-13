<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayTrl.ascx.vb" Inherits="UI.CDCTrl.UC.UCActPayTrl" %>
<table cellpadding="0" style="border-collapse: collapse; margin-top: -1px; width: 510px" border="0">
    <tr>
        <td>
            <!-- �����|����(12) -->
            <table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1"
                bordercolor="#FFFFFF">
                <tr>
                    <td height="20" class="sFoldTitle">
                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                            <tr>
                                <td width="1%" align="right">
                                    <img id="img_FoldTitle_11" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_11', this.id)"
                                        align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" />
                                </td>
                                <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_11')">�X�t�H�����<font color="red" size="2pt">���Юi�}</font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FoldTitle_11" style="display: block" onpropertychange="sync_title_img(this)">
                    <td style="padding: 5px">
                        <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="90px" align="right">�����W�١G
                                </td>
                                <td width="125px">
                                    <asp:TextBox ID="ctl_AcpTrlDepName" runat="server"
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDepName"></asp:TextBox>
                                </td>
                                <td width="90px" align="right">�X�t�H�W�G
                                </td>
                                <td width="125px">
                                    <asp:TextBox ID="ctl_AcpTrlEmpName" runat="server"
                                        Width="120px" Enabled="True" DBFieldName="acpTrlEmpName"></asp:TextBox>
                                </td>
                                <td width="90px" align="right">�~��N�X�G
                                </td>
                                <td width="85px">
                                    <asp:TextBox ID="ctl_AcpTrlEmpCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlEmpCode") %>'
                                        Width="80px" Enabled="True" DBFieldName="acpTrlEmpCode" onkeypress="javascript:NumberAndEngLetterOnly();"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="90px" align="right">¾���W�١G
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlRankLevelName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlArmyRankCode") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlRankLevelName"></asp:TextBox>
                                </td>
                                <td width="90px" align="right">¾�٦W�١G
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlRankName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlRankName") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlRankName"></asp:TextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="90px" align="right">�X�t�ѼơG
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlDateCount" onfocus="this.select()" Style="text-align: Right"
                                        onkeypress="javascript:NumberOnly();" MaxLength="3" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpTrlDateCount") &"")) %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDateCount" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="ctl_AcpTrlDateMemo" runat="server" Text='<%#  DataBinder.Eval(Container, "DataItem.acpTrlDateMemo")  %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDateMemo"></asp:TextBox>
                                </td>
                                <td width="90px" align="right">��ڱi�ơG
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlBillCnt" onfocus="this.select()" Style="text-align: Right"
                                        onkeypress="javascript:NumberOnly();" MaxLength="2" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpTrlBillCnt") &"")) %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlBillCnt"></asp:TextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr style="display: block">
                                <td width="90px" align="right">�X�t�ƥѡG
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="ctl_AcpTrlMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlMemo") %>'
                                        Width="500px" Enabled="True" DBFieldName="acpTrlMemo" Rows="3"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="display: block">
                                <td width="90px" align="right">�Ƶ��G</td>
                                <td colspan="5">
                                    <asp:TextBox ID="ctl_AcpTrlSubMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlSubMemo") %>'
                                        Width="500px" Enabled="True" DBFieldName="acpTrlSubMemo" Rows="3"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td width="90px" align="right">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td width="90px" align="right">�t�Ȫ��B�G
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlMoney" onfocus="this.select()" Style="text-align: Right"
                                        onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};"
                                        onclick="this.value=replaceString(this.value,',',''); this.select();" MaxLength="8"
                                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpTrlMoney") &"")) %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlMoney"></asp:TextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td width="90px" align="right">�����N�X�G
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlDepCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlDepCode") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDepCode"></asp:TextBox>
                                </td>
                                <td align="right">¾�٥N�X�G
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlRankCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlRankCode") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlRankCode"></asp:TextBox>
                                </td>
                                <td align="right">¾�ťN�X�G
                                </td>
                                <td>&nbsp;
                                    <asp:TextBox ID="ctl_AcpTrlRankLevelCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlRankLevelCode") %>'
                                        Width="35px" Enabled="True" DBFieldName="acpTrlRankLevelCode"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td></td>
                                <td colspan="4">
                                    <input id="ctl_AcmYear" type="hidden" runat="server" dbfieldname="acmYear" />
                                    <input id="ctl_AcmNo" type="hidden" runat="server" dbfieldname="acmNo" />
                                    <input id="ctl_AcmTrlNo" type="hidden" runat="server" dbfieldname="acmTrlNo" value="0" />
                                    <input id="ctl_AcpTrlNo" type="hidden" runat="server" dbfieldname="acpTrlNo" />
                                    <input id="ctl_AcpPayYear" type="hidden" runat="server" dbfieldname="acpPayYear" />
                                    <input id="ctl_AcpPayNo" type="hidden" runat="server" dbfieldname="acpPayNo" />
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
