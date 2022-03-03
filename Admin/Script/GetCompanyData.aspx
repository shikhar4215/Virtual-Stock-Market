<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetCompanyData.aspx.cs" Inherits="VSM_Final.Admin.Script.GetCompanyData" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    Response.Clear();
    connection con = new connection();
    try
    {
        con.open();
        string id = Request.QueryString["id"];
        string qs = "select * from Company where CompanyId=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            string Data = "{" +
                        "\"Id\": \"" + dr.GetValue(0).ToString() + "\"," +
                        "\"Name\": \"" + dr.GetValue(1).ToString() + "\"," +
                        "\"Contact\": \"" + dr.GetValue(2).ToString() + "\"," +
                        "\"Person\": \"" + dr.GetValue(3).ToString() + "\"," +
                        "\"Mail\": \"" + dr.GetValue(4).ToString() + "\"," +
                        "\"Image\": \"" + dr.GetValue(6).ToString() + "\"," +
                        "\"Gst\": \"" + dr.GetValue(7).ToString() + "\"," +
                        "\"Cin\": \"" + dr.GetValue(8).ToString() + "\"," +
                        "\"RegDate\": \"" + dr.GetValue(9).ToString() + "\"," +
                        "\"Add\": \"" + dr.GetValue(10).ToString() + "\"," +
                        "\"CityId\": \"" + dr.GetValue(11).ToString() + "\"," +
                        "\"StateId\": \"" + dr.GetValue(12).ToString() + "\"," +
                        "\"CountryId\": \"" + dr.GetValue(13).ToString() + "\"," +
                        "\"Pincode\": \"" + dr.GetValue(14).ToString() + "\"," +
                        "\"SectorId\": \"" + dr.GetValue(15).ToString() + "\"," +
                        "\"MarketCap\": \"" + dr.GetValue(16).ToString() + "\"," +
                        "\"Active\": \"" + dr.GetValue(19).ToString() + "\"," +
                        "\"Deleted\": \"" + dr.GetValue(20).ToString() + "\"}";

%>

<div class="container shadow-lg p-3 mb-5 bg-light rounded row">
    <div class="col-lg-12 col-md-12 col-sm-12">
        <table class="table f table-borderless">
            <thead>
                <tr>
                    <th colspan="4" class="text-center pd">
                        <h2>COMPANY DETAILS
                        </h2>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th rowspan="4" class="pr-5" style="width: 200px;">
                        <img src="../../Profile/download.png" />
                        
                    </th>
                    <th>company Name
                    </th>
                    <th>Contact No
                    </th>
                    <th>Email
                    </th>

                </tr>
                <tr class="t">
                    <td>
                        <span id="lblName"><%= (dr.GetValue(1).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblContact"><%= (dr.GetValue(2).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblMail"><%= (dr.GetValue(3).ToString()) %></span>
                    </td>
                </tr>
                <tr>
                    <th>GstNo
                    </th>
                    <th>CIN
                    </th>
                    <th>Registration Date
                    </th>

                </tr>
                <tr class="t">
                    <td>
                        <span id="lblGst"><%= (dr.GetValue(7).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblCin"><%= (dr.GetValue(8).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblRegDt"><%= (dr.GetValue(9).ToString()) %></span>
                    </td>

                </tr>
                <tr>
                    <th>Address
                    </th>
                    <th>Country
                    </th>
                    <th>State
                    </th>
                    <th>City
                    </th>

                </tr>
                <tr class="t">
                    <td>
                        <span id="lblAdd"><%= (dr.GetValue(10).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblCountry"><%= (con.GetLocation(dr.GetValue(13).ToString(),"con")) %></span>
                    </td>
                    <td>
                        <span id="lblState"><%= (con.GetLocation(dr.GetValue(12).ToString(),"st")) %></span>
                    </td>
                    <td>
                        <span id="lblCity"><%= (con.GetLocation(dr.GetValue(11).ToString(),"ci")) %></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th>Pincode
                    </th>
                    <th>Sector
                    </th>
                    <th>MarketCap
                    </th>
                    <th>Active
                    </th>
                    <th>Delete
                    </th>
                </tr>
                <tr class="t">
                    <td>
                        <span id="lblPincode"><%= (dr.GetValue(14).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblSec"><%= (con.getSector(dr.GetValue(15).ToString())) %></span>
                    </td>
                    <td>
                        <span id="lblMarkCap"><%= (dr.GetValue(16).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblActive"><%= (dr.GetValue(21).ToString()) %></span>
                    </td>
                    <td>
                        <span id="lblDelete"><%= (dr.GetValue(22).ToString()) %></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center " colspan="4">
                        <%
                            if (dr.GetValue(22).ToString() == "0")
                            {
                        %>
                        <button id="Block" class="btn btn-warning btn-lg" onclick="BlockCompany()">Block</button>
                        <%
                            }
                            else
                            {
                        %>
                        <button id="UnBlock" class="btn btn-warning btn-lg" onclick="UnblockCompany()">UnBlock </button>
                        <%
                            }
                        %>

                        <button id="Delete" class="btn btn-danger btn-lg" onclick="DeleteCompany()">Delete </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<%

        }
        else
        {
            Response.Write(null);
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

