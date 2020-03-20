<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/ClientPanel.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ClientPanel_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <main>
        <div class="hero_home version_1">
            <div class="content">
                <h3 class="fadeInUp animated">Find a Hospital!</h3>
                <p class="fadeInUp animated">
                    Ridiculus sociosqu cursus neque cursus curae ante scelerisque vehicula.
                </p>
                <div class="fadeInUp animated">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" class=" search-query" placeholder="Ex. Name, Specialization ....">
                            <input type="submit" class="btn_search" value="Search">
                        </div>
                        <ul>
                            <li>
                                <input type="radio" id="all" name="radio_search" value="all" checked="">
                                <label for="all">All</label>
                            </li>
                            <li>
                                <input type="radio" id="doctor" name="radio_search" value="doctor">
                                <label for="doctor">Hospital</label>
                            </li>
                            <li>
                                <input type="radio" id="clinic" name="radio_search" value="clinic">
                                <label for="clinic">Clinic</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

