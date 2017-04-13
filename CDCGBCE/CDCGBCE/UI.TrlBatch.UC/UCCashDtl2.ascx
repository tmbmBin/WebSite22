<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCCashDtl2.ascx.vb"
    Inherits="UI.TrlBatch.UC.UCCashDtl2" %>
        <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
<div id="DivcashDtl2" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>);
    overflow: auto; border-left: 1px groove; width: 690px; border-bottom: 1px groove;
    height: 200px" scrollpos="<%= savescrollpos.value %>" persistid="<%= savescrollpos.uniqueid %>">
    <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server" />
    <asp:GridView ID="GV_cashDtl2" runat="server" BackColor="White" BorderColor="#999999"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True"
        GridLines="Vertical" AllowSorting="True" AutoGenerateColumns="False"
        Font-Size="X-Small">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="序號">
                <HeaderStyle Width="35px" />
                <ItemTemplate> 
                    <input id="ctl_CsmYear"         runat="server" type="hidden" dbfieldname="csmYear"       value='<%# Val(DataBinder.Eval(Container, "DataItem.csmYear") &"") %>' />
                    <input id="ctl_CsmNo"           runat="server" type="hidden" dbfieldname="csmNo"         value='<%# Val(DataBinder.Eval(Container, "DataItem.csmNo") &"") %>' />
                    <input id="ctl_CsdNo"           runat="server" type="hidden" dbfieldname="csdNo"         value='<%# Val(DataBinder.Eval(Container, "DataItem.csdNo") &"") %>' />
                    <input id="ctl_CsmSourKeys"     runat="server" type="hidden" dbfieldname="csmSourKeys"   value='<%# DataBinder.Eval(Container, "DataItem.csmSourKeys")  %>' />
                    <input id="ctl_ActKeys"         runat="server" type="hidden" dbfieldname="actKeys"       value='<%# DataBinder.Eval(Container, "DataItem.actKeys")  %>' />
                    <input id="ctl_AcmWordNum"      runat="server" type="hidden" dbfieldname="acmWordNum"    value='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' />                                                     
                    <input id="ctl_acmNo1"          runat="server" type="hidden" dbfieldname="acmNo1"        value='<%# Val(DataBinder.Eval(Container, "DataItem.acmNo1") &"") %>' />
                    <input id="ctl_acpPayNo"        runat="server" type="hidden" dbfieldname="acpPayNo"      value='<%# Val(DataBinder.Eval(Container, "DataItem.acpPayNo") &"") %>' />
                    <input id="ctl_csmOrderFlag"    runat="server" type="hidden" dbfieldname="csmOrderFlag"  value='<%# DataBinder.Eval(Container, "DataItem.csmOrderFlag")  %>' />
                     <input id="ctl_csdMoney"       runat="server" type="hidden" dbfieldname="csdMoney"      value='<%# DataBinder.Eval(Container, "DataItem.acvMoney")  %>' />
                    <asp:Label ID="ctl_DataNo"      runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="退件">
                <ItemTemplate>
                    <input id="ctl_CsmPassFlag"    runat="server" type="hidden" dbfieldname="csmPassFlag" value='<%# MyTools.StrTool.StringToBoolean(DataBinder.Eval(Container, "DataItem.csmPassFlag") &"")  %>' />
                    <asp:CheckBox ID="ctl_CsmRejectFlag" runat="server" DBFieldName="csmRejectFlag" Checked='<%#  MyTools.StrTool.StringToBoolean(DataBinder.Eval(Container, "DataItem.csmRejectFlag") &"") %>' />
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="核退原因">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_CsmRejectCause" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmRejectCause") %>'
                        Width="120px" Enabled="True" DBFieldName="csmRejectCause"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="動支編號">
                <ItemTemplate>
                    <asp:HyperLink Visible="false" ID="HLdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") &"-"& DataBinder.Eval(Container, "DataItem.acmNo1") &"-"& DataBinder.Eval(Container, "DataItem.acpPayNo")  %>'
                        NavigateUrl='<%# "javascript:OpenActData(" & Chr(39) & DataBinder.Eval(Container, "DataItem.acmWordNum") &"-"& DataBinder.Eval(Container, "DataItem.acmNo1") &"-"& DataBinder.Eval(Container, "DataItem.acpPayNo") & "-" & strModFlag &  Chr(39) & ");" %>' Width="80px" Enabled="True" ></asp:HyperLink>
                    <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'
                        Width="70px" Enabled="True"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="出差人名">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcpTrlEmpName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpTrlEmpName") %>'
                        Width="70px" Enabled="True" DBFieldName="acpTrlEmpName"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="70px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="金額">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcvMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney" , "{0:#,0}") %>'
                        Width="70px" Enabled="True" DBFieldName="acvMoney"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="70px" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="計畫名稱">
                <ItemTemplate>
                    <asp:Label ID="ctl_PlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PlanName") %>'
                        Width="120px" Enabled="True" DBFieldName="PlanName"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用途別">
                <ItemTemplate>
                    <asp:Label ID="ctl_OulName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.OulName") %>'
                        Width="120px" Enabled="True" DBFieldName="OulName"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用途說明">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvMemo"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="DarkOrange" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
</div>
