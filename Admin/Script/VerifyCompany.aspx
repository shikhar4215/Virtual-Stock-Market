<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyCompany.aspx.cs" Inherits="VSM_Final.Admin.Script.VerifyCompany" %>

<%@ import Namespace="VSM.Class" %>
<%@ import Namespace="System.Data.SqlClient" %>

<%
    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update Company set Verified=1 where CompanyId=" + id;
        cmd.Connection = con.Con;
        cmd.ExecuteNonQuery();
    }
    catch(Exception ex)
    {
        Response.Write(ex.Message);
    }
    finally
    {
        con.close();
        Response.Redirect("http://localhost:58381/Admin/AddShare.aspx?cid=" + id);
    }
%>
