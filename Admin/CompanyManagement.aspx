<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="CompanyManagement.aspx.cs" Inherits="VSM_Final.WebForm10" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table {
            text-align: center;
        }

        .r:hover {
            background: lightgrey;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="UnverifiedCompany.aspx" cssclass="  btn-info mb-4 f " runat="server">
        <i class="fa fa-check text-success fa-lg ml-5 f"></i>Unverified Company</a>
    <center>
        <h1>Company Management </h1>
    </center>
    <center><div class="container">
    <%
        string qs1 = "select * from Company";
        string[] idarr = new connection().query(qs1).getColumnArray(0);
        try
        {
            connection con = new connection();
            string qs = "select CompanyId, Name, GSTno, CIN from Company where Verified=1";
            Tables t = con.query(qs);
            t.print();
        }
        catch (Exception ex)
        {
            Response.Redirect("../error.aspx?e=" + ex.Message);
        }
        finally
        {

        }

    %>
    <div id="main" class="container">

    </div>
    </div></center>
    <script src="../bootstrap-4.4.1-dist/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        var JsonData;
        var i = -1;
        function display(index) {
            document.getElementById("main").innerHTML = "<div class='text-center'><i class='fas fa-3x fa-circle-notch fa-spin'></i></div>"
            var req = new XMLHttpRequest();
            i = index;
            req.open("get", "Script/GetCompanyData.aspx?id=" + index, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("main").innerHTML = this.responseText;
                }
            };
            req.send();
        }

        function BlockCompany() {
            document.getElementById("main").innerHTML = "<div class='text-center'><i class='fa fa-exclamation text-danger ml-2'>Company has been successfully blocked</div>";
            var req = new XMLHttpRequest();
            req.open("get", "Script/BlockCompany.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText == "True") {
                        window.location.replace("CompanyManagement.aspx");
                    }
                }
            };
            req.send();
        }

        function DeleteCompany() {
            document.getElementById("main").innerHTML = "<div class='text-center'><i class='fas fa-3x fa-circle-notch fa-spin'></i></div>";
            var req = new XMLHttpRequest();
            req.open("get", "Script/DeleteCompany.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    window.location.reload();
                }
            };
            req.send();
        }

         function UnblockCompany() {
             document.getElementById("main").innerHTML = "<div class='text-center text-success'><i class='fa fa-check-circle text-success ml-2'>Company has been successfully unblocked</div>";
            var req = new XMLHttpRequest();
            req.open("get", "Script/UnblockCompany.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                  if (this.responseText == "True") {
                        window.location.replace("CompanyManagement.aspx");
                    }
                }
            };
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
