using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;

namespace VSM_Final
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void regComapny_Click(object sender, EventArgs e)
        {

            string name = txtCompanyName.Text;
            string contact = txtContact.Text;
            string person = txtContactPerson.Text;
            string mail = txtEmail.Text;
            string password = CPassword.Text;
            string gst = GstNo.Text;
            string cin = CIN.Text;
            string regDate = RegDate.Text;
            string address = Address.Text;
            string city = Request["dropCity"];
            string state = Request["dropState"];
            string country = Request["dropcon"];
            string pincode = Pincode.Text;
            string sector = Request["dropSector"]; //dropSector.SelectedIndex.ToString();
            string log = Request["lg"];
            string let = Request["lt"];
            String imgpath = IO.UploadImage(FileUpload1);
            bool flag = con.addCompany(name, contact, person, mail, password, gst, cin, regDate, address, city, state, country, pincode, sector, imgpath, let, log);
            if (flag)
            {
                Response.Redirect("Login.aspx");
            }


        }
        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }
    }
}