<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="tsbficEntrustParaT.Web.FrmtsbficEntrustParaT_tsbficEntrustPara.Modify" EnableEventValidation="true" %>
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
<%--20150701 [Edit]:加入附加檔案功能需修改 head 位置--%>

<%-- Style專區 --%>
<%: Styles.Render("~/Content/basic") %>
<%: Styles.Render("~/Content/jqueryui") %>
<%: Styles.Render("~/Content/jqueryval") %>
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
            <asp:TextBox ID="txtoulaycode" runat="server" Style="display: none"></asp:TextBox>
            <!--用途別 JS判斷用-->
            <h1 class="h1Class">委辦參數勾選設定</h1>
            <asp:FormView ID="FormView1" Style="width: 100%;" runat="server">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td1">會計年度</td>
                            <td class="qury_table_td5" style="width: 10%;">
                                <asp:TextBox ID="txtaccYear" Width="100px" runat="server" Text='<%# Eval("tsbYear") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支年度</td>
                            <td class="qury_table_td5" style="width: 10%;">
                                <asp:TextBox ID="txttsbYear" Width="100px" runat="server" Text='<%# Eval("tsbYear") %>'></asp:TextBox>
                            </td>
                            <td class="qury_table_td1">動支編號</td>
                            <td class="qury_table_td5" style="width: 10%;">
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
                            <td class="qury_table_td1">受委辦單位</td>
                            <td colspan="9" class="qury_table_td2">
                                <asp:TextBox ID="txttsbPayeeName" runat="server" Text='<%# Eval("tsbPayeeName") %>' Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td1">委託辦理事項</td>
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
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2" rowspan="2">受委辦單位徵選方式</td>
                        <td class="qury_table_td4" rowspan="2">
                            <asp:RadioButtonList ID="rdbEntrustSelectMode" runat="server">
                                <asp:ListItem Value="1" Selected="True">直接委辦</asp:ListItem>
                                <asp:ListItem Value="2">公開徵選</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">直接委辦之原因</td>
                        <td class="qury_table_td5">
                            <asp:DropDownList ID="ddlDirectEntrustCause" runat="server" Width="98%" Enabled="false">
                                <asp:ListItem Value =""></asp:ListItem>
                                <asp:ListItem Value="1">(1) 按政府採購法第105條辦理</asp:ListItem>
                                <asp:ListItem Value="2">(2) 按行政程序法辦理</asp:ListItem>
                                <asp:ListItem Value="3">(3) 預算明列</asp:ListItem>
                                <asp:ListItem Value="4">(4) 其他規定</asp:ListItem>
                            </asp:DropDownList>
                            <div id="divEntrustOtherCause" style="display:none;">
                                原因：
                                <asp:TextBox runat="server" ID="txtEntrustOtherCause" style="width:98%;"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">徵選辦理方式</td>
                        <td class="qury_table_td5">
                            <asp:DropDownList ID="ddlSelectProcessMode" runat="server" Width="98%"  Enabled="false">
                                <asp:ListItem Value =""></asp:ListItem>
                                <asp:ListItem Value="1">(1) 按政府採購法辦理</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">合約金額</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtContractMoney" runat="server" Width="140px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkisUnContractMoney" Text="無合約金額" runat="server" />
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">無簽約原因</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtUnContractCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                            <input id="btnSelectUCCause" type="button" value="..." />
                            <br />
                            <span style="color: Red;">＊附註：若勾選『無合約金額』，則此欄位必填。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">委辦(訂約)日期</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtContractDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                            <br />
                            <span style="color: Red;">＊附註：若勾選『無合約金額』，則此欄位無需填寫。</span>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">未能於6/30前簽約之原因</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtOverContractDateCause" runat="server" Width="80%" onclick="blur()" ReadOnly="true"></asp:TextBox>
                            <input id="btnSelectOCCause" type="button" value="..." />
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">完成時間(預定)</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtContractBDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">未依約完成之原因</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtOverBDateCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                            <input id="btnSelectODCause" type="button" value="..." />
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">完成時間(實際)</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtContractEDate" runat="server" Width="140px" MyKendoDatePicker="MyKendoDatePicker" onclick="blur()"></asp:TextBox>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">未能於12/31前完成之原因</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtOverFinishDateCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                            <input id="btnSelectOFCause" type="button" value="..." />
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">是否按政府採購法辦理</td>
                        <td class="qury_table_td5">
                            <asp:RadioButtonList ID="rdbisGov" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">有</asp:ListItem>
                                <asp:ListItem Value="0">無</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">原因</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtisGovCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                            <input id="btnSelectGCause" type="button" value="..." />
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">委託辦理事項類別</td>
                        <td class="qury_table_td5" colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rdbisAuth" runat="server" Width="130px" Height="90px" onclick="AutoSelect(this);">
                                            <asp:ListItem Value="1" Selected="True">行政及政策類</asp:ListItem>
                                            <asp:ListItem Value="2">科學及技術類</asp:ListItem>
                                            <asp:ListItem Value="3">其他委託事項</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <span style="color: Red;">＊若點選『其他委託事項』，則【有無報告、有無評審、委託事項(報告)處理】三項需點選『無需填寫』。</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">有無報告</td>
                        <td class="qury_table_td5" colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rdbisReport" runat="server" Width="100px" Height="90px">
                                            <asp:ListItem Value="1" Selected="True">有</asp:ListItem>
                                            <asp:ListItem Value="0">無</asp:ListItem>
                                            <asp:ListItem Value="2">無需填寫</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td style="width: 100%">原因：
                                        <asp:TextBox ID="txtisReportCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                                        <input id="btnSelectRCause" type="button" value="..." />
                                        <br />
                                        <span style="color: Red;">＊附註：若點選『無』，需填寫原因。</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">有無評審</td>
                        <td class="qury_table_td5" colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rdbisJudge" runat="server" Width="100px" Height="90px">
                                            <asp:ListItem Value="1" Selected="True">有</asp:ListItem>
                                            <asp:ListItem Value="0">無</asp:ListItem>
                                            <asp:ListItem Value="2">無需填寫</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td style="width: 100%">原因：<asp:TextBox ID="txtisJudgeCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                                        <input id="btnSelectJCause" type="button" value="..." />
                                        <br />
                                        <span style="color: Red;">＊附註：若點選『無』，需填寫原因。</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">委託事項(報告)處理</td>
                        <td class="qury_table_td5" colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rdbisProc" runat="server" Width="150px" Height="100px">
                                            <asp:ListItem Value="2" Selected="True">納入計畫實施</asp:ListItem>
                                            <asp:ListItem Value="4">無需填寫</asp:ListItem>
                                            <asp:ListItem Value="1">存參</asp:ListItem>
                                            <asp:ListItem Value="3">其他</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td style="width: 100%">原因：
                                        <asp:TextBox ID="txtisProcCause" runat="server" Width="80%" ReadOnly="true"></asp:TextBox>
                                        <input id="btnSelectPCause" type="button" value="..." />
                                        <br />
                                        <span style="color: Red;">＊附註：若點選『存參』或『其他』，需填寫原因。</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <%--20170104 17.9  請將程式內與「是否派員就地抽查」相關之欄位設定清除(不用填寫該欄位，並無需檢核勾稽該欄位，且不用上傳附件)。--%>
                    <tr runat="server" visible="false">
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">是否派員就地抽查</td>
                        <td class="qury_table_td5" colspan="3">
                            <table>
                                <tr>
                                    <td rowspan="2" colspan="2">
                                        <asp:RadioButtonList ID="rdbisCheck" runat="server" Width="150px" Height="120px">
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
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
                                        <asp:TextBox ID="txtisCheckMemo" runat="server" Width="500px" ReadOnly="true"></asp:TextBox>
                                        <input id="btnSelectMemo" type="button" value="..." />
                                        <br />
                                        <span style="color: Red;">＊附註：若點選『是』，需上傳檔案；若點選『否』，需填寫備註。</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">支出憑證之種類</td>
                        <td class="qury_table_td3" colspan="3" aria-orientation="horizontal">
                            <div style="float:left;">
                                <asp:RadioButtonList ID="rdbExpenseDocKind" runat="server" RepeatDirection="Horizontal" Width="200px">
                                    <asp:ListItem Value="1" Selected="True">原始憑證</asp:ListItem>
                                    <asp:ListItem Value="2">領據</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <%--20170106 17.12 當「是否按政府採購法辦理」選「否」加上「支出憑證之種類」選「領據」時，應填寫「委託機關核准文號」(xx字第xxxxxxxxxxxx號)，請新增填寫介面，並於「參數表」內備註欄內出現。--%>
                            <div id="divtsbOrganApprovedNo" style="float:left; display:none;">
                                委託機關核准文號：
                                <asp:TextBox runat="server" ID="txttsbOrganApprovedNo" style="width:300px;"></asp:TextBox><br/>
                                <span style="color: Red;">　　　　　＊範例：（xx字 第xxxxxxxx號）。</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" colspan="2" style="background-color: #CCFFCC;">支出憑證核銷方式</td>
                        <td class="qury_table_td4" colspan="3">
                            <asp:RadioButtonList ID="rdbExpenseDocCancelMode" runat="server" RepeatDirection="Horizontal" Width="98%">
                                <asp:ListItem Value="1" Selected="True">經本署同意憑證由受委辦單位留存</asp:ListItem>
                                <asp:ListItem Value="2">檢附原始憑證辦理核銷</asp:ListItem>
                                <asp:ListItem Value="3">檢附原始憑證影本辦理核銷</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

<%--                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">支出憑證有無同意由受委辦單位留存</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisApplyInspect" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1">有</asp:ListItem>
                                <asp:ListItem Value="0">無</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2" rowspan="3">計畫結案與否</td>
                        <td class="qury_table_td5" rowspan="3">
                            <asp:RadioButtonList ID="rdbisClose" runat="server">
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
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">有無簽定計畫執行效益衡量指標</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisBenefitFlag" runat="server" RepeatDirection="Horizontal" Width="280px">
                                <asp:ListItem Value="1" Selected="True">有</asp:ListItem>
                                <asp:ListItem Value="0">無－未研訂</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">是否達成預期效益及內容</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisReachBenefit" runat="server" RepeatDirection="Horizontal" Width="150px">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
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
                        <td class="qury_table_td5" colspan="3" nowrap="true">&nbsp;原因：&nbsp;&nbsp;<asp:TextBox ID="txtunfinishCause" runat="server" Width="85%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">執行績效</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtExcuteEffects" runat="server" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="width: 1%; background-color: #CCFFCC;">連續委託之計畫</td>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">是否為連續三年委託同一單位之計畫</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:RadioButtonList ID="rdbisThreeYSamePlan" runat="server" RepeatDirection="Horizontal" Width="300px">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否(以下免填)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">連續委辦之原因</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtContinuteCause" runat="server" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">上年度委辦經費</td>
                        <td class="qury_table_td5">
                            <asp:TextBox ID="txtLastYSubMoney" runat="server" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></asp:TextBox>
                        </td>
                        <td class="qury_table_td1" style="background-color: #CCFFCC;">前年度委辦經費</td>
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

                        <%--<td class="qury_table_td" style="background-color: #CCFFCC;">連續補助之原因</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="TextBox1" runat="server" Width="98%"></asp:TextBox>
                        </td>--%>
                    </tr>
                    <tr>
                        <td class="qury_table_td5" colspan="3">&nbsp;原因：&nbsp;&nbsp;
                            <asp:TextBox ID="txtNoExcutePlanCause" runat="server" Width="85%"></asp:TextBox></td>

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
                            <asp:TextBox ID="txtNoAbroadReportCause" runat="server" Width="85%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;">出國旅費金額</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtAbroadMoney" runat="server" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></asp:TextBox>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <td class="qury_table_td" style="background-color: #CCFFCC;" colspan="2">備註</td>
                        <td class="qury_table_td5" colspan="3">
                            <asp:TextBox ID="txtEntrustMemo" runat="server" Width="90%"></asp:TextBox>&nbsp;
                            <input id="btnSelectMemo" type="button" value="..." />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="qury_table_td5" colspan="5">
                            <span style="color: Red;">＊本表系立法委員及審計部要求填報資料，請各單位確實查填。</span>
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

                //出國旅費
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
                //用途別
                check_outlay();
                //<%--受委辦單位徵選方式--%>
                $("input:radio[name='rdbEntrustSelectMode']").click(function () {
                    if ($(this).prop("checked")) {
                        if ("1" == $(this).val()) { //<%--直接委辦--%>
                            $("#ddlSelectProcessMode").val("").prop("disabled", true);
                            $("#ddlDirectEntrustCause").prop("disabled", false);
                        }
                        else { //<%--公開徵選--%>
                            $("#ddlDirectEntrustCause").val("").prop("disabled", true);
                            $("#txtEntrustOtherCause").val("");
                            $("#divEntrustOtherCause").hide();

                            $("#ddlSelectProcessMode").prop("disabled", false);
                            $("#ddlSelectProcessMode")[0].selectedIndex = 1;
                        }
                    }
                });
                $("#ddlDirectEntrustCause").change(function () {
                    if ("4" == $(this).val())
                        $("#divEntrustOtherCause").show();
                    else
                        $("#divEntrustOtherCause").hide();
                });
                //<%--受委辦單位徵選方式--%>
                if ("1" == $("input:radio[name='rdbEntrustSelectMode']:checked").val()) {
                    $("#ddlDirectEntrustCause").prop("disabled", false);
                    if ("4" == $("#ddlDirectEntrustCause").val())
                        $("#divEntrustOtherCause").show();
                }
                else
                    $("#ddlSelectProcessMode").prop("disabled", false);
 
                $("#chkisUnContractMoney").click(function () {
                    if ($(this).prop("checked")) {
                        $("#txtUnContractCause, #btnSelectUCCause").prop("disabled", false);
                    }
                    else {
                        $("#txtUnContractCause").val("");
                        $("#txtUnContractCause, #btnSelectUCCause").prop("disabled", true);
                    }
                });
                if (!$("#chkisUnContractMoney").prop("checked")) {
                    $("#txtUnContractCause").val("");
                    $("#txtUnContractCause, #btnSelectUCCause").prop("disabled", true);
                }
                //<%--20170106 17.12 當「是否按政府採購法辦理」選「否」加上「支出憑證之種類」選「領據」時，應填寫「委託機關核准文號」(xx字第xxxxxxxxxxxx號)，請新增填寫介面，並於「參數表」內備註欄內出現。--%>
                //<%--支出憑證之種類 2:領據--%>
                $("input:radio[name='rdbExpenseDocKind']").click(function () {
                    if ("2" == $(this).val() && "0" == $("input:radio[name='rdbisGov']:checked").val())
                        $("#divtsbOrganApprovedNo").show();
                    else
                        $("#divtsbOrganApprovedNo").hide();
                });
                $("input:radio[name='rdbisGov']").click(function () {
                    if ("2" == $("input:radio[name='rdbExpenseDocKind']:checked").val() && "0" == $(this).val())
                        $("#divtsbOrganApprovedNo").show();
                    else
                        $("#divtsbOrganApprovedNo").hide();
                });
                if ("2" == $("input:radio[name='rdbExpenseDocKind']:checked").val() && "0" == $("input:radio[name='rdbisGov']:checked").val())
                    $("#divtsbOrganApprovedNo").show();
            });

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
                //alert(tmpselect);
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
                //alert(tmpselect);
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
                //alert(tmpselect);
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

                    if (tmpDofirst) {
                        //如期完成選是
                        RadionButtonSelectedValueSet('<% =rdbisFinishMutiPlan.ClientID %>', '1')
                }

            }
    }
    //#endregion




    //#region 025102用途別
    function check_outlay() {
        var tmpoulayCode = $("#txtoulaycode").val();
        if (tmpoulayCode == "025102") {
            $("input[id^='<% =rdbisAuth.ClientID %>'][value='3']").attr('disabled', true);
            $("input[id^='<% =rdbisReport.ClientID %>'][value='2']").attr('disabled', true);
            $("input[id^='<% =rdbisJudge.ClientID %>'][value='2']").attr('disabled', true);
            $("input[id^='<% =rdbisProc.ClientID %>'][value='4']").attr('disabled', true);
        }
    }
    //#endregion



    //#region 備註維護
    $("#btnMemo").click(function () {
        var src = "../../tsbMemoT.Web/FrmtsbMemoT_tsbMemo/Default.aspx?menuID=1811&PageMod=9&type=1";
        MyLibraryJs.JqPluginExt.fnKendoWindowOpen(src,
            {
                title: "備註維護",
                width: document.getElementsByTagName('body')[0].clientWidth * 0.95,
                height: document.documentElement.offsetHeight * 0.85
            });

    });
    //#endregion

    //#region  Memo 選擇頁面 -- 未派員查核之原因：
    $("#btnSelectMemo").click(function () {

        $("#TempShowDiv").append("<div id='selectMemo'></div>");

        var selectWindow = $("#selectMemo").kendoWindow({
            visible: false,
            iframe: true,
            title: "備註資料選取",
            width: 800,
            height: 750,
            modal: true,
            resizable: true,
            refresh: function () { this.center(); },
            deactivate: function () { this.destroy(); },
            close: function (e) {
                var returnData = window.frames[0].document.getElementById("txtReturnData").value;

                if (returnData.length > 0)
                    $("#<%= this.txtisCheckMemo.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtisCheckMemo.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未派員查核之原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    //#endregion

    //#region  OverBDateCause 選擇頁面 -- 未依約完成之原因：
    $("#btnSelectODCause").click(function () {

        $("#TempShowDiv").append("<div id='selectMemo'></div>");

        var selectWindow = $("#selectMemo").kendoWindow({
            visible: false,
            iframe: true,
            title: "備註資料選取",
            width: 800,
            height: 750,
            modal: true,
            resizable: true,
            refresh: function () { this.center(); },
            deactivate: function () { this.destroy(); },
            close: function (e) {
                var returnData = window.frames[0].document.getElementById("txtReturnData").value;

                if (returnData.length > 0)
                    $("#<%= this.txtOverBDateCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtOverBDateCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未依約完成之原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    //#endregion


    //#region  unfinishMemo選擇頁面 -- 計畫未完成原因
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
            },
            content: "Memo.aspx?KeyWord=計畫未完成原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    //#endregion

    //#region  UnContractCause選擇頁面 -- 無簽約原因
    $("#btnSelectUCCause").click(function () {
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
                    $("#<%= this.txtUnContractCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtUnContractCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=無簽約原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END

    // OverContractDateCause選擇頁面  -- 未能於6/30前簽約之原因 
    $("#btnSelectOCCause").click(function () {
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
                var returnData = window.frames[0].document.getElementById("txtReturnData").value;

                if (returnData.length > 0)
                    $("#<%= this.txtOverContractDateCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtOverContractDateCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未能於6月底前簽約之原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END

    // OverFinishDateCause 選擇頁面 -- 未能於12/31前完成之原因
    $("#btnSelectOFCause").click(function () {
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
                    $("#<%= this.txtOverFinishDateCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtOverFinishDateCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未能於12/31前完成之原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END

    // isGovCause 選擇頁面 -- 不按政府採購法辦理之原因
    $("#btnSelectGCause").click(function () {
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
                    $("#<%= this.txtisGovCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtisGovCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=不按政府採購法辦理之原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END

    // isReportCause 選擇頁面 -- 未提報告原因：
    $("#btnSelectRCause").click(function () {
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
                    $("#<%= this.txtisReportCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtisReportCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未提報告原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END

    // isJudgeCause 選擇頁面 -- 未作評審原因：
    $("#btnSelectJCause").click(function () {
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
                    $("#<%= this.txtisJudgeCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtisJudgeCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未作評審原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END

    // isProcCause 選擇頁面 -- 未納入計畫實施之原因：
    $("#btnSelectPCause").click(function () {
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
                    $("#<%= this.txtisProcCause.ClientID %>").val(returnData);
                else
                    $("#<%= this.txtisProcCause.ClientID %>").val("");
            },
            content: "Memo.aspx?KeyWord=未納入計畫實施之原因："
        }).data("kendoWindow");

        selectWindow.open().center();
    });
    // END


    $(function () {
        fnPageInit();
    });

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
        } else {
            alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
        }
        return false;
    });
    //#endregion

    // 自動勾選功能
    function AutoSelect(input) {

        var value = $("input:radio[name='rdbisAuth']:checked").val();

        if (value == '3') {

            // 有無報告
            var tmpRBL = document.getElementById("rdbisReport");
            tmpRBL.rows[2].cells[0].childNodes[0].checked = true;

            // 有無評審
            var tmpRBL = document.getElementById("rdbisJudge");
            tmpRBL.rows[2].cells[0].childNodes[0].checked = true;

            // 委託事項(報告)處理
            var tmpRBL = document.getElementById("rdbisProc");
            tmpRBL.rows[1].cells[0].childNodes[0].checked = true;
        }
    }

    // 頁面初始化
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


        </script>
    </form>
</body>
</html>
