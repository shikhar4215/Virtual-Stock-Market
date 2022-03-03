<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarkAsPaid.aspx.cs" Inherits="VSM_Final.Admin.Script.MarkAsPaid" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "update Trading set Paid=1 where TradeId=" + id;
        cmd.ExecuteNonQuery();
    }
    catch(Exception ex)
    {
        Response.Write(ex.Message);
    }
    finally
    {
        con.close();
    }

%>