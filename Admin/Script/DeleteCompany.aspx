<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteCompany.aspx.cs" Inherits="VSM_Final.Admin.Script.DeleteCompany" %>

<%@ Import Namespace="VSM.Class" %>

<%
    string id = Request.QueryString["id"];
    new connection().deleteCompany(id);
    Response.Write(true);
%>