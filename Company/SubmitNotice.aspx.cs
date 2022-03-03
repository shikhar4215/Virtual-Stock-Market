using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;

namespace VSM_Final.Company
{
    public partial class SubmitNotice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnSumbit_Click(object sender, EventArgs e)
        {
            connection con = new connection();
            try
            {
                con.submitNotice(ddlType.SelectedValue, txtSubject.Text, txtContent.Text, Convert.ToDateTime(txtDate.Text).ToShortDateString(), (txtHour.Text + ":" + txtMin.Text + " " + ddlTime.SelectedValue));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br/>");
                Response.Write(ex.StackTrace + "<br/>");
            }
            finally
            {
                con.close();
            }
        }
    }
}