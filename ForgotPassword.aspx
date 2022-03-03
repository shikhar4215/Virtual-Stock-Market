<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="VSM_Final.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container p-5">
            <h1 class="text-center">Forgot Password </h1>
            <div class="row">
                <div class="col-lg-6 col-md-10 col-sm-12">
                    <label for="Email">
                        Email
                    </label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control w-75" runat="server" placeholder="Registerd mail Email"></asp:TextBox>
                    <asp:Button ID="btnSubmit" runat="server" Text="Reset Password" CssClass="btn btn-success mt-2" OnClick="btnSubmit_Click" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col">
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
