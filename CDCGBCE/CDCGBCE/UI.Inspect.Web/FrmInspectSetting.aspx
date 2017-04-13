<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmInspectSetting.aspx.vb" Inherits="UI.Inspect.Web.FrmInspectSetting" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <script language="javascript">


        function fnCallPayNameDtl(parObj) {
            var strReturnVal = showModalDialog(parObj.className, window, "dialogWidth:650px;dialogHeight:300px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel" && strReturnVal != "undefined") {
                if (strReturnVal != "")
                    parObj.innerText = strReturnVal;
            }
        }


        function fnCallAcmMemoDtl(parObj) {
            var strReturnVal = showModalDialog(parObj.className, window, "dialogWidth:650px;dialogHeight:300px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");


            if (strReturnVal != "Cancel") {
                if (strReturnVal != "")
                    parObj.innerText = "<font  style='cursor:hand'>" + strReturnVal + "</font>";
            }
        }




        function UCBDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBBDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }


        function UCEDate_Change(calendar) {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBEDate").value = (vDay.getYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
        }



        function OpenActData(parObj) {

            var strParams;
            strParams = parObj;
            //strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=" + arrID[0] + "&acmno1=" + arrID[1] + "&acppayno=" + arrID[2] + "&acppayno1=" + arrID[3] + "&mod=" + arrID[4];
            var strReturnVal = showModalDialog(strParams, window, "dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        }

    </script>

    <style type="text/css">
        .style1 {
            width: 118px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5"
            width="900" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    valign="top" align="left">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%"
                        border="1">
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="1" width="100%" border="0">
                                    <tr>
                                        <td align="right" width="90">日期區間：</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:TextBox>至<asp:TextBox ID="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:TextBox>
                                            <asp:Label ID="Label2" runat="server">(日期範例:095/09/28)</asp:Label>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">經費單位：</td>
                                        <td>
                                            <asp:DropDownList ID="DDLBgtDepName" runat="server"></asp:DropDownList></td>
                                        <td align="right" class="style1">執行單位：</td>
                                        <td>
                                            <asp:DropDownList ID="DDLWorkDepName" runat="server"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">計畫名稱：</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="DDLPlanName" runat="server" Width="480px"></asp:DropDownList>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">用途別：</td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="DDLOul" runat="server" Width="480px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">金額：</td>
                                        <td>
                                            <asp:TextBox ID="TBMoney" runat="server" Width="120px"></asp:TextBox></td>
                                        <td align="right" class="style1">廠商名稱：</td>
                                        <td>
                                            <asp:TextBox ID="TBPayName" runat="server" Width="280px"
                                                Style="margin-left: 0px"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td align="right" width="90">動支編號：</td>
                                        <td>
                                            <asp:TextBox ID="TBAcmWordNum" runat="server" Width="120px"></asp:TextBox></td>
                                        <td align="right" class="style1">事由：</td>
                                        <td>
                                            <asp:TextBox ID="TBMemo" runat="server" Width="280px"
                                                Style="margin-left: 0px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="90">報支廠商：</td>
                                        <td>
                                            <asp:DropDownList ID="DDLPayNameFlag" runat="server">
                                                <asp:ListItem Value="">------</asp:ListItem>
                                                <asp:ListItem Value="0">未輸入</asp:ListItem>
                                                <asp:ListItem Value="1">已輸入</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="style1">審計狀態：</td>
                                        <td>
                                            <asp:DropDownList ID="DDLInspectStatus" runat="server">
                                                <asp:ListItem Value="">------</asp:ListItem>
                                                <asp:ListItem Value="1">就地審計</asp:ListItem>
                                                <asp:ListItem Value="0">非就地審計</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr style="<%= strShowFlag(0) %>">
                                        <td align="right" width="90">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td align="right" class="style1">金額種類：</td>
                                        <td>
                                            <asp:DropDownList ID="DDLMoneyKind" runat="server">
                                                <asp:ListItem Value="1">簽證金額</asp:ListItem>
                                                <asp:ListItem Value="2">實際金額</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" style="table-layout: fixed">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnList" runat="server" Width="75px" Text="列出資料" Height="22px"></asp:Button>
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px"></asp:Button>
                                        </td>
                                    </tr>
                                </table>


                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" height="10"></td>
            </tr>
            <tr style="<%= strShowFlag(1) %>">
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    bordercolor="#666668">
                    <table style="table-layout: fixed; border-collapse: collapse" bordercolor="#ffffff" cellpadding="5" width="100%" border="1">
                        <tr>
                            <td align="left">
                                <asp:Button ID="BtnSave" runat="server" Text="就地審計設定存檔" Height="22"></asp:Button></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%"
                                    AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                                    PageSize="20">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
                                        BackColor="#003366"></HeaderStyle>
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="選取">
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CBdgSelect" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center"
                                                VerticalAlign="Middle" Wrap="False" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="簽證資料">
                                            <HeaderStyle Width="60px" />
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HLDataDtl" Target="_self" NavigateUrl='<%# "javascript:OpenActData("& Chr(39) & GetUrlTxt(Container.DataItem("acmWordNum") &"",Container.DataItem("acmKidNum") &""  , val(Container.DataItem("acmYear") &""),Container.DataItem("acmNo") , val( Container.DataItem("acmNo1") &"") , val(Container.DataItem("acmNo2")  &"") , val( Container.DataItem("acpPayYear")  &"") , val( Container.DataItem("acpPayNo") &"") , val( Container.DataItem("acpPayNo1") &"")) & Chr(39) &");"  %>' runat="server">簽證資料</asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateColumn>

                                        <asp:BoundColumn DataField="acmYear" HeaderText="年度">
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmWordNum" HeaderText="動支編號">
                                            <HeaderStyle Width="60px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmNo" Visible="False" HeaderText="系統號-4">
                                            <HeaderStyle Width="70px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvNo" Visible="False" HeaderText="acvNo-5">
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmNo1" HeaderText="再簽號">
                                            <HeaderStyle Width="45px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvNo1" Visible="False" HeaderText="acvNo1-7">
                                            <HeaderStyle Width="60px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmNo2" Visible="False" HeaderText="決標號-8">
                                            <HeaderStyle Width="45px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvNo2" Visible="False" HeaderText="acvNo2-9">
                                            <HeaderStyle Width="70px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acpPayYear" Visible="False" HeaderText="報支年度-10">
                                            <HeaderStyle Width="50px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acpPayNo" HeaderText="報支號">
                                            <HeaderStyle Width="50px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvSubNo" Visible="False" HeaderText="acvSubNo-12">
                                            <HeaderStyle Width="50px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acpPayNo1" Visible="true" HeaderText="轉正號">
                                            <HeaderStyle Width="50px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvSubNo1" Visible="False" HeaderText="acvSubNo1-14">
                                            <HeaderStyle Width="45px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmNoPrv" Visible="False" HeaderText="acmNoPrv-15">
                                            <HeaderStyle Width="45px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="inspect" Visible="False" HeaderText="inspect-16">
                                            <HeaderStyle Width="45px"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PlanName" HeaderText="分支計畫名稱"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="OulName" HeaderText="用途別">
                                            <HeaderStyle Width="50px"></HeaderStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="承辦人"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvExchNo" HeaderText="傳票號碼">
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="acvMoney" DataFormatString="{0:#,0}" HeaderText="金額">
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Bold="False"
                                                Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="廠商名稱">
                                            <HeaderStyle Width="40px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HLPayName" name="HLPayName" Target="_blank" onclick="fnCallPayNameDtl(this);" CssClass='<%# "../UI.CDCFun1.Web/FrmEditPayName.aspx?workstatus=edit&acmYear="& Container.DataItem("acmYear") & "&acmNoPrv="& Container.DataItem("acmNoPrv")  &"&acmNo=" & Container.DataItem("acmNo") &"&acvNo=" & Container.DataItem("acvNo") &"&acmNo1=" & Container.DataItem("acmNo1") &"&acvNo1=" & Container.DataItem("acvNo1") &"&acmNo2=" & Container.DataItem("acmNo2")  &"&acvNo2=" & Container.DataItem("acvNo2")  &"&acpPayYear=" & Container.DataItem("acpPayYear") &"&acpPayNo=" & Container.DataItem("acpPayNo") &"&acvSubNo=" & Container.DataItem("acvSubNo") &"&acpPayNo1=" & Container.DataItem("acpPayNo1") &"&acvSubNo1=" & Container.DataItem("acvSubNo1") & "&oulcode=" & Container.DataItem("oulOutlayCode") &"&acmpayname=" & Container.DataItem("acmPayName")  %>' runat="server"><%#IIf(Container.DataItem("acmPayName") & "" = "", "<font color=#FF0000 size=+1 style='cursor:hand'><u><b>未設定</b></u></font>", Container.DataItem("acmPayName") & "")%></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="事由">
                                            <HeaderStyle></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HLMemo" name="HLMemo" Target="_blank" onclick="fnCallAcmMemoDtl(this);" CssClass='<%# "FrmEditInspectMemo.aspx?workstatus=edit&acmYear="& Container.DataItem("acmYear") & "&acmNoPrv="& Container.DataItem("acmNoPrv")  &"&acmNo=" & Container.DataItem("acmNo") &"&acvNo=" & Container.DataItem("acvNo") &"&acmNo1=" & Container.DataItem("acmNo1") &"&acvNo1=" & Container.DataItem("acvNo1") &"&acmNo2=" & Container.DataItem("acmNo2")  &"&acvNo2=" & Container.DataItem("acvNo2")  &"&acpPayYear=" & Container.DataItem("acpPayYear") &"&acpPayNo=" & Container.DataItem("acpPayNo") &"&acvSubNo=" & Container.DataItem("acvSubNo") &"&acpPayNo1=" & Container.DataItem("acpPayNo1") &"&acvSubNo1=" & Container.DataItem("acvSubNo1") &"&acmmemo=" &  Server.UrlEncode(Container.DataItem("acmmemo") ) %>' runat="server"><%#"<font  style='cursor:hand'>" & Container.DataItem("acmMemo") & "</font> "%></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <ComponentArt:Calendar ID="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></ComponentArt:Calendar>

        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

    </form>
</body>
</html>
