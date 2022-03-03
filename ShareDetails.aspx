<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ShareDetails.aspx.cs" Inherits="VSM_Final.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table th {
            border-top: none;
        }

        #chart {
            position: relative;
            width: 100%;
        }

        .chart-div {
            padding: 0px;
            background: white;
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-sm-12">
                    <div class="card card-comman mt-5">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-7 col-sm-7 col-md-7 d-flex justify-content-left">
                                    <h1 class="text-info">
                                        <asp:Label ID="lblName" runat="server" Text="Label">Share Name</asp:Label>
                                    </h1>
                                </div>
                                <div class="col-lg-5 col-sm-7 col-md-7 d-flex justify-content-left ml-auto">
                                    <asp:Button ID="Button3" runat="server" Text="BUY" CssClass="btn btn-success btn-lg  ml-auto mr-3" OnClick="Button3_Click" />
                                    <asp:Button ID="Button4" runat="server" Text="Add to WatchList" CssClass=" btn btn-primary btn-lg" OnClick="Button4_Click" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6
        col-sm-6 col-md-6 d-flex justify-content-left ">
                                    <p class="text-secondary">
                                        Id:
                                    </p>
                                    <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
                                    <div class="col-lg-6
        col-sm-6 col-md-6 d-flex justify-content-left">
                                        <p class="text-secondary">
                                            Secotor:
                                        </p>
                                        <asp:Label ID="lblSector" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-7 col-sm-12">
                    <div class="card card-comman mt-5 bg-white chart-div">
                        <div class="card-body text-secondary chart-div">
                            <div id="chart">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5
        col-sm-12">
                    <div class="card card-comman mt-5 bg-dark">
                        <div class="card-header">
                            <h3 class="text-white">Share Details</h3>
                        </div>
                        <div class="card-body bg-white">
                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <table class="table">
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
                                                <td>
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
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12
        col-sm-12">
                    <div class="card mt-5 ">
                        <div class="card-header bg-dark">
                            <h1 class="text-info">Company Name</h1>
                            <ul class="nav nav-tabs card-header-tabs mt-3" id="main">
                                <li class="nav-item"><a href="#comp" class="nav-link active">Company Details</a></li>
                                <li class="nav-item"><a href="#detail" class="nav-link ">Contact Details</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="comp">
                                <div class="card-body">
                                    <table class="table" style="border-color: White">
                                        <tr>
                                            <td rowspan="2">
                                                <asp:Image ID="Image1" runat="server" Width="200px" Height="200px" />
                                            </td>
                                            <td>
                                                <h4 class="">GST NO.</h4>
                                                <asp:Label ID="lblGst" runat="server" Text="Label" CssClass=""></asp:Label>
                                            </td>
                                            <td>
                                                <h4 class="">Registration No.
                                                </h4>
                                                <asp:Label ID="lblRegDt" runat="server" Text="Label" CssClass=""></asp:Label>
                                            </td>
                                            <td>
                                                <h4 class="">Market Capital
                                                </h4>
                                                <asp:Label ID="lblMarkCap" runat="server" Text="Label" CssClass=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h4 class="">CIN NO.
                                                </h4>
                                                <asp:Label ID="lblCIN" runat="server" Text="Label" CssClass=""></asp:Label>
                                            </td>
                                            <td>
                                                <h4 class="">Sector
                                                </h4>
                                                <asp:Label ID="lblSec2" runat="server" Text="Label" CssClass=""></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="detail">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-7 col-sm-12">
                                            <div id="mapStreetView" style="height: 300px; width: 500px"></div>
                                        </div>
                                        <div class="col-lg-5 col-sm-12">
                                            <table class="table">
                                                <tr>
                                                    <td>
                                                        <h4>Contact Number</h4>
                                                        <asp:Label ID="lblContact" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <h4>Contact Person</h4>
                                                        <asp:Label ID="lblPerson" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h4>Email</h4>
                                                        <asp:Label ID="lblMail" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <h4>Address</h4>
                                                        <asp:Label ID="lblAdd" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../bootstrap-4.4.1-dist/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
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
            readfile(<%= (Request.QueryString["id"]) %>)
        }

    </script>
    <script type="text/javascript">
        $(window).resize(function () {
            DrawCharts();
        });
    </script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

   <%-- <script type="text/javascript">
        function initializeThisMap(lat, lan) {
            var mapOptions = {
                zoom: 8,
                center: new google.maps.LatLng(lat, lan),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map = new google.maps.Map(document.getElementById('mapStreetView'),
                mapOptions);

            var marker = new google.maps.Marker({
                position: map.getCenter(),
                map: map,
                title: 'Click to zoom in'
            });


            google.maps.event.addListener(marker, 'click', function () {
                map.setZoom(12);
                map.setCenter(marker.getPosition());
            });
        }
    </script>
    <script type="text/javascript">

        initializeThisMap('<%= (dr.GetDouble(1)) %>', '<%=(dr.GetDouble(2)) %>');
          <%}
        }%>
    </script>--%>
</asp:Content>
