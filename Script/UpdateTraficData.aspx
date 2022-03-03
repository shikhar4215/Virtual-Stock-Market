<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateTraficData.aspx.cs" Inherits="VSM_Final.Script.UpdateTraficData" %>

<%@ import Namespace="System.IO" %>

<%

    string change = Request.Form[0];
    File.WriteAllText(Server.MapPath("../Data/Trafic/" + DateTime.Now.ToShortDateString() + ".json"),string.Empty);
    FileStream fs = new FileStream(Server.MapPath("../Data/Trafic/" + DateTime.Now.ToShortDateString() + ".json"), FileMode.OpenOrCreate);
    fs.Seek(0, 0);
    byte[] b = Encoding.ASCII.GetBytes(change);
    fs.Write(b, 0 , b.Length);
    fs.Close();
%>
