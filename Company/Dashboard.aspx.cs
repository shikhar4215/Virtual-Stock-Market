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
    public partial class Dashboard : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] != null)
            {
                if (Session["type"].ToString() != "company")
                {
                    Response.Redirect("http://localhost:58381/login.aspx");
                }
            }
            try
            {
                con.open();
                string qs = "select ShareId from Share where CompanyId=" + Session["CompanyId"].ToString();
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    Session["ShareId"] = dr.GetValue(0).ToString();
                    dr.Close();
                    cmd.CommandText = "select c.Name, s.Symbol, sec.SectorName from Sector as sec, Share as s, Company as c where s.ShareId=" + Session["ShareId"].ToString() + " and c.CompanyId=s.CompanyId and sec.SectorId=c.SectorId";
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        lblComapny.Text = dr.GetValue(0).ToString();
                        lblName.Text = dr.GetValue(1).ToString();
                        lblId.Text = Session["ShareId"].ToString();
                        lblSector.Text = dr.GetValue(2).ToString();
                        lblSymbol.Text = dr.GetValue(1).ToString();
                    }
                }
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
    }
}