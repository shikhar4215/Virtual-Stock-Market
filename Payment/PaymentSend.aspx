<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="PaymentSend.aspx.cs" Inherits="VSM_Final.Payment.PaymentSend" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <script>
        
    </script>

    <%--<div class="container">
        <%
            string sharename = Request.QueryString["symbol"];
            string qty = Request.QueryString["qty"];
            string total = Request.QueryString["total"];
        %>
        <input type="hidden" id="udf5" name="udf5" value="BOLT_KIT_ASP.NET" />
        <input type="hidden" id="surl" name="surl" value="http://localhost:58381/Payment/Response.aspx" />
        <input type="hidden" id="key" name="key" placeholder="Merchant Key" value="xDKE2dSR" />
        <input type="hidden" id="salt" name="salt" placeholder="Merchant Salt" value="aaQoZl5fQ2" />
        <input type="hidden" id="txnid" name="txnid" placeholder="Transaction ID" value="0" />
        <input type="hidden" id="amount" name="amount" placeholder="Amount" value="<%= (total) %>" />
        <input type="hidden" id="pinfo" name="pinfo" placeholder="Product Info" value="<%= (sharename) %>" />
        <input type="hidden" id="fname" name="fname" placeholder="First Name" value="Shrey" />
        <input type="hidden" id="email" name="email" placeholder="Email ID" value="shreypateliya@gmail.com" />
        <input type="hidden" id="mobile" name="mobile" placeholder="Mobile/Cell Number" value="7041599067" />
        <input type="hidden" id="hash" name="hash" placeholder="Hash" value="" />

        <div class="row">
            <div class="col">
                <h1 class="text-center">Purchase Details</h1>
            </div>
        </div>
        <hr />
        <div class="row text-center">
            <div class="col">
                <h3>Share: <b><%= (sharename) %></b></h3>
                <h3>Quantity: <b><%= (qty) %></b> </h3>
                <h3>Total: <b><%= (total) %> &#8377;</b> </h3>
            </div>
        </div>
        <hr />
        <div class="row text-center">
            <div class="col">
                <input type="submit" value="Pay" class="btn btn-outline-success w-50" onclick="launchBOLT(); return false;" />
            </div>
        </div>

    </div>
    <script type="text/javascript" id="bolt" src="https://sboxcheckout-static.citruspay.com/bolt/run/bolt.min.js"></script>
    <script type="text/javascript" src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            getHash();
        });

        function getHash() {
            $.ajax({
                url: 'http://localhost:58381/Script/Hash.aspx',
                type: 'post',
                data: JSON.stringify({
                    key: $('#key').val(),
                    salt: $('#salt').val(),
                    txnid: $('#txnid').val(),
                    amount: $('#amount').val(),
                    pinfo: $('#pinfo').val(),
                    fname: $('#fname').val(),
                    email: $('#email').val(),
                    mobile: $('#mobile').val(),
                    udf5: $('#udf5').val()
                }),
                contentType: "application/json",
                dataType: 'json',
                success: function (json) {
                    if (json['error']) {
                        $('#alertinfo').html('<i class="fa fa-info-circle"></i>' + json['error']);
                    }
                    else if (json['success']) {
                        $('#hash').val(json['success']);
                        console.log($('#hash').val())
                    }
                }
            });
            console.log("hash");
        }
//-->
    </script>
    <script type="text/javascript"><!--
    function launchBOLT() {
        bolt.launch({
            key: $('#key').val(),
            txnid: $('#txnid').val(),
            hash: $('#hash').val(),
            amount: $('#amount').val(),
            firstname: $('#fname').val(),
            email: $('#email').val(),
            phone: $('#mobile').val(),
            productinfo: $('#pinfo').val(),
            udf5: $('#udf5').val(),
            surl: $('#surl').val(),
            furl: $('#surl').val()
        }, {
                responseHandler: function (BOLT) {
                    console.log(BOLT.response.txnStatus);
                    if (BOLT.response.txnStatus != 'CANCEL') {
                        var fr = '<form action=\"' + $('#surl').val() + '\" method=\"post\">' +
                            '<input type=\"hidden\" name=\"key\" value=\"' + BOLT.response.key + '\" />' +
                            '<input type=\"hidden\" name=\"salt\" value=\"' + $('#salt').val() + '\" />' +
                            '<input type=\"hidden\" name=\"txnid\" value=\"' + BOLT.response.txnid + '\" />' +
                            '<input type=\"hidden\" name=\"amount\" value=\"' + BOLT.response.amount + '\" />' +
                            '<input type=\"hidden\" name=\"productinfo\" value=\"' + BOLT.response.productinfo + '\" />' +
                            '<input type=\"hidden\" name=\"firstname\" value=\"' + BOLT.response.firstname + '\" />' +
                            '<input type=\"hidden\" name=\"email\" value=\"' + BOLT.response.email + '\" />' +
                            '<input type=\"hidden\" name=\"udf5\" value=\"' + BOLT.response.udf5 + '\" />' +
                            '<input type=\"hidden\" name=\"mihpayid\" value=\"' + BOLT.response.mihpayid + '\" />' +
                            '<input type=\"hidden\" name=\"status\" value=\"' + BOLT.response.status + '\" />' +
                            '<input type=\"hidden\" name=\"hash\" value=\"' + BOLT.response.hash + '\" />' +
                            '</form>';
                        var form = jQuery(fr);
                        jQuery('body').append(form);
                        form.submit();
                    }
                },
                catchException: function (BOLT) {
                    alert(BOLT.message);
                }
            });
    }
    </script>--%>
</asp:Content>

