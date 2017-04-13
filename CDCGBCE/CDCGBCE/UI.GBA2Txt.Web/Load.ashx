<%@ WebHandler Language="C#" Class="Load" %>

using System;
using System.Web;
using System.Configuration;

public class Load : IHttpHandler 
{
    System.Web.HttpServerUtility Server = System.Web.HttpContext.Current.Server;
    public void ProcessRequest (HttpContext context) 
    {
        //DLName = System.Web.HttpUtility.UrlEncode(DLName + DLSuit, System.Text.Encoding.UTF8);
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //string filename = context.Request.QueryString["txtFileName"];
        string filename = System.Web.HttpUtility.UrlEncode(context.Request.QueryString["txtFileName"] + ".zip", System.Text.Encoding.UTF8);
        string url = context.Request.QueryString["txtURL"];
        context.Response.ContentType = "application/octet-stream";  
        context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
        //1031205 修改路徑錯誤問題 =================================================
        //string fileurl = @"D:\webfiles\CDCGBCE\CDCGBCE\GBA2OutputFiles\\" + filename;
        string fileurl = Server.MapPath(ConfigurationManager.AppSettings["fileplace"] )+ " \\" + filename;
        System.IO.FileStream fs = new System.IO.FileStream(fileurl, System.IO.FileMode.Open);       
        //System.IO.FileStream fs = new System.IO.FileStream(fileurl, System.IO.FileMode.Open);
        //===========================================================================
        if (fs.Length > 0)
        {
            byte[] buffer = new byte[fs.Length];
            fs.Read(buffer, 0, buffer.Length);
            fs.Close();
            context.Response.BinaryWrite(buffer);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}