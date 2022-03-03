using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VSM.Class
{
    public class Share
    {
        private string symbol;
        private string id;
        private string cid;

        public string Id { get => id; set => id = value; }
        public string Cid { get => cid; set => cid = value; }
        public string Symbol { get => symbol; set => symbol = value; }

        public static Share[] fromDataReader(System.Data.SqlClient.SqlDataReader dr)
        {
            int count = 0;
            System.Data.SqlClient.SqlDataReader dr1 = dr;
            try
            {
                while (dr.Read())
                {
                    count++;
                }
                if (count > 0)
                {
                    Share[] Shares = new Share[count];
                    foreach (Share s in Shares)
                    {
                        dr1.Read();
                        s.Id = dr1.GetValue(0).ToString();
                        s.Cid = dr1.GetValue(1).ToString();
                        s.Symbol = dr1.GetValue(2).ToString();
                    }
                    return Shares;
                }
                return null;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect(ex.Message);
                return null;
            }
        }
        public static double calculatePrice(double x1, double y1, double x2, double y2, double x3, double y3, double x4, double y4
            )
        {
            double m1 = (y2 - y1) / (x2 - x1);
            double b1 = (m1 * x1) - y1;
            double m2 = (y4 - y3) / (x4 - x3);
            double b2 = (m2 * x4 - y4);
            double p = (b2 - b1) / (2 * (m1 - m2));
            return p;
        }
    }
}