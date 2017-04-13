<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActVisa2.ascx.vb"
    Inherits="AppCtrls.UCActVisa2" %>

<script language="javascript">
<!--

    function fnCallRptDtl(parObj) {

        var strPars;
        var tmpOulVal = "";
        var tmpArray = parObj.cssclass.split(":")
        //     for (var i=0;i<document.forms[0].elements.length;i++)
        //    {
        //        var e=document.forms[0].elements[i];
        //        if (e.getAttribute("MyName")=="TBAcmMemo")
        //        {
        //            tmpMemo=e.value;
        //            break;
        //        }
        //    }
        //
        var bolMemoExit = false;
        var bolOulExit = false;
        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (e.getAttribute("MyName") == "TBAcmMemo") {
                tmpMemo = e.value;
                bolMemoExit = true;
            }
            if (e.getAttribute("MyName") == "DDLdlOulName" && e.getAttribute("MyParentIndex") == parObj.MyParentIndex && e.getAttribute("MyIndex") == parObj.MyIndex) {
                tmpOulVal = e.value;
                bolOulExit = true;
            }
            if (bolMemoExit == true && bolOulExit == true) {
                break;
            }
        }


        strPars = "acmyear=" + tmpArray[0] + "&acmno=" + tmpArray[1] + "&acvno=" + tmpArray[2] + "&acmno1=" + tmpArray[3] + "&acvno1=" + tmpArray[4] + "&acmno2=" + tmpArray[5] + "&acvno2=" + tmpArray[6] + "&acmmemo=" + escape(tmpMemo) + "&oulcode=" + tmpOulVal; // + "&acppayyear=" + tmpArray(7) + "&acppayno=" & tmpArray(8) + "&acvsubno=" +  tmpArray(9) + "&acppayno1=" + tmpArray(10) + "&acvsubno1=" + tmpArray(11);
        //window.open("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars);
        //var strReturnVal=
        showModalDialog("../UI.CDCFun1.Web/FrmRptExtraDtl.aspx?" + strPars, window, "dialogWidth:850px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        //		if (strReturnVal != "Cancel" )
        //			{
        //				document.all(thisName).value=document.all(thisName).value + strReturnVal;
        //			}
    }



    function GetTotalAcvMoney() {
        var e = document.forms[0].elements[i];
        if (e.getAttribute("MyName") == "TBdgProdQry") {

        }

    }

    function check_Num() {
        if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
            return true;
        }
        else { event.keyCode = 0; false; }
    }




    function GetAutoAdjMoney(parObj, parIndex) {

        var dblTotal
        dblTotal = 0;

        //紀錄動支金額剩於數
        var objDG
        var bolFlag
        bolFlag = 0;

        //紀錄調整數，找到調整數物件，並記錄起來
        var objAdj
        var bolAdjFlag
        bolAdjFlag = 0;

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];

            //找動支數
            if (bolFlag == 0) {
                objDG = document.forms[0].elements[i];

                if (e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parIndex) {
                    bolFlag = 1;
                }
            }

            //找調整數
            if (bolAdjFlag == 0) {
                objAdj = document.forms[0].elements[i];

                if (e.getAttribute("MyName") == "TBdgAdjustMoney" && e.getAttribute("MyIndex") == parIndex) {
                    bolAdjFlag = 1;
                }
            }

            //找出明細總和
            if (e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parIndex) {
                if (e.value != "") {
                    dblTotal += parseFloat(replaceString(e.value, ",", ""));
                }
            }
        } // next i



        if (parObj.checked == true) {
            objAdj.value = parseFloat(replaceString(objDG.value, ",", "")) - dblTotal;
            parObj.checked = true;
        }
        else {
            objAdj.value = 0;
            //parObj.checked=true;
        }
    }

    function replaceString(sString, sReplaceThis, sWithThis) {
        if (sReplaceThis != "" && sReplaceThis != sWithThis) {
            var counter = 0;
            var start = 0;
            var before = "";
            var after = "";

            while (counter < sString.length) {
                start = sString.indexOf(sReplaceThis, counter);
                if (start == -1) {
                    break;
                }
                else {
                    before = sString.substr(0, start);
                    after = sString.substr(start + sReplaceThis.length, sString.length);
                    sString = before + sWithThis + after;
                    counter = before.length + sWithThis.length;
                }
            }
        }

        return sString;
    }



    function GetTotalPayMoney(parObj) {
        var dblTotal
        var objPayMoney;
        dblTotal = 0;

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];

            if (e.getAttribute("MyName") == "TBdlAcvMoney") {
                if (e.value != "") {
                    dblTotal += parseFloat(replaceString(e.value, ",", ""));
                }
            }

            if (e.getAttribute("MyName") == "TBAcmMoney1") {
                objPayMoney = e;
            }
        } // next i


        objPayMoney.value = dblTotal;
    }




    function CheckUpLevlMoney(parObj) {
        var dblTotal
        dblTotal = 0;
        var objDG
        var bolFlag
        bolFlag = 0;
        var bolFlag1 = 0;
        var objBtnSplit;

        for (var i = 0; i < document.forms[0].elements.length; i++) {
            var e = document.forms[0].elements[i];
            if (bolFlag == 0) {
                objDG = document.forms[0].elements[i];

                if (e.getAttribute("MyName") == "TBdgAcvMoney" && e.getAttribute("MyIndex") == parObj.MyParentIndex) {
                    bolFlag = 1;
                }
            }

            if (e.getAttribute("MyName") == "BtnSplit" && bolFlag1 == 0 && e.getAttribute("MyIndex") == parObj.MyParentIndex) {
                objBtnSplit = e;
            }

            if (e.getAttribute("MyName") == "TBdlAcvMoney" && e.getAttribute("MyParentIndex") == parObj.MyParentIndex) {
                if (e.value != "") {
                    dblTotal += parseFloat(replaceString(e.value, ",", ""));
                }
            }
        } // next i

        if (parseFloat(replaceString(objDG.value, ",", "")) - dblTotal < 0) {
            var tmpNo
            tmpNo = parseFloat(parObj.MyParentIndex) + 1;
            alert("動支序號為 " + tmpNo + " 報支金額總數大於原動支金額。請重新修改。");
            objBtnSplit.disabled = true;
            parObj.onfocus;
        }
        else {
            if (parseFloat(replaceString(objDG.value, ",", "")) - dblTotal == 0) {
                objBtnSplit.disabled = true;
            }
            else {
                objBtnSplit.disabled = false;
            }
        }
        //document.all("TBacmMoney1").value=dblTotal;

    }

//-->
</script>

<table _ondblclick="alert('1A:UCActVisa2.ascx')" cellpadding="0" style="border-collapse: collapse;
    margin-top: -1; width: 100%" border="0">
    <tr>
        <td>
            <!-- ↓折疊項目(1A) -->
            <table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1"
                bordercolor="#FFFFFF">
                <tr>
                    <td height="20" class="sFoldTitle">
                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                            <tr>
                                <td width="1%" align="right">
                                    <img id="img_FoldTitle_1A" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_1A', this.id)"
                                        align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" />
                                </td>
                                <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_1A')">
                                    預算動支項目<font color="red" size="2pt">←請展開</font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FoldTitle_1A" style="display: block" onpropertychange="sync_title_img(this)">
                    <td style="padding: 5px">
                        <table cellpadding="5" cellspacing="0" style="table-layout: fixed" border="0">
                            <tr>
                                <td width="150" align="right">
                                    <img id="img1A" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top"
                                        style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand"
                                            onclick='img1A.fireEvent("onclick")'>預算動支項目</span>
                                </td>
                                <td width="440" align="right" style="padding-right: 0px">
                                    <table border="0" cellpadding="0" style="border-collapse: collapse">
                                        <tr>
                                            <td style="display: block">
                                                <font size="2">經費所屬單位｜</font>
                                            </td>
                                            <td style="display: block">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td>
                                    <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
                                    <div id="div_UCActVisa2" class="DIV1_width" alt="DIV1" style="behavior: url(<%= resolveurl(scrollposurl)%>)"
                                        persistid="<%= savescrollpos.uniqueid %>" scrollpos="<%= savescrollpos.value %>">
                                        <input type="hidden" id="savescrollpos" name="savescrollpos" runat="server" />
                                        <asp:DataGrid ID="DataGrid2" runat="server" Width="100%" AutoGenerateColumns="False">
                                            <HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White"
                                                BackColor="#003366"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                            <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                            <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                            <Columns>
                                                <asp:TemplateColumn>
                                                    <HeaderStyle Width="15px"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo" MyName="LBdgAcvNo" MyIndex='<%# Container.ItemIndex %>'
                                                            MyParentIndex='<%# Container.ItemIndex %>' runat="server" Style="text-align: center;
                                                            cursor: help" Width="15px" Text='<%# Container.ItemIndex + 1  %>' onclick="setShowBudget(this)"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="年度">
                                                    <HeaderStyle Width="30px" Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"
                                                        Wrap="False"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:CheckBox id="CBdgNextYearFlag" tooltip="非本年度預算" runat="server" Enabled="false"></asp:CheckBox>
                                                        <asp:TextBox ID="TBdgBgtYear" runat="server" Width="30px" Style="text-align: Center" onfocus="this.blur();"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <HeaderStyle Width="1230px" />
                                                    <HeaderTemplate>
                                                        <table style="table-layout: fixed" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 30px; color: #ffffff;
                                                                    text-align: center">
                                                                    月份
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 50px; color: #ffffff;
                                                                    text-align: center">
                                                                    門別
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 75px; color: #ffffff;
                                                                    text-align: center">
                                                                    預算來源
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 100px; color: #ffffff;
                                                                    text-align: center">
                                                                    經費單位
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 140px; color: #ffffff;
                                                                    text-align: center">
                                                                    控帳業務
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 200px; color: #ffffff;
                                                                    text-align: center">
                                                                    計畫科目
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 200px; color: #ffffff;
                                                                    text-align: center">
                                                                    用途別科目
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 75px; color: #ffffff;
                                                                    text-align: center">
                                                                    動支金額
                                                                </td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 100px; color: #ffffff;
                                                                    text-align: center; display: none">
                                                                    用途說明
                                                                </td>
                                                               <%--20160115 [mdf]:因配合105年CGBA上線GBC系統之調整,暫付改預付--%>
                                                               <%-- <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 30px; color: #ffffff;
                                                                    text-align: center">
                                                                    暫付
                                                                </td>--%>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 30px; color: #ffffff;
                                                                    text-align: center">
                                                                    預付
                                                                </td>
                                                                <td style="font-size: 10pt; width: 60px; color: #ffffff; text-align: center; display: none">
                                                                    就地審計
                                                                </td>
                                                                <td style="font-size: 10pt; width: 60px; color: #ffffff; text-align: center">
                                                                    新增移除
                                                                </td>
                                                                <td style="font-size: 10pt; width: 60px; color: #ffffff; text-align: center; display: none">
                                                                    明細資料
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                        <table style="table-layout: fixed; margin-left: 0px" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table style="table-layout: fixed; margin-left: 0px" border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="border-right: #ffffff 1px solid; width: 30px" valign="top">
                                                                                <asp:TextBox ID="TBdgBgtMonth" runat="server" Width="30px" onfocus="this.blur();"
                                                                                    Style="text-align: center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtMonth"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 50px" valign="top">
                                                                                <asp:TextBox ID="TBdgAccKindName" runat="server" Width="50px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAccKindName"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 75px" valign="top">
                                                                                <asp:TextBox ID="TBdgBgtSourName" runat="server" Width="75px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtSourName"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 100px" valign="top">
                                                                                <asp:TextBox ID="TBdgBgtDepName" runat="server" Width="100px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtDepName"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 140px" valign="top">
                                                                                <asp:TextBox ID="TBdgBizName" runat="server" Width="140px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBizName"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 200px" valign="top">
                                                                                <asp:TextBox ID="TBdgPalnName" runat="server" Width="200px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgPalnName"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 200px" valign="top">
                                                                                <asp:TextBox ID="TBdgOulName" runat="server" Width="200px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgOulName"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 75px" valign="top">
                                                                                <asp:TextBox ID="TBdgAcvMoney" runat="server" Width="75px" onfocus="this.blur();"
                                                                                    Style="text-align: right" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvMoney"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 100px; display: none" valign="top">
                                                                                <asp:TextBox ID="TBdgAcvMemo" runat="server" Width="100px" onfocus="this.blur();"
                                                                                    MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgAcvMemo"></asp:TextBox>
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 30px; text-align: center" valign="top">
                                                                                <asp:CheckBox ID="CBdgPrePayFlag" runat="server" Enabled="false" />
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 30px; display: none" valign="top">
                                                                                <asp:CheckBox ID="CBdgInpsect" runat="server" Enabled="false" />
                                                                            </td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 60px" valign="top">
                                                                            </td>
                                                                            <td style="font-size: 10pt; width: 30px; display: none" valign="bottom">
                                                                                <input id="BtndgRptDtl" runat="server" type="button" value="..." visible="false"
                                                                                    style="height: 22px" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="13" align="right">
                                                                                <asp:DataList ID="DataList1" runat="server" Style="margin-right: 2px" OnItemCreated="DataList1_ItemCreated"
                                                                                    OnItemDataBound="DataList1_ItemDataBound">
                                                                                    <ItemTemplate>
                                                                                        <table style="table-layout: fixed; margin-left: 0px" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 20px; text-align: center">
                                                                                                    <asp:Label ID="LBdlNo" runat="server" Style="text-align: center; cursor: help" onclick="setShowBudget(this)"><%# Container.ItemIndex +1 %></asp:Label>
                                                                                                </td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 30px" valign="top" wrap="false">
                                                                                                    <asp:CheckBox id="CBdlNextYearFlag" tooltip="非本年度預算" runat="server"></asp:CheckBox>
                                                                                                    <asp:TextBox ID="TBdlYear" runat="server" Width="30px" onfocus="this.select();" Style="background-color: #FFFFE0; text-align: center" onkeypress="return check_Num()" MyName="TBdlYear"></asp:TextBox>
                                                                                                </td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 30px" valign="top">
                                                                                                    <asp:TextBox ID="TBdlMonth" runat="server" Width="30px" onfocus="this.select();"
                                                                                                        Style="background-color: #FFFFE0; text-align: center" onkeypress="return check_Num()"
                                                                                                        MyName="TBdlMonth"></asp:TextBox>
                                                                                                </td>
                                                                                                 <td style="border-right: #ffffff 1px solid; width: 120px; padding-top: 1px" valign="top">
                                                                                                  <asp:DropDownList ID="DDLdlAccKind" runat="server" Width="120px" style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex  %>" MyName="DDLdlAccKind" ></asp:DropDownList>
                                                                                                </td>
                                                                                                 <td style="border-right: #ffffff 1px solid; width: 200px; padding-top: 1px" valign="top">
                                                                                                    <asp:DropDownList ID="DDLdlOulName" runat="server" Width="200px" Style="background-color: #FFFFE0"
                                                                                                        MyIndex="<%# Container.ItemIndex  %>" MyName="DDLdlOulName">
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 75px" valign="top">
                                                                                                    <asp:TextBox ID="TBdlAcvMoney" runat="server" Width="75px" onblur="CheckUpLevlMoney(this);GetTotalPayMoney();"
                                                                                                        onfocus="this.select();" Style="background-color: #FFFFE0; text-align: right"
                                                                                                        onkeypress="return check_Num()" MyName="TBdlAcvMoney"></asp:TextBox>
                                                                                                </td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 100px; display: none" valign="top">
                                                                                                    <asp:TextBox ID="TBdlAcvMemo" runat="server" Width="100px" Style="background-color: #FFFFE0"></asp:TextBox>
                                                                                                </td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 30px; text-align: center" valign="top">
                                                                                                    <asp:CheckBox ID="CBdlPrePayFlag" runat="server" />
                                                                                                </td>
                                                                                                <td style="font-size: 10pt; width: 30px; text-align: center; display: none" valign="top">
                                                                                                    <asp:CheckBox ID="CBdlInpsect" runat="server" />
                                                                                                </td>
                                                                                                <td style="font-size: 10pt; width: 60px; text-align: center" valign="top">
                                                                                                    <asp:CheckBox ID="CBdlDel" runat="server" />
                                                                                                </td>
                                                                                                <td style="font-size: 10pt; width: 30px; text-align: center; display: none" valign="top">
                                                                                                    <input id="BtnRptDtl" runat="server" type="button" value="..." onclick="fnCallRptDtl(this)"
                                                                                                        style="height: 22px" visible="false" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="font-size: 10pt; width: 20px; text-align: right" valign="bottom">
                                                                    <asp:Button ID="BtnSplit" runat="server" Text="+" CssClass="<%# Container.ItemIndex %>"
                                                                        MyName="BtnSplit" MyIndex="<%# Container.ItemIndex %>" OnClick="BtnSplit_Click">
                                                                    </asp:Button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="結案">
                                                    <HeaderStyle Width="100px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                        Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center"
                                                        VerticalAlign="Middle" Wrap="False"></HeaderStyle>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="False" />
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:CheckBox ID="CBdgClose" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="TBdgAdjustMoney" MyName="TBdgAdjustMoney" MyIndex="<%# Container.ItemIndex %>"
                                                                        Style="text-align: right" runat="server" Width="80px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <!-- Insert 項目內容 here -->
                    </td>
                </tr>
            </table>
            <!-- 折疊項目(1A)↑ -->
        </td>
    </tr>
</table>
