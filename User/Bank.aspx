<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="VSM_Final.User.Bank" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%

            connection con = new connection();
            try
            {
                con.open();
                string qs = "select b.BankName, b.Number, u.FirstName, b.BId from BankDetails as b, UserMaster as u where b.UserId=" + Session["UserId"] + " and u.UserId=b.UserId";
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
        %>

        <div class="container shadow-lg p-5 mb-5">
            <h4>Your Bank Details <%= (dr.GetValue(2).ToString()) %> </h4>
            <hr />
            <span>Bank Name: </span><b><%= (dr.GetValue(0).ToString()) %></b><br />
            <span>Account Number: </span><b><%= (dr.GetValue(1).ToString()) %></b><br />
            <div class="row">
                <div class="col">
                    <button class="btn btn-outline-danger w-100" onclick="deleteBankDetails(<%= (dr.GetValue(3).ToString()) %>);">Delete</button>
                </div>
                <div class="col">
                    <button class="btn btn-outline-primary w-100" data-target="#m2" data-toggle="modal" onclick="return false;">Edit Details</button>

                    <!-- Edit details modal -->
                    <div class="modal fade" id="m2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Details</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col">
                                            <input type="text" id="txtEditName" placeholder="Bank Name" class="form-control" value="<%= (dr.GetValue(0).ToString()) %>" />
                                            <input type="number" id="txtEditNumber" placeholder="Account Number" class="form-control mt-3" value="<%= (dr.GetValue(1).ToString()) %>" />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button class="btn btn-primary" onclick="editBankDetails();"> Confirm </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%
            }
            else
            {
        %>
        <div class="text-center">
            <h3 class="text-center text-danger">Looks Like you dont Have a Bank Account Saved.</h3>
            <button class="btn btn-primary" data-toggle="modal" data-target="#m1" onclick="return false;">Add Bank Account</button>

            <!-- Add account modal -->

            <div class="modal fade" id="m1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Bank Account
                            </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col">
                                    <input type="text" id="txtBankName" placeholder="Bank Name" class="form-control" />
                                    <input type="number" id="txtAccountNumber" placeholder="Account Number" class="form-control mt-3" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button class="btn btn-primary" onclick="addBankDetails();">Add Account</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
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
    </div>

    <script type="text/javascript">
        function addBankDetails() {
            var name = document.getElementById("txtBankName").value;
            var number = document.getElementById("txtAccountNumber").value;
            var req = new XMLHttpRequest();
            req.open("get", "Script/SubmitBankDetails.aspx?name=" + name + "&number=" + number);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                }
            }
            req.send();
        }

        function editBankDetails() {
            var name = document.getElementById("txtEditName").value;
            var number = document.getElementById("txtEditNumber").value;
            var req = new XMLHttpRequest();
            req.open("get", "Script/EditBankDetails.aspx?name=" + name + "&number=" + number);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                }
            }
            req.send();
        }

        function deleteBankDetails(id) {
            var req = new XMLHttpRequest();
            req.open("get", "Script/DeleteBankDetails.aspx?id=" + id);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                }
            }
            req.send();
        }
    </script>

</asp:Content>
