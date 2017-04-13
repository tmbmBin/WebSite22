<%@ import Namespace="System.Configuration" %>
<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="ToolsFun" %>
<script runat="server">
	Dim ConnectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

  
	Sub Page_Load(Sender As Object, E As EventArgs)
		 
	End Sub

	 
	Sub btn_submit_Click(sender As Object, e As EventArgs)
		 
        If Me.RadioButton1.Checked = True Then
            ReSetAllPassEn()
            
        ElseIf Me.RadioButton2.Checked = True Then
            ReSetEachPass()
            
        ElseIf Me.RadioButton2.Checked = True Then
            ReSetAllPass()
            
        End If
        
                        
    End Sub
    
    
    Private Sub ReSetEachPass()
        
        
        Dim strSqlTxt As String
        strSqlTxt = " Select * From sysBaseUser "
        
        Dim objDT As Data.DataTable
        objDT = ToolsFun.MsDbFun.GetDbTable(strSqlTxt)
        Dim strDefPass As String
        Dim strErrMsg As String
             
        
        
        If Me.CheckBox1.Checked = True Then
             
            strDefPass = ToolsFun.StrFun.EncryptStr(Trim(Me.text_account.Text))
            strSqlTxt = "UPDATE sysBaseUser SET usrPwd =@parUsrPwd Where usrAlias=@parUsrNo "
            
            
            Dim objSqlCm As New Data.SqlClient.SqlCommand
            With objSqlCm
                .CommandText = strSqlTxt
                .CommandType = Data.CommandType.Text
                With .Parameters
                    
                    .Add(New System.Data.SqlClient.SqlParameter("@parUsrPwd", Data.SqlDbType.VarChar, 0))
                    objSqlCm.Parameters("@parUsrPwd").Value = strDefPass
                    
                    .Add(New System.Data.SqlClient.SqlParameter("@parUsrNo", Data.SqlDbType.VarChar, 0))
                    objSqlCm.Parameters("@parUsrNo").Value = Me.text_account.Text
                End With
                
            End With
            
            
            
            Try
                ToolsFun.MsDbFun.GetDbExec(objSqlCm)
            Catch ex As Exception
                strErrMsg &= "帳號：" & Me.text_account.Text & "　密碼未加密成功。" & vbCrLf
            End Try
                          
        Else
            For i As Integer = 0 To objDT.Rows.Count - 1
            
                strDefPass = ToolsFun.StrFun.EncryptStr(objDT.Rows(i)("usrAlias") & "")
                strSqlTxt = "UPDATE sysBaseUser SET usrPwd =@parUsrPwd Where PK_usrNo=@parUsrNo "
            
            
                Dim objSqlCm As New Data.SqlClient.SqlCommand
                With objSqlCm
                    .CommandText = strSqlTxt
                    .CommandType = Data.CommandType.Text
                    With .Parameters
                    
                        .Add(New System.Data.SqlClient.SqlParameter("@parUsrPwd", Data.SqlDbType.VarChar, 0))
                        objSqlCm.Parameters("@parUsrPwd").Value = strDefPass
                    
                        .Add(New System.Data.SqlClient.SqlParameter("@parUsrNo", Data.SqlDbType.VarChar, 0))
                        objSqlCm.Parameters("@parUsrNo").Value = objDT.Rows(i)("PK_usrNo")
                    End With
                
                End With
            
            
            
                Try
                    ToolsFun.MsDbFun.GetDbExec(objSqlCm)
                Catch ex As Exception
                    strErrMsg &= "帳號：" & objDT.Rows(i)("usrAlias") & "　密碼未加密成功。" & vbCrLf
                End Try
                          
            Next
        
        End If
        
        If strErrMsg & "" = "" Then strErrMsg = "全部更新成功。"
        ToolsFun.WebMsgFun.Show(strErrMsg)
        
        
        
    End Sub
    
    
    
    Private Sub ReSetAllPassEn()
        
        
        Dim strSqlTxt As String
        Dim strDefPass As String = ToolsFun.StrFun.EncryptStr("1234")
        strSqlTxt = "UPDATE sysBaseUser SET usrPwd ='" & strDefPass & "'"
        
        If Me.CheckBox1.Checked = True Then
            strSqlTxt &= " Where usrAlisa= '" & Trim(Me.text_account.Text) & "'"
        End If
        
        
        Try
            ToolsFun.MsDbFun.GetDbExec(strSqlTxt)
            ToolsFun.WebMsgFun.Show("重設成功。")
        Catch ex As Exception
            ToolsFun.WebMsgFun.Show(ex.Message)
        End Try
        
    End Sub
    
    
    
      
    Private Sub ReSetAllPass()
        
        
        Dim strSqlTxt As String
        Dim strDefPass As String = "1234"  ' ToolsFun.StrFun.EncryptStr("1234")
        strSqlTxt = "UPDATE sysBaseUser SET usrPwd ='" & strDefPass & "'"
        
          
        If Me.CheckBox1.Checked = True Then
            strSqlTxt &= " Where usrAlisa= '" & Trim(Me.text_account.Text) & "'"
        End If
        
        
        
        Try
            ToolsFun.MsDbFun.GetDbExec(strSqlTxt)
            ToolsFun.WebMsgFun.Show("重設成功。")
        Catch ex As Exception
            ToolsFun.WebMsgFun.Show(ex.Message)
        End Try
        
    End Sub
    
    
    
    
    
    

</script>
<html>
<head>
<title></title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body >
	<form id="form1" method="post" runat="server" autocomplete="off">
		<table style="border-collapse: collapse; width: 104px; height: 18px" borderColor="#666668" cellSpacing="0" cellPadding="0" border="1">
			<tr>
				<td>
					<table style="border-collapse: collapse" borderColor="#f8f8fa" cellSpacing="0" cellPadding="5" bgColor="#dadee9" border="1">
						<tr>
							<td>
								<table cellspacing="0" cellpadding="5" border="0" style="width: 264px; height: 118px">
									<tr>
										<td>帳號</td>
										<td><asp:TextBox id="text_account" runat="server" width="150" ></asp:TextBox></td>
									</tr>
									<tr>
										<td align="right" style="width: 259px" colspan="2">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="設定一筆資料" /></td>
									</tr>
									<tr>
                                        <td colspan="2"><asp:RadioButton ID="RadioButton1" runat="server" Text="全部設成預設值(加密)" GroupName="PassType" /></td>
									</tr>
                                    <tr>
                                        <td colspan="2"><asp:RadioButton ID="RadioButton2" runat="server" Text="針對個別密碼加密" GroupName="PassType" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><asp:RadioButton ID="RadioButton3" runat="server" Text="全部設成明碼預設值" GroupName="PassType" /></td>
                                    </tr>
									<tr>
										<td align="right" colspan="2">&nbsp;&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right"><asp:Button id="btn_submit" onclick="btn_submit_Click" runat="server" Height="22px" Width="50px" Text="更新"></asp:Button></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>