<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Adverisement.aspx.cs" Inherits="VSM_Final.WebForm15" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VSM.Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 p-3 shadow-lg">
        <h1>Advertisement 
        </h1>
        <%connection con = new connection();
            con.open();
            string qs = "Select Name,Image,Url From Advertisement";
            SqlCommand cmd = new SqlCommand(qs, con.Con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {%>
        <div class="card shadow-lg bg-secondary mt-2">
            <div class="card-body">
                <div class="row">
                    <div class="col-4">
                        <span><%=(dr.GetValue(0).ToString()) %></span>
                    </div>
                    <div class="col-4 ">
                        <img src="<%=(dr.GetValue(1).ToString()) %>" class="w-25 h-05" />
                    </div>
                    <div class="col-4">
                        <a href="<%=(dr.GetValue(2).ToString()) %>"><%=(dr.GetValue(2).ToString()) %></a>
                    </div>
                </div>
            </div>
        </div>
                <%}
            }%>
        <hr />
        <h2 class="mt-2">To Show Your Advertisemet Please Contact on Below Number</h2>
        <p><i class="fa fa-phone-square  mr-1"></i>+911800023457</p>
    </div>
</asp:Content>
