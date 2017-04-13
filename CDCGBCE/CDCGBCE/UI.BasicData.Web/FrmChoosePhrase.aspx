<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmChoosePhrase.aspx.vb" Inherits="UI.BasicData.Web.FrmChoosePhrase" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>FrmChoosePhrase</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta http-equiv="Pragma" content="No-cache">
    <base target="_self">
    <script language="javascript">
<!--

    function fnGetInfo(bnkSubNo) {
        //var sData = dialogArguments;
        //sData.sUserName = bnkSubNo;
        //sData.fnUpdate();
        returnValue = bnkSubNo;

        //returnValue=bnkSubNo;
    }


    returnValue = "Cancel";
    function fnCancel() {
        //var sData = dialogArguments;
        //sData.sUserName = "";
        //sData.fnUpdate();
    }

    //-->
    </script>
</head>
<body ms_positioning="GridLayout" bgcolor="#dadee9">
    <form id="Form1" method="post" runat="server">
        <table id="Table1" style="z-index: 105; left: 16px; width: 496px; position: absolute; top: 16px; height: 142px"
            cellspacing="1" cellpadding="1" width="496" border="0">
            <tr>
                <td style="width: 69px; height: 2px"><font face="新細明體">片語代碼</font></td>
                <td style="width: 152px; height: 2px">
                    <asp:TextBox ID="TBID" runat="server" MaxLength="6"></asp:TextBox></td>
                <td style="width: 36px; height: 2px"></td>
                <td style="height: 2px"></td>
            </tr>
            <tr>
                <td style="width: 69px; height: 2px"><font face="新細明體">片語內容</font></td>
                <td style="width: 152px; height: 2px">
                    <asp:TextBox ID="TBName" runat="server"></asp:TextBox></td>
                <td style="width: 36px; height: 2px"><font face="新細明體">
                    <asp:Button ID="BtnSearch" runat="server" Text="搜尋"></asp:Button></font></td>
                <td style="height: 2px">
                    <asp:Button ID="BtnAdd" runat="server" Text="新增編輯"></asp:Button></td>
            </tr>
            <tr>
                <td style="width: 69px; height: 1px"><font face="新細明體"></font></td>
                <td colspan="3"><font face="新細明體">
                    <asp:Button ID="BtnSortCode" runat="server" Text="依片語代碼排序"></asp:Button>
                    <asp:Button ID="BtnSortName" runat="server" Text="依片語名稱排序"></asp:Button></font></td>
            </tr>
            <tr>
                <td colspan="4"><font face="新細明體">
                    <asp:DataList ID="DataList1" runat="server" BorderWidth="2px" CellPadding="3" BackColor="White"
                        CellSpacing="1" BorderStyle="Ridge" BorderColor="White" RepeatColumns="3" RepeatDirection="Horizontal">
                        <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE"></SelectedItemStyle>
                        <FooterStyle ForeColor="Black" BackColor="#C6C3C6"></FooterStyle>
                        <ItemStyle ForeColor="Black" BackColor="#DEDFDE"></ItemStyle>
                        <ItemTemplate>
                            <a style="cursor: hand;" onclick='fnGetInfo("<%#container.dataitem("phaData")%>");window.close();'>
                                <%# container.dataitem("phaCode")  &" " & container.dataitem("phaData")%>
                            </a>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True" ForeColor="#E7E7FF" BackColor="#4A3C8C"></HeaderStyle>
                    </asp:DataList></font></td>
            </tr>
        </table>
    </form>
</body>
</html>
