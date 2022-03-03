<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trade.aspx.cs" Inherits="VSM_Final.Trade.Trade" %>

<%@ Import Namespace="VSM.Class" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    //get query strings:----------------------------------------------------------------------------------------------
    string type, shareid, qty, orderid = "";
    type = Request.QueryString["type"];
    shareid = Request.QueryString["shareid"];
    qty = Request.QueryString["qty"];
    string sellerid = "";
    string price = "";
    if (type != "out")
    {
        orderid = Request.QueryString["OrderId"];
    }
    bool done = true;
    //end get query strings----------------------------------------------------------------------------------------------


    //global variable declaration----------------------------------------------------------------------------------------------

    int outstanding;

    //end global variable declaration----------------------------------------------------------------------------------------------
    connection con = new connection();
    try
    {
        con.open();
        //bring transaction
        SqlCommand cmd = new SqlCommand("begin transaction", con.Con);
        SqlDataReader dr;
        cmd.ExecuteNonQuery();
        if (type == "out")
        {
            //trade from outstandin shares.
            //deduct from outstanding shares
            cmd.CommandText = "select OutStanding from share where Shareid=" + shareid;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                outstanding = dr.GetInt32(0) - Convert.ToInt32(qty);

                //update the record.
                dr.Close();
                cmd.CommandText = "update Share set OutStanding=" + outstanding + " where ShareId= " + shareid;
                cmd.ExecuteNonQuery();
            }
            else
            {
                dr.Close();
                throw new Exception("invalid Input");
            }
        }
        else
        {
            //trade from SellOrder id [orderid].
            //1. deduct from sellers holdin record.
            //1.1 get sellers userid from orderid
            cmd.CommandText = "select UserId,Volume,Price from SellOrders where SellOrderId=" + orderid;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                sellerid = dr.GetValue(0).ToString();
                int volume = dr.GetInt32(1);
                price = dr.GetValue(2).ToString();
                dr.Close();
                //1.2 deduct from holding of sellerId.
                cmd.CommandText = "select Volume from Holdings where UserId=" + sellerid + " and ShareID=" + shareid;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    int volumeh = dr.GetInt32(0) - Convert.ToInt32(qty);
                    dr.Close();
                    cmd.CommandText = "Update from Holding set Volume=" + volumeh + " where UserID=" + sellerid + " and ShareId=" + shareid;
                    cmd.ExecuteNonQuery();
                    //1.2 Deduct from  SellOrder Record;
                    if ((volume - Convert.ToInt32(qty)) > 0)
                    {
                        //update record
                        cmd.CommandText = "update from SellOrders set Volume=" + (volume - Convert.ToInt32(qty)) + " where SellOrderID=" + orderid;
                        cmd.ExecuteNonQuery();
                    }
                    if ((volume - Convert.ToInt32(qty)) == 0)
                    {
                        //delete record
                        cmd.CommandText = "delete from SellOrders where SellOrderID=" + orderid;
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        throw new Exception("Invalid Input");
                    }
                }
            }
            else
            {
                throw new Exception("Invalid Input");
            }

        }
        //add to users holding record if does not exists create a new record.
        cmd.CommandText = "select HoldingId ,Volume from Holding where UserId=" + Session["UserID"] + " and ShareId=" + shareid;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            //update record
            string id = dr.GetValue(0).ToString();
            int volume = dr.GetInt32(1) + Convert.ToInt32(qty);
            dr.Close();
            cmd.CommandText = "update from Holding set Volume=" + volume + " where HoldingId=" + id;
            cmd.ExecuteNonQuery();
        }
        else
        {
            //insert record
            dr.Close();
            int count = 0;
            cmd.CommandText = "select * from Holding order by HoldingId desc";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                count = dr.GetInt32(0);
            }
            dr.Close();
            cmd.CommandText = "insert into Holding(HoldinId, UserId, ShareId, Volume) values('" + count + "', '" + Session["UserId"] + "', '" + shareid + "', '" + qty + "')";
            cmd.ExecuteNonQuery();
        }

        //insert into trading table
        cmd.CommandText = "insert into Trading values('" + shareid + "', '" + sellerid + "', '" + Session["UserId"] + "', '"+ price +"', '" + qty + "', '" + DateTime.Now.ToShortDateString() + "', 0)";
        cmd.ExecuteNonQuery();

    }
    catch (Exception ex)
    {
        //maintains the automicity of transaction
        new SqlCommand("Rollback", con.Con).ExecuteNonQuery();
        Response.Write(ex.Message);
        Response.Write(ex.StackTrace);
        done = false;
    }
    finally
    {
        //marks a succesfull transaction
        if (done)
        {
            new SqlCommand("commit transaction", con.Con).ExecuteNonQuery();
        }
        con.close();
    }
%>
<div class="container mt-5">
    <center><a href="http://localhost:58381/Home.aspx" class="btn btn-success mt-3">Back To Home</a></center>
</div>