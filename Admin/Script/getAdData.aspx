<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getAdData.aspx.cs" Inherits="VSM_Final.Admin.Script.getAdData" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    connection con = new connection();
    try
    {
        con.open();
        string id = Request.QueryString["id"].ToString();
        string qs = "select * from Advertisement where Id=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            string json = "{" +
                        "\"id\": \"" + dr.GetValue(0).ToString() + "\"," +
                        "\"Name\": \"" + dr.GetValue(1).ToString() + "\"," +
                        "\"Image\": \"" + dr.GetValue(2).ToString() + "\"," +
                        "\"Impressions\": \"" + dr.GetValue(3).ToString() + "\"," +
                        "\"URL\": \"" + dr.GetValue(4).ToString() + "\"}";
%>

<div class="container">
    <img src="<%= (dr.GetValue(2).ToString()) %>" alt="Ad Image To Display" class="img-fluid mb-3" id="Profile" /><br />
    <big>
        <span id="lblName"><%= (dr.GetValue(1).ToString()) %></span></big>
    <br />
    <big>Impresions: <span id="lblImpresion"><%= (dr.GetValue(3).ToString()) %></span></big>
    <br />
    <a id="lblURL" href="<%= (dr.GetValue(4).ToString()) %>">Navigate Url</a><br />
    <button class="btn btn-danger" onclick="Delete()">Delete </button>
</div>

<%
        }
        else
        {
            Response.Write(null);
        }
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

