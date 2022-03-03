<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="navbar.aspx.cs" Inherits="RealEstate_final.navbar" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Real state</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .out {
            outline: none;
            border: none;
            background: white;
        }
    </style>
</head>
<body>
    <input type="hidden" id="count" value="6" />
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
    <header>
<div class="header-area ">
<div class="header-top_area d-none d-lg-block">
<div class="container">
<div class="row">
<div class="col-xl-5 col-md-5 ">
<div class="header_left">

</div>
</div>
<div class="col-xl-7 col-md-7">
<div class="header_right d-flex">
<div class="short_contact_list">

</div>
<div class="social_media_links">

</div>
</div>
</div></div>
</div>
</div>
<div id="sticky-header" class="main-header-area">
<div class="container">
<div class="header_bottom_border">
<div class="row align-items-center">
<div class="col-xl-3 col-lg-2">
<div class="logo">
<a href="#">
<img src="img/logo.png" alt="">
</a>
</div>
</div>
<div class="col-xl-6 col-lg-7">
 <div class="main-menu  d-none d-lg-block">

<ul id="navigation">
<li><a class="active" href="#">home</a></li>
<li><a href="#">Types <i class="ti-angle-down"></i></a>
<ul class="submenu">

<li><a href="navbar.aspx">All Types</a></li>
 <li><button onclick="FindBunglow(); return false;" class="border-0 out"> Bunglow</button></li>
     <li><button onclick="FindFlat(); return false;" class="border-0  out">Flat</button></li>
 <li><button onclick="FindPlot(); return false;" class="border-0  out">Plot</button></li>
</ul>
</li>

<li><a href="service.aspx">Services</a></li>
<li><a href="ContactUs.aspx">Contact Us</a></li>
<li><a href="AboutUs.aspx">About Us</a></li>
</ul>
</nav>
</div>
</div>
<div class="col-xl-3 col-lg-3 d-none d-lg-block">
<div class="Appointment">
<div class="book_btn d-none d-lg-block">
<a href="login.aspx">Login</a>
</div>
<div class="book_btn d-none d-lg-block">
<a href="registration.aspx">SignUp</a>
</div>
<div class="book_btn d-none d-lg-block">
<a href="#">Wishlist</a>
</div>
</div>
</div>
<div class="col-12">
<div class="mobile_menu d-block d-lg-none"></div>
</div>
</div>
</div>
</div>
</div>
</div>
</header>
    <div class="slider_area">
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="slider_text text-center justify-content-center">
                            <h3>Find your best Property</h3>
                        </div>
                        <div class="property_form">
                            <form id="Form1" action="#" runat="server">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="form_wrap d-flex">
                                            <div class="single-field max_width ">
                                                <label for="#">
                                                    Location</label>
                                                <asp:DropDownList runat="server" ID="propertylocation" class="wide">
                                                    <asp:ListItem Text="Ahmedabad" Value="Ahmedabad"></asp:ListItem>
                                                    <asp:ListItem Text="Surat" Value="Surat"></asp:ListItem>
                                                    <asp:ListItem Text="Vadodara" Value="Vadodara"></asp:ListItem>
                                                    <asp:ListItem Text="Nadiad" Value="Nadiad"></asp:ListItem>
                                                    <asp:ListItem Text="Anand" Value="Anand"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="single-field max_width">
                                                <label for="#">
                                                    Property type</label>
                                                <asp:DropDownList runat="server" ID="propertytype" class="wide">
                                                    <asp:ListItem Text="Flat" Value="Flat"></asp:ListItem>
                                                    <asp:ListItem Text="Bunglow" Value="Bunglow"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="single-field max_width ">
                                                <label for="#">
                                                    Min Price</label>
                                                <asp:DropDownList runat="server" ID="minprice" class="wide">
                                                    <asp:ListItem Text="50000" Value="50000"></asp:ListItem>
                                                    <asp:ListItem Text="100000" Value="100000"></asp:ListItem>
                                                    <asp:ListItem Text="200000" Value="200000"></asp:ListItem>
                                                    <asp:ListItem Text="300000" Value="300000"></asp:ListItem>
                                                    <asp:ListItem Text="400000" Value="400000"></asp:ListItem>
                                                    <asp:ListItem Text="500000" Value="500000"></asp:ListItem>
                                                    <asp:ListItem Text="600000" Value="600000"></asp:ListItem>
                                                    <asp:ListItem Text="700000" Value="700000"></asp:ListItem>
                                                    <asp:ListItem Text="800000" Value="800000"></asp:ListItem>
                                                    <asp:ListItem Text="900000" Value="900000"></asp:ListItem>
                                                    <asp:ListItem Text="1000000" Value="1000000"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="single-field max_width ">
                                                <label for="#">
                                                    Max Price</label>
                                                <asp:DropDownList runat="server" ID="maxprice" class="wide">
                                                    <asp:ListItem Text="1500000" Value="1500000"></asp:ListItem>
                                                    <asp:ListItem Text="2000000" Value="2000000"></asp:ListItem>
                                                    <asp:ListItem Text="2500000" Value="2500000"></asp:ListItem>
                                                    <asp:ListItem Text="3000000" Value="3000000"></asp:ListItem>
                                                    <asp:ListItem Text="3500000" Value="3500000"></asp:ListItem>
                                                    <asp:ListItem Text="4000000" Value="4000000"></asp:ListItem>
                                                    <asp:ListItem Text="4500000" Value="4500000"></asp:ListItem>
                                                    <asp:ListItem Text="5000000" Value="5000000"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <!--
<div class="single_field range_slider">
<label for="#">Price</label>
<div id="slider"></div>
</div>-->
                                            <div class="single-field min_width ">
                                                <label for="#">
                                                    Bed Room</label>
                                                <asp:DropDownList ID="propertybhk" runat="server" class="wide">
                                                    <asp:ListItem Text="1 BHK" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="2 BHK" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="3 BHK" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <!--<div class="single-field min_width ">
<label for="#">Bath Room</label>
<select class="wide">
<option data-display="01">01</option>
<option value="1">02</option>
<option value="2">03</option>
</select>
</div>-->
                                            <div class="serach_icon">
                                                <asp:Button ID="searchbtn" runat="server" CssClass="ti-search btn #0000003b" Text="Search"
                                                    OnClick="searchbtn_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="popular_property" id="prop">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-40 text-center">
                        <h3>Popular Properties</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                    int i = 0;
                    SqlConnection sqlconn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\RealEstate_final-20200412T033521Z-001\\RealEstate_final\\App_Data\\Database1.mdf;Integrated Security=True;User Instance=True");
                    sqlconn.Open();
                    string sqlquery = "select * from Property";
                    SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                    SqlDataReader ad = sqlcomm.ExecuteReader();
                    if (ad.HasRows)
                    {
                        while (ad.Read())
                        {
                            i++;
                            if (i > 6)
                            {
                                break;
                            }
                %>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_property">
                        <div class="property_thumb">
                            <a href="PropertyDetails.aspx?id=<%= ad.GetValue(0).ToString() %>">
                                <img src="<%= (ad.GetValue(12).ToString()) %>" alt="" style="width: 350px; height: 230px;"></a>
                        </div>
                        <div class="property_content">
                            <div class="main_pro">
                                <h3>
                                    <a href="PropertyDetails.aspx?id=<%= ad.GetValue(0).ToString() %>">
                                        <%= ad.GetValue(1).ToString() %></a></h3>
                                <div class="mark_pro">
                                    <img src="img/location.svg" alt="">
                                    <span>Popular Properties</span>
                                </div>
                                <span class="amount">Price.
                                    <%= ad.GetValue(11).ToString() %>/-</span>
                            </div>
                        </div>
                        <div class="footer_pro">
                            <ul>
                                <li>
                                    <div class="single_info_doc">
                                        <img src="img/svg_icon/square.svg" alt="">
                                        <span>
                                            <%= ad.GetValue(2).ToString() %>
                                            Sqft</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="single_info_doc">
                                        <img src="img/svg_icon/bed.svg" alt="">
                                        <span>
                                            <%= ad.GetValue(5).ToString() %>
                                            BHK</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="single_info_doc">
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="more_property_btn text-center">
                        <button class="boxed-btn3-line" onclick="getMoreProperties(); return false;">More Properties</button>
                        <script type="text/javascript">
                            function getMoreProperties() {
                                var count = document.getElementById("count").value;
                                document.getElementById("count").value = count + 6;
                                var req = new XMLHttpRequest();
                                req.open("get", "UserScripts/getProperty.aspx?count=" + count, true);
                                req.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        document.getElementById("MoreP").innerHTML += this.responseText;
                                    }
                                };
                                req.send();
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <div class="faq_ask">
                        <h3>Frequently ask</h3>
                        <div id="accordion">
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                            aria-expanded="false" aria-controls="collapseTwo">
                                            <p>
                                                Why Are You Selling?
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion"
                                    style="">
                                    <div class="card-body">
                                        <p>
                                            There are many reasons why people move, including job relocation, desire to get
                                            into a smaller/larger house, life events (marriage, the birth of a child, death
                                            of a spouse, or other reason), and retirement. While you may not always get a truthful
                                            answer, asking why the seller is moving can be helpful in determining how much room
                                            there is for negotiating.
                                        </p>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                            What Advantage Do You Offer Me That No Other Agent Can Offer?
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion"
                                    style="">
                                    <div class="card-body">
                                        <p>
                                            This is a narrative opportunity for an agent to sell himself. If he can't sell himself
                                            persuasively to you, don't expect he can sell real estate well. On the other hand,
                                            just because he talks smooth doesn't mean he will automatically satisfy all the
                                            other criteria. Be discerning. Be wise in your selection.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree"
                                            aria-expanded="false" aria-controls="collapseThree">
                                            Age Of Components?
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion"
                                    style="">
                                    <div class="card-body">
                                        <p>
                                            Ask about the age and condition of key components of the house so you are prepared
                                            for any big expenses you could be facing. Start with the roof: Newer ones may last
                                            anywhere from 15 to 50 years, depending on the roofing material. An asphalt roof
                                            lasts about 15 to 20 years, so if it’s already 15 years old, you might be looking
                                            at a fairly immediate large expense. Also ask about the heating and cooling systems,
                                            appliances, water heater, septic, plumbing, and electrical systems.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="js/jquery.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"
        type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src=" js/jquery-ui.min.js" type="afeb1211fab58d09c4107664-text/javascript"> </script>
    <script src="js/modernizr-3.5.0.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/popper.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/bootstrap.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/owl.carousel.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/isotope.pkgd.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/ajax-form.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/waypoints.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.counterup.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/imagesloaded.pkgd.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/scrollIt.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.scrollUp.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/wow.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/nice-select.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.slicknav.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.magnific-popup.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/plugins.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/slick.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/contact.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.ajaxchimp.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.form.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/mail-script.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script src="js/main.js" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script type="afeb1211fab58d09c4107664-text/javascript">
        function collision($div1, $div2) {
            var x1 = $div1.offset().left;
            var w1 = 40;
            var r1 = x1 + w1;
            var x2 = $div2.offset().left;
            var w2 = 40;
            var r2 = x2 + w2;

            if (r1 < x2 || x1 > r2)
                return false;
            return true;
        }
        // Fetch Url value
        var getQueryString = function (parameter) {
            var href = window.location.href;
            var reg = new RegExp('[?&]' + parameter + '=([^&#]*)', 'i');
            var string = reg.exec(href);
            return string ? string[1] : null;
        };
        // End url
        // // slider call
        $('#slider').slider({
            range: true,
            min: 20,
            max: 200,
            step: 1,
            values: [getQueryString('minval') ? getQueryString('minval') : 20, getQueryString('maxval') ?
                getQueryString('maxval') :200
            ],

            slide: function (event, ui) {

                $('.ui-slider-handle:eq(0) .price-range-min').html( ui.values[0] + 'K');
                $('.ui-slider-handle:eq(1) .price-range-max').html( ui.values[1] + 'K');
                $('.price-range-both').html('<i>K' + ui.values[0] + ' - </i>K' + ui.values[1]);

                // get values of min and max
                $("#minval").val(ui.values[0]);
                $("#maxval").val(ui.values[1]);

                if (ui.values[0] == ui.values[1]) {
                    $('.price-range-both i').css('display', 'none');
                } else {
                    $('.price-range-both i').css('display', 'inline');
                }

                if (collision($('.price-range-min'), $('.price-range-max')) == true) {
                    $('.price-range-min, .price-range-max').css('opacity', '0');
                    $('.price-range-both').css('display', 'block');
                } else {
                    $('.price-range-min, .price-range-max').css('opacity', '1');
                    $('.price-range-both').css('display', 'none');
                }

            }
        });

        $('.ui-slider-range').append('<span class="price-range-both value"><i>' + $('#slider').slider('values', 0) +
            ' - </i>' + $('#slider').slider('values', 1) + '</span>');

        $('.ui-slider-handle:eq(0)').append('<span class="price-range-min value">' + $('#slider').slider('values', 0) +
            'k</span>');

        $('.ui-slider-handle:eq(1)').append('<span class="price-range-max value">' + $('#slider').slider('values', 1) +
            'k</span>');
    </script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="afeb1211fab58d09c4107664-text/javascript"></script>
    <script type="afeb1211fab58d09c4107664-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
    </script>
    <script src="js/rocket-loader.min.js" data-cf-settings="afeb1211fab58d09c4107664-|49"
        defer=""></script>
    <script type="text/javascript">
        function FindBunglow() {
            var req = new XMLHttpRequest();
            req.onreadystatechange = function () {
                document.getElementById("prop").innerHTML = this.responseText;

            };
            req.open("get", "bunglow.aspx", true);
            req.send();
        }
    </script>
    <script type="text/javascript">
        function FindFlat() {
            var req = new XMLHttpRequest();
            req.onreadystatechange = function () {
                document.getElementById("prop").innerHTML = this.responseText;

            };
            req.open("get", "Flat.aspx", true);
            req.send();
        }
    </script>
    <script type="text/javascript">
        function FindPlot() {
            var req = new XMLHttpRequest();
            req.onreadystatechange = function () {
                document.getElementById("prop").innerHTML = this.responseText;

            };
            req.open("get", "Plot.aspx", true);
            req.send();
        }
    </script>
</body>
</html>
