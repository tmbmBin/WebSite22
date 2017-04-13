<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Pay.Web.FrmPay_tsbPay.Modify" EnableEventValidation="true" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>    <%: Styles.Render("~/Content/jqueryui") %>    <%: Styles.Render("~/Content/jqueryval") %>    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
    <% if (false)
       { %><link href="../../Content/base.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/layout.css" rel="stylesheet" type="text/css" /><% } %>
    <% if (false)
       { %><link href="../../Content/kendo/2014.1.416/kendo.silver-themebuilder.css" rel="stylesheet" type="text/css" /><% } %>
 
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h1Class">
                <asp:Label ID="lbltitle" runat="server" Text="核銷資料新增作業"></asp:Label></h1>
            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">會簽編號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtAtsbApplyWordNum" runat="server" Width="150px" Text='<%# Eval("AtsbApplyWordNum") %>'></asp:TextBox>
                                <asp:TextBox ID="txtAtsbApplyNo" runat="server" Enabled="false" Style="display: none" Text='<%# Eval("AtsbApplyNo") %>'></asp:TextBox>
                                <asp:TextBox ID="txtBtsbDecideNo" runat="server" Enabled="false" Style="display: none" Text='<%# Eval("BtsbDecideNo") %>'></asp:TextBox>
                                <asp:TextBox ID="txtCtsbYear" runat="server" Enabled="false" Style="display: none" Text='<%# Eval("CtsbYear") %>' onfocus="blur()"></asp:TextBox>
                                <asp:TextBox ID="txtAtsbBgtYear" runat="server" Text='<%# Eval("AtsbBgtYear") %>' Width="650px" Style="display: none"></asp:TextBox>
                                <asp:CheckBox ID="chkIstsbInterest" runat="server" />
                                <!--是否貼補息---->
                            </td>
                            <td class="qury_table_td">核銷號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbPayNo" runat="server" Text='<%# Eval("CtsbPayNo") %>' Width="150px"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">核定日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtBtsbDecideDate" runat="server" MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()" Width="150px" Text='<% #   shareFunction01.fun01.Converto_ROCstring(Convert.ToDateTime(Eval("BtsbDecideDate")))%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>核銷日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbMarkDate" runat="server" Width="150px" Text='<% #  shareFunction01.fun01.Converto_ROCstring(Convert.ToDateTime(Eval("CtsbMarkDate")))%>' MyKendoDatePicker="MyKendoDatePicker" ></asp:TextBox></td>
                            <td class="qury_table_td">核定金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtBtsbMoney" runat="server" Width="150px" Text='<%# string.Format( "{0:N0}",Eval("BtsbMoney")) %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td">核銷金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbMoney" runat="server" Width="150px" Text='<%# string.Format( "{0:N0}",Eval("CtsbMoney")) %>' onfocus="blur()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">付款方式</td>
                            <td class="qury_table_td4">
                            <%--    <asp:DropDownList ID="ddlCPayKind" runat="server">
                                    <asp:ListItem Value="0">無</asp:ListItem>
                                    <asp:ListItem Value="1">零用金</asp:ListItem>
                                    <asp:ListItem Value="2">電子支付</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:RadioButtonList ID="RdbCPayKind" runat="server" RepeatDirection="Horizontal">
                                     <asp:ListItem Value="0">無</asp:ListItem>
                                    <asp:ListItem Value="1">零用金</asp:ListItem>
                                    <asp:ListItem Value="2">電子支付</asp:ListItem>
                                </asp:RadioButtonList>
                               
                            </td>
                            <td class="qury_table_td">群組編號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbGroupNo" runat="server" Text='<%# Eval("CtsbGroupNo ") %>'></asp:TextBox></td>
                            <td class="qury_table_td">電支付號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtCtsbEtcPayWordNum" runat="server" Text='<%# Eval("CtsbEtcPayWordNum") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請業務單位</td>
                            <td class="qury_table_td4">
                                <asp:DropDownList ID="ddlCtsbWorkUnitNo" Width="180px" runat="server"></asp:DropDownList>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請人</td>
                            <td class="qury_table_td4" colspan="3">
                                <asp:TextBox ID="txtCtsbWorkUserNo" runat="server" Width="150px" Text='<%# Eval("CtsbWorkUserNo") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td">
                                <asp:Label ID="lbltsbTrustSubsidyName" runat="server" Text="用途說明"></asp:Label>
                            </td>
                            <td colspan="5" class="qury_table_td4">
                                <asp:TextBox ID="txtAtsbTrustSubsidyName" runat="server" Text='<%# Eval("AtsbTrustSubsidyName") %>' Width="650px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>事由</td>
                            <td colspan="5" class="qury_table_td4" rowspan="2">
                                 <span style="color: Red;">＊最大輸入字數：120 個中文字。</span><br/>
                                <asp:TextBox ID="txtCtsbMemo" runat="server" Rows="3" TextMode="MultiLine" Width="650px" Text='<%# Eval("CtsbMemo") %>'></asp:TextBox>
                                <input id="btnChoosePhrase" type="button" value="..."  onclick="fnCallPhraseDialog();"  />
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </asp:FormView>
        </div>
        <br />
        <asp:Panel ID="Panel2" runat="server" Width="100%">

            <div style="display:none">
                <asp:TextBox ID="txtESTotaltsbEstimateMoney" runat="server" onfocus="blur()" Width="97%"></asp:TextBox>
                <br />
                <input id="btnEselectEstimate" type="button" value="..." />
                <asp:TextBox ID="txtESTotaltsbFee" runat="server" onfocus="blur()" Width="98%"></asp:TextBox>
                <asp:TextBox ID="txtEselectEstimateData" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                        <!--選擇估列字串--->
            </div>

            <div id="tabETitle" class="editTitle">
                編 輯 區
            </div>
            <table style="width: 100%;" border="1">
                <tr class="DtleditTd">
                    <td style="width:19%">核定明細資料(受款人)</td>
                    <td style="width:19%">計畫科目/用途別科目</td>
<%--                    <td style="width:10%">受款人</td>--%>
                    <td style="width:7%">經資門別<br /> 預算來源</td>
                    <td style="width:10%">經費單位<br /> 控帳業務</td>
                    <td style="width:7%"><span style="color: Red;">＊</span>核銷金額</td>
                    <td colspan="2"><span style="color: Red;">＊</span>沖抵預撥(貸)</td>
                    <td style="width:7%">付現(貨)</td>
                    <td style="width:7%">群組編號</td>
                    <td style="width:4%">結案</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtEStsbYear" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:TextBox ID="txtEStsbApplyNo" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:TextBox ID="txtEStsbDecideNo" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:TextBox ID="txtEStsbPayYear" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:TextBox ID="txtEStsbPayNo" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:TextBox ID="txtEStsbApplySeq" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:TextBox ID="txtEStsbDecideSeq" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:DropDownList ID="ddlApplyDtlData" runat="server" Width="100%">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtEtsbPayeeName" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                        <asp:TextBox ID="txtEtsbPayeeNo" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAtsbPlanCode" runat="server" onfocus="this.blur()" Width="100%">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddloulOutlayCode" runat="server" Width="100%" onfocus="this.blur()">
                        </asp:DropDownList>
                    </td>
<%--                    <td>
                        <asp:TextBox ID="txtEtsbPayeeName2" runat="server" Width="100%"></asp:TextBox> <!---受款人--->
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="ddlEcodAccKindName" runat="server" onfocus="this.blur()" Width="100%"></asp:DropDownList> <!---經資門--->
                        <asp:DropDownList ID="ddlEcodBgtOrigin" runat="server" onfocus="this.blur()" Width="100%"></asp:DropDownList>  <!---預算來源--->
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEcodDepartName" runat="server" onfocus="blur()" Width="100%"></asp:DropDownList>  <!---經費單位--->
                        <asp:DropDownList ID="ddlcodBiz" runat="server" onfocus="blur()" Width="100%"></asp:DropDownList><!---控帳業務---->

                    </td>
                    <td>
                        <asp:TextBox ID="txtEDectsbMoney" runat="server" Style="display: none"></asp:TextBox>
                        <!--核定金額沒作用--->
                        <asp:TextBox ID="txtESTotaltsbPayMoney" runat="server" OnKeyPress="if(((event.keyCode&gt;=48)&amp;&amp;(event.keyCode &lt;=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" Width="96%"></asp:TextBox>
                        <!--核消金額--->
                    </td>
                    <td style="width:7%">
                        <asp:TextBox ID="txtselectPrepayData" runat="server" onfocus="blur()"  Width="98%" Style="display: none"></asp:TextBox>
                         <!--選擇估列字串--->
                        <asp:TextBox ID="txtESTotaltsbPreMoney" runat="server" onfocus="blur()" Width="96%"></asp:TextBox>
                    </td>
                    <td style="width:2%">
                        <input id="btnEselectPreMoney" type="button" value="..." />
                    </td>
                    <td>
                        <asp:TextBox ID="txtESTotaltsbCash" runat="server" onfocus="blur()" Width="96%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEtsbGroupNo" runat="server" OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" Width="96%"></asp:TextBox>
                    </td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkEStsbFinalKind" runat="server" Width="100%" />
                        <asp:TextBox ID="txtEtsbtemp" runat="server" Style="display: none" Width="98%"></asp:TextBox>
                        <!--暫存用(目前沒用到但開啟隱藏可以用)---></td>
                </tr>
            </table>
            <div style="text-align: center;">
                <asp:Button ID="btnAddDtl" runat="server" Text="增加明細" CssClass="Btn12" OnClick="btnAddDtl_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnModifyDtl" runat="server" Text="確認修改" CssClass="Btn12" OnClick="btnModifyDtl_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDeleteDtl" runat="server" Text="刪除明細" CssClass="Btn12"    OnClick="btnDeleteDtl_Click" />
            </div>
        </asp:Panel>








        <br />
        <!------------>
        <div>
            <asp:GridView ID="GridView1" runat="server" MyName="gvList" AutoGenerateColumns="False"
                CssClass="GridViewStyle" Width="100%" OnRowCreated="GridView1_RowCreated">
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <Columns>
                    <asp:TemplateField HeaderText="序號" Visible="True">
                        <ItemTemplate>
                            <%# GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="25" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="25" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbYear" runat="server" Text='<%# Eval("StsbYear") %>' Style="display: none"></asp:Label>
                            <!--年度-->
                            <asp:Label ID="lblStsbApplyNo" runat="server" Text='<%# Eval("StsbApplyNo") %>' Style="display: none"></asp:Label>
                            <!--會簽系統號-->
                            <asp:Label ID="lblStsbDecideNo" runat="server" Text='<%# Eval("StsbDecideNo") %>' Style="display: none"></asp:Label>
                            <!--核定號-->
                            <asp:Label ID="lblStsbPayYear" runat="server" Text='<%# Eval("StsbPayYear") %>' Style="display: none"></asp:Label>
                            <!--核銷年度-->
                            <asp:Label ID="lblStsbPayNo" runat="server" Text='<%# Eval("StsbPayNo") %>' Style="display: none"></asp:Label>
                            <!--核銷號-->
                            <asp:Label ID="lblStsbApplySeq" runat="server" Text='<%# Eval("StsbApplySeq") %>' Style="display: none"></asp:Label>
                            <!--會簽明細號(要顯示的)-->
                            <asp:Label ID="lblStsbDecideSeq" runat="server" Text='<%# Eval("StsbDecideSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="50" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經資門別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbAccKind" runat="server" Text='<%#    CodeFormat( Eval("StsbAccKind").ToString(),"ddlEcodAccKindName")%> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="預算來源" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbBgtSourceCode" runat="server" Text='<%#  CodeFormat( Eval("StsbBgtSourceCode").ToString(),"ddlEcodBgtOrigin") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經費單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbBgtDepCode" runat="server" Text='<%#  CodeFormat( Eval("StsbBgtDepCode").ToString(),"ddlEcodDepartName") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="75" />
                        <ItemStyle HorizontalAlign="Center" Width="75" />
                    </asp:TemplateField>


                      <asp:TemplateField HeaderText="控帳業務" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbBizCode" runat="server" Text='<%# CodeFormat( Eval("StsbBizCode").ToString(),"ddlcodBiz") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="75" />
                        <ItemStyle HorizontalAlign="Center" Width="75" />
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="計畫科目" Visible="True">
                        <ItemTemplate>                                                    
                            <asp:Label ID="lblStsbPlanCode" runat="server" Text='<%#  CodeFormat( Eval("StsbPlanCode").ToString(),"ddlAtsbPlanCode") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="180" />
                        <ItemStyle HorizontalAlign="Left" Width="180" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="受款人名稱" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbPayeeName" runat="server" Text='<%# Eval("StsbPayeeName") %>'></asp:Label>
                            <asp:Label ID="lblStsbPayeeNo" runat="server" Text='<%# Eval("StsbPayeeNo") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="150"/>
                        <ItemStyle HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="核銷金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblSTotaltsbPayMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("STotaltsbPayMoney ")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="暫存用" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbtemp" runat="server" Text='<%#   Eval("Stsbtemp") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>




                    <asp:TemplateField HeaderText="用途別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbOutlayCodeName" runat="server" Text='<%#   OutlayFormat( (Eval("StsbOutlayCode")??"").ToString())%>'></asp:Label>
                            <asp:Label ID="lblStsbOutlayCode" runat="server" Text='<%# Eval("StsbOutlayCode") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="140" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="140" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="沖抵估列" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblSTotaltsbEstimateMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("STotaltsbEstimateMoney  ")) %>' Style="display: none"></asp:Label>
                            <!---確認金額用-->

                            <asp:Label ID="lblStsbEstimateMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("StsbEstimateMoney  ")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="費用" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblSTotaltsbFee" runat="server" Text='<%#   string.Format("{0:N0}", Eval("StsbFee")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="沖抵預撥金額" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblSTotaltsbPreMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("STotaltsbPreMoney")) %>' Style="display: none"></asp:Label>
                            <!---確認金額用-->
                            <asp:Label ID="lblStsbPreMoney" runat="server" Text='<%#  string.Format("{0:N0}", Eval("StsbPreMoney")) %>'  ToolTip='<%#  "傳票號碼：" + Eval("StsbExchNo1") %>'    ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="付現" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblSTotaltsbCash" runat="server" Text='<%#   string.Format("{0:N0}", Eval("StsbCash")) %>'  ToolTip='<%#  "傳票號碼：" + Eval("StsbExchNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="70" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="70" />
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="群組編號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblStsbGroupNo" runat="server" Text='<%#   Eval("StsbGroupNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="65" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="65" />
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="是否結案" Visible="True">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkStsbFinalKind" runat="server" Checked='<%#  (Eval("StsbFinalKind")??"0").ToString().Equals("1")%> ' Enabled="false" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="40" Font-Size="14px" />
                        <ItemStyle HorizontalAlign="Center" Width="40" />
                    </asp:TemplateField>



                    <%-- ↑↑開始資料行↑↑ --%>
                </Columns>
                <EmptyDataTemplate>沒有資料！</EmptyDataTemplate>
            </asp:GridView>
            <br style="clear: both;" />
            <asp:Panel ID="divPagination" runat="server" HorizontalAlign="Center"></asp:Panel>
            <br style="clear: both;" />

        </div>

        <!----------------->
        <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
            <asp:Button ID="btnDelete" runat="server" Text="刪除" class="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
        </asp:Panel>
        <div id="div_selectPrePay"></div>
        <div id="div_selectEstimate"></div>


        <%: Scripts.Render("~/bundles/jquery") %>
        <%: Scripts.Render("~/bundles/basic") %>
        <%: Scripts.Render("~/bundles/jqueryui") %>
        <%: Scripts.Render("~/bundles/jqueryval") %>
        <%: Scripts.Render("~/bundles/kendo") %>
        <%: Scripts.Render("~/bundles/jquery.MyKendo") %>
        <%: Scripts.Render("~/bundles/MyLibraryJs") %>
        <%: Scripts.Render("~/bundles/jquery.pagination") %>
        <%: Scripts.Render("~/bundles/URI") %>

        <script type="text/javascript">

            $(function () {

                fnPageInit();
                Getoulcode();//選擇科目變化用途別
                getSelectDtlData();

                //核銷是否輸入判斷
                //$("#txtESTotaltsbEstimateMoney").change(function ()
                $("#txtESTotaltsbEstimateMoney").bind("change", function ()
                {

                    var STotaltsbPayMoney = parseInt($("#txtESTotaltsbPayMoney").val(), 10);
                    //alert(STotaltsbPayMoney);
                    if (STotaltsbPayMoney == "NaN" | STotaltsbPayMoney == 0) {
                        alert("尚未輸入核銷金額")
                    }
                    else {

                        var txtESTotaltsbPayMoney = $("#<%= txtESTotaltsbPayMoney.ClientID %>").val().val().replace(/[,]+/g, ""); //移除千分位
                        var tmptsbFee = parseInt(txtESTotaltsbPayMoney, 10) - parseInt($("#txtESTotaltsbEstimateMoney").val().val().replace(/[,]+/g, ""), 10);
                        if (tmptsbFee == "NaN") {
                            tmptsbFee = txtESTotaltsbPayMoney
                        }
                        $("#<%= txtESTotaltsbFee.ClientID %>").val(tmptsbFee.toString().replace("NaN", txtESTotaltsbPayMoney)); //費用金額
                    }
                });


                //$("#txtESTotaltsbPreMoney").change(function ()
                $("#txtESTotaltsbPreMoney").bind("change", function ()
                {

                    var STotaltsbPayMoney = parseInt($("#txtESTotaltsbPayMoney").val(), 10);

                    if (STotaltsbPayMoney == "NaN" | STotaltsbPayMoney == 0) {
                        alert("尚未輸入核銷金額")
                    }
                    else {
                        var txtESTotaltsbPayMoney = $("#<%= txtESTotaltsbPayMoney.ClientID %>").val().replace(/[,]+/g, "");
                        var tmptsbCash = parseInt(txtESTotaltsbPayMoney, 10) - parseInt($("#txtESTotaltsbPreMoney").val().replace(/[,]+/g, ""), 10);

                        $("#<%= txtESTotaltsbCash.ClientID %>").val(tmptsbCash.toString().replace("NaN", txtESTotaltsbPayMoney)); //付現金額
                    }
                });


                $("#txtESTotaltsbPayMoney").change(function () {
                    $("#txtESTotaltsbEstimateMoney").change();
                    $("#txtESTotaltsbPreMoney").change();
                });


                GetoulcodeStart();  //起始
                disabledControl();//禁止點選


            });

            ///
            function disabledControl() {

                //$('#ddlEcodAccKindName').attr("disabled", "disabled");
                //$('#ddlEcodBgtOrigin').attr("disabled", "disabled");
                //$('#ddlEcodDepartName').attr("disabled", "disabled");
                //$('#ddlAtsbPlanCode').attr("disabled", "disabled");
                //$('#txtEtsbPayeeName2').attr("disabled", "disabled");
               




                $('#ddlEcodAccKindName').click(function () {
                    alert('禁止選取');
                    return false;
                });
                $('#ddlEcodBgtOrigin').click(function () {
                    alert('禁止選取');
                    return false;
                });
                $('#ddlEcodDepartName').click(function () {
                    alert('禁止選取');
                    return false;
                });
                $('#ddlAtsbPlanCode').click(function () {
                    alert('禁止選取');
                    return false;
                });

                $('#txtEtsbPayeeName2').click(function () {
                    alert('禁止選取');
                    return false;
                });


                $('#ddlcodBiz').click(function () {
                    alert('禁止選取');
                    return false;
                });

                $('#ddloulOutlayCode').click(function () {
                    alert('禁止選取');
                    return false;
                });

              



            }
            ///

            //事由_片語
            function fnCallPhraseDialog() {

                var thisName = "FormView1_txtCtsbMemo";
                var strReturnVal = showModalDialog("../../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
                //alert(thisName);
                if (strReturnVal != "Cancel") {
                    document.all(thisName).value = document.all(thisName).value + strReturnVal;
                }
            }
            //



            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href + "&WIN=0";
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    //$.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />刪除中...</b></h1>" });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    //$.blockUI({ message: "<h1><b><img src='../../Images/ajax-loader.gif' />儲存中...</b></h1>" });
                    $.blockUI({ message: '<h1>資料儲存中，請耐心等候...</h1>' });
                    return true;
                } else {
                    alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                }


                return false;
            });
            //#endregion



            // 判斷是否有點選任何一筆資料
            $("#btnDeleteDtl").click(function () {
                //alert('111');
                var tmpFlag = false;
                $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {

                    if ($(this).css("background-color") == "yellow")
                          tmpFlag = true;
                });

                if (tmpFlag == true) {
                  
                    return true;
                }
                else
                {
                    alert("尚未選取明細檔");
                }

                return false;
            });
            // END



            function fnPageInit() {

                $.MyKendoComboBox();
                $.MyKendoDatePicker();
                $.MyKendoMultiSelect();


                $("#form1").validate({
                    onsubmit: false, ignore: ""
                });



                //$("form").makeValidationInline();

                //預設驗證規則
                $("[datepicker='datepicker']").each(function () {
                    $(this).rules("add", {
                        date: true
                    });
                });

                $(":input").bind("focusout keyup change", function () {
                    $(this).valid();

                });

                //#endregion 基本           
            }


            ////
            function GetoulcodeStart() {

                //載入
                var selected = $("#<%= ddlApplyDtlData.ClientID %>").val();
                //檢視或刪除時
                if (selected == null) {
                    return;
                }

                if (selected.length > 0) {
                 
                    getSetEditData("");
                   
                }
            }
            /////


            /////
            function Getoulcode() {
                var ddl = $("#<%= ddlApplyDtlData.ClientID %>");

                //變更
                ddl.change(function () {
                    getSetEditData("");
                });

            }
            //////

            function getSelectDtlData() {


                $('#GridView1 tr').click(function () {
                    //  $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });

                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        // alert($(this).html());
                        $(this).css({ "background-color": "white" });
                    });

                    var tmpIndex = $.trim($(this).find("td:first").text());
                    if (parseInt(tmpIndex, 10) > 0) {
                        $(this).css({ "background-color": "yellow" });
                    }

                    var tmptsbApplySeq = $.trim($(this).find("[id$=lblStsbApplySeq]").text()); //會簽明細號
                    var tmptsbDecideSeq = $(this).find("[id$=lblStsbDecideSeq]").text();//核定明細號
                    var tmptsbOutlayCodeName = $.trim($(this).find("[id$=lblStsbOutlayCodeName]").text()); //用途別
                    var tmptsbtemp = $(this).find("[id$=lblStsbtemp]").text();//暫存用
                    var tmpBtsbGroupNo = $(this).find("[id$=lblStsbGroupNo]").text();//群組編號


                    //Key
                    $("#<%= txtEStsbYear.ClientID %>").val($.trim($(this).find("[id$=lblStsbYear]").text()));
                    $("#<%= txtEStsbApplyNo.ClientID %>").val($.trim($(this).find("[id$=lblStsbApplyNo]").text()));
                    $("#<%= txtEStsbDecideNo.ClientID %>").val($.trim($(this).find("[id$=lblStsbDecideNo]").text()));
                    $("#<%= txtEStsbPayYear.ClientID %>").val($.trim($(this).find("[id$=lblStsbPayYear]").text()));
                    $("#<%= txtEStsbPayNo.ClientID %>").val($.trim($(this).find("[id$=lblStsbPayNo]").text()));
                    $("#<%= txtEStsbApplySeq.ClientID %>").val($.trim($(this).find("[id$=lblStsbApplySeq]").text()));
                    $("#<%= txtEStsbDecideSeq.ClientID %>").val($.trim($(this).find("[id$=lblStsbDecideSeq]").text()));

                   


                    //選擇沖抵JSON String 變空白
                    $("#<%= txtEselectEstimateData.ClientID %>").val('');
                    $("#<%= txtselectPrepayData.ClientID %>").val('');

                    $('#ddlApplyDtlData option[value=' + tmptsbDecideSeq + ']').attr('selected', true);
                    getSetEditData(tmptsbOutlayCodeName.split(" ")[0]); //受款人資料 、dtl Key設定(複寫)




                    // 畫面呈現 寫在最後 因為getSetEditData會把值清空
                    //核銷金額
                    //alert($.trim($(this).find("[id$=lblSTotaltsbPayMoney]").text()));
                    $("#<%= txtESTotaltsbPayMoney.ClientID %>").val($.trim($(this).find("[id$=lblSTotaltsbPayMoney]").text()));

                    //沖抵估列
                    $("#<%= txtESTotaltsbEstimateMoney.ClientID %>").val($.trim($(this).find("[id$=lblSTotaltsbEstimateMoney]").text()));
                    //費用
                    $("#<%= txtESTotaltsbFee.ClientID %>").val($.trim($(this).find("[id$=lblSTotaltsbFee]").text()));
                    //沖抵預撥金額
                    $("#<%= txtESTotaltsbPreMoney.ClientID %>").val($.trim($(this).find("[id$=lblSTotaltsbPreMoney]").text()));
                    //付現
                    $("#<%= txtESTotaltsbCash.ClientID %>").val($.trim($(this).find("[id$=lblSTotaltsbCash]").text()));
                    //暫存用
                    $("#<%= txtEtsbtemp.ClientID %>").val($.trim($(this).find("[id$=lblStsbtemp]").text()));


                    $('#txtEtsbGroupNo').val($.trim(tmpBtsbGroupNo));//群組編號


                    //結案否
                    if ($(this).find("[id$=chkStsbFinalKind]").is(':checked')) {
                        $("#<%= chkEStsbFinalKind.ClientID %>").attr("checked", true);
                    } else
                        $("#<%= chkEStsbFinalKind.ClientID %>").attr("checked", false);


                    return false;
                });

            }

        
           
            function getSetEditData(tmptsbOutlayCode) {



                //檢視刪除不執行撈取資料
                var tmpTitle = $("#<%= lbltitle.ClientID %>").text();
                if (tmpTitle.indexOf("檢視") >= 0 | tmpTitle.indexOf("刪除")>=0)
                {
                   // alert("123");
                    return;
                }



                $.blockUI({ message: '<h1>Loading...Please Wait</h1>' });

                var tmpApplyNo = $("#<%=  FormView1.FindControl("txtAtsbApplyNo").ClientID %>").val();

                var tmpDecideNo = $("#<%=  FormView1.FindControl("txtBtsbDecideNo").ClientID %>").val();

                var ddl2 = $("#<%= ddloulOutlayCode.ClientID %>");
                var selected = $("#<%= ddlApplyDtlData.ClientID %>").val();

                $("#<%= txtEtsbPayeeName.ClientID %>").val('');
                $("#<%= txtEtsbPayeeNo.ClientID %>").val('');
                $("#<%= txtEDectsbMoney.ClientID %>").val(''); //核定金額
                $("#<%= txtselectPrepayData.ClientID %>").val('');//清空

                
                //
                $("#<%= txtESTotaltsbPayMoney.ClientID %>").val(''); //使用者核銷金額
                $("#<%= txtESTotaltsbEstimateMoney.ClientID %>").val(''); //估列總額
                $("#<%= txtESTotaltsbFee.ClientID %>").val(''); //費用金額
                $("#<%= txtESTotaltsbPreMoney.ClientID %>").val(''); //預撥總額
                $("#<%= txtESTotaltsbCash.ClientID %>").val(''); //付現金額
                $("#<%= txtEtsbtemp.ClientID %>").val(''); //暫存用

              

                $.ajax({
                    type: "POST",
                    url: "ajax01.aspx",
                    async: false,
                    dataType: "JSON",
                    data: { 'ApplyNo': tmpApplyNo, 'DecideNo': tmpDecideNo, 'DecideSeq': selected },
                    success: function (result) {
                        ddl2.empty();
                        $.each(result.oulayCoedeItem, function (i, value) {
                            //ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>")

                            if (value.IsCannSelect)
                                ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>")
                            else
                                ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\" style=\"color:Navy\" disabled=\"true\" ></option>")

                        });

                        //用途別設定
                        if (tmptsbOutlayCode.length > 0)
                        { $('#ddloulOutlayCode option[value=' + tmptsbOutlayCode + ']').attr('selected', true); }
                        else
                        {
                            //預設值
                            $('#ddloulOutlayCode option[value=' + result.tsbDecideDtlDTO.tsbOutlayCode + ']').attr('selected', true);
                        }

                        $("#<%= txtEtsbPayeeName.ClientID %>").val(result.tsbDecideDtlDTO.tsbPayeeName);
                        $("#<%= txtEtsbPayeeNo.ClientID %>").val(result.tsbDecideDtlDTO.tsbPayeeNo);

                        //
                        $('#ddlEcodAccKindName option[value=' + result.tsbDecideDtlDTO.tsbAccKind + ']').attr('selected', true);
                        $('#ddlEcodBgtOrigin option[value=' + result.tsbDecideDtlDTO.tsbBgtSourceCode + ']').attr('selected', true);
                        $('#ddlEcodDepartName option[value=' + result.tsbDecideDtlDTO.tsbBgtDepCode + ']').attr('selected', true);
                        $('#ddlAtsbPlanCode option[value=' + result.tsbDecideDtlDTO.tsbPlanCode + ']').attr('selected', true);
                        <%--  $("#<%= txtEtsbPayeeName2.ClientID %>").val(result.tsbDecideDtlDTO.tsbPayeeName);--%>
                        $('#ddlcodBiz option[value=' + result.tsbDecideDtlDTO.tsbBizCode + ']').attr('selected', true);

                        $('#txtEtsbPayeeName2').val(result.tsbDecideDtlDTO.tsbPayeeName);

                        //

                        //選取核定明細後要設定的(給新增 沖抵 估列用)
                        $("#<%= txtEStsbYear.ClientID %>").val($.trim(result.tsbDecideDtlDTO.tsbYear));
                        $("#<%= txtEStsbApplyNo.ClientID %>").val($.trim(result.tsbDecideDtlDTO.tsbApplyNo));
                        $("#<%= txtEStsbDecideNo.ClientID %>").val($.trim(result.tsbDecideDtlDTO.tsbDecideNo));
                        $("#<%= txtEStsbPayYear.ClientID %>").val($("#<%= this.FormView1.FindControl("txtCtsbYear").ClientID %>").val());
                        $("#<%= txtEStsbPayNo.ClientID %>").val($("#<%= this.FormView1.FindControl("txtCtsbPayNo").ClientID %>").val());
                        $("#<%= txtEStsbApplySeq.ClientID %>").val($.trim(result.tsbDecideDtlDTO.tsbApplySeq));
                        $("#<%= txtEStsbDecideSeq.ClientID %>").val($.trim(result.tsbDecideDtlDTO.tsbDecideSeq));

                    },
                    beforeSend: function () {
                        // $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });
                    },
                    complete: function () {
                        // $.unblockUI();
                    },
                    error: function (XMLHttpRequest, textStatus) {
                        if (textStatus == 'timeout')
                            alert('Time Out');
                        else {
                                alert('error 資料重載');
                                getSetEditData("");
                        }
                    },
                });
                //
                $.unblockUI();
                return false;
            }


            $("#btnEselectPreMoney").click(function () {
                openPrepayFrame();
            });

            $("#btnEselectEstimate").click(function () {
                openEstimateFrame();
            });

            //openPrepayFrame
            function openPrepayFrame() {

                var BtsbYear = $("#<%= txtEStsbYear.ClientID %>").val();
                var BtsbApplyNo = $("#<%= txtEStsbApplyNo.ClientID %>").val();
                var BtsbDecideNo = $("#<%= txtEStsbDecideNo.ClientID %>").val();
                var BtsbPrePayYear = $("#<%= txtEStsbYear.ClientID %>").val(); //先預設跟年度依樣
                var BtsbApplySeq = $("#<%= txtEStsbApplySeq.ClientID %>").val();
                var BtsbDecideSeq = $("#<%= txtEStsbDecideSeq.ClientID %>").val();
                var CtsbPayNo = $("#<%=  this.FormView1.FindControl("txtCtsbPayNo").ClientID %>").val();
                var AtsbApplyWordNum = $("#<%=  this.FormView1.FindControl("txtAtsbApplyWordNum").ClientID %>").val(); //會簽編號

                var keys = {
                    BtsbYear: BtsbYear, BtsbApplyNo: BtsbApplyNo, BtsbDecideNo: BtsbDecideNo
                  , BtsbPrePayYear: BtsbPrePayYear, BtsbApplySeq: BtsbApplySeq, BtsbDecideSeq: BtsbDecideSeq
                  , CtsbPayNo: CtsbPayNo, AtsbApplyWordNum: AtsbApplyWordNum
                };
                var tmpsrc = "selectPrePay.aspx?Keys=" + encodeURIComponent(JSON.stringify(keys));

                $("#div_selectPrePay").append("<div id='selectPrePay'></div>");

                var selectPrePayWindow = $("#selectPrePay").kendoWindow({
                    visible: false,
                    iframe: true,
                    title: "沖抵資料選取",
                    width: 800,
                    height: 600,
                    modal: true,
                    resizable: true,
                    refresh: function () {
                        this.center();
                    },
                    deactivate: function () {
                        this.destroy();
                    },
                    close: function (e) {

                       

                        var returndata = window.frames[0].document.getElementById("txtReturnData").value
                        var returnMessage = window.frames[0].document.getElementById("txtMessage").value
                        var returnMoney = window.frames[0].document.getElementById("txtTotaltsbPreMoney").value


                        if (returndata.length > 0 && returnMessage.length > 0) {
                            $("#<%= txtESTotaltsbPreMoney.ClientID %>").val(returnMoney); //預撥金額
                            $("#<%= txtESTotaltsbPreMoney.ClientID %>").change();
                            $("#<%= txtselectPrepayData.ClientID %>").val(returndata);//JSON 字串

                        } else {
                            $("#<%= txtESTotaltsbPreMoney.ClientID %>").val('0');
                            $("#<%= txtESTotaltsbCash.ClientID %>").val('0');
                        }

                        //重新計算付現金額
                        $("#txtESTotaltsbPreMoney").change();


                    },
                    content: tmpsrc



                }).data("kendoWindow");

                selectPrePayWindow.open().center();

            }
            // End  openPrepayFrame



            //openEstimateFrame
            function openEstimateFrame() {

                var AtsbYear = $("#<%= txtEStsbYear.ClientID %>").val();
                var AtsbApplyNo = $("#<%= txtEStsbApplyNo.ClientID %>").val();
                var AtsbDecideNo = $("#<%= txtEStsbDecideNo.ClientID %>").val();
                var AtsbApplySeq = $("#<%= txtEStsbApplySeq.ClientID %>").val();
                var AtsbDecideSeq = $("#<%= txtEStsbDecideSeq.ClientID %>").val();
                var BtsbPayNo = $("#<%=  this.FormView1.FindControl("txtCtsbPayNo").ClientID %>").val();
                var AtsbApplyWordNum = $("#<%=  this.FormView1.FindControl("txtAtsbApplyWordNum").ClientID %>").val(); //會簽編號

                var keys = {
                    AtsbYear: AtsbYear, AtsbApplyNo: AtsbApplyNo, AtsbDecideNo: AtsbDecideNo
                  , AtsbApplySeq: AtsbApplySeq, AtsbDecideSeq: AtsbDecideSeq
                  , BtsbPayNo: BtsbPayNo, AtsbApplyWordNum: AtsbApplyWordNum
                };
                var tmpsrc = "selectEstimate.aspx?Keys=" + encodeURIComponent(JSON.stringify(keys));

                $("#div_selectEstimate").append("<div id='selectEstimate'></div>");
                var selectEstimateWindow = $("#selectEstimate").kendoWindow({
                    visible: false,
                    iframe: true,
                    title: "沖抵資料選取",
                    width: 800,
                    height: 600,
                    modal: true,
                    resizable: true,
                    refresh: function () {
                        this.center();
                    },
                    deactivate: function () {
                        this.destroy();
                    },
                    close: function (e) {
                        var dialog = $("#div_selectEstimate").data("kendoWindow");
                        var returndata = window.frames[0].document.getElementById("txtReturnData").value
                        var returnMessage = window.frames[0].document.getElementById("txtMessage").value
                        var returnMoney = window.frames[0].document.getElementById("txtTotaltsbEstimateMoney").value //總金額


                        if (returndata.length > 0 && returnMessage.length > 0) {
                            $("#<%= txtESTotaltsbEstimateMoney.ClientID %>").val(returnMoney); //估列金額
                            $("#<%= txtESTotaltsbEstimateMoney.ClientID %>").change();
                            $("#<%= txtEselectEstimateData.ClientID %>").val(returndata);//JSON 字串

                        } else {
                            $("#<%= txtESTotaltsbEstimateMoney.ClientID %>").val('0');
                            $("#<%= txtESTotaltsbFee.ClientID %>").val('0');
                        }

                        //重新計算費用金額
                        $("#txtESTotaltsbEstimateMoney").change();

                    },
                    content: tmpsrc

                }).data("kendoWindow");

                selectEstimateWindow.open().center();
            }
            // End  openEstimateFrame

        </script>
    </form>
</body>
</html>
