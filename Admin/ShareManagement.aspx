<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ShareManagement.aspx.cs" Inherits="VSM_Final.WebForm11" %>

<%@ Import Namespace="VSM.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        tr:hover {
            background: lightgrey;
        }
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        function map(x, rh, rl, mh, ml) {
            return x * (mh - ml) / (rh - rl);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input id="Hidden1" type="hidden" />
    <center>
        <h1>Share Management</h1>
    </center>

    <center><div class="container">
        <div class="form-group">
            <div class="row">
                <div class="col-1">
                    <i class="fa fa-search fa-2x ml-5 mt-1"></i>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control w-100" placeholder="Search Parameters (Leave Blank for all)"></asp:TextBox>
                </div>
                <div class="col-2">
                    <asp:Button ID="Button1" runat="server" Text="GO" CssClass="btn btn-info w-100" />
                </div>
            </div>
        </div>
    

    <% 
        Tables t = new connection().query("select t1.ShareId, t2.Name, t1.Symbol from Share AS t1, Company As t2 where t2.CompanyId=t1.CompanyId and (t2.Name like '%" + txtSearch.Text + "%' or t1.Symbol like '%" + txtSearch.Text + "%')");
        t.print();
        string[] idarr = t.getColumnArray(0);
    %>
    </div></center>
    <div class="container" id="main">
    </div>




    <script type="text/javascript" src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script type="text/javascript">

        function DeleteShare(i) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/DeleteShare.aspx?id=" + id, true);
            req.send();
        }

        var index;

        function DisplayData(i) {
            index = i;
            var req = new XMLHttpRequest();
            req.open("get", "Script/getShareData.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("main").innerHTML = this.responseText;
                    google.charts.load('current', { 'packages': ['corechart'] });
                    google.charts.setOnLoadCallback(drawchart);
                }
            };
            req.send();
        }

        function drawchart() {
            document.getElementById("chart").innerHTML = "<div class='text-center mt-5'><i class='fas fa-circle-notch fa-spin fa-3x'></i></div>";
            var req = new XMLHttpRequest();
            req.open("get", "http://localhost:58381/Quotations/" + index + ".json", true);

            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    placeChart(JSON.parse(this.responseText));
                }
            };

            req.send();
        }

        function placeChart(quots) {
            var data = new google.visualization.DataTable();
            data.addColumn("string", "Time");
            data.addColumn("number", "price");
            name = quots.name;

            //printing last 20 quots
            time = "";
            for (var i = quots.quots.length - 3; i < quots.quots.length; i++) {
                for (var j = 0; j < quots.quots[i].prices.length; j++) {
                    data.addRows([[time, quots.quots[i].prices[j].price]]);
                }
            }
            var option = {
                'title': name,
                'height': 400
            };
            var chart = new google.visualization.LineChart(document.getElementById('chart'));
            chart.draw(data, option);
        }

        $(window).resize(function () {
            drawchart();
        });
        <%
        for (int i = 0; i < idarr.Length; i++)
        {
            string jq = "$('#" + idarr[i] + "').click(function(){" +
                    "DisplayData(" + idarr[i] + ")" +
                    "});\n";
            Response.Write(jq);
        }
        %>

        function clear() {
            console.log("click");
            document.getElementById("main").innerHTML = "";
        }

    </script>
</asp:Content>
