<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteSector.aspx.cs" Inherits="VSM_Final.Admin.Script.DeleteSector" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VSM.Class" %>


<%

    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "delete from Sector where SectorId=" + id;
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