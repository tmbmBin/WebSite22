<%@ WebHandler Language="C#" Class="Load" %>

using System;
using System.Web;
using System.Configuration;

public class Load : IHttpHandler 
{
    
    public void ProcessRequest (HttpContext context) 
    {
        //DLName = System.Web.HttpUtility.UrlEncode(DLName + DLSuit, System.Text.Encoding.UTF8);
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //string filename = context.Request.QueryString["txtFileName"];
        string filename = System.Web.HttpUtility.UrlEncode(context.Request.QueryString["txtFileName"] + ".txt", System.Text.Encoding.UTF8);
        string url = context.Request.QueryString["txtURL"];
        context.Response.ContentType = "application/octet-stream";  
        context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
        //string fileurl = @"C:\\GBAText\\" + filename;
        string fileurl = ConfigurationManager.AppSettings["fileplace"] + " \\" + filename;
        System.IO.FileStream fs = new System.IO.FileStream(fileurl, System.IO.FileMode.Open);
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