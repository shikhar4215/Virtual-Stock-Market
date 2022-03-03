<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnblockCompany.aspx.cs" Inherits="VSM_Final.Admin.Script.UnblockCompany" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    connection con = new connection();
    string id = Request.QueryString["id"];
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "update Company set deleted=0 where CompanyId='"+ id+"'";
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
