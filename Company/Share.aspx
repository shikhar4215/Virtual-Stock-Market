<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Share.aspx.cs" Inherits="VSM_Final.WebForm14" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VSM.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow-lg">
        <div class="row">
            <div class="col">
                <div class="card mt-2 text-white bg-dark">
                    <div class="card-body">
                        <h2>
                            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                        </h2>
                        <span>Id:
                    <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
                        </span>
                        <span>Sector
                    <asp:Label ID="lblSector" runat="server" Text="Label"></asp:Label>
                        </span>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div id="chart" class="col">
            </div>
            <div class="col">
                <div class="card mt-3">
                    <div class="card-body">
                        <table class="table mt-2 table-hover ">
                            <thead>
                                <tr>
                                    <th scope="col">Symbol
                                    </th>
                                    <th scope="col">price
                                    </th>
                                    <th scope="col">company Name
                                    </th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSymbol" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        <span id="price">&#8377;</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblComapny" runat="server" Text="Label"></asp:Label>
                                    </td>

                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                    <th scope="col">High
                                    </th>
                                    <th scope="col">low
                                    </th>
                                    <th scope="col">Change
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span id="high"></span>
                                    </td>
                                    <td>
                                        <span id="low"></span>
                                    </td>
                                    <td>
                                        <span id="change"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row p-3">
            <h3>Trading Volume Info</h3>
            <div id="vol-chart" class="w-100">
            </div>
        </div>

    </div>

    <script src="../bootstrap-4.4.1-dist/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#main a").click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
    </script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(DrawCharts);

        function readfile(index) {
            var req = new XMLHttpRequest();
            req.open("get", "http://localhost:56268/Quotations/" + index + ".json", true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    draw(index, JSON.parse(this.responseText));
                    drawVolChart(index, JSON.parse(this.responseText));
                }
            };
            req.send();
            return null;
        }

        function drawVolChart(index, quots) {
            var data = new google.visualization.DataTable();
            data.addColumn("string", "Time");
            data.addColumn("number", "volume")
            name = quots.name;

            //printing last 20 quots
            time = "";
            for (var i = 0; i < quots.quots.length; i++) {
                for (var j = 0; j < quots.quots[i].prices.length; j++) {
                    data.addRows([[time, quots.quots[i].prices[j].Volume]]);
                }
            }
            var option = {
                'title': name,
                'height': 400
            };
            var chart = new google.visualization.LineChart(document.getElementById('vol-chart'));
            chart.draw(data, option);
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

            document.getElementById("price").innerHTML = "&#8377; " + quots.quots[quots.quots.length - 1].prices[quots.quots[quots.quots.length - 1].prices.length - 1].price;
            var changediv = document.getElementById("change");
            document.getElementById("high").innerHTML = quots.quots[quots.quots.length - 1].high;
            document.getElementById("low").innerHTML = quots.quots[quots.quots.length - 1].low;
            var change = quots.quots[quots.quots.length - 1].prices[quots.quots[quots.quots.length - 1].prices.length - 1].change.toFixed(2);

            if (change < 0) {
                changediv.style.color = "red";
            }
            else {
                changediv.style.color = "green";
            }
            changediv.innerHTML = change + " &#8377;";



            var option = {
                'title': name,
                'height': 320
            };
            var chart = new google.visualization.LineChart(document.getElementById('chart'));
            chart.draw(data, option);
        }

        function DrawCharts() {
            readfile(<%= (Session["ShareId"]) %>)
        }

    </script>
    <script type="text/javascript">
        $(window).resize(function () {
            DrawCharts();
        });
    </script>

</asp:Content>

