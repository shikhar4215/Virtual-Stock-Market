using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using VSM.Class;

namespace VSM_Final.Company
{
    public partial class Profile : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

            
            //try
            //{
            //    con.open();
            //    string qs = "select * from Company where CompanyId=" + Session["CompanyId"];
            //    SqlCommand cmd = new SqlCommand(qs, con.Con);
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.HasRows)
            //    {
            //        dr.Read();
            //        lblName.Text = dr.GetValue(1).ToString();
            //        lblContact.Text = dr.GetValue(2).ToString();
            //        lblPerson.Text = dr.GetValue(3).ToString();
            //        lblMail.Text = dr.GetValue(4).ToString();
            //        imgProfile.ImageUrl = dr.GetValue(6).ToString();
            //        lblGst.Text = dr.GetValue(7).ToString();
            //        lblCIN.Text = dr.GetValue(8).ToString();
            //        lblRegDt.Text = dr.GetValue(9).ToString();
            //        lblAdd.Text = dr.GetValue(10).ToString();
            //        string city = dr.GetValue(11).ToString(); ;
            //        string state = dr.GetValue(12).ToString();
            //        string country = dr.GetValue(13).ToString();
            //        lblPincode.Text = dr.GetValue(14).ToString();
            //        lblMarkCap.Text = dr.GetValue(16).ToString();
            //        string sector = dr.GetValue(15).ToString();
            //        dr.Close();
            //        con.close();
            //        lblCity.Text = con.GetLocation(city, "ci");
            //        lblState.Text = con.GetLocation(state, "st");
            //        lblCountry.Text = con.GetLocation(country, "con");
            //        lblSec2.Text = con.getSector(sector);
            //    }
            //    else
            //    {
            //        Response.Redirect("../Error.aspxe=?User%20Not%20Found.");
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}
            //finally
            //{
            //    con.close();
            //}
        }
    }
}