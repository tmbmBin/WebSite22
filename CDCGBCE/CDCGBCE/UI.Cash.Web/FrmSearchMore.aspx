<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmSearchMore.aspx.vb" Inherits="UI.Cash.Web.FrmSearchMore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>搜尋動支編號</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <base target="_self" />
    <script type="text/javascript" language="javascript">
        function fnGetInfo(subNo) {
            returnValue = subNo;
            //alert(subNo);
        }
        returnValue = "Cancel";
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span>動支編號</span>
        <span><asp:TextBox ID="txtAcmWordNum" runat="server" Width="80px"></asp:TextBox></span>
        <span><asp:Button ID="btnSearch" runat="server" Text="搜尋" /></span>
        <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" Font-Size="Small">
            <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366" ></HeaderStyle>
            <AlternatingRowStyle BackColor="#E0E0E0"></AlternatingRowStyle>
            <RowStyle Font-Size="Small" BackColor="WhiteSmoke"></RowStyle>
            <EmptyDataTemplate>
                <asp:Label ID="Label1" runat="server" Text="無資料!" ForeColor="Red"></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField="csmNo" HeaderText="領用編號">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="csmBatchNo" HeaderText="撥還批號">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FulAcmWordNum" HeaderText="動支編號" >
                <ItemStyle HorizontalAlign="Center" Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="FulPlanName" HeaderText="計畫名稱" />
                <asp:BoundField DataField="FulOutlayName" HeaderText="用途別名稱" />
                <asp:BoundField DataField="acvMoney" HeaderText="金額" 
                    DataFormatString="{0:#,#}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="acmWorkUserNo" HeaderText="申請人" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Memo" HeaderText="用途說明" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
