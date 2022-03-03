using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VSM_Final
{
    public partial class Index : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://localhost:58381/Search/Search.aspx?s=" + txtSearch.Text);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Write("<script>alert('You have been loged out')</script>");
            Response.Redirect("Login.aspx?mode=logout");
        }
    }
}