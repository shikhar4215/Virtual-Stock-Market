<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VSM_Final.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../css/form.css" rel="stylesheet" />
    <style type="text/css">
        @media only screen and (min-device-width : 375px) and (max-device-width : 812px) and (-webkit-device-pixel-ratio : 3) {
            .con {
                margin-top: 40%;
                width: 100%;
            }
        }

        .fm {
            top: -25px;
        }

        .fm1 {
            transition: 0.4s;
            position: relative;
        }

        .tb {
            box-shadow: none !important;
        }

            .tb:focus ~ .fm1, .tb:valid ~ .fm1 {
                top: -55px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container con">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="card shadow-lg mt-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">LOGIN</h5>
                        <h5 class="text-center"><i class="fa fa-user fa-5x mt-1 text-primary mb-3"></i></h5>
                        <div class="form-group">
                            <asp:TextBox ID="LMail" runat="server" CssClass="t1 form-control lig  border-left-0 border-right-0 border-top-0" required="true"></asp:TextBox>
                            <i class="fa fa-user l1 llg mr-1"></i><span class="l1 llg">LOGIN</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="LPass" TextMode="Password" runat="server" CssClass="t1 form-control  pw1  border-left-0 border-right-0 border-top-0" required="true"></asp:TextBox>
                            <i class="fa fa-key l1 lpw1 mr-1"></i><span class="l1 lpw1">PASSWORD</span>
                        </div>
                        <div class="form-group">
                            <%
                                if (Request.QueryString["type"] != null)
                                {
                            %>
                            <a href="Login.aspx">Login as User</a>
                            <%
                                }
                                else
                                {
                            %>
                            <a href="Login.aspx?type=com">Login as Company</a>
                            <%
                                }
                            %>
                            <br />
                            <a href="ForgotPassword.aspx" class="text-decoration-none">Forgot Password? </a>
                            <br />
                            Not Yet Registered? <a href="UserRegistration.aspx">Sign Up here.</a><br />
                            <br />

                        </div>
                        <div class="text-center">

                            <asp:Button ID="Log" runat="server" Text="LOGIN" CssClass="btn btn-primary" OnClick="Log_Click" />
                            <br />
                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</asp:Content>
