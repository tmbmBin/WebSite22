<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayeeDtl.ascx.vb"
    Inherits="UI.ActPayee.UC.UCActPayeeDtl" %>
<% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
<div id="DivactPayeeDtl" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove; width: 690px; border-bottom: 1px groove; height: 200px"
    scrollpos="<%= savescrollpos.value %>"
    persistid="<%= savescrollpos.uniqueid %>">
    <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server" />
    <asp:GridView ID="GV_actPayeeDtl" runat="server" BackColor="White" BorderColor="#999999"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True"
        GridLines="Vertical" AllowPaging="False" AllowSorting="True" AutoGenerateColumns="False"
        Font-Size="X-Small">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="序號">
                <HeaderStyle Width="40px" />
                <ItemTemplate>
                    <asp:Label ID="ctl_DataNo" runat="server" Text="<%#Container.DataItemIndex+1 %>" ToolTip='<%# Val(DataBinder.Eval(Container, "DataItem.acdNo") &"") %>'></asp:Label><input id="ctl_AceYear" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.aceYear") &"") %>' dbfieldname="aceYear" /><input id="ctl_AceNo" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.aceNo") &"") %>' dbfieldname="aceNo" /><input id="ctl_AcdNo" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acdNo") &"") %>' dbfieldname="acdNo" /><input id="ctl_AcnPayCode" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acnPayCode") &"") %>' dbfieldname="acnPayCode" /><input id="ctl_AcvOutlayYear" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acvOutlayYear") &"") %>' dbfieldname="acvOutlayYear" /></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="移除">
                <ItemTemplate>
                    <asp:CheckBox ID="ctl_Del" runat="server" /><input id="ctl_AcnInputSourFlag" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acnInputSourFlag") &"") %>' dbfieldname="acnInputSourFlag" /></ItemTemplate>
                <HeaderStyle Width="40px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="編輯" Visible="False">
                <ItemTemplate>
                    <asp:Button ID="ctl_Edit" runat="server" Text="編輯" OnClientClick='<%# "fnOpenActPayeeDtlForGrid("& DataBinder.Eval(Container, "DataItem.aceYear") &"," & DataBinder.Eval(Container, "DataItem.aceNo")  &"," & DataBinder.Eval(Container, "DataItem.acdNo") &");" %>' />
                    <%--2015.01.21 改用server元件，clinet元件修改後資料未更新<input id="ctl_Edit1"  type="button" value="編輯" runat="server" onclick='<%# "fnOpenActPayeeDtlForGrid("& DataBinder.Eval(Container, "DataItem.aceYear") &"," & DataBinder.Eval(Container, "DataItem.aceNo")  &"," & DataBinder.Eval(Container, "DataItem.acdNo") &");" %>' />--%>
                </ItemTemplate>
                <HeaderStyle Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="退件" Visible="False">
                <ItemTemplate>
                    <asp:CheckBox ID="ctl_acnRejectFlag" runat="server" DBFieldName="acnRejectFlag" Checked='<%# MyTools.BooleanTool.StringToBoolean( DataBinder.Eval(Container, "DataItem.acnRejectFlag") &"") %>' ToolTip='<%# Val( DataBinder.Eval(Container, "DataItem.acnRejectFlag") &"") %>' /></ItemTemplate>
                <HeaderStyle Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="退件原因" Visible="False">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_acnRejectMemo" runat="server" DBFieldName="acnRejectMemo" Text='<%# DataBinder.Eval(Container, "DataItem.acnRejectMemo") %>'></asp:TextBox></ItemTemplate>
                <HeaderStyle Width="40px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="員工代碼">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnEmpCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpCode") %>'
                        Width="60px" Enabled="True" DBFieldName="acnEmpCode" BackColor="Transparent"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="60px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工姓名">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnEmpName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnEmpName") %>'
                        Width="60px" DBFieldName="acnEmpName" BackColor="Transparent"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="60px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="銀行代碼">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnBankCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnBankCode") %>'
                        Width="40px" Enabled="True" DBFieldName="acnBankCode" BackColor="Transparent"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="分行代碼">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnBranchCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnBranchCode") %>'
                        Width="60px" Enabled="True" DBFieldName="acnBranchCode" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="60px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="金融機構名稱">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnBankName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnBankName") %>'
                        Width="100px" Enabled="True" DBFieldName="acnBankName" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="戶 名">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnDepositor" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepositor") %>'
                        Width="55px" Enabled="True" DBFieldName="acnDepositor" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="55px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="身分證號">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnPayID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnPayID") %>'
                        Width="80px" Enabled="True" DBFieldName="acnPayID" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="帳 號">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnDepositorNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepositorNo") %>'
                        Width="80px" Enabled="True" DBFieldName="acnDepositorNo" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="應付金額">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnMoney"
                        Style="text-align: Right" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                        MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acnMoney") &"")) %>'
                        Width="60px" Enabled="True" DBFieldName="acnMoney" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="60px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="部門名稱">
                <ItemTemplate>
                    <input id="ctl_AcnDepCode" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acnDepCode") &"") %>' dbfieldname="acnDepCode" />
                    <asp:Label ID="ctl_AcnDepName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnDepName") %>'
                        Width="80px" Enabled="True" DBFieldName="acnDepName" BackColor="Transparent" EnableViewState="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="計畫名稱">
                <ItemTemplate>
                    <input id="ctl_AcvPlanCode" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acvPlanCode") &"") %>' dbfieldname="acvPlanCode" /><asp:Label ID="ctl_AcvPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acvPlanName") %>' Width="120px" Enabled="True" DBFieldName="acvPlanName" BackColor="Transparent" EnableViewState="False"></asp:Label></ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用途別">
                <ItemTemplate>
                    <input id="ctl_AcvOutlayCode" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acvOutlayCode") &"") %>' dbfieldname="acvOutlayCode" enableviewstate="False" /><asp:Label ID="ctl_AcvOutlayName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayName") %>' Width="80px" Enabled="True" DBFieldName="acvOutlayName" BackColor="Transparent"></asp:Label></ItemTemplate>
                <HeaderStyle Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="費用種類">
                <ItemTemplate>
                    <input id="ctl_AcnSubKind" type="hidden" runat="server" value='<%# Val(DataBinder.Eval(Container, "DataItem.acnSubKind") &"") %>' dbfieldname="acnSubKind" enableviewstate="False" /><asp:Label ID="ctl_AcnSubKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnSubKindName") %>' Width="75px" Enabled="True" DBFieldName="acnSubKindName" BackColor="Transparent"></asp:Label></ItemTemplate>
                <HeaderStyle Width="75px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="備註">
                <ItemTemplate>
                    <asp:Label ID="ctl_AcnMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acnMemo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acnMemo") %>' Width="150px" Enabled="True" DBFieldName="acnMemo" BackColor="Transparent" EnableViewState="False"></asp:Label></ItemTemplate>
                <%--    <HeaderStyle Width="120px" />--%>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="DarkOrange" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
</div>

<input id="ctl_SessionID" type="hidden" runat="server" />


