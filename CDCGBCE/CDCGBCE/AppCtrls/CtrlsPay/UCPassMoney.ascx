<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCPassMoney.ascx.vb" Inherits="AppCtrls.UCPassMoney" %>
<table border=0 cellpadding=1 cellspacing=1 width=100% >
                                 <tr>
                                        <TD  align="right" style="width: 70px">
                                            核支原因</TD>
                                        <TD style="width: 100px" ><asp:TextBox id="TBPassMemo" runat="server" Width="100px"  Enabled="False" ></asp:TextBox></TD>
                                        <TD align="right" style="width: 70px">核支日期</TD>
                                        <TD style=" width:80px"><asp:TextBox id="TBPassDate" style="background-color: #FFE0C0; text-align:center"  runat="server" Width="80px"  Enabled="False" ondblclick="JavaScript: UCDate.Show();"  ></asp:TextBox></TD>
                                        <TD align="right" style="width: 70px">核支批次</TD>
                                        <TD style=" width:30px"><asp:TextBox ID="TBPassBat" runat="server" Width="30px"></asp:TextBox></TD>
                                        <td align="right" style="width: 70px">核支金額</td>
                                        <td style=" width:80px"><asp:TextBox id="TBPassMoney" runat="server" Width="80px" onfocus="this.blur();" onkeypress="return check_Num()" BackColor="Transparent"  style="text-align:right" MyName="TBPayMoney"></asp:TextBox></td>
                                </tr>                                                     
                                </table> 