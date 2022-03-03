using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.IO;

namespace VSM.Class
{
    public class IO
    {
        static string error;

        public string Error { get => error; set => error = value; }

        public static bool move(String source, String destination)
        {
            try
            {
                if (File.Exists(source))
                {
                    File.Copy(source, destination);
                    File.Delete(source);
                }
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }
        }

        public static bool copy(String source, String destination)
        {
            try
            {
                if (File.Exists(source))
                {
                    File.Copy(source, destination);
                }
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }
        }

        public static bool delete(String source)
        {
            try
            {
                if (File.Exists(source))
                {
                    File.Delete(source);
                }
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }
        }

        public static String[] getFolderNames(String Source)
        {
            try
            {
                String[] folders = Directory.GetDirectories("source");
                for (int i = 0; i < folders.Length; i++)
                {
                    String[] s = folders[i].Split('\\');
                    folders[i] = s[s.Length - 1];
                }
                return folders;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return null;
            }
        }

        public static String[] getFileNames(String Source)
        {
            try
            {
                String[] folders = Directory.GetFiles("source");
                for (int i = 0; i < folders.Length; i++)
                {
                    String[] s = folders[i].Split('\\');
                    folders[i] = s[s.Length - 1];
                }
                return folders;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return null;
            }
        }

        public static void download(String id)
        {
            string path = HttpContext.Current.Server.MapPath("../../Company/Documents/" + id + "/");
            string[] files = Directory.GetFiles(path);
            string source = files[files.Length - 1];
            try
            {
                if (File.Exists(source))
                {
                    HttpContext.Current.Response.ContentType = GetMimeType(source);
                    HttpContext.Current.Response.AppendHeader("Content - Disposition", "attachment; filename=" + files[files.Length - 1].Split('/')[files[files.Length - 1].Split('/').Length - 1]);
                    HttpContext.Current.Response.TransmitFile(HttpContext.Current.Server.MapPath(source));
                    HttpContext.Current.Response.Write("<script> alert(\"" + source + "\"); </script>");
                    HttpContext.Current.Response.End();

                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
            }
        }

        public static void UploadDocument(string id, FileUpload Docs)
        {
            string limit = "zip";
            try
            {
                string FileName = Docs.FileName;
                string type = FileName.Split('.')[FileName.Split('.').Length - 1];
                if (type.Equals(limit))
                {
                    if (!Directory.Exists("http://localhost:56268/Documents/" + id))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath("Documents/") + id);   //("http://localhost:56268/Documents/" + id);
                    }
                    string path = HttpContext.Current.Server.MapPath("Documents/" + id + "/") + Docs.FileName;
                    Docs.SaveAs(path);

                    HttpContext.Current.Response.Write("<script> alert('" + path + "') </script>");
                }
                else
                {
                    throw new Exception("Invalid File Type.");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("<script> alert(\"" + ex.Message + "\") </script>");
                HttpContext.Current.Response.Write("<script> alert(\"" + ex.StackTrace + "\") </script>");
            }
        }


        public static string UploadImage(FileUpload Docs)
        {
            string path = "";
            string op = "http://localhost:58381/profile/" + Docs.FileName;
            try
            {
                string FileName = Docs.FileName;
                string type = FileName.Split('.')[FileName.Split('.').Length - 1];
                if (Docs.HasFile)
                {
                    if (!Directory.Exists("/Profile/"))
                    {
                        Directory.CreateDirectory("/Profile/");
                    }
                    path = HttpContext.Current.Server.MapPath("/Profile" + "/") + Docs.FileName;
                    Docs.SaveAs(path);
                }
                return op;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect(ex.Message);
                return null;
            }
        }



        public static bool Upload(FileUpload docs, String limit = null)
        {
            if (docs.HasFile)
            {
                try
                {
                    String[] file = docs.FileName.Split('.');
                    string filetype = file[file.Length - 1];
                    if (limit != null && file[file.Length - 1] != limit)
                    {
                        HttpContext.Current.Response.Write("<script>alert(\"Only file with Extension" + limit + " allowed\");</script>");
                        return false;
                    }
                    else
                    {
                        String[] doc = Directory.GetFiles(HttpContext.Current.Server.MapPath("../Files/"), HttpContext.Current.Session["id"] + "*");
                        docs.SaveAs(HttpContext.Current.Server.MapPath("../Files/") + HttpContext.Current.Session["id"] + "Document" + doc.Length + 1 + "." + filetype);
                        return true;
                    }
                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write(ex.Message);
                    return false;
                }
            }
            else
            {
                HttpContext.Current.Response.Write("<script>alert(\"Please Select a Document\");</script>");
                return false;
            }
        }
        public static string Upload(string id, string path, FileUpload docs)
        {
            string[] file = docs.FileName.Split('.');
            try
            {
                if (docs.HasFile)
                {
                    String[] doc = Directory.GetFiles(HttpContext.Current.Server.MapPath("../advertisement/"), id + "*");
                    docs.SaveAs(HttpContext.Current.Server.MapPath("../Advertisement/") + id + (doc.Length + 1) + "." + file[file.Length - 1]);
                    return id + (doc.Length + 1) + "." + file[file.Length - 1];
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Redirect("../Error.aspx?e=" + ex.Message);
                return null;
            }
        }

        private static string GetMimeType(string fileName)
        {
            string mimeType = "application/unknown";
            string ext = Path.GetExtension(fileName).ToLower();
            Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);
            if (regKey != null && regKey.GetValue("Content Type") != null)
            {
                mimeType = regKey.GetValue("Content Type").ToString();
            }
            return mimeType;
        }

        public static string getType(FileUpload doc)
        {
            return doc.FileName.Split('.')[doc.FileName.Split('.').Length - 1];
        }

    }
}