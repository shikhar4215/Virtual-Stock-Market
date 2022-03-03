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
    public partial class VerifyOTP : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string mail = Request.QueryString["mail"];
            string otp = OTP.Text;
            try
            {
                con.open();
                SqlCommand cmd = new SqlCommand("", con.Con);
                cmd.CommandText = "Select * from FP_Token where Email='" + mail + "' and OTP=" + otp;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    string id = dr.GetValue(0).ToString();
                    dr.Close();
                    cmd.CommandText = "delete from FP_Token where id=" + id;
                    cmd.ExecuteNonQuery();
                    Response.Redirect("ChangePassword.aspx?mail=" + mail);
                }
                else
                {
                    Response.Write("<script> alert('Invalid OTP') </script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.close();
            }
        }
    }
}