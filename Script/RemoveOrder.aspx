<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveOrder.aspx.cs" Inherits="VSM_Final.Script.RemoveOrder" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    string id = Request.QueryString["id"];
    string type = Request.QueryString["type"], table = "", field = "";
    if (type.Equals("sell"))
    {
        table = "SellOrders";
        field = "SellOrderId";
    }
    else
    {
        table = "BuyOrder";
        field = "BuyOrderId";
    }
    connection con = new connection();
    try
    {
        con.open();
        string qs = "delete from " + table + " where " + field + "=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        cmd.ExecuteNonQuery();
    }
    catch(Exception ex)
    {
        Response.Redirect(ex.Message);
    }
    finally
    {
        con.close();
    }
%>