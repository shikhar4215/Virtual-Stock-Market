<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="VSM_Final.VerifyOTP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-4">
        <div class="row text-center">
            <div class="col">
                <h1>Enter OTP Here </h1>
                <hr />
                <b>Check Your Mail for OTP. </b>
            </div>
        </div>
        <div class="container mt-3">
            <div class="row justify-content-around">
                <div class="col-lg-6 col-md-10 col-sm-12">
                    <label for="OTP">Enter OTP</label>
                    <asp:TextBox ID="OTP" runat="server" TextMode="number" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row justify-content-around">
                <div class="col-lg-6 col-md-10 col-sm-12">
                    <asp:Button ID="btnCheck" runat="server" CssClass="btn btn-success w-100" Text="Continue" OnClick="btnCheck_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
