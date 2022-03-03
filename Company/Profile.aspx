<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="VSM_Final.Company.Profile" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VSM.Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% 
        connection con = new connection();
        con.open();
        string qs = "select * from Company where CompanyId='" + Session["CompanyId"] + "'";
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {

            while (dr.Read())
            {%>
    <div class="container shadow-lg p-3 mb-5 bg-light rounded">
        <div class="row">
            <h1 class="">
                <span><%=(dr.GetValue(1).ToString()) %></span>
            </h1>
            <table class="table table-borderless" style="border-color: White">
                <tr>
                    <td rowspan="2">
                        <img src="<%=(dr.GetValue(6).ToString()) %>"  class="img-fluid w-100 h-100 img-fluid" />

                    </td>
                    <td>
                        <h4 class="">GST NO.</h4>
                        <span><%=(dr.GetValue(7).ToString()) %></span>
                    </td>
                    <td>
                        <h4 class="">Registration No.
                        </h4>
                        <span><%=(dr.GetValue(9).ToString()) %></span>
                    </td>
                    <td>
                        <h4 class="">Market Capital
                        </h4>
                        <span><%=(dr.GetValue(16).ToString()) %></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4 class="">CIN NO.
                        </h4>
                        <span><%=(dr.GetValue(8).ToString()) %></span>
                    </td>
                    <td>
                        <h4 class="">Sector
                        </h4>
                        <span><%=(con.getSector(dr.GetValue(15).ToString())) %></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div id="mapStreetView" style="height: 200px; width: 100%;">
                </div>
            </div>
            <div class="col-lg-12 col-sm-12">
                <table class="table table-borderless">
                    <tr>
                        <td>
                            <h4>Contact Number</h4>
                            <span><%=(dr.GetValue(2).ToString()) %></span>
                        </td>
                        <td>
                            <h4>Contact Person</h4>
                            <span><%=(dr.GetValue(3).ToString()) %></span>
                        </td>
                        <td>
                            <h4>Email</h4>
                            <span><%=(dr.GetValue(4).ToString()) %></span>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <h4>Address</h4>
                            <span><%=(dr.GetValue(10).ToString()) %></span>
                        </td>

                        <td>
                            <h4>City</h4>
                            <span><%=(con.GetLocation(dr.GetValue(11).ToString(), "ci")) %></span>
                        </td>
                        <td>
                            <h4>Pincode</h4>
                            <span><%=(dr.GetValue(14).ToString()) %></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>State</h4>
                            <span><%=(con.GetLocation(dr.GetValue(12).ToString(), "st")) %></span>
                        </td>

                        <td>
                            <h4>Country</h4>
                            <span><%=(con.GetLocation(dr.GetValue(13).ToString(), "con")) %></span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

        <script type="text/javascript">
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
                    map.setZoom(20);
                    map.setCenter(marker.getPosition());
                });
            }
        </script>
        <script type="text/javascript">
            initializeThisMap('<%=dr.GetValue(24).ToString() %>', '<%=dr.GetValue(23).ToString() %>');
        </script>
        <%

                }
            }

        %>
</asp:Content>

