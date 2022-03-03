using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;
using System.IO;

namespace VSM_Final
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("CompanyRegistration.aspx");
        }

        protected void RegUser_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string ext = Path.GetExtension(FileUpload1.FileName);
                if (ext == ".jpeg" || ext == ".png" || ext == ".jpg")
                {
                    string path = Server.MapPath("~/Profile/");
                    FileUpload1.SaveAs(path + FileUpload1.FileName);
                    string filename = path + FileUpload1.FileName;
                    string fname = FirstName.Text;
                    string mname = MiddleName.Text;
                    string lname = LastName.Text;
                    string mail = Email.Text;
                    string pass = Password.Text;
                    string dob = BirthDate.Text;
                    string phno = phone.Text;
                    string gender = "";
                    if (Male.Checked)
                    {
                        gender = "Male";
                    }
                    else if (Female.Checked)
                    {
                        gender = "Female";
                    }
                    else
                    {
                        gender = "Others";
                    }
                    string address = Address.Text;
                    string city = Request.Form["dropci"]; //dropci.SelectedIndex.ToString();
                    string state = Request.Form["dropst"];
                    string country = Request.Form["dropcon"];
                    string log = Request["lg"];
                    string let = Request["lt"];
                    string pin = txtpin.Text;
                    String imgpath = IO.UploadImage(FileUpload1);
                    bool flag = con.AddUser(fname, mname, lname, mail, pass, dob, phno, gender, address, city, state, country, pin, filename, let, log);
                    if (flag)
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {

                }
            }
        }
    }
}