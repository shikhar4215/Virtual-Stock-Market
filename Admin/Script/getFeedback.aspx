<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getFeedback.aspx.cs" Inherits="VSM_Final.Admin.Script.getFeedback" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    string id = Request.QueryString["id"];
    string type = "";
    connection con = new connection();
    try
    {
        con.open();
        string qs = "select type from Feedback where FeedbackId=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            type = dr.GetValue(0).ToString();
            if (type.Equals("Company"))
            {
                cmd.CommandText = "select c.Name, f.Feedback, f.Response from Company as c, Feedback as f where f.FeedbackId=" + id + " and c.CompanyId=f.UserId";
            }
            else
            {
                cmd.CommandText = "select u.FirstName, u.LastName, f.Feedback, f.Response from Company as c, Feedback as f where FeedbackId=" + id + " and u.UserId=f.UserId";
            }
            dr.Close();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
%>

<div class="container shadow-lg p-4 mt-5 mb-5">
    <div class="row">
        <div class="col">
            <i class="fa fa-times close" onclick="document.getElementById('main').innerHTML = ''"></i>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h2>Feedback Details</h2>
        </div>
    </div>
    
    <hr />

    <div class="row">
        <div class="col">
            Name: 
            <b>

                <%
                    int index = 0;
                    if (type.Equals("User"))
                    {
                        Response.Write(dr.GetValue(0).ToString() + " " + dr.GetValue(1).ToString());
                        index = 2;
                    }
                    else
                    {
                        Response.Write(dr.GetValue(0).ToString());
                        index = 1;
                    }
                %>

            </b>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col">Feedback</div>
    </div>
    <div class="row">
        <div class="col"> <%= (dr.GetValue(index).ToString()) %></div>
    </div>
    <hr />

    <div class="row">
        <div class="col">
            Response
        </div>
    </div>

    <div class="row">
        <div class="col">
            <textarea id="AdminResponse" class="w-100 rounded response"> <%= (dr.GetValue(index+1).ToString()) %> </textarea>
        </div>
    </div>

    <div class="row justify-content-around">
        <div class="col-sm-12 col-md-10 col-lg-6">
            <button class="btn btn-primary w-100" onclick="submitResponse();"> Submit Response </button>
        </div>
    </div>

</div>

<%
            }
        }
    }
    catch (Exception ex)
    {
        Response.Write(ex.Message);
    }
    finally
    {
        con.close();
    }

%>
