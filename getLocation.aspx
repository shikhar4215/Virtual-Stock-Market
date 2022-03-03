<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getLocation.aspx.cs" Inherits="VSM.scripts.getLocation" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%
        string id = Request.QueryString["id"];
        string type = Request.QueryString["type"];
        string table = "";
        int index = -1;
        if (type.Equals("con"))
        {
            table = "Countries";
            index = 1;
        }
        else if (type.Equals("st"))
        {
            table = "Regions";
            index = 1;
        }
        else if (type.Equals("ci"))
        {
            table = "Cities";
            index = 2;
        }

        if (!table.Equals("") && index != -1)
        {
            connection con = new connection();
            try
            {
                string qs = "select * from " + table + " where Id=" + id;
                con.open();
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    Response.Write(dr.GetValue(index).ToString());
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
        }



%>
