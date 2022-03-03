<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getSectorData.aspx.cs" Inherits="VSM_Final.Admin.Script.getSectorData" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "select * from Sector where SectorId=" + id;
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
%>
<div class="container text-center">
    <div class="row">
        <div class="col">
            Id: <b><%= (dr.GetValue(0).ToString()) %> </b>
        </div>
    </div>
    <div class="row">
        <div class="col">
            Name: <b> <%= (dr.GetValue(1).ToString()) %> </b>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <button class="btn btn-outline-danger" onclick="DeleteSector(<%= (id) %>);">Delete Sector</button>
        </div>
     </div>
</div>
<%
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
