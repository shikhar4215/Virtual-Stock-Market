<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getShareData.aspx.cs" Inherits="VSM_Final.Admin.Script.getShareData" %>


<html>

    <head>
        <style type="text/css">
            .close{
                height: 25px;
                width: 25px;
                text-align: center;
                cursor: pointer;
            }
            .close:hover{
                background: lightgrey;
            }
            .my-btn{
                background: #F8F9FA;
                height: 25px;
                width: 25px;
            }
        </style>
    </head>

<body>
    <%@ Import Namespace="System.Data.SqlClient" %>
    <%@ Import Namespace="VSM.Class" %>

    <%

        string id = Request.QueryString["id"];
        connection con = new connection();
        try
        {
            con.open();
            string qs = "select t1.ShareId, t1.CompanyId, t1.Symbol, t1.Volume, t1.DividendType, t1.LastDividend, t1.DividendAmt, t2.CompanyId, t2.Name from Share as t1, Company as t2 where t1.ShareId=" + id + " and t2.CompanyId=t1.CompanyId";
            SqlCommand cmd = new SqlCommand(qs, con.Con);
            SqlDataReader dr = cmd.ExecuteReader();
            //lblId.Text = dr.GetValue(0).ToString();
            //lblComapnyId.Text = dr.GetValue(1).ToString();
            //lblSymbol.Text = dr.GetValue(2).ToString();
            //lblVolume.Text = dr.GetValue(3).ToString();
            //lblDivType.Text = dr.GetValue(4).ToString();
            //lblLastDiv.Text = dr.GetValue(5).ToString();
            //lblDivAmt.Text = dr.GetValue(6).ToString();
            //lblCompanyName.Text = dr.GetValue(8).ToString();
            if (dr.HasRows)
            {
                dr.Read();
    %>
    <div class="container shadow-lg p-3 mb-5 bg-light rounded mt-5">
        <div class="row">
            <div class="col">
                <i class="fa fa-times close" onclick="document.getElementById('main').innerHTML = ''"></i>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div id="chart" class="col-lg-7 col-sm-12">
                </div>
                <div class="col-lg-5 col-sm-12">
                    <table class="table table-borderless">
                        <tr>
                            <td>
                                <h4>Share ID</h4>
                                <span><%= (dr.GetValue(0).ToString()) %></span>
                            </td>
                            <td>
                                <h4>Share Name</h4>
                                <span><%= (dr.GetValue(2).ToString()) %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Company ID</h4>
                                <span><%= (dr.GetValue(1).ToString()) %></span>
                            </td>
                            <td>
                                <h4>Company Name</h4>
                                <span><%= (dr.GetValue(8).ToString()) %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Symbol</h4>
                                <span><%= (dr.GetValue(2).ToString()) %></span>
                            </td>
                            <td>
                                <h4>Volume</h4>
                                <span><%= (dr.GetValue(3).ToString()) %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>DividendType
                                </h4>
                                <span><%= (dr.GetValue(4).ToString()) %></span>
                            </td>
                            <td>
                                <h4>LastDividend
                                </h4>
                                <span><%= (dr.GetValue(5).ToString()) %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>DividendAmt
                                </h4>
                                <span><%= (dr.GetValue(6).ToString()) %></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ml-auto mr-auto">
                    <table class="table table-borderless">
                        <tr>
                            <td class="text-center " colspan="4">
                                <button id="Button4" class="btn btn-danger btn-lg f1" onclick="DeleteShare(<%= (dr.GetValue(0).ToString()) %>);">Delete </button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("../Error.aspx?e=" + ex.Message);
        }
        finally
        {
            con.close();
        }

    %>
</body>
</html>
