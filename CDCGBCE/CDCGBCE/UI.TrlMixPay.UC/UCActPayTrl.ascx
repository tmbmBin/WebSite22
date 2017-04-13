<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayTrl.ascx.vb" Inherits="UI.TrlMixPay.UC.UCActPayTrl" %>
<table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 510px" border="0">
    <tr>
        <td>
            <!-- ↓折疊項目(12) -->
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
                                <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_11')">
                                    出差人員資料<font color="red" size="2pt">←請展開</font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FoldTitle_11" style="display: block" onpropertychange="sync_title_img(this)">
                    <td style="padding: 5px">
                        <table style="table-layout: fixed" border="0" cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="90px" align="right">
                                    部門名稱：
                                </td>
                                <td width="125px">
                                    <asp:TextBox ID="ctl_AcpTrlDepName" runat="server" 
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDepName"></asp:TextBox>
                                </td>
                                <td width="90px" align="right">
                                    出差人名：
                                </td>
                                <td  width="125px">
                                    <asp:TextBox ID="ctl_AcpTrlEmpName" runat="server" 
                                        Width="120px" Enabled="True" DBFieldName="acpTrlEmpName"></asp:TextBox>
                                </td>
                                <td width="90px" align="right">
                                    薪資代碼：
                                </td>
                                <td width="85px">
                                    <asp:TextBox ID="ctl_AcpTrlEmpCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlEmpCode") %>'
                                        Width="80px" Enabled="True" DBFieldName="acpTrlEmpCode"  onkeypress="javascript:NumberAndEngLetterOnly();"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="90px" align="right">
                                    職等名稱：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlRankLevelName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlArmyRankCode") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlRankLevelName"></asp:TextBox>
                                </td>
                                <td  width="90px" align="right">
                                    職稱名稱：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlRankName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlRankName") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlRankName"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="90px" align="right">
                                    出差天數：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlDateCount" onfocus="this.select()" Style="text-align: Right"
                                        onkeypress="javascript:NumberOnly();" MaxLength="3" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpTrlDateCount") &"")) %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDateCount" Visible="false" ></asp:TextBox>
                                        <asp:TextBox ID="ctl_AcpTrlDateMemo" runat="server" Text='<%#  DataBinder.Eval(Container, "DataItem.acpTrlDateMemo") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDateMemo"></asp:TextBox>
                                </td>
                                <td  width="90px" align="right">
                                    單據張數：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlBillCnt" onfocus="this.select()" Style="text-align: Right"
                                        onkeypress="javascript:NumberOnly();" MaxLength="2" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpTrlBillCnt") &"")) %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlBillCnt"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr style="display:black">
                                <td  width="90px" align="right">
                                    出差事由：
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="ctl_AcpTrlMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlMemo") %>'
                                        Width="500px" Enabled="True" DBFieldName="acpTrlMemo" Rows="3" 
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="display:black">
                                <td  width="90px" align="right">
                                    備註：</td>
                                <td colspan="5">
                                    <asp:TextBox ID="ctl_AcpTrlSubMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlSubMemo") %>'
                                        Width="500px" Enabled="True" DBFieldName="acpTrlSubMemo" Rows="3" 
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td  width="90px" align="right">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td  width="90px" align="right">
                                    差旅金額：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlMoney" onfocus="this.select()" Style="text-align: Right"
                                        onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};"
                                        onclick="this.value=replaceString(this.value,',',''); this.select();" MaxLength="8"
                                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpTrlMoney") &"")) %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlMoney"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td  width="90px" align="right">
                                    部門代碼：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlDepCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlDepCode") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlDepCode"></asp:TextBox>
                                </td>
                                <td align="right">
                                    職稱代碼：
                                </td>
                                <td>
                                    <asp:TextBox ID="ctl_AcpTrlRankCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlRankCode") %>'
                                        Width="120px" Enabled="True" DBFieldName="acpTrlRankCode"></asp:TextBox>
                                </td>
                                <td align="right">
                                    職級代碼：
                                </td>
                                <td>
                                    &nbsp;
                                    <asp:TextBox ID="ctl_AcpTrlRankLevelCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlRankLevelCode") %>'
                                        Width="35px" Enabled="True" DBFieldName="acpTrlRankLevelCode"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td>
                                </td>
                                <td colspan="4">
                                    <input id="ctl_AcmYear" type="hidden" runat="server" DBFieldName="acmYear" />
                                    <input id="ctl_AcmNo" type="hidden" runat="server" DBFieldName="acmNo" />
                                    <input id="ctl_AcmNo1" type="hidden" runat="server" DBFieldName="acmNo1" />
                                     <input id="ctl_AcmTrlNo" type="hidden" runat="server" DBFieldName="acmTrlNo" value="0" />
                                    <input id="ctl_AcpTrlNo" type="hidden" runat="server" DBFieldName="acpTrlNo" />
                                    <input id="ctl_AcpPayYear" type="hidden" runat="server" DBFieldName="acpPayYear" />
                                    <input id="ctl_AcpPayNo" type="hidden" runat="server" DBFieldName="acpPayNo" />
                                     <input id="ctl_AcpPayNoPrv" type="hidden" runat="server" DBFieldName="acpPayNoPrv" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        </tr></table>
