﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/ClientPanel.master" AutoEventWireup="true" CodeFile="StateWiseHospitalList.aspx.cs" Inherits="ClientPanel_StateWiseHospitalList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="container" style="padding-top: 10px">
        <div class="row">
            <asp:Label ID="lblMsg" runat="server" CssClass="badge badge-danger m-3"></asp:Label>
        </div>
        <div class="main_title">
            <h2>State Wise Hospital</h2>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="list_home">
                    <div class="list_title">
                        <i class="icon_archive_alt"></i>
                        <h3>Search Hospital</h3>
                    </div>
                </div>
            </div>
            <asp:Repeater ID="rpHospitalListByStateName" runat="server">
                <ItemTemplate>
                    <div class="col-xl-4 col-lg-5 col-md-6">
                        <div class="list_home">
                            <ul>
                                <li>
                                    <asp:HyperLink runat="server" ID="hlState" NavigateUrl='<%# "~/ClientPanel/HospitalDetails/" + Eval("HospitalID") %>'>
                                        <strong><%#Eval("HospitalID")%></strong><%#Eval("HospitalName") + "(" + Eval("CityName") + ")" %>
                                    </asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

