using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;


namespace VSM.Class
{
    public class Security
    {
        public static string Hash(String text)
        {
            using (MD5 en = MD5.Create())
            {
                StringBuilder sb = new StringBuilder();
                byte[] b = en.ComputeHash(Encoding.Unicode.GetBytes(text));
                foreach (byte a in b)
                {
                    sb.Append(a.ToString("X2"));
                }
                return sb.ToString();
            }
        }

        public static string generateRandom(int length)
        {
            string s = "";
            string comb = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
            Random r = new Random();
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < length; i++)
            {
                str.Append(comb[r.Next(comb.Length)]);
            }
            s = str.ToString();
            return s;
        }
    }
}