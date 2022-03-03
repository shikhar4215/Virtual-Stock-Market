using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VSM.Class;
using System.Net.Mail;
using System.Data.SqlClient;

namespace VSM_Final
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                bool ValidMail = con.ValidEmail(txtEmail.Text);
                if (ValidMail)
                {
                    Random r = new Random();
                    int otp = r.Next(1000, 9999);
                    string mail = "Otp For Password Change:<b>" + otp + "</b>";
                    SmtpClient FPMail = new SmtpClient("smtp.gmail.com", 587)
                    {
                        EnableSsl = true,
                        Credentials = new System.Net.NetworkCredential("shreypateliya@gmail.com", "36110000")
                    };
                    MailMessage message = new MailMessage(new MailAddress("shreypateliya@gmail.com"), new MailAddress(txtEmail.Text))
                    {
                        Subject = "Reset Password",
                        Body = mail,
                        IsBodyHtml = true
                    };

                    //add token to db
                    SqlCommand cmd = new SqlCommand("", con.Con);
                    cmd.CommandText = "insert into FP_Token values('" + txtEmail.Text + "','" + otp + "')";
                    con.open();
                    cmd.ExecuteNonQuery();
                    FPMail.Send(message);
                    Response.Redirect("VerifyOTP.aspx?mail=" + txtEmail.Text);
                }
                else
                {
                    lblMsg.Text = "Invalid Email";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
            finally
            {
                con.close();
            }
        }
    }
}