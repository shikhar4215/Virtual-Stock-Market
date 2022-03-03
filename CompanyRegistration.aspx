<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="CompanyRegistration.aspx.cs" Inherits="VSM_Final.WebForm5" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/form.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow-lg w-50 p-3">
        <h5 class="text-center">COMPANY REGISTER</h5>
        <hr />
        <div class=" text-center mb-5">

            <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-primary" navigateUrl="registration.aspx" OnClick="LinkButton2_Click1">USER</asp:LinkButton>
            <button type="button" class="ml-2 btn btn-primary" disabled>COMPANY</button>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtCompanyName" CssClass="t1 form-control n mt-2" runat="server"
                required="true"></asp:TextBox>
            <span class="l1 lnn">Company Name</span><asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                runat="server" ErrorMessage="Please enter proper Company Name" ValidationExpression="^([A-z][A-Za-z]*\s*[A-Za-z]*)$"
                ControlToValidate="txtCompanyName" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtContact" runat="server" CssClass="t1 form-control  cn" required="true"></asp:TextBox>
            <span class="l1 lcn">Contact Number</span><asp:RegularExpressionValidator ID="RegularExpressionValidator9"
                runat="server" ErrorMessage="Please enter 10 digit mobile number" ValidationExpression="[0-9]{10}" ControlToValidate="txtContact" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtContactPerson" runat="server" CssClass="t1 form-control cp"
                required="true"></asp:TextBox>
            <span class="l1  lcp">Contact Person</span>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="t1 form-control  em2" required="true"></asp:TextBox>
            <span class="l1 lem2">Email</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="GstNo" runat="server" CssClass="t1 form-control  gs" required="true"></asp:TextBox>
            <span class="l1 lgs">GST Number</span><asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                runat="server" ErrorMessage="Enter valid GST number" ValidationExpression="^[0-9]{2}[a-zA-Z0-9]{10}[0-9]{1}[A-Za-z]{1}[0-9]{1}$"
                ControlToValidate="GstNo" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="CIN" CssClass="t1 form-control cin text-capitalize" required="true" runat="server"></asp:TextBox>
            <span class="l1 lcin">CIN</span><asp:RegularExpressionValidator ID="RegularExpressionValidator10"
                runat="server" ErrorMessage="Please Enter CIN number" ValidationExpression="^[A-Za-z]{1}[0-9]{5}[a-zA-Z]{2}[0-9]{4}[A-Za-z]{3}[0-9]{6}$" ControlToValidate="CIN" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="RegDate" runat="server" CssClass="t1 form-control  rg" required="true"
                TextMode="Date">
            </asp:TextBox>
            <span class="lrg">Registration Date</span>
        </div>
        <div class="form-group">
            <asp:TextBox ID="CPassword" runat="server" CssClass="t1 form-control pw3" required="true"
                TextMode="Password"></asp:TextBox>
            <span class="l1 lpw3">Password</span>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                runat="server" ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                ControlToValidate="CPassword" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtcw" runat="server" CssClass="t1 form-control cpw2" required="true"
                TextMode="Password"></asp:TextBox>
            <span class="l1 lcpw2">Confirm Password</span>
            <asp:CompareValidator ID="CompareValidator2"
                runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtcw" ControlToCompare="CPassword" CssClass="vd"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="Address" runat="server" CssClass="t1 form-control  ad2" required="true"></asp:TextBox>
            <span class="l1 lad2">Address</span>
        </div>
        <div class="form-group">
            <select id="dropcon" name="dropcon" class="t1 form-control con2" required="true" onclick="getLocation(this.value, 'con')">
                <option value="0">---Select Country--- </option>
                <%
                    connection con = new connection();
                    try
                    {
                        con.open();
                        string qs = "select * from Countries";
                        SqlCommand cmd = new SqlCommand(qs, con.Con);
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                %>
                <option value="<%=(dr.GetValue(0).ToString()) %>"><%= (dr.GetValue(1).ToString()) %> </option>
                <%
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("error.aspx?e=" + ex.Message);
                    }
                    finally
                    {
                        con.close();
                    }
                %>
            </select>
            <span class="l1 lcon2">Country</span>
        </div>
        <div class="form-group">
            <select id="dropState" name="dropState" class="t1 form-control st2" required="true" onclick="getLocation(this.value, 'st')">
            </select>
            <span class="l1 lst2">State</span>

        </div>
        <div class="form-group">
            <select id="dropCity" name="dropCity" class="t1 ct form-control ct2" required="true">
            </select>
            <span class="l1 lct2">City</span>
        </div>
        <div class="form-group">
            <asp:TextBox ID="Pincode" runat="server" CssClass="t1 form-control pin" required="true">
            </asp:TextBox>
            <span class="l1 lpin">Pincode</span><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="please enter 6 digit pincode" ValidationExpression="[0-9]{6}" ControlToValidate="Pincode" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <input type="hidden" id="Demo1" name="lt" />
            <input type="hidden" id="Demo2" name="lg" />
           <center><button onclick="getlocation_let(); return false;" class="btn btn-success m-2" data-toggle="tooltip" data-placement="right" title="Please Click this button to store your current location"><i class="fa fa-map-marked"></i> Latitude</button></center>
        </div>
        <div class="form-group">
            <select id="dropSector" name="dropSector" class="t1 ct form-control sec" required="true">
                <option value="0">---Select Sector--- </option>
                <%
                    con.open();
                    string qs1 = "Select * from Sector";
                    SqlCommand cmd1 = new SqlCommand(qs1, con.Con);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        while (dr1.Read())
                        {
                %>
                <option value="<%=(dr1.GetValue(0).ToString()) %>"><%= (dr1.GetValue(1).ToString()) %> </option>
                <%
                        }
                    }
                    con.close();
                %>
            </select>
            <span class="l1 lsec">sector</span>

        </div>
        <div class="form-group">
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="t1 form-control im" />
            <span class="lrg">Image</span>
        </div>
        <div class="form-group"> 
            <span class="g-recaptcha" data-sitekey="6LdJWNcUAAAAAJAnBxbHWCryQeYzSZWl1yGHRvOz" data-toggle="tooltip" data-placement="right" title="Please verify here"></span>
        </div>
        <div class="text-right">
            <asp:Button ID="RegCompany" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="regComapny_Click" />
        </div>
    </div>
    <script type="text/javascript">
        function getLocation(data, type) {
            var req = new XMLHttpRequest(),
                id;
            req.open("get", "GetLocationOption.aspx?id=" + data + "&type=" + type);
            if (type == "con") {
                id = "dropState";
            }
            else {
                id = "dropCity";
            }
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById(id).innerHTML = this.responseText;
                }
            };

            req.send();
        } </script>
    <script type="text/javascript">
        function getlocation_let() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            }
            else {
                x.innerHTML("Your browser does not support geolocation");

            }
            return false;
        }
        function showPosition(position) {

            document.forms[0].elements['lt'].value = position.coords.latitude;
            document.forms[0].elements['lg'].value = position.coords.longitude;


        }
    </script>
     <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</asp:Content>
