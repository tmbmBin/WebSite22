<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCManualSearch.ascx.vb" Inherits="UI.TrlBatch.UC.UCManualSearch" %>
                                    <table style="table-layout:fixed;width:600px">
                                        <tr>										
											<td align="right" width="90">執行單位：</td>
											<td align="left" width="150"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90">經費單位：</td>
											<td align="left" width="150"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="right" width="90" >群組號：</td>
											<td  width="150"><asp:textbox id="TBAcpGroupNo" runat="server" 
                                                    Width="120px"></asp:textbox></td>
                                        </tr>
										<tr>
											<td align="right" width="90">動支編號：</td>
											<td width="150"><asp:textbox id="TBacmWordNum" runat="server" Width="120px"></asp:textbox></td>
											<td align="right" width="90">&nbsp;</td>
											<td align="left" width="150">&nbsp;</td>
                                                                                        <td  align="right">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td></td>
                                            <td></td>
										</tr>
										<tr>
											<td align="right" width="90">計畫科目：</td>
											<td colspan="3"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></td>
											<td align="right" width="90">&nbsp;</td>
											<td align="left" colspan=3>
                                                &nbsp;</td>
										</tr>
										<tr>
											<td align="right" width="90">用途別：</td>
											<td colspan="3">
                                                <asp:dropdownlist id="DDLOul" runat="server" 
                                                    Width="300px" Height="16px"></asp:dropdownlist></td>
											<td align="right" width="90">&nbsp;</td>
											<td align="left" colspan=3>
                                                &nbsp;</td>
										</tr>
                                    </table>