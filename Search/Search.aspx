<%@ Page Title="" Language="C#" MasterPageFile="../Index.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="VSM_Final.WebForm2" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 120px;">
        <%
            connection con = new connection();
            object searchString = Request.QueryString["s"];
            Tables t;
            string qs = "select s.ShareId, s.Symbol, c.Name from Share as s,Company as c where (s.Symbol like '%" + searchString + "%' or c.Name like '%"+searchString+"%') and c.CompanyId=s.CompanyId";
            t = con.query(qs);
            if (searchString != null)
            {
                con.open();
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
        %>

        <div class="container shadow-lg p-4 mb-5">
            <div class="row">
                <div id="chart-<%= (dr.GetValue(0).ToString()) %>" class="col-7 text-center">
                </div>
                <div class="col-5">
                    <div class="row">
                        <div class="col m-1">
                            <h2>Symbol: <%= (dr.GetValue(1).ToString()) %></h2>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col m-1">
                            <h3>Company: <%= (dr.GetValue(2).ToString()) %> </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4 m-1">
                            price:<br />
                            <span id="price-<%= (dr.GetValue(0).ToString()) %>"></span>
                        </div>
                        <div class="col-4">
                            Change:<br />
                            <span id="change-<%= (dr.GetValue(0).ToString()) %>"></span>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col mt-1 text-center">
                    <a href="http://localhost:58381/ShareDetails.aspx?id=<%= (dr.GetValue(0).ToString()) %>">View More </a>
                </div>
            </div>
        </div>

        <%
                    }
                }
            }
        %>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(DrawCharts);

        function readfile(index) {
            var req = new XMLHttpRequest();
            req.open("get", "http://localhost:58381/Quotations/" + index + ".json", true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    draw(index, JSON.parse(this.responseText));
                }
            };
            req.send();
            return null;
        }

        function draw(index, quots) {
            var data = new google.visualization.DataTable();
            data.addColumn("string", "Time");
            data.addColumn("number", "price")
            name = quots.name;

            //printing last 20 quots
            time = "";
            for (var i = quots.quots.length - 1; i < quots.quots.length; i++) {
                for (var j = 0; j < quots.quots[i].prices.length; j++) {
                    data.addRows([[time, quots.quots[i].prices[j].price]]);
                }
            }

            document.getElementById("price-" + index).innerHTML = "&#8377; " + quots.quots[quots.quots.length - 1].prices[quots.quots[quots.quots.length - 1].prices.length - 1].price;
            var changediv = document.getElementById("change-" + index);
            var change = quots.quots[quots.quots.length - 1].prices[quots.quots[quots.quots.length - 1].prices.length - 1].change.toFixed(2);

            if (change < 0) {
                changediv.style.color = "red";
            }
            else {
                changediv.style.color = "green";
            }
            changediv.innerHTML = change  + " &#8377;";



            var option = {
                'title': name,
                'height': 200
            };
            var chart = new google.visualization.LineChart(document.getElementById('chart-' + index));
            chart.draw(data, option);
        }


        function DrawCharts() {
        <%
        string[] idarr = t.getColumnArray(0);
        for (int i = 0; i < idarr.Length; i++)
        {
            %>
            readfile(<%=(idarr[i])%>);
            <%
        }
        %>

        }



    </script>
    <script src="../bootstrap-4.4.1-dist/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).resize(function () {
            DrawCharts();
        });
    </script>
</asp:Content>
