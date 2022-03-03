<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fail.aspx.cs" Inherits="VSM_Final.Company.Fail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
            
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container mt-5">
                <center>
                    <i class="fa fa-exclamation fa-5x text-danger mt-5"></i></center>
                <center>
                    <h3 class="text-danger">Payment Has Been faild</h3>
                    <a href="http://localhost:58381/Home.aspx" class="btn btn-success mt-3">Back To Home</a>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
