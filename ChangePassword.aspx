<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="VSM_Final.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-3">
        <div class="row justify-content-around">
            <div class="col text-center">
                <h1>Change Password</h1>
                <hr />
            </div>
        </div>
        <div class="container">
            <div class="row justify-content-around">
                <div class="col-lg-6 col-md-10 col-sm-12">
                    <label for="passord">New Password:</label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                    <label for="passord">Confirm New Password:</label>
                    <asp:TextBox ID="txtConPass" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row justify-content-around">
            <div class="col-lg-6 col-md-10 col-sm-12">
                <asp:Button ID="btnChange" runat="server" CssClass="btn btn-success" Text="ChangePassword" OnClick="btnChange_Click" />
            </div>
        </div>
    </div>
</asp:Content>
