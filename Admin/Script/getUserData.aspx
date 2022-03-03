<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getUserData.aspx.cs" Inherits="VSM_Final.Admin.Script.getUserData" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VSM.Class" %>
<%
    connection con = new connection();
    try
    {
        con.open();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        string qs = "select * from UserMaster where UserId=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            string response = "{" +
            "\"id\":\"" + dr.GetValue(0).ToString() + "\"," +
            "\"Fname\":\"" + dr.GetValue(1).ToString() + "\", \"Mname\": \"" + dr.GetValue(2).ToString() + "\", \"Lname\": \"" + dr.GetValue(3).ToString() + "\"," +
            "\"email\":\"" + dr.GetValue(5).ToString() + "\"," +
            "\"Birth\":\"" + dr.GetValue(7).ToString() + "\"," +
            "\"address\":\"" + dr.GetValue(8).ToString() + "\"," +
            "\"cityid\": \"" + dr.GetValue(9).ToString() + "\"," +
            "\"stateid\":\"" + dr.GetValue(10).ToString() + "\"," +
            "\"countryid\":\"" + dr.GetValue(11).ToString() + "\"," +
            "\"pincode\":\"" + dr.GetValue(12).ToString() + "\"," +
            "\"image\":\"" + dr.GetValue(13).ToString() + "\"," +
            "\"phone\":\"" + dr.GetValue(14).ToString() + "\"," +
            "\"gender\" : \"" + dr.GetValue(15).ToString() + "\"," +
            "\"active\" : \"" + dr.GetValue(16).ToString() + "\"," +
            "\"delete\" : \"" + dr.GetValue(17).ToString() + "\"}";

%>
<div class="container">
    <table class=" table  table-borderless">
        <thead>
            <tr>
                <th>
                    <h2 class="">USER DETAILS</h2>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="4">
                    <img alt="Profile Image" id="profile" src="<%= (dr.GetValue(13).ToString()) %>" class="w-50 h-50 img-fluid" width="200" height="200" />
                </td>
                <th>First name
                </th>
                <th>Middle name
                </th>
                <th>Last name
                </th>
            </tr>
            <tr>
                <td>
                    <div id="lblFname"><%= (dr.GetValue(1).ToString()) %></div>
                </td>
                <td>
                    <div id="lblMname"><%= (dr.GetValue(2).ToString()) %></div>
                </td>
                <td>
                    <div id="lblLname"><%= (dr.GetValue(3).ToString()) %></div>
                </td>
            </tr>
            <tr>
                <th>Email
                </th>
                <th>Phone Number
                </th>
                <th>Birth Date
                </th>
            </tr>
            <tr>
                <td>
                    <div id="lblMail"><%= (dr.GetValue(5).ToString()) %></div>
                </td>
                <td>
                    <div id="lblPhone"><%= (dr.GetValue(16).ToString()) %></div>
                </td>
                <td>
                    <div id="lblBirth"><%= (Convert.ToDateTime(dr.GetValue(7).ToString()).ToShortDateString()) %></div>
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
            <tr>
                <td>
                    <div id="lblAdd"><%= (dr.GetValue(8).ToString()) %></div>
                </td>
                <td>
                    <div id="lblCountry"><%= (con.GetLocation(dr.GetValue(11).ToString(), "con")) %></div>
                </td>
                <td>
                    <div id="lblCity"><%= (con.GetLocation(dr.GetValue(10).ToString(), "st")) %></div>
                </td>
                <td>
                    <div id="lblState"><%= (con.GetLocation(dr.GetValue(9).ToString(), "ci")) %></div>
                </td>
            </tr>
            <tr>
                <th>Pincode
                </th>
                <th>Gender
                </th>
                <th>Active
                </th>
                <th>Delete
                </th>
            </tr>
            <tr>
                <td>
                    <div id="lblPincode"><%= (dr.GetValue(12).ToString()) %></div>
                </td>
                <td>
                    <div id="lblGender"><%= (dr.GetValue(17).ToString()) %></div>
                </td>
                <td>
                    <div id="lblActive"><%= (dr.GetValue(18).ToString()) %></div>
                </td>
                <td>
                    <div id="lblDelete"><%= (dr.GetValue(19).ToString()) %></div>
                </td>
            </tr>
            <tr>
                <td class="text-center " colspan="4">
                    <%
                        if (dr.GetValue(19).ToString() == "1")
                        {
                    %>
                    <button class="btn btn-warning btn-lg" onclick="unblockUser()">Unblock </button>
                    <%
                        }
                        else
                        {
                    %>
                    <button class="btn btn-warning btn-lg" onclick="blockUser()">Block </button>
                    <%
                        }
                    %>
                    <button class="btn btn-danger btn-lg" onclick="deleteUser()">Delete </button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<%


            //Response.Write(response);
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