<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="FeedbackManagement.aspx.cs" Inherits="VSM_Final.Admin.FeedbackManagement" %>

<%@ Import Namespace="VSM.Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        tr {
            cursor: pointer;
        }

            tr:hover {
                background: lightgrey;
            }

        .close {
            height: 25px;
            width: 25px;
            text-align: center;
            cursor: pointer;
        }

            .close:hover {
                background: lightgrey;
            }

        .my-btn {
            background: #F8F9FA;
            height: 25px;
            width: 25px;
        }

        .response{
            resize: none;
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Feedback Management</h1>
    </center>
   <center> <%
        Tables t = new connection().query("select FeedbackId, Feedback, Response, Type from FeedBack");
        t.print();
        string[] idarr = t.getColumnArray(0);
    %></center>
    <div id="main" class="container">
    </div>


    <script type="text/javascript" src="../bootstrap-4.4.1-dist/js/jquery.js"></script>
    <script type="text/javascript">

        index = -1;
        function displayData(i) {
            index = i;
            document.body.style.cursor = "progress";
            document.getElementById("main").innerHTML = "<div class='text-center'><i class='fas fa-circle-notch fa-spin fa-3x'></i></div>";
            var req = new XMLHttpRequest();
            req.open("get", "Script/getFeedback.aspx?id=" + i, true);
            req.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("main").innerHTML = this.responseText;
                }
            };
            req.send();
        }

        function submitResponse() {
            var response = document.getElementById("AdminResponse").value;
            if (response == "") {
                aler("No Response Provided");
            }
            else {
                var req = new XMLHttpRequest();
                req.open("post", "http://localhost:58381/Admin/Script/SubmitAdminResponse.aspx", true);

                req.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        alert(this.responseText);
                    }
                };

                var formdata = new FormData();
                formdata.append("Response", response);
                formdata.append("Id", index);
                req.send(formdata);
                
            }
        }

        <%
        foreach (String id in idarr)
        {
            %>$("#<%= (id) %>").click(function () { displayData(<%= (id) %>); });<%
        }
        %>
</script>
</asp:Content>
