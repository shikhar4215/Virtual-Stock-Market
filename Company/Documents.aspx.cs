using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;
using System.Data.SqlClient;

namespace VSM_Final.Company
{
    public partial class Documents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void upload_Click(object sender, EventArgs e)
        {
            if (docs.HasFile)
            {
                IO.UploadDocument(Session["CompanyId"].ToString(), docs);
                //Update DocUpload to 1 in Company;

                connection con = new connection();
                try
                {
                    con.open();
                    string qs = "Update Company set DocUpload=1 where CompanyId=" + Session["CompanyId"].ToString();
                    SqlCommand cmd = new SqlCommand(qs, con.Con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("http://localhost:58381/Company/Payment.aspx");
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
}