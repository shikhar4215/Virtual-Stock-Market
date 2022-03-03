<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="VSM_Final.Admin.Script.DeleteUser" %>

<%@ Import Namespace="VSM.Class" %>


<%
    string id = Request.QueryString["id"];
    Response.Write(new connection().deleteUser(id));
%>
 