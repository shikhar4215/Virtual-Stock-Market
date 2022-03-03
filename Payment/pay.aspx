<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pay.aspx.cs" Inherits="VSM_Final.Payment.pay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

    <%
        string shareid = Request.QueryString["shareId"],
            name = Request.QueryString["sharename"],
            type = Request.QueryString["type"],
            qty = Request.QueryString["qty"],
        orderid = "";
        if (!type.Equals("out"))
        {
            orderid = "&orderid=" + Request.QueryString["orderid"];
        }
    %>
    <script>
        var req = new XMLHttpRequest();
        req.open("get", "http://localhost:58381/Quotations/" + <%= (shareid) %> + ".json");
        req.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var quots = JSON.parse(this.responseText);
                var p = (Number(quots.quots[quots.quots.length - 1].prices[quots.quots[quots.quots.length - 1].prices.length - 1].price) * Number(<%=(qty)%>)).toFixed(2);
                document.getElementsByName("amount").value = p;
            }
        }
        req.send();
    </script>
    <div>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_xclick" />
            <input type="hidden" name="business" value="adityanair102@gmail.com" />
            <input type="hidden" name="lc" value="US" />
            <input type="hidden" name="item_name" value='<%= (name) %>' />
            <input type="hidden" name="item_number" value='001' />
            <%--<input type="hidden" name="amount" value='<%=  Session["BuyPrice"] %>'>--%>
            <input type="hidden" name="amount" value='' />
            <input type="hidden" name="currency_code" value="INR" />
            <input type="hidden" name="button_subtype" value="services" />
            <input type="hidden" name="no_note" value="0" />
            <input type="hidden" name="cn" value="Add special instructions to the seller" />
            <input type="hidden" name="no_shipping" value="2" />
            <input type="hidden" name="undefined_quantity" value="1" />
            <input type="hidden" name="rm" value="1" />
            <input type="hidden" name="return" value="http://localhost:58381/Trade/Trade.aspx?type=<%=(type) %>&shareid=<%=(shareid) %>&qty<%=(qty) %><%=(orderid) %>" />
            <input type="hidden" name="cancel_return" value="http://localhost:58381/Payment/Fail.aspx" />
            <input type="hidden" name="tax_rate" value="1.000" />
            <input type="hidden" name="shipping" value="10.00" />
            <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest" />
            <center><div class="container m-5 w-25 shadow-lg">
                <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!" class="w-100 h-100" />

            </div></center>
            
            <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
        </form>
    </div>

</body>
</html>
