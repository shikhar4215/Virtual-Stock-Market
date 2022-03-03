<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnblockUser.aspx.cs" Inherits="VSM_Final.Admin.Script.UnblockUser" %>
<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    connection con = new connection();
    string id = Request.QueryString["id"];
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "update UserMaster set deleted=0 where UserId='"+ id+"'";
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

