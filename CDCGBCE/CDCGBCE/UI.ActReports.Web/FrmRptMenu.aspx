<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptMenu.aspx.vb" Inherits="UI.ActReports.Web.FrmRptMenu" %>

<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />

    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <%-- <script language="javascript" src="../ScriptFiles/setFrameSize.js" type="text/javascript"></script>--%>
    <%--20150317 [mdf]:修正 iframe 高度問題--%>
    <script language="javascript" src="../ScriptFiles/setFrameSize.js" type="text/javascript"></script>
    <script src="../ScriptFiles/jquery-1.9.1-fix.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        //20150317 [del]:修正 iframe 高度問題
        //$(document).ready(function(){
        //    setInterval(function () {
        //        ResizeIframeFromParent('rptFrame');
        //    }, 1000);
        //     });

        //function ResizeIframeFromParent(id) {
        //    if ($('#' + id).length > 0) {
        //        var window = document.getElementById(id).contentWindow;
        //        var prevheight = $('#' + id).attr('height');
        //        var newheight = 0;
        //        try
        //        { newheight=Math.max(window.document.body.scrollHeight, window.document.body.offsetHeight, window.document.documentElement.clientHeight, window.document.documentElement.scrollHeight, window.document.documentElement.offsetHeight); }
        //        catch (e)
        //        {}

        //        if (newheight != prevheight && newheight > 0) {
        //            $('#' + id).attr('height', newheight);
        //            console.log("Adjusting iframe height for " + id + ": " + prevheight + "px => " + newheight + "px");
        //        }
        //    }
        //}
    </script>

</head>
<body>
    <form id="form1" runat="server">


        <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="500" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr style="display: none">
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 110px; text-align: right;" nowrap>動支編號：</td>
                                        <td style="width: 150px; text-align: left">
                                            <asp:Label ID="LBAacmWordNum"
                                                runat="server"></asp:Label></td>
                                        <td style="width: 70px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 90px; text-align: right;" nowrap>&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style="display: none">
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="text-align: left" colspan="3">
                                            <asp:CheckBox ID="CBPrintThisDataOnly" runat="server"
                                                Text="本筆為補簽資料，是否單獨列印本補簽資料" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left" colspan="2">可列印報表如下：</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Left" colspan="5">
                                            <asp:RadioButtonList ID="RBRptList" runat="server">
                                            </asp:RadioButtonList>
                                            <asp:Label ID="LBMsg" runat="server" Text="無報表可以列印" Visible="false"></asp:Label>
                                            <asp:Label ID="LBMsg1" runat="server" Text="因為本筆動支編號已有再簽資料，故無法再進行列印"
                                                Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnList" runat="server" Text="列出資料" Visible="False" />
                                            <asp:Button ID="BtnPrint" runat="server" Text="預覽報表" />
                                            <asp:CheckBox ID="CBExcel" runat="server" Text="轉製成EXCEL" Checked="True" Visible="false"></asp:CheckBox>
                                            <input id="Button1" type="button" value="列印" onclick="try { if (rptFrame.location != 'about:blank') { rptFrame.focus(); rptFrame.print(); } } catch (e) {; };" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>


        <%--<iframe id="rptFrame" name="rptFrame" border="0" frameborder="0" width="100%" scrolling="no"  height="100%"  src="<%=AntiXss.HtmlEncode(strFrameSrc)%>"></iframe>                             </td>--%>
        <%--20150317 [mdf]:修正 iframe 高度問題--%>
        <iframe onload="setiFrameBox(this,-1);" id="rptFrame" name="rptFrame" border="0" frameborder="0" width="100%" scrolling="no" height="100%" src="<%=AntiXss.HtmlEncode(strFrameSrc)%>"></iframe>
        </td>
    </form>
    <%--   <script language="javascript" >

            function setiFrameBox(ObjStr, ReSetFlag, TimeOut) {
                var setObj = ObjStr;
                var WaitTime = 0;
                if (typeof (setObj) != "object") try { setObj = document.all[ObjStr]; } catch (e) { ; }
                if (typeof (setObj) != "object") try { setObj = eval(ObjStr); } catch (e) { ; }
                if (setObj && ((!ReSetFlag && (setObj.runtimeStyle.width || setObj.runtimeStyle.height)) || ReSetFlag == 1)) {
                    setObj.runtimeStyle.width = null;
                    setObj.runtimeStyle.height = null;
                }
                else
                    if (setObj && setObj.contentWindow.document.body && setObj.contentWindow.document.body.all.length) //ReSetFlag:-1=all,2~n:(n-1) times
                {
                    var myLen = setObj.contentWindow.document.body.scrollWidth * 1 + setObj.contentWindow.document.body.rightMargin * 1 + setObj.contentWindow.document.body.leftMargin * 1;
                    if (myLen < setObj.contentWindow.document.body.offsetWidth) myLen = setObj.contentWindow.document.body.offsetWidth;
                    if (myLen != setObj.runtimeStyle.width) setObj.runtimeStyle.width = myLen;
                    myLen = setObj.contentWindow.document.body.scrollHeight * 1 + setObj.contentWindow.document.body.topMargin * 1 + setObj.contentWindow.document.body.bottomMargin * 1 + 10;
                    if (myLen < setObj.contentWindow.document.body.offsetHeight) myLen = setObj.contentWindow.document.body.offsetHeight;
                    if (myLen != setObj.runtimeStyle.height) setObj.runtimeStyle.height = myLen;
                    if (ReSetFlag == -1 || ReSetFlag > 2) {
                        if (ReSetFlag > 2) ReSetFlag--;
                        WaitTime = (TimeOut) ? TimeOut : 1000;
                    }
                } else WaitTime = 200;
                if (WaitTime) {//alert("setiFrameBox('"+ObjStr+"',"+((!ReSetFlag)?'null':ReSetFlag)+","+((!TimeOut)?'null':TimeOut)+")");
                    if (typeof (ObjStr) == "object") {
                        if (ObjStr.id)
                            setTimeout("setiFrameBox('" + ObjStr.id + "'," + ((!ReSetFlag) ? 'null' : ReSetFlag) + "," + ((!TimeOut) ? 'null' : TimeOut) + ")", WaitTime);
                    }
                    else
                        setTimeout("setiFrameBox('" + ObjStr + "'," + ((!ReSetFlag) ? 'null' : ReSetFlag) + "," + ((!TimeOut) ? 'null' : TimeOut) + ")", WaitTime);
                }
            }


    
    </script>--%>
</body>
</html>
