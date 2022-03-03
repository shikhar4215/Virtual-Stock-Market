<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetOrder.aspx.cs" Inherits="VSM_Final.Script.GetOrder" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    string type = Request.QueryString["type"], table = "", field = "";
    if (type.Equals("sell"))
    {
        table = "SellOrders";
        field = "s.SellOrderId";
    }
    else
    {
        table = "BuyOrder";
        field = "s.BuyOrderId";
    }
    connection con = new connection();
    try
    {
        con.open();
        string qs = "select sh.Symbol, c.Name, s.Volume, s.Price, s.ShareId, " + field + " from " + table + " as s, Share as sh, Company as c where s.UserId=" + Session["UserId"] + " and sh.ShareId=s.ShareId and c.CompanyId=sh.CompanyId";
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
%>
<div class="container shadow-lg p-4 pl-5 mt-5">
    <div class="row">
        <div class="col">
            <h2>Symbol: <b><%= (dr.GetValue(0).ToString()) %></b> </h2>
        </div>
        <div class="col">
            <a href="http://localhost:58381/ShareDetails.aspx?id=<%= (dr.GetValue(4).ToString()) %> %>">View More Details</a>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h4>Company Name: <b><%= (dr.GetValue(1).ToString()) %></b> </h4>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h4>Volume: <b><%= (dr.GetValue(2).ToString()) %></b> </h4>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h4>Price: <b><%= (dr.GetValue(3).ToString()) %> &#8377; / Share</b> </h4>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col">
            <button class="btn btn-outline-danger w-100" onclick="removeOrder(<%= (dr.GetValue(5).ToString()) %>, '<%= (type) %>'); return false;">Remove Order </button>
        </div>
    </div>
</div>
<%
            }
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
