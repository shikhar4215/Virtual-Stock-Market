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
    public partial class ChangePassword : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            if (txtPass.Text == txtConPass.Text)
            {
                try
                {
                    con.open();
                    string mail = Request.QueryString["mail"];
                    SqlCommand cmd = new SqlCommand("", con.Con);
                    cmd.CommandText = "update UserMaster set Password='" + Security.Hash(txtPass.Text) + "' where Email='"+ mail + "'";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
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
            else
            {
                Response.Write("<script> alert('Password and Confirm Password Do not Match'); </script>");
            }

        }
    }
}