<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteAd.aspx.cs" Inherits="VSM_Final.Admin.Script.DeleteAd" %>

<%@ Import Namespace="VSM.Class" %>

<%
    new connection().DeleteAd(Convert.ToInt32(Request.QueryString["id"]));
    Response.Write("Done");
%>
