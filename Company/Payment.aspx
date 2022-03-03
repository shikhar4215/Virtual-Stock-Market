<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="VSM_Final.Company.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
           <center><p class="mt-5 font-weight-bold fa-2x">10000 Registration fees will be charged</p>
            <input type="hidden" name="cmd" value="_xclick" />
            <input type="hidden" name="business" value="adityanair102@gmail.com" />
            <input type="hidden" name="lc" value="US" />
            <input type="hidden" name="item_name" value='Scrunity' />
            <input type="hidden" name="item_number" value='001' />
            <input type="hidden" name="amount" value='10000' />
            <input type="hidden" name="currency_code" value="INR" />
            <input type="hidden" name="button_subtype" value="services" />
            <input type="hidden" name="no_note" value="0" />
            <input type="hidden" name="cn" value="Add special instructions to the seller" />
            <input type="hidden" name="no_shipping" value="2" />
            <input type="hidden" name="undefined_quantity" value="1" />
            <input type="hidden" name="rm" value="1" />
            <input type="hidden" name="return" value="http://localhost:58381/Payment/Sucessfull" />
            <input type="hidden" name="cancel_return" value="http://localhost:58381/Payment/Fail.aspx" />
            <input type="hidden" name="tax_rate" value="1.000" />
            <input type="hidden" name="shipping" value="10.00" />
            <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest" />
            <div class="container m-5 w-50 shadow-lg">
                <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!" class="w-100 h-100" />

            </div>
            <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" /></center> 
        </form>
    </div>
</body>
</html>
