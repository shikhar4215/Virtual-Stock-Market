using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace VSM.Class
{
    public class Tables
    {
        private int rows = 0;
        private int cols = 0;
        private string[,] data;
        private string qs = "";
        private string[] name;

        public int Rows { get => rows; set => rows = value; }
        public int Cols { get => cols; set => cols = value; }
        public string[,] Data { get => data; set => data = value; }
        public string Qs { get => qs; set => qs = value; }
        public string[] Name { get => name; set => name = value; }

        //creates a table object from a dataReader object
        public Tables(SqlDataReader result, String qs)
        {

            connection con = new connection();
            try
            {
                this.Qs = qs;
                Rows = getRowCount(result);
                Cols = result.FieldCount;
                Data = new string[Rows, Cols];
                Name = new string[cols];
                con.open();
                SqlCommand cmd = new SqlCommand(qs, con.Con);
                SqlDataReader result1 = cmd.ExecuteReader();

                for (int i = 0; i < Cols; i++)
                {
                    Name[i] = result1.GetName(i);
                }
                for (int i = 0; i < Rows; i++)
                {
                    result1.Read();
                    for (int j = 0; j < Cols; j++)
                    {
                        Data[i, j] = result1.GetValue(j).ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                HttpContext.Current.Response.Write(ex.StackTrace);
            }
            finally
            {
                con.close();
            }
        }

        private int getRowCount(SqlDataReader dr)
        {
            int count = 0;
            while (dr.Read())
            {
                count++;
            }
            return count;
        }

        //print the data in a tabular format
        public void print()
        {
            HttpContext.Current.Response.Write("<table align=\"center\" class='table w-50 shadow-lg p-3 mb-5 bg-light rounded'> <tr class='ml-5'>");

            for (int i = 0; i < cols; i++)
            {
                HttpContext.Current.Response.Write("<th> " + name[i] + " </th>");
            }

            HttpContext.Current.Response.Write("</tr>");

            for (int i = 0; i < Rows; i++)
            {
                string[] idarr = getColumnArray(0);
                HttpContext.Current.Response.Write("<tr class='r' id=" + idarr[i] + ">");
                for (int j = 0; j < Cols; j++)
                {
                    HttpContext.Current.Response.Write("<td> " + Data[i, j] + " </td>");
                }
                HttpContext.Current.Response.Write("</tr>");
            }
            HttpContext.Current.Response.Write("</table>");
        }

        //return a coulumn as an 1-d array
        public string[] getColumnArray(int index)
        {
            string[] ret = new string[Rows];
            for (int i = 0; i < Rows; i++)
            {
                ret[i] = Data[i, index];
            }
            return ret;
        }

        public string[] getRowArray(int index)
        {
            string[] ret = new string[Cols];
            for (int i = 0; i < Cols; i++)
            {
                ret[i] = Data[index, i];
            }
            return ret;
        }

        public void replaceRow(string[] row, int index)
        {
            for (int i = 0; i < Cols; i++)
            {
                Data[index, i] = row[i];
            }
        }

        //sort a array alphabetically
        public void sort(int index)
        {
            String[,] tempd = Data;
            for (int i = 0; i < Rows; i++)
            {
                for (int j = i; j < Rows; j++)
                {
                    if (compareString(Data[i, index], Data[j, index]) > 0)
                    {
                        string[] irow = getRowArray(i);
                        string[] jrow = getRowArray(j);
                        replaceRow(irow, j);
                        replaceRow(jrow, i);
                    }
                }
            }
        }

        public int compareString(String s1, String s2)
        {
            int diff = 0;
            char[] cs1 = s1.ToCharArray();
            char[] cs2 = s2.ToCharArray();
            int l = Math.Min(cs1.Length, cs2.Length);
            for (int i = 0; i < l; i++)
            {
                if (cs1[i] != cs2[i])
                {
                    if (cs1[i] < cs2[i])
                    {
                        diff = -1;
                    }
                    else
                    {
                        diff = 1;
                    }
                    break;
                }
            }
            return diff;
        }
    }
}