<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="LoginRedirect.aspx.cs" Inherits="VSM_Final.LoginRedirect1" %>

<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        foreach (string key in Session.Keys)
        {
            Response.Write(key + ": " + Session[key]);
        }
    %>
    <script type="text/javascript">
        var change = "", changed_content = "";
        var type = "<%= (Session["type"].ToString()) %>";
        console.log(type);
        var trafic = null, json_string = "";
        var req = new XMLHttpRequest();
        var com = 0, use = 0, adm = 0;
        if (type == "company") {
            com = 1;
        }
        else {
            if (type == "user") {
                use = 1;
            }
            else {
                adm = 1;
            }
        }
    <%
        bool newFile = false;
        string filename = DateTime.Now.ToString("MM-dd-yyyy") + ".json";
        if (!File.Exists(Server.MapPath("Data/Trafic/" + filename)))
        {
            FileStream fs = File.Create(Server.MapPath("Data/Trafic/" + filename));
            fs.Close();
            newFile = true;
        }
        if (newFile)
        {
    %>
        trafic = {
            "date": new Date().toDateString(),
            "Trafic": [
                {
                    "Time": new Date().getHours(),
                    "count": 1,
                    "comapny": com,
                    "admin": adm,
                    "user": use
                }
            ]
        }
        req.open("post", "Script/UpdateTraficData.aspx", true);
        req.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
            <% Response.Redirect("http://localhost:58381/home.aspx");%>
            }
        }
        form = new FormData();
        form.append("data", JSON.stringify(trafic));
        req.send(form);
    <%
        }
        else
        {
    %>

        req.open("get", "http://localhost:58381/Data/Trafic/<%= (filename) %>", true);
        req.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                trafic = JSON.parse(this.responseText);
                last = trafic.Trafic[trafic.Trafic.length - 1].Time;
                if (last == new Date().getHours()) {
                    trafic.Trafic[trafic.Trafic.length - 1].count++;
                    trafic.Trafic[trafic.Trafic.length - 1].comapny += com;
                    trafic.Trafic[trafic.Trafic.length - 1].admin += adm;
                    trafic.Trafic[trafic.Trafic.length - 1].user += use;
                }
                else {
                    trafic.Trafic.push({
                        "Time": new Date().getHours(),
                        "count": 1,
                        "comapny": com,
                        "admin": adm,
                        "user": use
                    })
                }
                var req1 = new XMLHttpRequest();
                req1.open("post", "Script/UpdateTraficData.aspx", true);
                req1.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                    <% Response.Redirect("http://localhost:58381/home.aspx");%>
                    }
                }
                form = new FormData();
                form.append("data", JSON.stringify(trafic));
                req1.send(form);
            }
        }
        req.send();

    <%
        }
    %>
</script>
</asp:Content>
