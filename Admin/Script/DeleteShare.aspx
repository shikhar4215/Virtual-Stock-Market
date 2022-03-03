<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteShare.aspx.cs" Inherits="VSM_Final.Admin.Script.DeleteShare" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "delete from Share where ShareId=" + id;
        cmd.ExecuteNonQuery();
    }
    catch (Exception ex)
    {
        Response.Write(ex.Message);
    }
    finally
    {
        con.close();
    }

%>