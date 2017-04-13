<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbficSubisdyParaT.Web.FrmtsbficSubisdyParaT_tsbficSubisdyPara.Modify" EnableEventValidation="true" %>
<%@ Import Namespace="System.Web.Optimization" %>

<%--20150701 [Add]:附加檔案功能--%>
<%@ Register Assembly="Sys.FileUploadManager" Namespace="Sys.FileUploadManager.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <script type="text/javascript" src="../../Scripts/jquery-1.11.1-fix.js"></script>
</head>

<%-- Style專區 --%>
<%: Styles.Render("~/Content/basic") %>
<%: Styles.Render("~/Content/jqueryval") %>
<%: Styles.Render("~/Content/jquery.pagination") %>
<%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
<%-- JavaScript專區 --%>
<%: Scripts.Render("~/bundles/basic") %>
<%: Scripts.Render("~/bundles/jqueryui") %>
<%: Scripts.Render("~/bundles/jqueryval") %>
<%: Scripts.Render("~/bundles/kendo") %>
<%: Scripts.Render("~/bundles/jquery.MyKendo") %>
<%: Scripts.Render("~/bundles/MyLibraryJs") %>
<%: Scripts.Render("~/bundles/jquery.pagination") %>
<%: Scripts.Render("~/bundles/URI") %>

<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h1Class">獎補助參數勾選設定</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td1">會計年度</td>
                            <td class="qury_table_td5">
                                <asp:TextBox ID="txtaccYear" Width="100px" runat="server" Text='<%# Eval("tsbYear") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支年度</td>
                            <td class="qury_table_td5">
                                <asp:TextBox ID="txttsbYear" Width="100px" runat="server" Text='<%# Eval("tsbYear") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支編號</td>
                            <td class="qury_table_td5">
                                <asp:TextBox ID="txttsbApplyWordNum" Width="120px" runat="server" Text='<%# Eval("tsbApplyWordNum") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支子案號</td>
                            <td class="qury_table_td2">
                                <asp:TextBox ID="txttsbDecideSeq" Width="80px" runat="server" Text='<%# Eval("tsbDecideSeq") %>'></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:CheckBox ID="chktsbPassFlag" Text="主計室審核" runat="server"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">受補助單位</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">計畫名稱</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">預算科目</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPlanCode" runat="server" Text='<%# Eval("tsbPlanName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <div runat="server" id="editDiv">
                <table style="width: 100%; background-color: white;" border="1">
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2" rowspan="3">受補助單位徵選方式</td>
                        <td class="qury_table_td5" rowspan="3">
                            <asp:RadioButtonList ID="rdbSubisdySelectMode" runat="server">
                                <asp:ListItem Value="1" Selected="True">法定預算已明列補(捐)助對象</asp:ListItem>
                                <asp:ListItem Value="2">公開徵選</asp:ListItem>
                                <asp:ListItem Value="3">來函申請</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">預算明列補(捐)助對象原因</td>
                        <td class="qury_table_td4">
                            <asp:TextBox ID="txtBgtSubisdyCause" runat="server" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">徵選辦理方式</td>
                        <td class="qury_table_td4">
                            <asp:DropDownList ID="ddlSelectProcessMode" runat="server" Width="98%" Enabled="false">
                                <asp:ListItem Value =""></asp:ListItem>
                                <asp:ListItem Value="1">公開徵選</asp:ListItem>
                                <asp:ListItem Value="2">來函申請</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td1" colspan="2"></td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">合約金額</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:TextBox ID="txtContractMoney" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">補助(訂約)日期</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:TextBox ID="txtContractDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" data-validation-engine="validate[required]" data-errormessage-value-missing="此欄位為必填值！" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">計畫執行期間(起日)</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:TextBox ID="txtContractBDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">計畫執行期間(迄日)</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:TextBox ID="txtContractEDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">就地審計</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbinspect" runat="server" RepeatDirection="Horizontal" Width="650px">
                                <asp:ListItem Value="0">一般(非就地審計)</asp:ListItem>
                                <asp:ListItem Value="1">就地審計(不納入地方政府預算)</asp:ListItem>
                                <asp:ListItem Value="2">納入地方政府預算</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">是否明定補助之條件標準</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbisStandard" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">是否納入受補助單位預算</td>
                        <td class="qury_table_td4" colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rdbisBgt" runat="server" Width="150px">
                                            <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                            <asp:ListItem Value="2">無需填寫</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td style="width: 100%">
                                        <%--20170301 17.76 B. 補(捐)助參數設定：『是否納入受補助單位預算』選『否』時，已無需填寫原因。（將原因欄移除，報表也同步修正。）--%>
                                        <div style="display:none;">
                                            備註：
                                            <asp:TextBox ID="txtisBgtMemo" runat="server" Width="85%" ReadOnly="true"></asp:TextBox>
                                            <input id="btnSelectBgtMemo" type="button" value="..." />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">是否明定成果考核方式並確實執行</td>
                        <td class="qury_table_td4">
                            <asp:RadioButtonList ID="rdbisAssess" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td5" colspan="2">
                            <span style="color: Red;">＊受補(捐)助單位為個人、捐助外國政府者，此選項不必填寫</span>
                            <br />
                            成果考核方式及標準：<asp:TextBox ID="txtisAssessMode" runat="server" Width="350px"></asp:TextBox>
                        </td>
                    </tr>
                    <%--20170104 17.9  請將程式內與「是否派員就地抽查」相關之欄位設定清除(不用填寫該欄位，並無需檢核勾稽該欄位，且不用上傳附件)。--%>
                    <tr runat="server" visible="false">
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">是否派員就地抽查</td>
                        <td class="qury_table_td4" colspan="3">
                            <table>
                                <tr>
                                    <td rowspan="2" colspan="2">
                                        <asp:RadioButtonList ID="rdbisCheck" runat="server" Width="150px" Height="120px">
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                            <asp:ListItem Value="2" Selected="True">無需填寫</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td style="width: 90px">
                                        <%--20150701 [Add]:附加檔案功能--%>
                                        附件上傳：
                                    </td>
                                    <td>
                                        <TM:FileUploadManagerX ID="FileUploadManagerX1" runat="server" EnableFileManage="True" EnableRemoveConfirm="true"
                                            EnableRemoveConfirmWithFileName="true" Filter="*.*" FilterDescript="All Files (*.*)" MaxLengthLimit="4096000"
                                            MaxQueueLimit="5" MaxUploadLimit="1" RemoveConfirmText="是否確定刪除檔案?" Visible="False" />
                                    </td>
                                    <td>
                                        <TM:FileUploadedList ID="FileUploadedList1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 90px">備　　註：
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtisCheckMemo" runat="server" Width="500px" ReadOnly="true" Height="19px"></asp:TextBox>
                                        <input id="btnSelectMemo" type="button" value="..." />
                                        <br />
                                        <span style="color: Red;">＊附註：若點選『是』，需上傳檔案；若點選『否』，需填寫備註。</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">有無簽定計畫執行效益衡量指標</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbisBenefitFlag" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">有</asp:ListItem>
                                <asp:ListItem Value="0">無</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">是否達成預期效益及內容</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbisReachBenefit" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">支出憑證之種類</td>
                        <td class="qury_table_td5" aria-orientation="horizontal">
                            <asp:RadioButtonList ID="rdbExpenseDocKind" runat="server" RepeatDirection="Horizontal" Width="200px">
                                <asp:ListItem Value="1" Selected="True">原始憑證</asp:ListItem>
                                <asp:ListItem Value="2">領據</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td5" colspan="2">
                            <asp:CheckBox ID="chkisBgtProved" Text="納入預算證明" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">支出憑證核銷方式</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbExpenseDocCancelMode" runat="server" RepeatDirection="Horizontal" Width="98%">
                                <asp:ListItem Value="1" Selected="True">經本署同意憑證由受補(捐)助單位留存</asp:ListItem>
                                <asp:ListItem Value="2">檢附原始憑證辦理核銷</asp:ListItem>
                                <asp:ListItem Value="3">檢附原始憑證影本辦理核銷</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">計畫執行情形</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisFinish" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">已完成</asp:ListItem>
                                <asp:ListItem Value="0">未完成</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" rowspan="3" style="background-color: #CCFFCC;">計畫結案與否</td>
                        <td class="qury_table_td5" rowspan="3">
                            <asp:RadioButtonList ID="rdbisClose" runat="server" Height="100px">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">結案日期</td>
                        <td class="qury_table_td4">
                            <asp:TextBox ID="txtCloseDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">計畫未完成原因</td>
                        <td class="qury_table_td4">
                            <asp:TextBox ID="txtunfinishMemo" runat="server" Width="85%" ReadOnly="true"></asp:TextBox>
                            <input id="btnSelectCause" type="button" value="..." />
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">未完成金額</td>
                        <td class="qury_table_td4">
                            <asp:TextBox ID="txtunfinishMoney" runat="server" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">原定當年度完成多年期計畫</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisMutiPlan" runat="server" RepeatDirection="Horizontal" Width="800px">
                                <asp:ListItem Value="1" Selected="True">有</asp:ListItem>
                                <asp:ListItem Value="0">無(原定當年度完成多年期計畫是否如期完成免填)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2" rowspan="2">原定當年度完成多年期計畫是否如期完成</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisFinishMutiPlan" runat="server" RepeatDirection="Horizontal" Width="400px">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="2">延宕完成</asp:ListItem>
                                <asp:ListItem Value="3">註銷計畫</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbMutiPlanMode" runat="server" RepeatDirection="Horizontal" Width="250px">
                                <asp:ListItem Value="1">延宕完成</asp:ListItem>
                                <asp:ListItem Value="0">註銷計畫</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td5" colspan="3" nowrap="true">&nbsp;原因&nbsp;&nbsp;<asp:TextBox ID="txtunfinishCause" runat="server" Width="92%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">執行績效</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtExcuteEffects" runat="server" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="width: 1%; background-color: #CCFFCC;">連續補助之計畫</td>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">是否為連續三年補助同一單位之計畫</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisThreeYSamePlan" runat="server" RepeatDirection="Horizontal" Width="300px">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否(以下免填)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">連續補助之原因</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtContinuteCause" runat="server" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">上年度補助經費</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtLastYSubMoney" runat="server" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></asp:TextBox>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">前年度補助經費</td>
                        <td class="qury_table_td4">
                            <asp:TextBox ID="txtBeforeLastYSubMoney" runat="server" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="6" style="width: 1%; background-color: #CCFFCC;">出國旅費</td>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">計畫經費有無支出應出國旅費</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisPayAbroadExpenses" runat="server" RepeatDirection="Horizontal" Width="300px">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否(以下免填)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" rowspan="2">是否依計畫確實執行</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisAbroadExcutePlan" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td5" colspan="3">&nbsp;原因：&nbsp;&nbsp;
                            <asp:TextBox ID="txtNoExcutePlanCause" runat="server" Width="85%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" rowspan="2">是否提交出國報告</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisAbroadReport" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td class="qury_table_td5" colspan="3">&nbsp;原因：&nbsp;&nbsp;
                            <asp:TextBox ID="txtNoAbroadReportCause" runat="server" Width="85%"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">出國旅費金額</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtAbroadMoney" runat="server" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></asp:TextBox>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <td class="qury_table_td1" colspan="2" style="background-color: #CCFFCC;">備註</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:TextBox ID="txtSubisdyMemo" runat="server" Width="90%"></asp:TextBox>&nbsp;
                            <input id="btnSelectMemo" type="button" value="..." />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td4" colspan="5">
                            <span style="color: Red;">＊本表系立法委員及審計部要求填報資料，請各單位確實查填</span>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <asp:Panel ID="Panel1" runat="server" CssClass="AlignCenterMiddle">
                <asp:Button ID="btnDelete" runat="server" Text="刪除" CssClass="Btn04" OnClick="btnDel_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" Text="儲存" class="Btn04" OnClick="btnSave_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnClose" runat="server" Text="關閉" class="Btn04" />
                &nbsp;&nbsp;
                <input type="button" id="btnMemo" value="備註維護" class="Btn04" />
            </asp:Panel>
            <!-- 暫時性彈出的選擇頁面 Start -->
            <div id="TempShowDiv"></div>
            <!-- 暫時性彈出的選擇頁面 End -->
            <br />
        </div>

        <script type="text/javascript">

            $(function () {

                //成果考核方式及標準
                check_rdbisAssess();
                $("#<%=rdbisAssess.ClientID%> input").change(function () {
                    check_rdbisAssess();
                });
                // 出國旅費
                check_rdbisPayAbroadExpenses()
                $("#<%=rdbisPayAbroadExpenses.ClientID%> input").change(function () {
                    check_rdbisPayAbroadExpenses();
                });
                //連續補助之計畫
                check_rdbisThreeYSamePlan();
                $("#<%=rdbisThreeYSamePlan.ClientID%> input").change(function () {
                    check_rdbisThreeYSamePlan();
                });
                //計畫結案與否
                check_rdbisClose();
                $("#<%=rdbisClose.ClientID%> input").change(function () {
                    check_rdbisClose();
                });
                //原定當年度完成多年期計畫
                check_rdbisMutiPlan(false);
                $("#<%=rdbisMutiPlan.ClientID%> input").change(function () {
                    check_rdbisMutiPlan(true);
                });

                $("input:radio[name='rdbSubisdySelectMode']").click(function () {
                    if ($(this).prop("checked")) {
                        if ("1" == $(this).val()) { //<%--法定預算已明列補(捐)助對象--%>
                            $("#ddlSelectProcessMode").val("");
                            $("#txtBgtSubisdyCause").prop("disabled", false);
                        }
                        else { //<%--公開徵選 or 來函申請--%>
                            $("#txtBgtSubisdyCause").val("").prop("disabled", true);

                            if ("2" == $(this).val()) {
                                $("#ddlSelectProcessMode")[0].selectedIndex = 1;
                            }
                            else if ("3" == $(this).val()) {
                                $("#ddlSelectProcessMode")[0].selectedIndex = 2;
                            }
                        }
                    }
                });
                //<%--受委辦單位徵選方式--%>
                if ("1" != $("input:radio[name='rdbSubisdySelectMode']:checked").val())
                    $("#txtBgtSubisdyCause").prop("disabled", true);
            });

            //#region 成果考核方式及標準開啟或關閉
            function check_rdbisAssess() {
                var tmpselect = $("input[id^='<% =rdbisAssess.ClientID %>']:checked").val();
                if (tmpselect == 1)
                    $("#txtisAssessMode").prop('disabled', false);
                else {
                    $("#txtisAssessMode").val('').prop('disabled', true);
                    $("txtisAssessMode").removeAttr('disabled');
                }
            }
            //#endregion


            //#region 出國旅費開啟或關閉
            function check_rdbisPayAbroadExpenses() {
                var tmpselect = $("input[id^='<% =rdbisPayAbroadExpenses.ClientID %>']:checked").val();
                if (tmpselect == 0) {


                    //選項都不選
                    $("input[id^='<% =rdbisAbroadExcutePlan.ClientID %>']").attr('checked', false);
                    $("input[id^='<% =rdbisAbroadReport.ClientID %>']").attr('checked', false);
                    //關閉選擇
                    $("input[id^='<% =rdbisAbroadExcutePlan.ClientID %>']").attr('disabled', true);
                    $("input[id^='<% =rdbisAbroadReport.ClientID %>']").attr('disabled', true);
                    $("#txtNoExcutePlanCause").val('').prop('disabled', true);
                    $("#txtNoAbroadReportCause").val('').prop('disabled', true);
                    $("#txtAbroadMoney").val('').prop('disabled', true);
                }
                else {
                    $("input[id^='<% =rdbisAbroadExcutePlan.ClientID %>']").attr('disabled', false);
                    $("input[id^='<% =rdbisAbroadReport.ClientID %>']").attr('disabled', false);
                    $("#txtAbroadMoney").prop('disabled', false);
                    $("#txtNoExcutePlanCause").prop('disabled', false);
                    $("#txtNoAbroadReportCause").prop('disabled', false);

                }
            }
            //#endregion



            //#region 連續補助之計畫
            function check_rdbisThreeYSamePlan() {
                var tmpselect = $("input[id^='<% =rdbisThreeYSamePlan.ClientID %>']:checked").val();

                if (tmpselect == 0) {
                    $("#txtContinuteCause").val('').prop('disabled', true);
                    $("#txtLastYSubMoney").val('').prop('disabled', true);
                    $("#txtBeforeLastYSubMoney").val('').prop('disabled', true);
                }
                else {
                    $("#txtContinuteCause").prop('disabled', false);
                    $("#txtLastYSubMoney").prop('disabled', false);
                    $("#txtBeforeLastYSubMoney").prop('disabled', false);
                }
            }
            //#endregion



            //#region 計畫結案與否
            function check_rdbisClose() {
                var tmpselect = $("input[id^='<% =rdbisClose.ClientID %>']:checked").val();

                if (tmpselect == 1) {
                    $("#txtunfinishMemo").val('').prop('disabled', true);
                    $("#txtunfinishMoney").val('').prop('disabled', true);
                    $("#txtCloseDate").prop('disabled', false);
                }
                else if (tmpselect == 0) {
                    $("#txtunfinishMemo").prop('disabled', false);
                    $("#txtunfinishMoney").prop('disabled', false);
                    $("#txtCloseDate").val('').prop('disabled', true);
                }
            }
            //#endregion


            //#region 原定當年度完成多年期計畫
            //tmpDofirst 只有當使用者點選radiobtn才執行 否則頁面錯誤訊息postback使用者選擇會被刷掉
            function check_rdbisMutiPlan(tmpDofirst) {
                var tmpselect = $("input[id^='<% =rdbisMutiPlan.ClientID %>']:checked").val();

                if (tmpselect == 0) {
                    //選項都不選
                    $("input[id^='<% =rdbisFinishMutiPlan.ClientID %>']").attr('checked', false);
                    //關閉選擇
                    $("input[id^='<% =rdbisFinishMutiPlan.ClientID %>']").attr('disabled', true);
                    $("#txtunfinishCause").val('').prop('disabled', true);

                }
                else if (tmpselect == 1) {
                    //開啟選擇
                    $("input[id^='<% =rdbisFinishMutiPlan.ClientID %>']").attr('disabled', false);
                    $("#txtunfinishCause").prop('disabled', false);

                    if (tmpDofirst)
                        RadionButtonSelectedValueSet('<% =rdbisFinishMutiPlan.ClientID %>', '1')  // 如期完成 => 是
                }
        }
        //#endregion



        function RadionButtonSelectedValueSet(name, SelectdValue) {
            $('input[name="' + name + '"][value="' + SelectdValue + '"]').prop('checked', true);
        }

        //#region 備註維護
        $("#btnMemo").click(function () {
            var src = "../../tsbMemoT.Web/FrmtsbMemoT_tsbMemo/Default.aspx?menuID=1811&PageMod=9&type=2";
            MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
                {
                    title: "備註維護",
                    width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                    height: document.documentElement.offsetHeight * 0.85
                });

        });
        //#endregion




        //#region Memo選擇頁面 -- 未派員就地抽查之原因：  
        $("#btnSelectMemo").click(function () {

            $("#TempShowDiv").append("<div id='selectMemo'></div>");

            var selectWindow = $("#selectMemo").kendoWindow({
                visible: false,
                iframe: true,
                title: "備註資料選取",
                width: 800,
                height: 600,
                modal: true,
                resizable: true,
                refresh: function () { this.center(); },
                deactivate: function () { this.destroy(); },
                close: function (e) {
                    var returnData = window.frames[0].document.getElementById("txtReturnData").value

                    if (returnData.length > 0)
                        $("#<%= this.txtisCheckMemo.ClientID %>").val(returnData);
                    else
                        $("#<%= this.txtisCheckMemo.ClientID %>").val("");
                },
                content: "Memo.aspx?KeyWord=未派員就地抽查之原因："
            }).data("kendoWindow");

            selectWindow.open().center();
        });
        //#endregion

        //#region isBgtMemo選擇頁面 -- 未納入受補助單位預算之原因：
        $("#btnSelectBgtMemo").click(function () {
            $("#TempShowDiv").append("<div id='selectMemo'></div>");

            var selectWindow = $("#selectMemo").kendoWindow({
                visible: false,
                iframe: true,
                title: "備註資料選取",
                width: 800,
                height: 600,
                modal: true,
                resizable: true,
                refresh: function () { this.center(); },
                deactivate: function () { this.destroy(); },
                close: function (e) {
                    var returnData = window.frames[0].document.getElementById("txtReturnData").value

                    if (returnData.length > 0)
                        $("#<%= this.txtisBgtMemo.ClientID %>").val(returnData);
                    else
                        $("#<%= this.txtisBgtMemo.ClientID %>").val("");
                },
                content: "Memo.aspx?KeyWord=未納入受補助單位預算之原因："
            }).data("kendoWindow");

            selectWindow.open().center();
        });
        //#endregion

        //#region Cause選擇頁面 -- 計畫未完成原因：
        $("#btnSelectCause").click(function () {
            $("#TempShowDiv").append("<div id='selectMemo'></div>");

            var selectWindow = $("#selectMemo").kendoWindow({
                visible: false,
                iframe: true,
                title: "備註資料選取",
                width: 800,
                height: 600,
                modal: true,
                resizable: true,
                refresh: function () { this.center(); },
                deactivate: function () { this.destroy(); },
                close: function (e) {
                    var returnData = window.frames[0].document.getElementById("txtReturnData").value

                    if (returnData.length > 0)
                        $("#<%= this.txtunfinishMemo.ClientID %>").val(returnData);
                    else
                        $("#<%= this.txtunfinishMemo.ClientID %>").val("");
                },
                content: "Memo.aspx?KeyWord=計畫未完成原因："
            }).data("kendoWindow");

            selectWindow.open().center();
        });
        //#endregion

        //#region $("#btnClose").click
        $("#btnClose").click(function () {
            parent.location.href = parent.location.href;
            return false;
        });
        //#endregion

        //#region $("#btnDelete").click
        $("#btnDelete").click(function () {
            if (confirm('是否真的要刪除此筆資料？')) {
                return true;
            }
            return false;
        });
        //#endregion

        //#region $("#btnSave").click
        $("#btnSave").click(function () {
            if ($("#form1").valid()) {
                $.blockUI({ message: "<b><img src='../../Images/ajax-loader.gif' />資料處理中，請稍後...</b>" });
                return true;
            } else
                alert("欄位驗證失敗，請檢查紅色星號的欄位是否有填！");

            return false;
        });
        //#endregion

        //#region 頁面初始化

        $(function () {
            fnPageInit();
        });

        function fnPageInit() {

            $.MyKendoComboBox();
            $.MyKendoDatePicker();
            $.MyKendoMultiSelect();
            $("#form1").validate({
                onsubmit: false, ignore: ""
            });

            //預設驗證規則
            $("[datepicker='datepicker']").each(function () {
                $(this).rules("add", {
                    date: true
                });
            });

            $(":input").bind("focusout keyup change", function () {
                $(this).valid();
            });

        }
        //#endregion

        </script>
    </form>
</body>
</html>
