<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayDtlTrl.ascx.vb" Inherits="UI.CDCTrl.UC.UCActPayDtlTrl" %>
<% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>

<table _ondblclick="alert('20:UCActPayDtlTrl.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%"
    border="0">
    <tr>
        <td>
            <!-- �����|����(20) -->
            <table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
                <tr>
                    <td height="20" class="sFoldTitle">
                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                            <tr>
                                <td width="1%" align="right">
                                    <img id="img_FoldTitle_20" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_20', this.id)"
                                        align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" />
                                </td>
                                <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_20')">�X�t���e<font color="red" size="2pt">���Юi�}</font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FoldTitle_20" style="display: block" onpropertychange="sync_title_img(this)">
                    <td style="padding: 5px">
                        <table cellpadding="5" cellspacing="0" style="table-layout: fixed" border="0">
                            <tr>
                                <td width="100" align="right">
                                    <img id="img20" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top"
                                        style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand"
                                            onclick='img20.fireEvent("onclick")'>�X�t���e</span>
                                </td>
                                <td width="100" align="right">�X�p�G</td>
                                <td width="100" align="right">
                                    <asp:TextBox ID="ctl_TrlTotalMoney" runat="server" Width="80px" BackColor="Transparent" onfocus="this.blur()" Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <div id="div_UCActPayVisa" class="DIV1_width" alt="DIV1">
                            <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server" />
                            <asp:GridView ID="GV_actPayDtlTrl" runat="server" BackColor="White" BorderColor="#999999"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True"
                                GridLines="Vertical" AutoGenerateColumns="False"
                                Font-Size="X-Small">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField HeaderText="�Ǹ�">
                                        <HeaderStyle Width="35px" />
                                        <ItemTemplate>
                                            <asp:Label ID="ctl_DataNo" runat="server" Text="<%#Container.DataItemIndex+1 %>" ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmYear") &":"& DataBinder.Eval(Container, "DataItem.acpTrlNo") &":"& DataBinder.Eval(Container, "DataItem.acdNo")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--20151229 [mdf]:�X�t�}�l��קאּ�X�t���--%>
                                    <asp:TemplateField HeaderText="�X�t���">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlDate" onfocus="this.select()" Style="text-align: center"
                                                onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                                                runat="server"
                                                Width="70px" Enabled='False' DBFieldName="acdTrlDate"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�ɶ�(��)" Visible="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlSTime" runat="server"
                                                Width="40px" Enabled="True" DBFieldName="acdTrlSTime"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="40px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�ɶ�(��)" Visible="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlETime" runat="server"
                                                Width="40px" Enabled="True" DBFieldName="acdTrlETime"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="40px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�a�I(�_)">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlAddrS" runat="server"
                                                Width="80px" Enabled="True" DBFieldName="acdTrlAddrS"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�a�I(��)">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlAddrE" runat="server"
                                                Width="80px" Enabled="True" DBFieldName="acdTrlAddrE"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�u�@���n">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdMemo" runat="server"
                                                Width="120px" Enabled="True" DBFieldName="acdMemo" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="����">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlTAir" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlTAir');"
                                                MaxLength="8"
                                                runat="server"
                                                Width="60px" Enabled="True" DBFieldName="acdTrlTAir"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="���K">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlThsrc" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlThsrc');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlThsrc"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�T��">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlTCar" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlTCar');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlTCar"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="���B">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlMetro" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlMetro');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlMetro"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="����">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlTRail" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value= fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlTRail');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlTRail"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="����">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlTBoats" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlTBoats');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlTBoats"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="��J�O">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlStay" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlStay');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlStay"></asp:TextBox><input id="btn_Stay" type="button" value="..." runat="server" onclick="fnCallStayDialog(this.id);" visible="false" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>

                                    <%-- <asp:TemplateField HeaderText="�����O">--%>
                                    <%--20150326 [mdf]:�����O�����O--%>
                                    <asp:TemplateField HeaderText="���O">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdTrlFMisce" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="text-align: Right"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};GetTotalTrlRowMoney(this.id,'ctl_AcdTrlFMisce');"
                                                MaxLength="8" runat="server" Width="60px" Enabled="True" DBFieldName="acdTrlFMisce"></asp:TextBox>
                                            <input id="btn_FMisce" type="button" value="..." runat="server" onclick="fnCallDailyFeeDialog(this.id);" visible="false" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�p�p">
                                        <ItemTemplate>
                                            <asp:TextBox ID="ctl_AcdMoney" onfocus="this.blur()" Style="text-align: Right" BackColor="#dadee9"
                                                onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value);};"
                                                onclick="this.value=replaceString(this.value,',',''); this.select();" MaxLength="8"
                                                runat="server" Width="60px" Enabled="True" DBFieldName="acdMoney"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="����">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ctl_Del" runat="server" />
                                            <input id="ctl_AcmYear" type="hidden" runat="server" dbfieldname="acmYear" />
                                            <input id="ctl_acmNo" type="hidden" runat="server" dbfieldname="acmNo" />
                                            <input id="ctl_acpPayYear" type="hidden" runat="server" dbfieldname="acpPayYear" />
                                            <input id="ctl_acpPayNo" type="hidden" runat="server" dbfieldname="acpPayNo" />
                                            <input id="ctl_AcpTrlNo" type="hidden" runat="server" dbfieldname="acpTrlNo" />
                                            <input id="ctl_AcdNo" type="hidden" runat="server" dbfieldname="acdNo" />
                                            <input id="ctl_AcmTrlNo" type="hidden" runat="server" dbfieldname="acmTrlNo" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="30px" Font-Size="XX-Small" ForeColor="#FF3300" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="DarkOrange" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </div>
                        <asp:Button ID="BtnAddRow" runat="server" Text="�W�[�C��" /><asp:TextBox ID="TBRowQty"
                            runat="server" Width="40px" ToolTip="���w�W�[�C��1~20�C" onkeypress="return check_Num()"
                            Style="text-align: center" Enabled="False">1</asp:TextBox><asp:CheckBox ID="CBCopyLastData"
                                runat="server" Font-Size="X-Small" Text="�ƻs�e�����"></asp:CheckBox>
                        <font style="font-size: x-small;">
                            <input  type="checkbox" id="HideDel_DG_actPayDtlTrl" runat="server" visible="false" />
                            <asp:Label Visible="false" ID="ctl_HideDelDataTxt" runat="server" Text="���ò����C"></asp:Label>
                        </font>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
