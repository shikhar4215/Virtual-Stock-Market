<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="SectorManagement.aspx.cs" Inherits="VSM_Final.Admin.SectorManagement" %>

<%@ Import Namespace="VSM.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        tr:hover {
            background: lightgrey;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-center">Sector Management</h1>
        <div class="row mt-5">
            <div class="col-lg-6 sol-sm-12 text-center">
                <h3>Sector Details</h3>
                <div id="main" class="text-center">
                    <b>Select a Sector ---></b>
                </div>
            </div>
            <div class="col-lg-6 sol-sm-12 text-center">
                <button class="btn btn-primary mb-3" type="button" data-toggle="modal" data-target="#sector">Add new Sector </button>
                <%
                    string qs1 = "select * from Sector";
                    string[] idarr = new connection().query(qs1).getColumnArray(0);
                    try
                    {
                        connection con = new connection();
                        string qs = "select * from Sector";
                        Tables t = con.query(qs);
                        t.print();
                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("../error.aspx?e=" + ex.Message);
                    }
                %>
            </div>
        </div>
    </div>

    <!-- modal-->
    <div class="modal" tabindex="-1" role="dialog" id="sector">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Sector</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="txtSectorName">
                       Name of Sector
                    </label>
                    <input type="text" id="txtSectorName" placeholder="Sector Name" class="form-control"/>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" onclick="AddSector();">Save changes</button>
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- modal ends-->
    <script src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script>

        function display(i) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/GetSectorData.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("main").innerHTML = this.responseText;
                }
            }
            req.send();
        }

        function DeleteSector(i) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/DeleteSector.aspx?id=" + i, true);
            req.send();
        }

        function AddSector() {
            var req = new XMLHttpRequest();
            req.open("get", "Script/AddSector.aspx?name=" + document.getElementById("txtSectorName").value, true);
            req.send();
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
</asp:Content>
