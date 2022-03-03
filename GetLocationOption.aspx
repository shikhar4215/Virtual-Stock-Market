<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetLocationOption.aspx.cs" Inherits="VSM.Script.GetLocationOption" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    connection con = new connection();
    try
    {
        con.open();
        string id = Request["id"];
        string type = Request["type"];
        string table = "", field = "";
        int idcol = 0, name = 0;
        if (type == "con")
        {
            table = "Regions";
            idcol = 0;
            name = 1;
            field = "CountryId";
        }
        else
        {
            table = "Cities";
            idcol = 0;
            name = 2;
            field = "RegionId";
        }

        String qs = "select * from " + table + " where " + field + "=" + id;
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();

        string response = "";

        response += "<option value=\"0\"> ---select--- </option>";


        if (dr.HasRows)
        {
            while (dr.Read())
            {


                response += "<option value=\"" + (dr.GetValue(idcol).ToString()) + "\"> " + (dr.GetValue(name).ToString()) + " </option>";


            }
        }


        Response.Write(response);
    }
    catch (Exception ex)
    {
        Response.Redirect("../error.aspx?e=" + ex.Message);
    }
    finally
    {
        con.close();
    }

%>