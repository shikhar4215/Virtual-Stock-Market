<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="SalesMonitor.aspx.cs" Inherits="VSM_Final.Admin.SalesMonitor" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        tr:hover {
            background: lightgrey;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <center> <%
        string paid = "";
        string adon = " where Paid=0";
        if (Request.QueryString["paid"] != null)
            paid = Request.QueryString["paid"];

        string redirect = "", text = "View All Records";
        if (paid == "")
        {
            adon = "";
            redirect = "?paid=1";
            text = "view only unpaid Records";
        }
    %>
    <h1 class="text-center">Monitor Sales </h1>
    <hr />
    <div class="text-center"><a href="SalesMonitor.aspx<%= (redirect) %>" class="btn btn-outline-secondary"><%=(text) %></a></div>
    <%
        string qs1 = "select * from Trading";
        string[] idarr = new connection().query(qs1).getColumnArray(0);
        try
        {
            connection con = new connection();
            string qs = "select TradeId, ShareId, Price, Volume from Trading" + adon;
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

    %></center>
    <div id="main" class="mt-5">
    </div>
    <script type="text/javascript" src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script type="text/javascript">
        function display(i) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/GetSalesRecord.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("main").innerHTML = this.responseText;
                }
            }
            req.send();
        }

        function MarkPaid(i) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/MarkAsPaid.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    display(i);
                }
            }
            req.send();
        }

        function getBankDetails(i) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/GetBank.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("bank").innerHTML = this.responseText;
                }
            }
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
