<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AdManagement.aspx.cs" Inherits="VSM_Final.WebForm9" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table {
            width: 100%;
        }

        tr:hover {
            background: lightgrey;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-home">
    <% 
        Tables t = new connection().query("select Id, Name from Advertisement");
        string[] idarr = t.getColumnArray(0);
        object id = Request.QueryString["id"];
    %>
    <center>
        <h1 style="margin-top: 75px;">Advertisement Management </h1>
    </center>


    <div class="container mt-5 shadow-lg rounded">

        <div class="row">
            <div class="col-md-3">
                <div class="row pt-2">
                    <div id="AdData" class="col text-center">
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-12">
                        <h3>Add Advertisement </h3>
                        <form id="add" action="AdManagement.aspx">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Name" runat="server"></asp:TextBox>
                                <label for="Impression">Impressions</label>
                                <asp:TextBox ID="txtImpressions" runat="server" CssClass="form-control" placeholder="impressions"></asp:TextBox>
                                <label for="url">Nvaigation URL</label>
                                <asp:TextBox ID="txtNavigateURL" runat="server" placeholder="URL" CssClass="form-control"></asp:TextBox>
                                <label for="image">Upload Image</label>
                                <asp:FileUpload ID="FileUpload1" CssClass="form-control-file" runat="server" />
                            </div>
                            <center>
                                <asp:Button ID="btnPrimary" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnPrimary_Click" /></center>
                            <br />
                        </form>
                    </div>
                </div>


            </div>
            <div class="col-md-9">
                <% t.print(); %>
            </div>
        </div>
    </div>
    <br />
    <br />





    <script type="text/javascript" src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script type="text/javascript">


        var i = -1;

        var JsonData;
        function display(index) {
            document.getElementById("AdData").innerHTML = "<i class='fas fa-circle-notch fa-spin'></i>"
            var req = new XMLHttpRequest();
            req.open("get", "Script/GetAdData.aspx?id=" + index, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("AdData").innerHTML = this.responseText;
                }
            }
            req.send();
            i = index;
        }

        function Delete() {
            var req = new XMLHttpRequest();
            if (i >= 0) {
                req.open("get", "Script/DeleteAd.aspx?id=" + i, true);
                req.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        windows.location.reload();
                    }
                };
                req.send();
            }

        }

        
        <%
        for (int i = 0; i < idarr.Length; i++)
        {
            string jq = "$('#" + idarr[i] + "').click(function(){ " +
                    "display(" + idarr[i] + ")" +
                    " });";
            Response.Write(jq);
        }
        %>  
    </script>
    </div>
</asp:Content>
