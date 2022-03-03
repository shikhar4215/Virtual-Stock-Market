<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getSalesRecord.aspx.cs" Inherits="VSM_Final.Admin.Script.getSalesRecord" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select t.TradeId, t.SellerId, t.BuyerId, t.Paid, s.Symbol from trading as t, Share as s where s.ShareId=t.ShareId and t.TradeId=" + id;
        cmd.Connection = con.Con;
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
%>

<div class="container">
    <div class="row">
        <div class="col">
            <h1><b><%= (dr.GetValue(4).ToString()) %></b></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-6">
            TradeId: <%= (dr.GetValue(0).ToString()) %>
        </div>
        <div class="col-lg-12 col-sm-6">
            SellerId: <%= (dr.GetValue(1).ToString()) %>
        </div>
        <div class="col-lg-12 col-sm-6">
            BuyerId: <%= (dr.GetValue(2).ToString()) %>
        </div>
    </div>
    <div class="row">
        <div class="col">
            Paid: <%= (dr.GetValue(3).ToString()) %>
        </div>
    </div>
    <div class="row text-center">
        <div class="col">
            <button class="btn btn-outline-success w-100" onclick="MarkPaid(<%= (dr.GetValue(0).ToString()) %>); return false;">Mark as Paid</button>
        </div>
        <div class="col">
            <button class="btn btn-outline-primary w-100" onclick="getBankDetails(<%= (dr.GetValue(0).ToString()) %>); return false;">Get Sellers Bank Details</button>
        </div>
    </div>
</div>

<%
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