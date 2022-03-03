using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;
using System.Data.SqlClient;

namespace VSM_Final
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            String ShareId = Request.QueryString["ID"];

            try
            {
                con.open();
                String qs = "select * from share where ShareId = " + ShareId + "";
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                String Symbol = dr.GetValue(2).ToString();
                String CompanyId = dr.GetValue(1).ToString();
                qs = "select * from Company where CompanyId='" + CompanyId + "'";
                dr.Close();
                cmd.CommandText = qs;
                SqlDataReader dr1 = cmd.ExecuteReader();
                dr1.Read();
                String CompanyName = dr1.GetValue(1).ToString();
                String contact = dr1.GetValue(2).ToString();
                String person = dr1.GetValue(3).ToString();
                String Email = dr1.GetValue(4).ToString();
                String Image = dr1.GetValue(6).ToString();
                String gst = dr1.GetValue(7).ToString();
                String cin = dr1.GetValue(8).ToString();
                String reg = dr1.GetValue(9).ToString();
                String add = dr1.GetValue(10).ToString();
                String sectorid = dr1.GetValue(15).ToString();
                String marketCap = dr1.GetValue(16).ToString();

                qs = "select * from Sector where SectorId = '" + sectorid + "'";
                cmd.CommandText = qs;
                dr1.Close();
                SqlDataReader dr2 = cmd.ExecuteReader();
                dr2.Read();
                String sector = dr2.GetValue(1).ToString();
                dr2.Close();

                lblName.Text = Symbol;
                lblId.Text = ShareId;
                lblSector.Text = sector;
                lblSymbol.Text = Symbol;
                lblComapny.Text = CompanyName;
                lblGst.Text = gst;
                lblRegDt.Text = reg;
                lblMarkCap.Text = marketCap;
                lblCIN.Text = cin;
                lblSec2.Text = sector;
                lblContact.Text = contact;
                lblPerson.Text = person;
                lblMail.Text = Email;
                lblAdd.Text = add;

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

        public bool checkCart(string shareid)
        {
            try
            {
                con.open();
                string qs = "select * from cart where ShareId=" + shareid + " and UserId=" + Session["UserId"];
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.close();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkCart(Request["id"]))
                {
                    con.open();
                    int count = 0;
                    string qs = "select CartId from Cart order by CartId desc";
                    SqlCommand cmd = new SqlCommand(qs, con.Con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        count = dr.GetInt32(0) + 1;
                    }

                    dr.Close();
                    cmd.CommandText = "insert into cart(CartId, UserID, ShareID) values('" + count + "', '" + Session["UserId"] + "', '" + Request.QueryString["id"] + "')";
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    throw new Exception("This Item is Already in Your Watch List");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
            finally
            {
                con.close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("http://localhost:58381/Trade/buy.aspx?id=" + Request.QueryString["id"]);
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }
        }
    }
}