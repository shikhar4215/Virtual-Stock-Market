<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getSellOrders.aspx.cs" Inherits="VSM_Final.Trade.Script.getSellOrders" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    connection con = new connection();
    string id = Request.QueryString["id"];
    string qty = Request.QueryString["qty"];
    bool flag = false;

%>

<%--check for OutStanding shares--%>


<%

    try
    {
        con.open();
        string qs = "select * from Share where ShareId=" + id + " and OutStanding>=" + qty;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            flag = true;
            dr.Read();
%>

<div class="container shadow-lg p-3 mb-5">
    <h3 class="">Out Standing </h3>
    <hr class="border border-secondary border-top-0" />
    <div class="row text-center">
        <div class="col">
            <b>Symbol</b>:
                <br />
            <%= (dr.GetValue(2).ToString()) %>
        </div>
        <div class="col">
            <b>Price</b>:
                <br />
            <span id="price"></span>&#8377;/Share
        </div>
    </div>
    <br />
    <div class="row text-center">
        <div class="col">
            <b>Quantity</b>:
                <br />
            <%= (dr.GetValue(7).ToString()) %>
        </div>
        <div class="col">
            <b>Total Cost</b>:
                <br />
            <span id="total"></span> &#8377;
        </div>
    </div>
    <div class="text-center mt-3">
        <%--<a class="w-75 btn btn-outline-success" href="http://localhost:58381/Trade/Trade.aspx?type=out&shareid=<%= (id) %>&qty=<%=(qty) %>">BUY </a>--%>
        <a class="w-75 btn btn-outline-success" href="http://localhost:58381/Payment/pay.aspx?shareid=<%= (id) %>&sharename=<%= (dr.GetValue(2).ToString()) %>&type=out&qty=<%=(qty) %>">BUY </a>
    </div>
</div>

<%
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



<%--check for sell orders--%>

<%

    try
    {
        con.open();
        string qs = "select u.FirstName, u.LastName, s.Volume, s.Price, s.SellOrderId from SellOrders as s, UserMaster as u where Volume>=" + qty + " and ShareId=" + id + " and u.UserId=s.UserId";
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            flag = true;
            while (dr.Read())
            {
%>
<div class="container shadow-lg p-3 mb-5 mt-2">
    <h3 class=""><%= (dr.GetValue(0).ToString() + " " + dr.GetValue(1).ToString()) %> </h3>
    <hr class="border border-secondary border-top-0" />
    <div class="row text-center">
        <div class="col">
            <b>Symbol</b>:
                <br />
            [Symbol]
        </div>
        <div class="col">
            <b>Price</b>:
                <br />
            <%= (dr.GetValue(3).ToString()) %> &#8377;/Share
        </div>
    </div>
    <br />
    <div class="row text-center">
        <div class="col">
            <b>Quantity</b>:
                <br />
            <%= (dr.GetValue(2).ToString()) %>
        </div>
        <div class="col">
            <b>Total Cost</b>:
                <br />
            <%= (dr.GetValue(3).ToString()) %> * <%= (qty) %> = <%= (dr.GetInt32(3)  * Convert.ToInt32(qty)) %> &#8377;
        </div>
    </div>
    <div class="text-center mt-3">
        <a class="w-75 btn btn-outline-success" href="http://localhost:58381/Payment/pay.aspx?shareid=<%= (id) %>&sharename=<%= (dr.GetValue(2).ToString()) %>&type=trade&qty=<%=(qty) %>&orderid=<%= (dr.GetValue(4).ToString()) %>">BUY </a>
        <%--<a class="w-75 btn btn-outline-success" href="http://localhost:58381/Trade/Trade.aspx?type=trade&shareid=<%= (id) %>&qty=<%= (qty) %>&orderid=<%= (dr.GetValue(4).ToString()) %>">BUY </a>--%>
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

    if (!flag)
    {
%>
<h3 class="text-center text-danger">Opps! No Matching Buy Order Found</h3>
<h3 class="text-center text-info">Submit a Sell Order and Check again Later</h3>
<%
    }

%>