<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmUpdatePayName.aspx.vb" Inherits="UI.CDCPayName.Web.FrmUpdatePayName" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 <table id="Table1" runat="server" style="display:block; border-collapse:collapse; border-right: #666668 1pt solid; border-top: #666668 1pt solid;  border-left: #666668 1pt solid; border-bottom: #666668 1pt solid" cellpadding="5" width="600" bgcolor="#dadee9">
	        <tr>
		        <td >
			        <table style=" border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
				        <tr>
					        <td style="text-align:center"><asp:Label ID="lbUnitTitle" runat="server" Font-Bold="True" style="font-size:20px; color:Blue">檔案資料匯入</asp:Label></td>
				        </tr>
                        <tr>
                            <td>
                                <fieldset>
	                                <legend>選取上傳資料</legend>
                                    <table style=" border-collapse:collapse; table-layout:fixed" border="0" width="100%">
		                                <tr>
			                                <td width="100px">&nbsp;</td>
			                                <td width="">
                                                <asp:CheckBox ID="CBNoPostCode" runat="server" Checked="True" Text="過濾無郵局局號" />
                                                <asp:CheckBox ID="CBDeleteTempTable" runat="server" Checked="True" 
                                                    Text="刪除暫存資料表" />
                                            </td>
		                                </tr>
		                                <tr>
			                                <td align="right">檔案名稱：</td>
			                                <td>
                                                <asp:FileUpload ID="fuFile" runat="server" Width="300px" />
                                                <asp:Button ID="btnUpload" runat="server" Text="上傳" Height="20px" 
                                                    Width="50px" />
                                            </td>
		                                </tr>
		                                <tr style="display:none">
			                                <td align="right">檔案路徑：</td>
			                                <td><asp:Label id="lbFilePath" runat="server" forecolor="red" font-size="8pt"></asp:Label></td>
		                                </tr>
		                                <tr>
			                                <td align="right">工作表：</td>
			                                <td><asp:DropDownList id="ddl_WorkSheet" runat="server"></asp:DropDownList>
                                            </td>
		                                </tr>
		                                
		                                <tr>
			                                <td align="right">&nbsp;</td>
			                                <td>
                                                &nbsp;</td>
		                                </tr>
		                                
	                                </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
		        </td>
	        </tr>	        
        </table>
    </form>
</body>
</html>
