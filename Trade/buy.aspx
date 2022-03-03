<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="VSM_Final.Trade.buy" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow-lg p-4 mb-5" style="margin-top: 100px">

        <%

            connection con = new connection();
            string id = Request.QueryString["id"];
            try
            {
                con.open();
                string qs = "select s.Symbol, c.Name from Share as s, Company as c where s.ShareId=" + id + " and c.CompanyId=s.CompanyId";
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
        %>

        <div class="row">
            <div class="col">
                <h4>You want to buy the following Share:</h4>
                <h5><b class="text-success"><%= (dr.GetValue(0).ToString()) %></b> by the Firm <b class="text-success"><%= (dr.GetValue(1).ToString()) %></b> </h5>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-lg-6  col-md-10 col-sm-12">
                <label for="txtqty">Enter Quantity: </label>
                <input type="text" name="qty" id="txtqty" class="form-control" placeholder="Leave Blank to get all Sell Orders" />
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-lg-3 col-md-5 col-sm-6">
                <button class="btn btn-success w-100" onclick="submitBuyOrder(); return false;">Submit buy order </button>
            </div>
            <div class="col-lg-3 col-md-5 col-sm-6">
                <button class="btn btn-info w-100" onclick="getSellOrders(); return false;">Search Sell Order </button>
            </div>
        </div>

        <%
            }
            else
            {
        %>
        <h1 class="text-danger text-center" style="margin-bottom: 35%"><i class="fa fa-exclamation"></i>Invalid Data Input!! </h1>
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
    </div>
    <div id="sell-orders" class="container">

    </div>


    <script type="text/javascript">
        function submitBuyOrder() {
        }

        function getSellOrders() {
            document.getElementById("sell-orders").innerHTML="<hr><div class='text-center'><i class='fa fa-circle-notch fa-3x fa-spin'></i></div>"
            var req = new XMLHttpRequest();
            var qty = document.getElementById("txtqty").value;
            if (qty == "") {
                qty = 0;
            }
            req.open("get", "Script/getSellorders.aspx?id=" + <%= (Request.QueryString["id"]) %> + "&qty=" + qty, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("sell-orders").innerHTML = "<hr>";
                    document.getElementById("sell-orders").innerHTML += this.responseText;
                    getLatestPrice(<%= (Request.QueryString["id"]) %>)
                }
            }
            req.send();
        }

        function getLatestPrice(i) {
            var req = new XMLHttpRequest();
            req.open("get", "http://localhost:58381/Quotations/" + i + ".json", true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var quots = JSON.parse(this.responseText);
                    var p = quots.quots[quots.quots.length - 1].prices[quots.quots[quots.quots.length - 1].prices.length - 1].price;
                    document.getElementById("price").innerHTML = p;
                    document.getElementById("total").innerHTML = p + " * " + document.getElementById("txtqty").value + " = " + ((Number(p) * Number(document.getElementById("txtqty").value)).toFixed(2));
                }
            }
            req.send();
        }

    </script>

</asp:Content>
