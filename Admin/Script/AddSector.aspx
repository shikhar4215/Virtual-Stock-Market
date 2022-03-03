<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSector.aspx.cs" Inherits="VSM_Final.Admin.Script.AddSector" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%

    string name = Request.QueryString["name"];
    connection con = new connection();
    try
    {
        int count = 0;
        con.open();
        string qs = "select SectorId from Sector order by SectorId desc";
        SqlCommand cmd = new SqlCommand(qs, con.Con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            count = dr.GetInt32(0) + 1;
        }
        dr.Close();
        cmd.CommandText = "insert into Sector Values('" + count + "', '" + name + "')";
        cmd.ExecuteNonQuery();
    }
    catch (Exception ex)
    {
        HttpContext.Current.Response.Write(ex.Message);
    }
    finally
    {
        con.close();
    }

%>