using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace VSM.Class
{
    public class connection
    {
        public static readonly int Company = 0;
        public static readonly int user = 1;
        private String error = "";
        private string type;
        public SqlConnection Con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\VSM_Final\\VSM_Final\\App_Data\\Master.mdf;Integrated Security=True");
        private string id;

        public string Error { get => error; set => error = value; }
        public string Id { get => id; set => id = value; }
        public string Type { get => type; set => type = value; }

        public void open()
        {
            try
            {
                Con.Open();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
            }
        }

        public void close()
        {
            try
            {
                Con.Close();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
            }
        }

        public bool userExist(String mail, String password)
        {

            try
            {
                Con.Open();
                string query = "select * from UserMaster where Email like '" + mail + "' and Password like '" + Security.Hash(password) + "'";
                SqlCommand cmd = new SqlCommand(query, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    Id = dr.GetValue(0).ToString();
                    type = dr.GetValue(4).ToString();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                //HttpContext.Current.Response.Redirect("http://localhost:56268/error.aspx?e=" + ex.Message);
                HttpContext.Current.Response.Write(ex.StackTrace);
                return false;
            }
            finally
            {
                Con.Close();

            }
        }

        public bool CompanyExist(String mail, String pass)
        {
            try
            {
                Con.Open();
                String qs = "select CompanyId from Company where Email like '" + mail + "' and Password like '" + Security.Hash(pass) + "'";
                SqlCommand cmd = new SqlCommand(qs, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    Id = dr.GetValue(0).ToString(); ;
                    type = "Company";
                    dr.Close();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool ValidEmail(String mail)
        {
            try
            {
                Con.Open();
                string qs = "Select * from UserMaster where Email='" + mail + "'";
                if (new SqlCommand(qs, Con).ExecuteReader().HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool updatePassword(string mail, string Password)
        {
            try
            {
                Con.Open();
                string qs = "update UserMaster set Password='" + Security.Hash(Password) + "' where Email='" + mail + "'";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool AddUser(String fname, String mname, String lname, String mail, String pass, String dob, String phno, String gender, String address, String city, String state, String country, String pincode, String filename, String log, String let)
        {

            try
            {
                Con.Open();
                string qs = "select * from UserMaster order by UserId desc";
                int count = 0;
                SqlCommand cmd = new SqlCommand(qs, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0);
                    count++;
                }
                dr.Close();

                qs = "insert into UserMaster(UserId, FirstName, MiddleName, LastName, Type, Email, Password, BirthDate, PhoneNumber, Gender, Address, CityId, StateId, CountryId, Pincode, Image,latitude,longitude) Values(" + count + ", '" + fname + "', '" + mname + "','" + lname + "', 'user', '" + mail + "' ,'" + Security.Hash(pass) + "', '" + dob + "', '" + Convert.ToInt64(phno) + "', '" + gender + "', '" + address + "', '" + city + "', '" + state + "', '" + country + "', '" + pincode + "', '" + filename + "','" + Convert.ToDouble(let) + "','" + Convert.ToDouble(log) + "')";
                SqlCommand cmd1 = new SqlCommand(qs, Con);
                int change = cmd1.ExecuteNonQuery();
                if (change > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://localhost:56268/error.aspx?e=" + ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool addCompany(String name, String contact, String Person, String mail, String Password, String gst, String cin, String regdate, String add, String city, String state, String Country, String Pincode, String sector, String imgpath, String log, String let)
        {
            try
            {
                Con.Open();
                String qs = "select count(*) from Company";
                SqlCommand cmd = new SqlCommand(qs, Con);
                String count = cmd.ExecuteScalar().ToString();
                qs = "insert into Company(CompanyId, Name, Contact, ContactPerson, Email, Password,Image, GSTno, CIN, RegistrationDate, Address, CityId, StateId, CountryId, Pincode, SectorId,longitude,latitude) values('" + count + "', '" + name + "', '" + contact + "', '" + Person + "', '" + mail + "', '" + Security.Hash(Password) + "','" + imgpath + "' ,'" + gst + "', '" + cin + "', '" + regdate + "', '" + add + "', '" + city + "', '" + state + "', '" + Country + "', '" + Pincode + "', '" + sector + "','" + Convert.ToDouble(log) + "','" + Convert.ToDouble(let) + "')";
                cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool addShare(string cid, string symbol, string volume, string div)
        {
            try
            {
                int count = 0;
                Con.Open();
                string qs = "select ShareId from Share order by ShareId desc";
                SqlCommand cmd = new SqlCommand(qs, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0) + 1;
                }
                dr.Close();
                cmd.CommandText = "insert into Share(ShareId, CompanyId, Symbol, Volume, DividendType, OutStandin) Values('" + count + "', '" + cid + "', '" + symbol + "', '" + volume + "', '" + div + "', '" + volume + "')";
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool addSector(string Name)
        {
            try
            {
                int count = 0;
                Con.Open();
                string qs = "select ShareId from Sector order by SectorId desc";
                SqlCommand cmd = new SqlCommand(qs, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0) + 1;
                }
                dr.Close();
                cmd.CommandText = "insert into Sector Values('" + count + "', '" + Name + "')";
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool deleteUser(String id)
        {
            try
            {
                Con.Open();
                String qs = "delete from UserMaster where UserId='" + id + "'";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;

            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool deleteSector(String id)
        {
            try
            {
                Con.Open();
                String qs = "delete from Sector where SectorId='" + id + "'";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool deleteCompany(String id)
        {
            try
            {
                Con.Open();
                String qs = "delete from Company where CompanyId=" + id + "";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;

            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://localhost/error.aspx?e=" + ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool blockUser(String id, int type)
        {
            String table = "", field = "";
            String check = "";
            try
            {
                Con.Open();
                if (type == Company)
                {
                    table = "Company";
                    field = "CompanyId";
                }
                else if (type == user)
                {
                    table = "UserMaster";
                    check = " and Type not like 'admin'";
                    field = "UserId";
                }
                else
                {
                    throw new Exception("Invalid Input type");
                }
                String qs = "update " + table + " set Deleted=1 where " + field + "='" + id + "'" + check;
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://localhost:58381/Error.aspx?e=" + ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool verifyComapny(String id)
        {
            try
            {
                Con.Open();
                string qs = "update Company set Verified=1 where CompanyId=" + id;
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public Share[] search(String SearchString)
        {
            try
            {
                Con.Open();
                String qs = "select * from Share where Symbol like '%" + SearchString + "%'";
                SqlDataReader dr = new SqlCommand(qs, Con).ExecuteReader();
                Share[] s = Share.fromDataReader(dr);
                return s;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect(ex.Message);
                return null;
            }
            finally
            {
                Con.Close();
            }
        }

        public Tables query(String queryString)
        {
            try
            {
                Con.Open();
                SqlCommand cmd = new SqlCommand(queryString, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                Tables t = new Tables(dr, queryString);
                return t;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect(ex.Message);
                return null;
            }
            finally
            {
                Con.Close();
            }
        }
        public static SqlDataReader clone(SqlDataReader dr)
        {
            SqlDataReader ret = dr;
            return ret;
        }

        public bool DeleteAd(int id)
        {
            try
            {
                Con.Open();
                string qs = "delete from Advertisement where Id=" + id + "";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public string getSector(string id)
        {
            connection con = new connection();
            try
            {
                con.open();
                string qs = "select * from Sector where SectorId=" + id;
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader dr = cmd.ExecuteReader();
                string name = "";
                if (dr.HasRows)
                {
                    dr.Read();
                    name = dr.GetValue(1).ToString();
                }
                return name;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return null;
            }
            finally
            {
                con.close();
            }
        }

        public string GetLocation(string id, string type)
        {
            string table = "";
            int index = -1;
            if (type.Equals("con"))
            {
                table = "Countries";
                index = 1;
            }
            else if (type.Equals("st"))
            {
                table = "Regions";
                index = 1;
            }
            else if (type.Equals("ci"))
            {
                table = "Cities";
                index = 2;
            }

            if (!table.Equals("") && index != -1)
            {
                connection con = new connection();
                try
                {
                    string qs = "select * from " + table + " where Id=" + id;
                    con.open();
                    SqlCommand cmd = new SqlCommand(qs, con.Con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        return (dr.GetValue(index).ToString());
                    }
                }
                catch (Exception ex)
                {
                    return (ex.Message);
                }
                finally
                {
                    con.close();
                }
            }
            return null;
        }

        public bool removeCartItem(string id)
        {
            try
            {
                Con.Open();
                string qs = "delete from cart where CartId=" + id;
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool submitFeedback(string data)
        {
            try
            {
                Con.Open();
                SqlDataReader dr = new SqlCommand("select * from FEEDBACK order by FeedbackId desc", Con).ExecuteReader();
                int count = 0;
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0) + 1;
                }
                dr.Close();
                string id = "";
                if (HttpContext.Current.Session["type"].ToString() == "Company")
                {
                    id = HttpContext.Current.Session["CompanyId"].ToString();
                }
                else
                {
                    id = HttpContext.Current.Session["UserId"].ToString();
                }
                string qs = "insert into FeedBack values('" + count + "', '" + id + "', '" + data + "', '', '" + HttpContext.Current.Session["type"].ToString() + "')";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("<script> alert('" + ex.Message + "'); </script>");
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool submitNotice(string type, string Subject, string content, string date, string time)
        {
            try
            {
                Con.Open();
                SqlDataReader dr = new SqlCommand("select * from Notice order by Id desc", Con).ExecuteReader();
                int count = 0;
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0) + 1;
                }
                dr.Close();
                string qs = "insert into Notice(Id, CompanyId, Subject, Type, Content, Date, Time) values('" + count + "', '" + HttpContext.Current.Session["CompanyId"] + "', '" + Subject + "', '" + type + "', '" + content + "', '" + date + "', '" + time + "')";
                SqlCommand cmd = new SqlCommand(qs, Con);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("<script> alert('" + ex.Message + "'); </script>");
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool outstandingShare(string id, string qty)
        {
            string qs = "select * from Share where ShareId=" + id + " and OutStanding>=" + qty;
            try
            {
                Con.Open();
                SqlCommand cmd = new SqlCommand(qs, Con);
                if (cmd.ExecuteReader().HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public SqlDataReader findSellOrder(string id, string qty)
        {
            try
            {
                Con.Open();
                string qs = "select u.FirstName, u.LastName, s.Volume, s.Price from SellOrders as s, UserMaster as u where Volume>=" + qty + " and ShareId=" + id + " and u.UserId=s.UserId";
                SqlCommand cmd = new SqlCommand(qs, Con);
                return cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://localhost:56268/error.aspx?e=" + ex.Message);
                return null;
            }
            finally
            {
                Con.Close();
            }

        }

        public bool submitBuyOrder(string id, string qty)
        {
            try
            {
                Con.Open();
                int count = 0;
                string qs = "select * from BuyOrder order by BuyOrderId desc";
                SqlCommand cmd = new SqlCommand(qs, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0) + 1;
                }
                dr.Close();
                qs = "insert into BuyOrder(BuyOrderId, UserId, ShareId, Volume) values(" + count + ", " + HttpContext.Current.Session["UserId"] + ", " + id + ", " + qty + ")";
                cmd.CommandText = qs;
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

        public bool submitSellOrder(string sid, string uid, string qty, string price)
        {
            try
            {
                Con.Open();
                int count = 0;
                string qs = "select * from SellOrders order by SellOrderId desc";
                SqlCommand cmd = new SqlCommand(qs, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    count = dr.GetInt32(0);
                }
                dr.Close();
                qs = "insert into SellOrders(SellOrderId, UserId, ShareId, Volume, price) values('" + count + "', '" + uid + "', '" + sid + "', '" + qty + "', '" + price + "')";
                cmd.CommandText = qs;
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("http://localhost:56268/error.aspx?e=" + ex.Message);
                return false;
            }
            finally
            {
                Con.Close();
            }
        }

    }
}
