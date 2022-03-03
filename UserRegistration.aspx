<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="VSM_Final.WebForm6" %>
<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .t1 {
    box-shadow: none !important;
    border: none;
    background-color: none;
    outline: none;
    border-bottom: 1px solid #ccc !important;
}
    </style>
    <link href="css/form.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container shadow-lg p-3 w-50 mt-2">
        <div class="">
            <h5 class=" text-center">USER REGISTER</h5>
        </div>
        <hr />
        <div class=" text-center mb-5">
            <button type="button" class="btn btn-primary" disabled="disabled">USER</button>
            <asp:LinkButton ID="LinkButton2" runat="server" class="ml-2 btn btn-primary" OnClick="LinkButton2_Click1">COMPANY</asp:LinkButton>
        </div>
        <div class="form-group">
            <asp:TextBox ID="FirstName" runat="server" CssClass="t1 form-control fn" required="true"></asp:TextBox>
            <span class="l1 lfn">First Name</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                runat="server" ErrorMessage="Please enter proper FirstName" ValidationExpression="^([A-z][A-Za-z]*\s*[A-Za-z]*)$"
                ControlToValidate="FirstName" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="MiddleName" runat="server" CssClass="t1 form-control  mn" required="true"></asp:TextBox>
            <span class="l1 lmn">Middle name</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                runat="server" ErrorMessage="Please enter proper MiddleName" ValidationExpression="^([A-z][A-Za-z]*\s*[A-Za-z]*)$"
                ControlToValidate="MiddleName" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="LastName" runat="server" CssClass="t1 form-control  ln mt-2" required="true"></asp:TextBox>
            <span class="l1 lln">Last Name</span><asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                runat="server" ErrorMessage="Please enter proper LastName" ValidationExpression="^([A-z][A-Za-z]*\s*[A-Za-z]*)$"
                ControlToValidate="LastName" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <span class="lg">Gender</span>
            <asp:RadioButton ID="Male" runat="server" Text="Male" GroupName="r2" CssClass="mb-auto" />
            <asp:RadioButton ID="Female" runat="server" Text="Female" GroupName="r2" CssClass="mb-auto" />
            <asp:RadioButton ID="Other" runat="server" Text="Other" GroupName="r2" CssClass="mb-auto" />
        </div>
        <div class="form-group">
            <asp:TextBox ID="Email" runat="server" CssClass="t1 form-control  em1" required="true"></asp:TextBox>
            <span class="l1 lem1">Email</span><asp:RegularExpressionValidator ID="RegularExpressionValidator7"
                runat="server" ErrorMessage="Please enter proper email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="Email" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="BirthDate" runat="server" CssClass="t1 form-control  bt" required="required"
                SelectedDate="1/1/2020" TextMode="Date"></asp:TextBox>
            <span class="lrg">BirthDate</span>
        </div>
        <div class="form-group">
            <asp:TextBox ID="Password" runat="server" CssClass="t1 form-control pw2" required="true"
                TextMode="password"></asp:TextBox>
            <span class="l1 lpw2">Password</span><asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                runat="server" ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                ControlToValidate="Password" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtcpw" runat="server" CssClass="t1 form-control cpw1" required="true" TextMode="password"></asp:TextBox>
            <span class="l1 lcpw1">Confirm Password</span>
            <asp:CompareValidator
                ID="CompareValidator1" runat="server" ErrorMessage="password must be same" ControlToCompare="Password"
                ControlToValidate="txtcpw" CssClass="vd"></asp:CompareValidator>

        </div>
        <div class="form-group">
            <asp:TextBox ID="Address" runat="server" CssClass="t1 form-control  ad1" required="true"
                TextMode="MultiLine"></asp:TextBox>
            <span class="l1 lad1">Address</span>
        </div>



        <div class="form-group">
            <select id="dropcon" name="dropcon" class="t1 form-control con1" required="true" onchange="getLocation(this.value, 'con')">
                <option value="0">---Select Country--- </option>
                <%
                        connection con = new connection();
                        try
                        {
                            con.Con.Open();
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

                        }%>
                <%
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                    finally
                    {
                        con.close();
                    }
                %>
            </select>
            <span class="l1 lcon1">Country</span>
        </div>



        <div class="form-group">
            <select id="dropst" name="dropst" class="t1 form-control st1" required="required" onchange="getLocation(this.value, 'st')">
            </select>
            <span class="l1 lst1">State</span>

        </div>



        <div class="for-group">
            <select id="dropci" name="dropci" class="t1  form-control ct1" required="required">
            </select>
            <span class="l1 lct1">City</span>
        </div>



        <div class="form-group">
            <asp:TextBox ID="txtpin" runat="server" CssClass="t1 form-control upin" required="required" TextMode="number" />
            <span class="l1 lupin">Pincode</span>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="please enter 6 digit pincode" ValidationExpression="[0-9]{6}" ControlToValidate="txtpin" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="t1 form-control im" />
            <span class="lrg">Image</span>
        </div>
        <div class="form-group">
            <asp:TextBox ID="phone" runat="server" CssClass="t1 form-control ph" required="true">
            </asp:TextBox>
            <span class="l1 lph">Phone Number</span><asp:RegularExpressionValidator ID="RegularExpressionValidator8"
                runat="server" ErrorMessage="Please enter 10 digit mobile number" ValidationExpression="[0-9]{10}" ControlToValidate="phone" CssClass="vd"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group  w-75">
            
            <span class="g-recaptcha" data-sitekey="6LdJWNcUAAAAAJAnBxbHWCryQeYzSZWl1yGHRvOz" data-toggle="tooltip" data-placement="right" title="Please verify here"></span>
        </div>
        <div class="form-check">
            <asp:CheckBox ID="CheckBox1" runat="server" />I hear by to the <a href="disclaimer.aspx">terms and contidtion</a>
        </div>
        <div class="form-group">
            <input type="hidden" id="Demo1" name="lt" />
            <input type="hidden" id="Demo2" name="lg" /><p></p>
            <center><button onclick="getlocation_let(); return false;" class="btn btn-success m-2" data-toggle="tooltip" data-placement="right" title="Please Click this button to store your current location"><i class="fa fa-map-marked"></i> Get Location</button></center>
        </div>
        
        <div class="text-right">
            <asp:Button ID="RegUser" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="RegUser_Click1" />
        </div>
    </div>
    <script type="text/javascript">
        function getLocation(data, type) {
            var req = new XMLHttpRequest(),
                id;
            req.open("get", "GetLocationOption.aspx?id=" + data + "&type=" + type);
            if (type == "con") {
                id = "dropst";
            }
            else {
                id = "dropci";
            }
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById(id).innerHTML = this.responseText;
                }
            };

            req.send();
        }
    </script>
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


