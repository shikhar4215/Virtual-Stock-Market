<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AddShare.aspx.cs" Inherits="VSM_Final.Admin.AddShare" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-5">
        <h3>Add Share For Company </h3>
        <br />
        <div class="row">

            <div class="col-lg-6 col-sm-12 col-md-10">
                <div class="form-group">
                    <label for="txtSymbol">Symbol</label>
                    <asp:TextBox ID="txtSymbol" CssClass="form-control" runat="server" requried="true"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-12 col-md-10">
                <div class="form-group">
                    <label for="txtVolume">Volume</label>
                    <asp:TextBox ID="txtVolume" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-sm-12 col-md-10">
                <div class="form-group">
                    <label for="dropDiv">DevidendType</label>
                    <asp:DropDownList ID="DropDiv" CssClass="form-control" runat="server" required="true"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-12 col-md-10">
                <div class="form-group">
                    <label for="txtPrice">Price</label>
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row text-center">
            <div class="col-lg-6 col-sm-12 col-md-10">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success w-100" Text="Add Share" OnClick="btnAdd_Click" />
            </div>
        </div>
    </div>
</asp:Content>
