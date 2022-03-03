<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockCompany.aspx.cs" Inherits="VSM_Final.Admin.Script.BlockCompany" %>

<%@ Import Namespace="VSM.Class" %>

<%
    string id = Request.QueryString["id"];
    new connection().blockUser(id, connection.Company);
    Response.Write(true);
%>