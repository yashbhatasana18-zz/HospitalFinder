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
        <div class="container margin_120_95">
            <div class="main_title">
                <h2>Find by specialization</h2>
                <p>Nec graeci sadipscing disputationi ne, mea ea nonumes percipitur. Nonumy ponderum oporteat cu mel, pro movet cetero at.</p>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_1.svg" width="60" height="60" alt="">
                        <h3>Primary Care</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_2.svg" width="60" height="60" alt="">
                        <h3>Cardiology</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_3.svg" width="60" height="60" alt="">
                        <h3>MRI Resonance</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_4.svg" width="60" height="60" alt="">
                        <h3>Blood test</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_7.svg" width="60" height="60" alt="">
                        <h3>Laboratory</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_5.svg" width="60" height="60" alt="">
                        <h3>Dentistry</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_6.svg" width="60" height="60" alt="">
                        <h3>X - Ray</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="#0" class="box_cat_home">
                        <i class="icon-info-4"></i>
                        <img src="img/icon_cat_8.svg" width="60" height="60" alt="">
                        <h3>Piscologist</h3>
                        <ul class="clearfix">
                            <li><strong>124</strong>Doctors</li>
                            <li><strong>60</strong>Clinics</li>
                        </ul>
                    </a>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

