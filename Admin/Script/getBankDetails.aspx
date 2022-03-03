<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getBankDetails.aspx.cs" Inherits="VSM_Final.Admin.Script.getBankDetails" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<%
    string id = Request.QueryString["id"];
    connection con = new connection();
    try
    {
        con.open();
        SqlCommand cmd = new SqlCommand("", con.Con);
        cmd.CommandText = "select b.BankName, b.Number from BankDetails as b, Trading as t where b.UserId=t.SellerId and t.TradeId=" + id;
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
%>

<div class="container">
    <div class="row">
        <div class="col">
            Bank Name: <%= (dr.GetValue(0).ToString()) %><b></b>
        </div>
    </div>
    <div class="row">
        <div class="col">
            Account number: <%= (dr.GetValue(0).ToString()) %><b></b>
        </div>
    </div>
</div>

<%
    }
    catch (Exception es)
    {
        Response.Write(es.Message);
    }
    finally
    {
        con.close(0;)
    }

%>
