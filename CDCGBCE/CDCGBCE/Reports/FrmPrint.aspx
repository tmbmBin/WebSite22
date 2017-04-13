<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmPrint.aspx.vb" Inherits="Reports.FrmPrint" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>FrmPrint</TITLE>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META http-equiv="Pragma" content="No-cache">
	</HEAD>
	<frameset rows="50%,50%">
		<frame name="header" src='<%=PrintKind %>'>
		<frame name="PrintDetail" src="">
	</frameset>
</HTML>
