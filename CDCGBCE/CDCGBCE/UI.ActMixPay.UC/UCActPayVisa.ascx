<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayVisa.ascx.vb"
    Inherits="UI.ActMixPay.UC.UCActPayVisa" %>
<% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
<div id="DivactPayVisa" style="border-right: 1px groove; border-top: 1px groove;
    behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove;
    width: 690px; border-bottom: 1px groove; height: 200px" scrollpos="<%= savescrollpos.value %>"
    persistid="<%= savescrollpos.uniqueid %>">
    <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server" />
    <asp:GridView ID="GV_actPayVisa" runat="server" BackColor="White" BorderColor="#999999"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True"
        GridLines="Vertical" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
        Font-Size="Small">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="序號">
                <HeaderStyle Width="35px" />
                <ItemTemplate>
                    <asp:Label ID="ctl_DataNo" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acmNo2">
                <ItemTemplate>
                        <input id="ctl_AcmYear" runat="server" type="hidden" DBFieldName="acmYear" />
                        <input id="ctl_AcmNo" runat="server" type="hidden" DBFieldName="acmNo" />
                        <input id="ctl_AcvNo" runat="server" type="hidden" DBFieldName="acvNo" />
                        <input id="ctl_AcmNo1" runat="server" type="hidden" DBFieldName="acmNo1" />
                        <input id="ctl_AcvNo1" runat="server" type="hidden" DBFieldName="acvNo2" />
                        <input id="ctl_AcmNo2" runat="server" type="hidden" DBFieldName="acmNo2" />
                        <input id="ctl_AcvNo2" runat="server" type="hidden" DBFieldName="acvNo2" />
                        <input id="ctl_AcpPayYear" runat="server" type="hidden" DBFieldName="acpPayYear" />
                        <input id="ctl_AcpPayNoPrv" runat="server" type="hidden" DBFieldName="acpPayNoPrv" />
                        <input id="ctl_AcvMixPayGrpNo" runat="server" type="hidden" DBFieldName="acvMixPayGrpNo" />
                        <input id="ctl_AcmNoPrv" runat="server" type="hidden" DBFieldName="acmNoPrv" />
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>          
            <asp:TemplateField HeaderText="acvPlanCode">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPlanCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode") %>'
                        Width="120px" Enabled="True" DBFieldName="acvPlanCode"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvOutlayYear">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvOutlayYear" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:NumberOnly();" MaxLength="2"
                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvOutlayYear") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvOutlayYear"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvOutlayCode">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvOutlayCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>'
                        Width="120px" Enabled="True" DBFieldName="acvOutlayCode"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvBgtSourceCode">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvBgtSourceCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtSourceCode") %>'
                        Width="120px" Enabled="True" DBFieldName="acvBgtSourceCode"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvAccKind">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvAccKind" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvAccKind") %>'
                        Width="120px" Enabled="True" DBFieldName="acvAccKind"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvBizCode">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvBizCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvBizCode") %>'
                        Width="120px" Enabled="True" DBFieldName="acvBizCode"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvPrePayFlag">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPrePayFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPrePayFlag") %>'
                        Width="120px" Enabled="True" DBFieldName="acvPrePayFlag"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvVisaMoney">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvVisaMoney" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                        MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvVisaMoney") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvVisaMoney"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvMoney">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvMoney" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                        MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvMoney") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvMoney"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvDateMemo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvDateMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvDateMemo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvDateMemo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvMemo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvMemo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvFinalKind">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvFinalKind" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvFinalKind") %>'
                        Width="120px" Enabled="True" DBFieldName="acvFinalKind"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvFinalDate">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvFinalDate" onfocus="this.select()" Style="text-align: center"
                        onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                        runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acvFinalDate")  &"" ) %>'
                        Width="120px" Enabled="True" DBFieldName="acvFinalDate"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvAdjustMoney">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvAdjustMoney" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                        MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvAdjustMoney") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvAdjustMoney"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvTranID">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvTranID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvTranID") %>'
                        Width="120px" Enabled="True" DBFieldName="acvTranID"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvTranBNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvTranBNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvTranBNo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvTranBNo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvTranDTime">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvTranDTime" onfocus="this.select()" Style="text-align: center"
                        onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                        runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acvTranDTime")  &"" ) %>'
                        Width="120px" Enabled="True" DBFieldName="acvTranDTime"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvTranUser">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvTranUser" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvTranUser") %>'
                        Width="120px" Enabled="True" DBFieldName="acvTranUser"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvExchNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvExchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvExchNo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvExchNo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvPassMoney">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPassMoney" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                        MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvPassMoney") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvPassMoney"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvPassAdjustMoney">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPassAdjustMoney" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:MoneyOnly();" onblur="if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"
                        MaxLength="8" runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvPassAdjustMoney") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvPassAdjustMoney"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="inspect">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_Inspect" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.inspect") %>'
                        Width="120px" Enabled="True" DBFieldName="inspect"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FK_VisaNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_FK_VisaNo" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:NumberOnly();" MaxLength="4"
                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.FK_VisaNo") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="FK_VisaNo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FK_DetailNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_FK_DetailNo" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:NumberOnly();" MaxLength="4"
                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.FK_DetailNo") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="FK_DetailNo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvBgtDepCode">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvBgtDepCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtDepCode") %>'
                        Width="120px" Enabled="True" DBFieldName="acvBgtDepCode"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvAccPayFlag">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvAccPayFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvAccPayFlag") %>'
                        Width="120px" Enabled="True" DBFieldName="acvAccPayFlag"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvAccPayDate">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvAccPayDate" onfocus="this.select()" Style="text-align: center"
                        onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                        runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acvAccPayDate")  &"" ) %>'
                        Width="120px" Enabled="True" DBFieldName="acvAccPayDate"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvPlanCateCode">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPlanCateCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCateCode") %>'
                        Width="120px" Enabled="True" DBFieldName="acvPlanCateCode"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvCostKind">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvCostKind" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvCostKind") %>'
                        Width="120px" Enabled="True" DBFieldName="acvCostKind"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvWTranID">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvWTranID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranID") %>'
                        Width="120px" Enabled="True" DBFieldName="acvWTranID"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvWTranBNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvWTranBNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranBNo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvWTranBNo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvWTranDTime">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvWTranDTime" onfocus="this.select()" Style="text-align: center"
                        onkeypress="javascript:DateOnly();" ondblclick="javascript:document.all.MyCalendar.Open(this.id); "
                        runat="server" Text='<%# MyTools.DateTool.WDateToCDate(DataBinder.Eval(Container, "DataItem.acvWTranDTime")  &"" ) %>'
                        Width="120px" Enabled="True" DBFieldName="acvWTranDTime"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvWTranUser">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvWTranUser" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranUser") %>'
                        Width="120px" Enabled="True" DBFieldName="acvWTranUser"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvWExchNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvWExchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>'
                        Width="120px" Enabled="True" DBFieldName="acvWExchNo"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvBgtKindSet">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvBgtKindSet" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvBgtKindSet") %>'
                        Width="120px" Enabled="True" DBFieldName="acvBgtKindSet"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvAutoTRFlag">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvAutoTRFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvAutoTRFlag") %>'
                        Width="120px" Enabled="True" DBFieldName="acvAutoTRFlag"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvDesc">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvDesc" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvDesc") %>'
                        Width="120px" Enabled="True" DBFieldName="acvDesc"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvPlanCodePN">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPlanCodePN" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCodePN") %>'
                        Width="120px" Enabled="True" DBFieldName="acvPlanCodePN"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvOutlayCodePN">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvOutlayCodePN" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCodePN") %>'
                        Width="120px" Enabled="True" DBFieldName="acvOutlayCodePN"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acpPayNoPrv">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcpPayNoPrv" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:NumberOnly();" MaxLength="2"
                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acpPayNoPrv") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acpPayNoPrv"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvNextYearFlag">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvNextYearFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvNextYearFlag") %>'
                        Width="120px" Enabled="True" DBFieldName="acvNextYearFlag"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvPrePayKind">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvPrePayKind" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPrePayKind") %>'
                        Width="120px" Enabled="True" DBFieldName="acvPrePayKind"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="acvMixPayGrpNo">
                <ItemTemplate>
                    <asp:TextBox ID="ctl_AcvMixPayGrpNo" onfocus="this.value=replaceString(this.value,',','');this.select()"
                        Style="text-align: Right" onkeypress="javascript:NumberOnly();" MaxLength="2"
                        runat="server" Text='<%# MyTools.NumTool.FormatNumberVal(Val(DataBinder.Eval(Container, "DataItem.acvMixPayGrpNo") &"")) %>'
                        Width="120px" Enabled="True" DBFieldName="acvMixPayGrpNo"></asp:TextBox>
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
<asp:Button ID="BtnAddRow" runat="server" Text="增加列數" />
<asp:TextBox ID="TBRowQty" runat="server" Width="40px" ToolTip="指定增加列數1~20列" onkeypress="return check_Num()"
    Style="text-align: center" Enabled="False">1</asp:TextBox>
<asp:CheckBox ID="CBCopyLastData" runat="server" Font-Size="X-Small" Text="複製前筆資料">
</asp:CheckBox>
<asp:CheckBox ID="CBCopyBatchData" runat="server" Font-Size="X-Small" Text="複製全部資料">
</asp:CheckBox>
<font style="font-size: x-small;">
    <input type="checkbox" id="HideDel_GV_actPayVisa" runat="server" /><asp:Label ID="ctl_HideDelDataTxt"
        runat="server" Text="隱藏移除列"></asp:Label></font>