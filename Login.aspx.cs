using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;

namespace VSM_Final
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        bool flag = false, done=false;
        connection con = new connection();
        string type = "User";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["type"] != null)
            {
                type = "Company";
            }
        }

        protected void Log_Click(object sender, EventArgs e)
        {
            if (type == "User")
            {
                flag = con.userExist(LMail.Text, LPass.Text);
                if (flag)
                {
                    Session["UserId"] = con.Id;
                    Session["type"] = con.Type;
                    done = true;
                }
                else
                {
                    Label4.Text = "Email and Password Does not Match";
                }
            }
            else if (type == "Company")
            {
                flag = con.CompanyExist(LMail.Text, LPass.Text);
                if (flag)
                {
                    Session["CompanyId"] = con.Id;
                    Session["type"] = con.Type;
                    done = true;
                }
                else
                {
                    Label4.Text = "Email and Password Does not Match";
                }
            }
            else
            {
                Label4.Text = "Please select your account type";
            }
            if (flag)
            {
                Response.Redirect("LoginRedirect.aspx");
            }
        }
    }
}