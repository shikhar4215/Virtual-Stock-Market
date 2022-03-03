<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockUser.aspx.cs" Inherits="VSM_Final.Admin.Script.BlockUser" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<%
    String id = Request.QueryString["id"].ToString();
    Response.Write(new connection().blockUser(id, connection.user));
    Response.Write("<script>alert('User Has been blocked');</Script>");
%>


