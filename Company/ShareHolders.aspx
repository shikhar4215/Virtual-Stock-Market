<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ShareHolders.aspx.cs" Inherits="VSM_Final.Company.ShareHolders" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        connection con = new connection();
        try
        {
            con.open();
            string qs = "select u.FirstName, h.Volume, b.BankName, b.Number, u.UserId from Company as c, Holding as h, UserMaster as u, Share as s,BankDetails as b where c.CompanyId=" + Session["CompanyId"] + "and s.CompanyId=c.CompanyId and h.ShareId=s.ShareId and u.UserId=h.UserId and b.UserId=u.UserId";
            SqlCommand cmd = new SqlCommand(qs, con.Con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
    %>

    <div class="container shadow">
        <div class="row">
            <div class="col">
                <h2><%= (dr.GetValue(0).ToString()) %> </h2>
                <h3>Ammount of Share Owned: <%= (dr.GetValue(1).ToString()) %> </h3>
            </div>
            <a class="btn btn-primary" href="#details-<%= (dr.GetValue(4).ToString()) %>" data-toggle="collapse">View More</a>
            <div class="collapse " id="details-<%= (dr.GetValue(4).ToString()) %>">
                <div class="card shadow">
                    <div class="card-body">
                        <h2>Bank Details</h2>
                        <span class="">Bank Name: <%= (dr.GetValue(2).ToString()) %>
                        </span><br />
                        <span>Account Numnber: <%= (dr.GetValue(3).ToString()) %>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "<br>");
            Response.Write(ex.StackTrace);
        }
        finally
        {
            con.close();
        }
    %>
</asp:Content>
