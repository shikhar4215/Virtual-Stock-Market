using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VSM_Final.Company
{
    public partial class Fail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] != null)
            {
                if (Session["type"].ToString() != "company")
                {
                    Response.Redirect("http://localhost:58381/login.aspx");
                }
            }
        }
    }
}