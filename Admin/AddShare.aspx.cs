using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;

namespace VSM_Final.Admin
{
    public partial class AddShare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDiv.Items.Add("QUATERLY");
                DropDiv.Items.Add("HALF_YEARLY");
                DropDiv.Items.Add("YEARLY");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            connection con = new connection();
            try
            {
                con.open();
                string companyId = Request.QueryString["cid"];
                string symbol = txtSymbol.Text;
                string volume = txtVolume.Text;
                string div = DropDiv.SelectedValue;
                con.addShare(companyId, symbol, volume, div);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.close();
                Response.Redirect("Script/AddSharePrice.aspx?id=" + Request.QueryString["cid"] + "&price=" + txtPrice.Text);
            }
        }
    }
}