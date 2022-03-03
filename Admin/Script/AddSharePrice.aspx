<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSharePrice.aspx.cs" Inherits="VSM_Final.Admin.Script.AddSharePrice" %>

<%@ Import Namespace="System.IO" %>
<%

    string id = Request.QueryString["id"],
                price = Request.QueryString["price"],
                name = Request.QueryString["name"];
    FileStream fs = new FileStream(Server.MapPath("../../Quotations/" + id + ".json"), FileMode.OpenOrCreate);
    string data = "{" +
                "'name': '" + name + "'," +
                "'quots': [" +
                "{" +
                "'date': '" + DateTime.Now.ToShortDateString() + "'," +
                "'high': " + price + "," +
                "'low': " + price + "," +
                "'prices':[" +
                "{" +
                "'price' " + price + "" +
                "'Change': 0" +
                "'Volume': 0" +
                "}" +
                "]" +
                "}" +
                "]" +
                "}";
    byte[] b = ASCIIEncoding.ASCII.GetBytes(data);
    fs.Seek(0, 0);
    fs.Write(b, 0, b.Length);
    Response.Redirect("http://localhost:58381/Admin/UnverifiedCompany.aspx");

%>
