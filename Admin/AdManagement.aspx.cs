using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using VSM.Class;

namespace VSM_Final
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] != null)
            {
                if (Session["type"].ToString() != "admin")
                {
                    Response.Redirect("http://localhost:58381/login.aspx");
                }
            }
        }

        protected void btnPrimary_Click(object sender, EventArgs e)
        {
            try
            {
                int id = 0;
                con.open();
                string name = txtName.Text;
                string url = txtNavigateURL.Text;
                string impressions = txtImpressions.Text;
                string qs = "select * from Advertisement order by Id desc";
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    id = dr.GetInt32(0) + 1;

                }
                dr.Close();
                string FileName = IO.Upload(id.ToString(), "image", FileUpload1);
                qs = "insert into Advertisement(Id, Name, Image, Impressions, URL) values(" + id + ", '" + name + "', '../Advertisement/" + FileName + "', '" + impressions + "', '" + url + "')";
                cmd.CommandText = qs;
                cmd.ExecuteNonQuery();
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
    }
}