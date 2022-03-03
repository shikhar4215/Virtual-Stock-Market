<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="SubmitNotice.aspx.cs" Inherits="VSM_Final.Company.SubmitNotice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="row justify-content-around">
            <div class="col-6">
                <asp:DropDownList ID="ddlType" CssClass="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">---Select Event---</asp:ListItem>
                    <asp:ListItem Value="EVENT">Event</asp:ListItem>
                    <asp:ListItem Value="SHHMT">Share Holders Meeting</asp:ListItem>
                    <asp:ListItem Value="EVENT">Company Event</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <div class="container shadow-lg mt-5 p-5">
        <%
            
            if (ddlType.SelectedValue.Equals("EVENT"))
            {

            }
            else if (ddlType.SelectedValue.Equals("SHHMT"))
            {

            }
            else
            {

            }
        %>
        <div class="row">
            <div class="col">

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtSubject">Subject</label>
                            <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtContent">Content</label>
                            <asp:TextBox ID="txtContent" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <label>Date & Time</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtDate" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4">
                                <label>Hours</label>
                            </div>
                            <div class="col-4">
                                <label>Minutes</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtHour" CssClass="form-control" TextMode="number" runat="server" placeholer="Hours"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtMin" CssClass="form-control" TextMode="number" PalceHolder="Minutes" runat="server"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:DropDownList ID="ddlTime" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="AM">AM</asp:ListItem>
                                    <asp:ListItem Value="PM">PM</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col text-center mt-4">
                <asp:Button ID="btnSumbit" OnClick="btnSumbit_Click" runat="server" Text="Submit" CssClass="btn btn-success w-50" />
            </div>
        </div>
    </div>
</asp:Content>
