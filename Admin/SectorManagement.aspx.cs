using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VSM_Final.Admin
{
    public partial class SectorManagement : System.Web.UI.Page
    {
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
    }
}