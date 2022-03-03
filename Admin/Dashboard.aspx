<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="VSM_Final.WebForm7" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .feedback {
            border: 1px solid lightgrey;
            width: 85%;
            height: 500px;
            border-radius: 5px;
            overflow-y: scroll;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-home" style="margin-top: 72px;" id="main-content">
        <h2 class="p-3">Dashboard </h2>
        <hr />
        <div class="container shadow-lg p-3 mb-5 bg-light rounded">
            <div class="row">
                <div class="col-lg-6 col-sm-12 p-2">
                    <div class="card card-comman bg-success">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <i class="fa fa-flag fa-3x text-white"></i>
                                <div class="text-right">
                                    <h5>Total Listed Shares</h5>
                                    <asp:Label ID="cs" runat="server" Text="Label">10</asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="class-footer text">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-12 p-2">
                    <div class="card card-comman bg-danger">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <i class="fa fa-building fa-3x text-info"></i>
                                <div class="text-right">
                                    <h5>Total Companies</h5>
                                    <asp:Label ID="cc" runat="server" Text="Label"10></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="class-footer text">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h3 class="p-3">Trading Information</h3>
        <hr />
        <div class="row">
            <div class="col" id="Trade-Chart">
            </div>
        </div>
        <br />
        <br />
        
        <br />
        <br />
        <h3>Recent Feedbacks</h3>
        <hr />
        <center>
            <div class="feedback p-3 shadow-lg">
                <%
                    connection con = new connection();
                    try
                    {
                        con.open();
                        string qs = "select * from Feedback";
                        SqlCommand cmd = new SqlCommand(qs, con.Con);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                if (dr.Read())
                                {
                                    %>
                
                <diV Class="mt-2">

                    <div class="row">
                        <div class="col">
                            FeedbackId: <%= (dr.GetValue(0).ToString()) %>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <b><%= (dr.GetValue(2).ToString()) %></b>
                        </div>
                    </div>

                </diV>
                <hr>
                
                <%
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<h2> No Feedback to Display </h2>");
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
        </center>
    </div>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawchart);

        function drawchart() {
            drawtradingchart();
            drawloginchart();
        }

        function drawtradingchart() {
            <%
        try
        {
            long unixTimestamp = (long)(DateTime.UtcNow.Subtract(DateTime.Now.AddHours(24))).TotalSeconds;
            string data = "";
            con.open();
            string qs = "Select * from trading order by TradeTime desc";
            SqlCommand cmd = new SqlCommand(qs, con.Con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    DateTime d = dr.GetDateTime(6);
                    long diff = (long)(DateTime.UtcNow.Subtract(d)).TotalSeconds;
                    if (diff - unixTimestamp > 0)
                    {
                        data = "['" + d.ToShortTimeString() + "', " + dr.GetValue(5).ToString() + "]," + data;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            %>
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'time');
            data.addColumn('number', 'volume');
            data.addRows([<%= data %>]);
            console.log([<%= data %>]);
            var option = {
                title: "",
                height: 400
            };
            var chart = new google.visualization.LineChart(document.getElementById('Trade-Chart'));
            chart.draw(data, option);
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
        }

        function drawloginchart() {

        }

        $(window).resize(function () {
            drawchart();
        });
    </script>
</asp:Content>

