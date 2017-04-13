<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="approved.Web.Frmapproved_approved.Modify" EnableEventValidation="true" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <%: Styles.Render("~/Content/basic") %>
    <%: Styles.Render("~/Content/jqueryui") %>
    <%: Styles.Render("~/Content/jqueryval") %>
    <%: Styles.Render("~/Content/kendo/2014.1.416/bundle") %>
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
                <asp:Label ID="lbltitle" runat="server" Text="核定資料新增作業"></asp:Label></h1>
            <asp:FormView ID="FormView1" runat="server" OnDataBound="FormView1_DataBound" Width="100%">
                <ItemTemplate>
                    <table class="MainCon3" style="width: 100%; vertical-align: top" border="1">
                        <tr>
                            <td class="qury_table_td">會簽編號</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbApplyWordNum" runat="server" Width="150px" Text='<%# Eval("tsbApplyWordNum") %>'></asp:TextBox>
                                <asp:TextBox ID="txttsbDecideNo" runat="server" Text='<%# Eval("tsbDecideNo") %>' Enabled="false" Style="display: none"></asp:TextBox><!---核定號-->
                                <asp:TextBox ID="txttsbApplyNo" runat="server" Text='<%# Eval("tsbApplyNo") %>' Enabled="false" Style="display: none"></asp:TextBox><!---會簽號-->
                                
                            </td>
                            <td class="qury_table_td">會簽日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbMarkDate" runat="server" Width="150px" Text='<% #ConverDate_ADtoROC(Convert.ToDateTime(Eval("tsbMarkDate")).ToString("yyyy/MM/dd"))%>' MyKendoDatePicker="MyKendoDatePicker" onfocus="blur()"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">會簽金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbMoney" runat="server" Width="150px" Text='<%# string.Format( "{0:N0}",Eval("tsbMoney")) %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>填表日期</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txttsbDecideDate" runat="server" MyKendoDatePicker="MyKendoDatePicker" Text='<% #ConverDate_ADtoROC(Convert.ToDateTime(Eval("tsbDecideDate")).ToString("yyyy/MM/dd"))%>' Width="150px"></asp:TextBox>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>核定金額</td>
                            <td class="qury_table_td4">
                                <asp:TextBox ID="txtDtsbMoney" runat="server" onfocus="blur()" Text='<%# string.Format( "{0:N0}",Eval("DtsbMoney")) %>' Width="150px"></asp:TextBox>
                            </td>
                            <td class="qury_table_td">加簽否</td>
                            <td class="qury_table_td4">
                                <asp:CheckBox ID="chbapplyplus" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請業務單位</td>
                            <td class="qury_table_td4">
                                <asp:DropDownList ID="ddltsbWorkUnitNo" runat="server" Width="150px">
                                </asp:DropDownList>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>申請人</td>
                            <td class="qury_table_td4">
                               <%-- <asp:TextBox ID="txttsbWorkUserNo" runat="server" CssClass="Width40p" Text='<%# Eval("tsbWorkUserNo") %>' Width="150px"></asp:TextBox>--%>
                                <asp:TextBox ID="txtBtsbWorkUserNo" runat="server" CssClass="Width40p" Text='<%# Eval("BtsbWorkUserNo") %>' Width="150px"></asp:TextBox>
                            </td>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>核定註記</td>
                            <td class="qury_table_td4">
                                <asp:DropDownList ID="ddltsbDecideFlag" runat="server" Width="150px">
                                    <asp:ListItem Value="1">1下次核定</asp:ListItem>
                                    <asp:ListItem Value="0">0餘額釋放</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>

                            <asp:TextBox ID="txttsbBgtYear" runat="server" Text='<%# Eval("tsbBgtYear") %>' Style="display: none"></asp:TextBox>
                                <!--分項計畫年-->


                            <td class="qury_table_td">用途說明</td>
                            <td colspan="5" class="qury_table_td4">
                                <asp:TextBox ID="txttsbTrustSubsidyName" runat="server" Text='<%# Eval("tsbTrustSubsidyName") %>' Width="650px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="qury_table_td"><span style="color: Red;">＊</span>事由</td>
                            <td colspan="5" class="qury_table_td4">
                                <span style="color: Red;">＊最大輸入字數：120 個中文字。</span><br/>
                                <asp:TextBox ID="txtDtsbMemo" runat="server" Rows="3" TextMode="MultiLine" Width="650px" Text='<%# Eval("DtsbMemo") %>'></asp:TextBox>
                                <input id="btnChoosePhrase" type="button" value="..."  onclick="fnCallPhraseDialog();"   />
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </asp:FormView>
        </div>
        <br />
        <%-- <asp:Panel ID="Panel2" runat="server" Width="100%" style="position:absolute;background-color:white">--%>
        <asp:Panel ID="Panel2" runat="server" Width="100%" >
            <asp:TextBox ID="txttsbDecideSeq" runat="server" Style="display: none"></asp:TextBox>
            <div id="tabETitle" class="editTitle">
                <asp:CheckBox ID="chkfloat" runat="server" Text="漂浮" style="display:none"/>
                編 輯 區
            </div>
            <table style="width: 100%;" border="1">
                <tr class="DtleditTd">
                    <td style="width: 12%"><span style="color: Red;">＊</span>會簽資料</td>
                    <td style="width: 8%">經資門別<br /> 預算來源</td>
                    <td style="width: 10%">經費單位<br /> 控帳業務</td>
                    <td style="width: 25%">計畫科目/用途別科目</td>
                    <td colspan="3" style="width: 25%">受款人</td>
                    <td style="width: 7%"><span style="color: Red;">＊</span>核定金額<br/><span style="color: Red;">＊</span>簽約金額</td>
                    <td style="width: 9%"><span style="color: Red;">＊</span>簽約日期<br /> <%--<span style="color: Red;">＊</span>主持人--%></td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <asp:DropDownList ID="ddlApplyDtlData" runat="server" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td rowspan="2" >
                        <asp:DropDownList ID="ddlEcodAccKindName" runat="server" onfocus="blur()" Width="100%"></asp:DropDownList>
                         <asp:DropDownList ID="ddlEcodBgtOrigin" runat="server" onfocus="blur()" Width="100%"></asp:DropDownList>
                    </td>
                    <td rowspan="2" >
                        <asp:DropDownList ID="ddlEcodDepartName" runat="server" onfocus="blur()" Width="100%"></asp:DropDownList>
                        <asp:DropDownList ID="ddlcodBiz" runat="server" onfocus="blur()" Width="100%"></asp:DropDownList>  <!-- 控帳業務 -->
                    </td>
                    <td rowspan="2" >
                        <asp:DropDownList ID="ddltsbPlanCode" runat="server"  onfocus="blur()" Width="100%">
                        </asp:DropDownList>
                        <br />
                        <asp:DropDownList ID="ddloulOutlayCode" runat="server" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 12%">
                        <div id="div_GVUse">
                            <asp:TextBox ID="txtEtsbPayeeName" runat="server" onfocus="blur()" Width="98%"></asp:TextBox>
                            <asp:TextBox ID="txtEtsbPayeeNo" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                            <asp:TextBox ID="txtEtsbPayeeKind" runat="server" onfocus="blur()" Style="display: none"></asp:TextBox>
                        </div>
                        <div id="div_PayeeUse" style="display: none">
                            <asp:Label ID="lblselectPayeeCount" runat="server" Text=""></asp:Label>
                        </div>
                        <asp:TextBox ID="txtPayeeReturnData" runat="server" onfocus="blur()" Style="display: none;"></asp:TextBox>
                         &nbsp;</td>
                    <td style="width: 4%">
                        <input id="btnPayee"  runat="server"  type="button" value="..." style="width: 98%" />
                    </td>
                    <td style="width: 4%">
                        <asp:Button ID="btnPayClear" runat="server" OnClick="btnPayClear_Click" Text="取消" Width="98%" />

                    </td>
                    <td rowspan="2">
                        <asp:TextBox ID="txtEtsbMoney" runat="server" Width="98%"  OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox> <!--核定金額本年度--->
                        <asp:TextBox ID="txtEtsbMoney1" runat="server" Width="98%" Height="23px" OnKeyPress="if(((event.keyCode&gt;=48)&amp;&amp;(event.keyCode &lt;=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}" Style="display:none"></asp:TextBox> <!--核定金額次年度--->
                        <asp:TextBox ID="txtEtsbContractMoney" runat="server" Width="98%"  OnKeyPress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox> <!--簽約金額--->
                         </td>
                    <td rowspan="2">
                        <asp:TextBox ID="txttsbContractDTime" runat="server" MyKendoDatePicker="MyKendoDatePicker"  Width="98%"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="txtEtsbHostName" runat="server"  Style="display:none"></asp:TextBox><!--主持人--->
                    </td>
                </tr>
                <tr>
                    <td colspan="3">就地審計：<asp:DropDownList ID="ddlEinspect" runat="server" Width="62%">
                        <asp:ListItem Value="0">一般(非就地審計)</asp:ListItem>
                        <asp:ListItem Value="1">就地審計(不納入地方政府預算)</asp:ListItem>
                        </asp:DropDownList><!--就地審計--->
                    </td>
                </tr>
            </table>

            <div style="text-align: center;">
                <asp:Button ID="btnAddApplyDtl" runat="server" Text="增加明細"   OnClientClick="if(btn_AddEdit_check()==false){ return false}else{return true}"   OnClick="btnAddApplyDtl_Click" CssClass="Btn12" />
                &nbsp;&nbsp;
                <asp:Button ID="btnModifyApplyDtl" runat="server" Text="確認修改"    OnClientClick="if(btn_AddEdit_check()==false){ return false}else{return true}"  OnClick="btnModifyApplyDtl_Click" CssClass="Btn12" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDeleteApplyDtl" runat="server" Text="刪除明細" OnClick="btnDeleteApplyDtl_Click" CssClass="Btn12" />
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
                        <HeaderStyle HorizontalAlign="Center" Width="30" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="核定明細號" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAtsbApplySeq" runat="server" Text='<%# Eval("AtsbApplySeq") %>' Style="display: none"></asp:Label>
                            <!--會簽名細號-->
                            <asp:Label ID="lblBtsbDecideSeq" runat="server" Text='<%# Eval("BtsbDecideSeq") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="50" />
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="年度" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAtsbYear" runat="server" Text='<%# Eval("BtsbYear") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="30" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="經資門別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAtsbAccKind" runat="server" Text='<%#    CodeFormat( Eval("BtsbAccKind").ToString(),"ddlEcodAccKindName")%> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="預算來源" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAtsbBgtSourceCode" runat="server" Text='<%#  CodeFormat( Eval("BtsbBgtSourceCode").ToString(),"ddlEcodBgtOrigin") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Center" Width="100" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="經費單位" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblAtsbBgtDepCode" runat="server" Text='<%#  CodeFormat( Eval("BtsbBgtDepCode").ToString(),"ddlEcodDepartName") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                        <ItemStyle HorizontalAlign="Center" Width="100" />
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="控帳業務" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lbltsbBizCode" runat="server" Text='<%# CodeFormat( Eval("BtsbBizCode").ToString(),"ddlcodBiz") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="計畫科目" Visible="True">
                        <ItemTemplate>                                                    
                            <asp:Label ID="lblAtsbPlanCode" runat="server" Text='<%#  CodeFormat( Eval("BtsbPlanCode").ToString(),"ddltsbPlanCode") %> '></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Left" Width="200" />
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="受款人名稱" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbPayeeName" runat="server" Text='<%# Eval("BtsbPayeeName") %>'></asp:Label>
                            <asp:Label ID="lblBtsbPayeeNo" runat="server" Text='<%# Eval("BtsbPayeeNo") %>' Style="display: none"></asp:Label>
                            <asp:Label ID="lblBtsbPayeeKind" runat="server" Text='<%# Eval("BtsbPayeeKind") %>' Style="display: none"></asp:Label>
                            <asp:Label ID="lblBinspect" runat="server" Text='<%# Eval("Binspect") %>' Style="display: none"></asp:Label> <!--就地審計--->

                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="200" />
                        <ItemStyle HorizontalAlign="Center" Width="200" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="就地審計" Visible="True">
                        <ItemTemplate>
                              <asp:CheckBox ID="chkDtsbPassFlag" runat="server" Checked='<%#  (Eval("Binspect")??"0").ToString().Equals("1")%> ' Width="40px" Enabled="false" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="120"  />
                        <ItemStyle HorizontalAlign="Center" Width="120" />
                    </asp:TemplateField>





                    <asp:TemplateField HeaderText="用途別" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbOutlayCodeName" runat="server" Text='<%#  OutlayFormat( Eval("BtsbOutlayCode").ToString())%>'></asp:Label>
                            <asp:Label ID="lblBtsbOutlayCode" runat="server" Text='<%# Eval("BtsbOutlayCode") %>' Style="display: none"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="120"  />
                        <ItemStyle HorizontalAlign="Center" Width="120" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="金額<br/>(本年度)" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("BtsbMoney")) %>'></asp:Label>
                            <asp:Label ID="lblBtsbContractMoney" runat="server" Text='<%#   string.Format("{0:N0}", Eval("BtsbContractMoney")) %>' Style="display: none"></asp:Label><!--簽約金額--->
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="80" />
                        <ItemStyle HorizontalAlign="Center" Width="80" />
                    </asp:TemplateField>


                   



                   <%-- <asp:TemplateField HeaderText="金額(次年度)" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbMoney1" runat="server" Text='<%#   string.Format("{0:N0}", Eval("BtsbMoney1")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="60"  />
                        <ItemStyle HorizontalAlign="Center" Width="60" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="簽約日期" Visible="True">
                        <ItemTemplate>
                            <asp:Label ID="lblBtsbContractDTime" runat="server" Text='<%# Eval("BtsbContractDTime").ToRocDate()  %>'></asp:Label>
                            <asp:Label ID="lblBtsbHostName" runat="server" Text='<%# Eval("BtsbHostName")  %>' Style="display:none"></asp:Label> <!-- 主持人--->
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="30" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>

                  
                     <%--  <asp:TemplateField HeaderText="主持人" Visible="false">
                        <ItemTemplate>
                        
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Width="30" />
                        <ItemStyle HorizontalAlign="Center" Width="30" />
                    </asp:TemplateField>--%>



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
            <asp:Button ID="btnDelete" runat="server" Text="刪除" Cssclass="Btn04" OnClick="btnDel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="儲存" Cssclass="Btn04" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnClose" runat="server" Text="關閉" Cssclass="Btn04" />
        </asp:Panel>
        <div id="win1"></div> <!--受款人被開啟的頁面--->

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
                GetoulcodeStart();
                Getoulcode();//選擇科目變化用途別
                getSelectDtlData();
                setddltsbDecideFlag_control();
                disabledControl();//禁止點選
                //checkfloat(); 漂浮功能啟用

            });


            //#region 編輯區漂浮
            $('#chkfloat').click(function () {
                checkfloat();
            });

            function checkfloat()
            {
                if ($('#chkfloat').prop('checked') == true) {
                    animateOpen();
                }
                else {
                    animateClose();
                }
            }

            function animateOpen()
            {
             var $scrollingDiv = $("#<%= Panel2.ClientID %>");
                $scrollingDiv.attr("style", "position:absolute;background-color:#C4E1FF;filter:alpha(opacity=90);");
                $(window).scroll(function () {
                    $scrollingDiv
                     .stop()
                     .animate({ "marginTop": ($(window).scrollTop() + 30) + "px" }, "slow");
                });
            }
            function animateClose() {
                var $scrollingDiv = $("#<%= Panel2.ClientID %>");
                $scrollingDiv.attr("style", "");
                $(window).scroll(function () {
                    $scrollingDiv
                     .stop();
                });
               
            }
            //#endregion 編輯區漂浮END





            ///
            function disabledControl()
            {

                //$('#ddlEcodAccKindName').attr("disabled", "disabled");
                //$('#ddlEcodBgtOrigin').attr("disabled", "disabled");
                //$('#ddlEcodDepartName').attr("disabled", "disabled");
                //$('#ddltsbPlanCode').attr("disabled", "disabled");



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
                $('#ddltsbPlanCode').click(function () {
                    alert('禁止選取');
                    return false;
                });


                $('#ddlcodBiz').click(function () {
                    alert('禁止選取');
                    return false;
                });


            }

            ///

            //事由_片語
            function fnCallPhraseDialog() {

                var thisName = "FormView1_txtDtsbMemo";
                var strReturnVal = showModalDialog("../../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
                //alert(thisName);
                if (strReturnVal != "Cancel") {
                    document.all(thisName).value = document.all(thisName).value + strReturnVal;
                }
            }
            //


          
            //#region 核定註記按鈕顯示控制
            function setddltsbDecideFlag_control() {
                var tmpddl = $("#<%=  FormView1.FindControl("ddltsbDecideFlag").ClientID %>")
                var tmptitle = $("#<%=  form1.FindControl("lbltitle").ClientID %>").text();

                if (tmptitle.indexOf('修改') > -1) {
                    if (tmpddl.val() == "0")
                        $(".Btn12").hide();
                    else
                        $(".Btn12").show();

                    tmpddl.change(function () {

                        if ($(this).val() == "0")
                            $(".Btn12").hide();
                        else
                            $(".Btn12").show();

                    });
                }

            }
            //#endregion


            //#region $("#btnClose").click
            $("#btnClose").click(function () {
                parent.location.href = parent.location.href + "&WIN=0";
                return false;
            });
            //#endregion


            //#region $("#btnDelete").click
            $("#btnDelete").click(function () {
                if (confirm('是否真的要刪除此筆資料？')) {
                    $.blockUI({ message: '<h1>資料刪除中，請耐心等候...</h1>' });
                    return true;
                }
                return false;
            });
            //#endregion


            //#region $("#btnSave").click
            $("#btnSave").click(function () {
                if ($("#form1").valid()) {
                    $.blockUI({ message: '<h1>資料儲存中，請耐心等候...</h1>' });
                    return true;
                } else {
                    alert("驗證失敗，請檢查紅色星號的欄位是否有填！！");
                }


                return false;
            });
            //#endregion


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

                //#endregion 基本           
            }


            //編輯區檢查
            function btn_AddEdit_check()
            {
                var tmpMoney =  parseInt ($('#txtEtsbMoney').val(),10); //金額
                var tmptsbContractMoney = parseInt ( $('#txtEtsbContractMoney').val(),10); // 合約金額
                //alert(tmpMoney );
                //alert(tmptsbContractMoney);

                if (tmpMoney > tmptsbContractMoney)
                {
                    alert('合約金額不可小於核定金額');
                    return false;

                }
            }





            function GetoulcodeStart() {
                var applyNo = $("#<%=  FormView1.FindControl("txttsbApplyNo").ClientID %>").val();
                var ddl2 = $("#<%= ddloulOutlayCode.ClientID %>");
                //載入
                var selectedStart = $("#<%= ddlApplyDtlData.ClientID %>").val();

                //檢視或刪除時
                if (selectedStart == null) {
                    return;
                }

                if (selectedStart.length > 0) {

                    $.ajax({
                        type: "POST",
                        url: "ajax01.aspx",
                        //async: false,
                        dataType: "JSON",
                        data: { 'seqNo': selectedStart, 'applyNo': applyNo },
                        success: function (result) {
                            ddl2.empty();
                            $.each(result.oulayCoedeItem, function (i, value) {
                                //ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>")

                               // var tmpDefaultselect = 0;

                                if (value.IsCannSelect)
                                { ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>") }
                                else
                                { ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\" style=\"color:Navy\" disabled=\"true\" ></option>") }


                            });

                            //$('#ddloulOutlayCode  option[value !=0][disabled!=""]:first').attr('selected', true);


                            //設定並選取該明細資料
                            $('#ddloulOutlayCode option').each(function (i, item) {
                                if ($(item).val() == result.selectoulaycode) {
                                    $(item).attr('selected', true);
                                }
                            });


                            //其他相關資料
                            $('#ddlEcodAccKindName option[value=' + result.tsbAccKind + ']').attr('selected', true)
                            $('#ddlEcodBgtOrigin option[value=' + result.tsbBgtSourceCode + ']').attr('selected', true)
                            $('#ddlEcodDepartName option[value=' + result.tsbBgtDepCode + ']').attr('selected', true)
                            $('#ddltsbPlanCode option[value=' + result.tsbPlanCode + ']').attr('selected', true)
                            //alert(result.tsbBizCode);
                            $('#ddlcodBiz option[value=' + result.tsbBizCode + ']').attr('selected', true)


                        },
                        error: function () { alert("資料載入錯誤，請檢查 經資門別/預算來源/經費單位/控帳業務/計畫科目/用途別科目 表單資料是否含有此筆資料"); }
                    });
                    return false;
                }

            }


            function Getoulcode() {
                var ddl = $("#<%= ddlApplyDtlData.ClientID %>");
                var ddl2 = $("#<%= ddloulOutlayCode.ClientID %>");
                var applyNo = $("#<%=  FormView1.FindControl("txttsbApplyNo").ClientID %>").val();
             
                //變更
                ddl.change(function () {

                    var selected = $(this).val();

                    $.ajax({
                        type: "POST",
                        url: "ajax01.aspx",
                        async: false,
                        dataType: "JSON",
                        data: { 'seqNo': selected, 'applyNo': applyNo },
                        success: function (result) {
                            ddl2.empty();
                            $.each(result.oulayCoedeItem, function (i, value) {
                                if (value.IsCannSelect)
                                    ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\"></option>")
                                else
                                    ddl2.append("<option value=\"" + value.Ivalue + "\" label=\"" + value.IText + "\" style=\"color:Navy\" disabled=\"true\" ></option>")


                            });

                            //設定並選取該明細資料
                            $('#ddloulOutlayCode option').each(function (i, item) {
                                if ($(item).val() == result.selectoulaycode) {
                                    $(item).attr('selected', true);
                                }
                            });

                            //其他相關資料
                            $('#ddlEcodAccKindName option[value=' + result.tsbAccKind  +']').attr('selected', true);
                            $('#ddlEcodBgtOrigin option[value=' + result.tsbBgtSourceCode + ']').attr('selected', true);
                            $('#ddlEcodDepartName option[value=' + result.tsbBgtDepCode + ']').attr('selected', true);
                            $('#ddltsbPlanCode option[value=' + result.tsbPlanCode + ']').attr('selected', true);

                        },
                        error: function () { alert("資料載入錯誤，請檢查 經資門別/預算來源/經費單位/控帳業務/計畫科目/用途別科目 表單資料是否含有此筆資料"); }
                    });
                    return false;
                });

            }

            function getSelectDtlData() {


                $('#GridView1 tr').click(function () {
                    $.blockUI({ message: '<h1>讀取中，請耐心等候...</h1>' });

                    $("#<%=GridView1.ClientID%> tr").not(':first').each(function () {
                        $(this).css({ "background-color": "white" });
                    });

                    var tmpIndex = $.trim($(this).find("td:first").text());
                    if (parseInt(tmpIndex, 10) > 0) {
                        $(this).css({ "background-color": "yellow" });
                    }


                    var tmptsbApplySeq = $.trim($(this).find("[id$=lblAtsbApplySeq]").text()); //會簽明細號
                    var tmptsbDecideSeq = $(this).find("[id$=lblBtsbDecideSeq]").text();//核定明細號
                    var tmptsbPayeeName = $.trim($(this).find("[id$=lblBtsbPayeeName]").text());//受款人名稱
                    var tmptsbPayeeNo = $.trim($(this).find("[id$=lblBtsbPayeeNo]").text());//受款人代碼
                    var tmptsbPayeeKind = $.trim($(this).find("[id$=lblBtsbPayeeKind]").text());//受款人代碼
                    var tmptsbOutlayCodeName = $.trim($(this).find("[id$=lblBtsbOutlayCode]").text());
                    var tmptsbMoney = $(this).find("[id$=lblBtsbMoney]").text();//核定金額
                    var tmptsbMoney1 = $(this).find("[id$=lblBtsbMoney1]").text();//核金額2

                                                                
                    var tmptsbContractMoney = $(this).find("[id$=lblBtsbContractMoney]").text();//簽約金額
                    var tmpinspect = $(this).find("[id$=lblBinspect]").text(); //就地審計
                  


                    var tmptsbContractDTime = $(this).find("[id$=lblBtsbContractDTime]").text();//簽約時間
                    var tmptsbHostName = $(this).find("[id$=lblBtsbHostName]").text();//主持人

                    //alert(tmptsbContractMoney);
                    //alert(tmpinspect);

                    //會籤資料
                    $("#<%= ddlApplyDtlData.ClientID %> option").each(function (i, item) {
                        if ($(item).val() == tmptsbApplySeq) {
                            $(item).attr('selected', true);
                            $("#<%= ddlApplyDtlData.ClientID %> option").change();
                        }
                    });

                    //用途別
                    $('#ddloulOutlayCode option').each(function (i, item) {
                        if ($(item).val() == tmptsbOutlayCodeName.split(" ")[0]) {
                            $(item).attr('selected', true);
                        }
                    });
                    $('#txtEtsbMoney').val($.trim(tmptsbMoney)); //金額1
                    $('#txtEtsbMoney1').val($.trim(tmptsbMoney1));//金額2
                    $('#txtEtsbContractMoney').val($.trim(tmptsbContractMoney)); //簽約金額

                    //$('#txtEtsbApplySeq').val($.trim(tmptsbApplySeq));//會簽明細號  (用不到)
                    $('#txttsbDecideSeq').val($.trim(tmptsbDecideSeq));//核定明細號
                    $('#txttsbContractDTime').val($.trim(tmptsbContractDTime));// 簽約時間

                    $('#txtEtsbHostName').val($.trim(tmptsbHostName));// 主持人



                    $("#<%= txtEtsbPayeeNo.ClientID %>").val(tmptsbPayeeNo);//受款人代碼
                    $("#<%= txtEtsbPayeeName.ClientID %>").val(tmptsbPayeeName);//受款人代碼
                    $("#<%= txtEtsbPayeeKind.ClientID %>").val(tmptsbPayeeKind);//受款人類型


                    if (tmpinspect.length > 0) {
                        //就地審計
                        $('#<%= ddlEinspect.ClientID %> option[value=' + tmpinspect + ']').attr('selected', true);
                    }
                    //清空
                    $("#<%= this.txtPayeeReturnData.ClientID %>").val('');

                    //點選該筆顯示
                    $('#div_GVUse').show();
                    $('#div_PayeeUse').hide();


                    $.unblockUI();
                });
            }
                //
            $("#btnPayee").click(function () {

                //判斷是否存在
                if (!$("#win1").data("kendoWindow")) {

                    OpenPayeeWindow();
                    //加入loading
                    
					var $load = $("<div id='load' style='position: absolute; top: 50%; left: 42%; '><h3 style='color:#0000AA;'><img src='../../Images/ajax-loader.gif' />&nbsp;載入受款人資料...</h3></div>");
                    $("#win1").data("kendoWindow").open().center()
                        .wrapper.find(".k-window-content").append($load);
                    //載畢隱藏
                    $("#win1").find(".k-content-frame").load(function () {
                        $("#win1").find("#load").hide();
                    });

                }
                else {

                    $("#win1").data("kendoWindow").open().center();

                }
            });

            function OpenPayeeWindow() {
                $("#win1").kendoWindow({
                    visible: false,
                    iframe: true,
                    title: "受款人資料選取",
                    width: 800,
                    height: 600,
                    modal: true,
                    resizable: true,
                    refresh: function () {
                        this.center();
                    },
                    close: function (e) {
                        var dialog = $("#win1").data("kendoWindow");

                        var returndata = window.frames[0].document.getElementById("txtReturnData").value
                        var returnMessage = window.frames[0].document.getElementById("txtMessage").value

                        if (returndata.length > 0 && returnMessage.length > 0) {
                            $("#<%= this.txtPayeeReturnData.ClientID %>").val(returndata);
                            $("#<%= this.lblselectPayeeCount.ClientID %>").html(returnMessage);
                            $("#<%= this.txtEtsbPayeeName.ClientID %>").val('');//要清除
                            $("#<%= this.txtEtsbPayeeNo.ClientID %>").val('');//要清除
                            $('#div_GVUse').hide();
                            $('#div_PayeeUse').show();

                        } else {

                            //後端判斷受款人用
                            $("#<%= this.txtPayeeReturnData.ClientID %>").val('');
                            $("#<%= this.lblselectPayeeCount.ClientID %>").html('');
                            $('#div_GVUse').show();
                            $('#div_PayeeUse').hide();

                        }

                    },
                    content: "Payee.aspx"
                });

            }

        </script>
    </form>
</body>
</html>
