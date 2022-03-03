<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitAdminResponse.aspx.cs" Inherits="VSM_Final.Admin.Script.SubmitAdminResponse" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%      

    string response = Request.Form["Response"],
        id= Request.Form["Id"];
    connection con = new connection();
    try
    {
        con.open();
        string qs = "update Feedback set Response='" + response + "' where FeedbackId=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
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