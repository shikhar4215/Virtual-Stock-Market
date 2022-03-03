<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="VSM_Final.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VSM</title>
    <style type="text/css">
        .main-div {
            margin-bottom: 20%;
            margin-top: 10%;
            text-align: center;
        }

        /*.danger {
            animation-name: err;
            animation-duration: 1s;
            animation-timing-function: linear;
        }

        @keyframes err {
            0% {
                font-size: 0%;
            }
            100% {
                font-size: 100%;
            }
        }*/
    </style>
    <link href="bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/all.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid main-div text-danger">
                <i class="fa fa-exclamation-circle fa-9x mb-3 danger"></i>
                <h1 class="font-weight-bold">Opps! Something Went Wrong</h1>
                <small><a href="#" class="fa-2x">Go back to home page</a></small>
            </div>
        </div>
    </form>
</body>
</html>
