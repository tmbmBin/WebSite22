<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCPayPass.ascx.vb" Inherits="AppCtrls.UCPayPass" %>
        <table style="MARGIN-TOP: 0px; MARGIN-LEFT: 0px; BORDER-COLLAPSE: collapse;" cellpadding="5" width="600" bgcolor="#dadee9">
	        <tr>
		        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668" valign="top" align="left">
			        <table style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				        <tr>
					        <td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid" bordercolor="#666668">
			                     <table  border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout:fixed">
                                    <tr style="display:none">
                                        <td style="color: #FF0000; width: 75px;" align="right"><asp:Label ID="LBPassDate" runat="server" Text="核支日期"></asp:Label></td>
                                            <td style="width: 110px;" ><asp:TextBox ID="TBPassDate" runat="server" Width="100px" style="BACKGROUND-COLOR: #ffe0c0; text-align: center" MyName="TBAcmPassDate" ondblclick="JavaScript:UCPassDate.Show();" ></asp:TextBox>
                                            <td style="color: #FF0000;width: 85px;" align="right" ><asp:Label ID="Label1" runat="server" Text="核支金額"></asp:Label></td> 
                                            <td style="width: 110px;"><asp:TextBox ID="TBPassMoney" runat="server" Width="100px" MyName="TBAcmPassMoney"  onfocus="this.blur();"  style="BACKGROUND-COLOR: #ffe0c0;text-align:right" ></asp:TextBox></td>
                                            <td ></td>
                                            <td ></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 75px; color: #ff0000;" align="right" ><asp:Label ID="Label2" runat="server" Text="核退原因"></asp:Label></td>
                                        <td colspan=5 >
                                            <asp:TextBox ID="TBPassMemo" style="BACKGROUND-COLOR: #ffe0c0" runat="server" Width="480px"></asp:TextBox>
                                            <input id="BtnPassPhrase" runat="server" type="button" value="..." onclick="fnCallPhraseDialog('TBAcmPassMemo');" visible="False"/>
                                        </td>
                                    </tr>
                                 </table> 
					        </td>
				        </tr>
			        </table>
		        </td>
	        </tr>
        </table>
