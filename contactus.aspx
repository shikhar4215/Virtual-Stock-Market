<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="VSM.home.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow-lg p-3 mb-5 bg-light rounded mt-5">
        <h1>ContactUs</h1>
        <hr />
        <div class="card-body">
            <div class="row">
                <div class="col-lg-7 col-sm-12">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3691.2588940707496!2d73.16333511490598!3d22.306046485320522!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395fc8a48be07895%3A0xcf6fbd85c3f99355!2sBENISON%20COMPLEX!5e0!3m2!1sen!2sin!4v1583300241571!5m2!1sen!2sin"
                        frameborder="0" style="border: 0" allowfullscreen class="h-100 w-100"></iframe>
                </div>
                <div class="col-lg-5 col-sm-12">
                    <table class="table table-borderless">
                        <tr>
                            <td>
                                <h4>
                                    Contact Number</h4>
                                <asp:Label ID="lblContact" runat="server" Text="+1234567890"></asp:Label>
                            </td>
                            <td>
                                <h4>
                                    Contact Person</h4>
                                <asp:Label ID="lblPerson" runat="server" Text="Shrey Pateliya(+91999999999)"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="Shikhar Shah(+91999999998)"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                                    Email</h4>
                                <asp:Label ID="lblMail" runat="server" Text="vsminfo@vsm.com"></asp:Label>
                            </td>
                            <td>
                                <h4>
                                    Address</h4>
                                <asp:Label ID="lblAdd" runat="server" Text="">404,benision tower,<br />Vadodara,Gujarat;<br />India</asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
