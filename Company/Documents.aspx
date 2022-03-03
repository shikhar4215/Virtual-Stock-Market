<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="VSM_Final.Company.Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .k {
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow-lg w-50 p-5 border-success h-lg-5 mt-5" style="border-style: dotted;">
        <center>
            <i class="fa fa-upload fa-3x mt-5 text-success"></i>
            <br />
                <asp:FileUpload ID="docs" runat="server" required="true" class="ml-5 mt-2" /><br />
            <asp:Button ID="upload" runat="server" Text="Upload" OnClick="upload_Click" class="btn btn-success btn-lg mt-3" /> 
            <center><div class="mt-5">
                <table>
                    <tr><td>               <h1>All The Neccessary documents are here</h1></td>
 </tr>
                    <tr><td>1) Government Approved certificate</td></tr>
                    <tr><td>2)Registration details</td></tr>
                    <tr><td> 3)GSt Deatils</td></tr>
                    <tr><td>4)Bank Details</td></tr>
                
                </table>
                <p>Note:Please mearge all the document into zip file and then upload</p>
                    </div></center>
        </center>
    </div>
</asp:Content>
