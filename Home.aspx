<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="VSM_Final.WebForm1" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .img-size {
            width: 10%;
            height: 10%;
        }

        .zin {
            z-index: 1;
        }

        .active {
            border-bottom: solid;
            border-color: orangered;
        }

        .dactive {
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%

        connection con = new connection();
        con.open();

    %>

        <div id="mycarousel" class="carousel slide mycarousel" data-ride="carousel">
            <ol class="carousel-indicators">
                <li class="active" data-target="#mycarousel" data-slide-to="0"></li>
                <li class="" data-target="#mycarousel" data-slide-to="1"></li>
                <li class="" data-target="#mycarousel" data-slide-to="2"></li>
                <li class="" data-target="#mycarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active slide border-bottom-0" data-intervel="3">
                    <img src="../images/black.jfif" class="img-fluid w-100" style="height: 500px;" />
                    <div class="carousel carousel-caption text-white fa-5x" style="margin-bottom: 200px;">VSM</div>
                </div>
                <div class="carousel-item slide border-bottom-0" data-intervel="3">
                    <img src="../images/2.jpeg" class="img-fluid w-100" style="height: 500px;" />
                </div>
                <div class="carousel-item slide border-bottom-0" data-intervel="3">
                    <img src="../images/5.jpeg" class="img-fluid  w-100" style="height: 500px;" />
                </div>

                <div class="carousel-item slide border-bottom-0" data-intervel="3">
                    <img src="../images/4.jpeg" class="img-fluid w-100" style="height: 500px;" />
                </div>
            </div>
            <a class="carousel-control-prev" data-slide="prev" data-target="#mycarousel">
                <span class="carousel-control-prev-icon"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" data-slide="next" data-target="#mycarousel">
                <span class="carousel-control-next-icon"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-sm-12">
                </div>
                <div class="col-lg-6 col-sm-12">
                    <table class="table shadow-lg p-3 mt-5 mb-5 mr-5">
                        <thead>
                            <tr>
                                <th colspan="4" class="text-secondary fa-2x">TOP FIVE VSM</th>
                            </tr>
                            <tr class="">
                                <th>Symbol</th>
                                <th>LTP</th>
                                <th>Change</th>
                                <th>Volume</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Symbol</td>
                                <td>LTP</td>
                                <td>Change</td>
                                <td>Volume</td>
                            </tr>
                            <tr>
                                <td>Symbol</td>
                                <td>LTP</td>
                                <td>Change</td>
                                <td>Volume</td>
                            </tr>
                            <tr>
                                <td>Symbol</td>
                                <td>LTP</td>
                                <td>Change</td>
                                <td>Volume</td>
                            </tr>
                            <tr>
                                <td>Symbol</td>
                                <td>LTP</td>
                                <td>Change</td>
                                <td>Volume</td>
                            </tr>
                            <tr>
                                <td>Symbol</td>
                                <td>LTP</td>
                                <td>Change</td>
                                <td>Volume</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="bg-light">
                <table class="table">
                    <tr>
                        <td>
                            <span class="fa-2x">Nifty</span><br />
                            <span>current Rate</span><br />
                            <span>high/low(change)</span>

                        </td>
                        <td>
                            <span class="fa-2x">Nifty</span><br />
                            <span>current Rate</span><br />
                            <span>high/low(change)</span>
                        </td>
                        <td>
                            <span class="fa-2x">Nifty</span><br />
                            <span>current Rate</span><br />
                            <span>high/low(change)</span>
                        </td>
                        <td>
                            <span class="fa-2x">Nifty</span><br />
                            <span>current Rate</span><br />
                            <span>high/low(change)</span>
                        </td>
                        <td>
                            <span class="fa-2x">Nifty</span><br />
                            <span class="">current Rate</span><br />
                            <span class="">high/low(change)</span>
                        </td>
                    </tr>
                </table>
            </div>
            <%--corporate event--%>
            <%  
                string qs1 = "SELECT c.Name, ca.Date, ca.subject FROM Company AS c, Notice AS ca where c.CompanyId=ca.CompanyId";

                SqlCommand cmd1 = new SqlCommand(qs1, con.Con);

                SqlDataReader dr1 = cmd1.ExecuteReader(); %>
            <div class="row">
                <div class="col-lg-6 col-sm-12">
                    <h2>Corporate Events</h2>
                    <hr />
                    <ul class="nav mt-3 ml-1" id="main">
                        <li class="nav-item" id="l1"><span class="ml-3 font-weight-bold text-secondary">Today</span><a href="#comp" class="nav-link active text-dark" id="dt"></a></li>
                        <li class="nav-item" id="l2"><span class="ml-3 font-weight-bold text-secondary">Tomorrow</span><a href="#detail" class="nav-link text-dark" id="dt1"></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active border-bottom-0" id="comp">
                            <div class="card w-50 ml-1 mb-1 mt-1">
                                <% if (dr1.HasRows)
                                    {
                                        while (dr1.Read())
                                        {%>

                                <div class="card-body">
                                    <table>
                                        <tr>
                                            <td>
                                                <span><%= (dr1.GetValue(0).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%= (dr1.GetValue(1).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%= (dr1.GetValue(2).ToString()) %></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <%}
                                    }
                                    dr1.Close();
                                    con.close();
                                %>
                            </div>
                        </div>
                        <%  string qs2 = "SELECT c.Name, ca.Date, ca.subject FROM Company AS c, Notice AS ca where c.CompanyId=ca.CompanyId";
                            con.open();
                            SqlCommand cmd2 = new SqlCommand(qs2, con.Con);
                            SqlDataReader dr2 = cmd2.ExecuteReader();

                        %>
                        <div class="tab-pane fade border-bottom-0" id="detail">
                            <div class="card w-50 ml-1 mb-1 mt-1">
                                <% 
                                    if (dr2.HasRows)
                                    {
                                        while (dr2.Read())
                                        {
                                %>

                                <div class="card-body">
                                    <table>
                                        <tr>
                                            <td>
                                                <span><%=(dr2.GetValue(0).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%=(dr2.GetValue(1).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%=(dr2.GetValue(2).ToString()) %></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <%}
                                }
                                dr2.Close();
                                con.close();
                            %>
                        </div>
                    </div>
                </div>
                <!--video-->
                <div class="col-lg-6 ">
                    <h2>VIDEO</h2>
                    <hr />
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <video class=" mb-1 h-75 w-100" controls>
                                        <source src="../videos/Investor%20Awareness%20-%20Password%20Tips.mp4" class="w-100" />
                                        Your browser does not support HTML5 video.
                                    </video>
                                </div>
                                <div class="col-6">
                                    <b>Investor Awareness|password Tips</b>
                                    <p>
                                        If Password is to remain a SECRET and only known to you, do not write it down or stick it up for easier access or recall. It could give hackers easy access to it. Watch this hilarious yet an insightful video to know more!
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="row mt-5">
                                <div class="col-6">
                                    <video class=" mb-1 h-75 w-100" controls>
                                        <source src="../videos/Investor%20Awareness%20-%20Trade%20Verification.mp4" class="w-100" />
                                        Your browser does not support HTML5 video.
                                    </video>
                                </div>
                                <div class="col-6">
                                    <b>Investor Awareness|Trade Verification</b>
                                    <p>
                                        Message Notification for Debit/Credit Card Purchases (check/tick icon) Message Notification for Business Transactions (check / tick icon) Message Notification for Investment Transactions? You know what to do next, update your contact details in KYC available with your broker and ensure that you get timely messages of all your investment transactions and be worry free.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <video class=" mb-1 h-75 w-100" controls>
                                        <source src="../videos/Investor%20Awareness%20-%20Trade%20Verification.mp4" class="w-100" />v_bbb.ogg" type="video/ogg">
                                Your browser does not support HTML5 video.
                                    </video>
                                </div>
                                <div class="col-6">
                                    <b>Investor Awareness|SMS Tips</b>
                                    <p>
                                        If it's too good to be true, it usually isn't. There are no shortcuts for creating wealth. So stay informed like this family and don’t fall for fraudulent SMS tips from unknown sources. Watch this informative video to know more.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--video-->
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <hr />
                </div>
            </div>
            <%--Corporate event && Board event--%>

            <ul class="nav" id="main1">
                <li class="nav-item"><a href="#tb-1" class="text-dark nav-link active">Corporate Announcement</a></li>
                <li class="nav-item"><a href="#tb-2" class="text-dark nav-link">Board Meetings</a></li>
            </ul>
            <%  string qs4 = "SELECT c.Name, ca.Date, ca.subject FROM Company AS c, Notice AS ca";
                SqlCommand cmd4 = new SqlCommand(qs4, con.Con);
                con.open();
                SqlDataReader dr4 = cmd1.ExecuteReader();

            %>
            <div class="tab-content">
                <div class="tab-pane show fade active border-bottom-0" id="tb-1">
                    <div class="row mt-5">
                        <div class="col-lg-3 col-sm-12">
                            <%if (dr4.HasRows)
                                {
                                    while (dr4.Read())
                                    { %>
                            <div class="card w-100 h-100">
                                <div class="card-header bg-primary">
                                </div>
                                <div class="card-body">
                                    <table>
                                        <tr>
                                            <td>
                                                <span><%=(dr4.GetValue(0).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%=(dr4.GetValue(1).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%=(dr4.GetValue(2).ToString()) %></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <%}
                                }
                                dr4.Close();
                                con.close();
                            %>
                        </div>
                    </div>
                </div>
                <%  string qs5 = "select c.Name, n.Subject, n.Content  from Company as c, Notice as n where c.CompanyId=n.CompanyId";
                    con.open();
                    SqlCommand cmd5 = new SqlCommand(qs5, con.Con);
                    SqlDataReader dr5 = cmd5.ExecuteReader();

                    if (dr5.HasRows)
                    {%>
                <div class="tab-pane show fade border-bottom-0" id="tb-2">
                    <div class="row mt-5 border-bottom-0">
                        <div class="col-lg-3 col-sm-12">
                            <%while (dr5.Read())
                                {%>
                            <div class="card">
                                <div class="card-header bg-primary">
                                </div>
                                <div class="card-body">
                                    <table>
                                        <tr>
                                            <td>
                                                <span><%=(dr5.GetValue(0).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%=(dr5.GetValue(1).ToString()) %></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span><%=(dr5.GetValue(2).ToString()) %></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <%}
                                }
                                dr5.Close();
                                con.close();
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <%string id = "0";
                string qs3 = "select * from Advertisement where id='" + id + "'";
                con.open();
                SqlCommand cmd3 = new SqlCommand(qs3, con.Con);
                SqlDataReader dr3 = cmd3.ExecuteReader();%>
            <%--Advt --%>
            <div id="hide" class="container zin mt-5">
                <div class="row">
                    <div class="col-12">
                        <div class="card bg-info z1 mb-2">
                            <div class="card-body">
                                <div class="mb-2">
                                    <button onclick="Hid() return false;" class="float-right mb-5"><i class="fa fa-times"></i></button>
                                </div>
                                <div class="row">
                                    <%if (dr3.HasRows)
                                        {
                                            while (dr3.Read())
                                            {%>
                                    <div class="col-4">
                                        <img class="text-white text-center img-fluid w-25" src=" <%= (dr3.GetValue(2).ToString()) %>" />
                                    </div>
                                    <div class="col-4"><span class="text-white  fa-2x"><%= (dr3.GetValue(1).ToString()) %> </span></div>
                                    <div class="col-4 d-flex justify-content-center mt-3"><a href="http://<%=(dr3.GetValue(4).ToString()) %>" class="text-decoration-none text-white"><%= (dr3.GetValue(4).ToString()) %></a></div>

                                    <%}
                                        }
                                        dr3.Close();
                                        con.close();
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header bg-success">
                                <h2>User FeedBack</h2>
                            </div>
                            <% con.open();
                                string qs6 = "select u.Image, u.FirstName, f.Feedback from FeedBack as f, UserMaster as u where u.UserId=f.UserId";
                                SqlCommand cmd6 = new SqlCommand(qs6, con.Con);
                                SqlDataReader dr6 = cmd6.ExecuteReader();
                                if (dr6.HasRows)
                                {
                                    while (dr6.Read())
                                    {

                            %>

                            <div class="Card-body">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <img src="<%= (dr6.GetValue(0).ToString()) %>" class="img-fluid h-100 w-100" />
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-12">
                                                <h3><%= (dr6.GetValue(1).ToString()) %></h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <p><%= (dr6.GetValue(2).ToString()) %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }
                                dr6.Close();
                                con.close();%>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header bg-success">
                                <h2>Company FeedBack</h2>
                            </div>
                            <% con.open();
                                string qs7 = "select c.image, c.Name, f.Feedback from FeedBack as f, Company as c where c.CompanyId=f.userId";
                                SqlCommand cmd7 = new SqlCommand(qs7, con.Con);
                                SqlDataReader dr7 = cmd6.ExecuteReader();
                                if (dr7.HasRows)
                                {
                                    while (dr7.Read())
                                    {

                            %>

                            <div class="Card-body">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <img src="<%= (dr7.GetValue(0).ToString()) %>" class="img-fluid h-100 w-100" />
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-12">
                                                <h3><%= (dr7.GetValue(1).ToString()) %></h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <p><%= (dr7.GetValue(2).ToString()) %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }
                                dr7.Close();
                                con.close();%>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    <%--<script type="text/javascript">
        function Hid() {
            var x = document.getElementById("hide");
            x.style.display = "none";
        }
    </script>--%>
    <script src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#main a").click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#main1 a").click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
    </script>
    <script type="text/javascript">
        function border() {
            var x = Document.getElementBYId("l1");
            var y = Document.getElementBYId("l2");
            if (x.onclick) {
                x.ClassList.Add(".active");


            }
            if (y.onclick) {
                y.ClassList.Add(".active");
            }
        }
        var d = new Date();
        document.getElementById("dt").innerHTML = d.toLocaleDateString();


        var d1 = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
        var day = d1.getDate();
        var month = d1.getMonth() + 1;
        var year = d1.getFullYear();
        document.getElementById("dt1").innerHTML = month + '/' + day + '/' + year;
    </script>
</asp:Content>
