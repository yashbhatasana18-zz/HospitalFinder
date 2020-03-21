<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/ClientPanel.master" AutoEventWireup="true" CodeFile="HospitalDetails.aspx.cs" Inherits="ClientPanel_HospitalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <main>
        <div id="breadcrumb">
            <div class="container">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Category</a></li>
                    <li>Page active</li>
                </ul>
            </div>
        </div>
        <!-- /breadcrumb -->
        <div class="col-md-12">
            <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-success"></asp:Label>
        </div>
        <div class="container margin_60">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <nav id="secondary_nav">
                        <div class="container">
                            <ul class="clearfix">
                                <li><a href="#section_1" class="active">General info</a></li>
                                <li><a href="#section_2">Reviews</a></li>
                            </ul>
                        </div>
                    </nav>
                    <div id="section_1">
                        <div class="box_general_3">
                            <div class="profile">
                                <div class="row">
                                    <div class="col-lg-5 col-md-4">
                                        <figure>
                                            <img src="http://via.placeholder.com/565x565.jpg" alt="" class="img-fluid">
                                        </figure>
                                    </div>
                                    <div class="col-lg-7 col-md-8">
                                        <small>Primary care - Internist</small>
                                        <h1 id="txtHospitalName" runat="server"></h1>
                                        <span class="rating">
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star"></i>
                                            <small>(145)</small>
                                            <a href="badges.html" data-toggle="tooltip" data-placement="top" data-original-title="Badge Level" class="badge_list_1">
                                                <img src="img/badges/badge_1.svg" width="15" height="15" alt=""></a>
                                        </span>
                                        <ul class="statistic">
                                            <li>854 Views</li>
                                            <li>124 Patients</li>
                                        </ul>
                                        <ul class="contacts">
                                            <li>
                                                <h6>Address</h6>
                                                <span id="txtAddress" runat="server"></span>
                                                <%--<a href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x0:0xa6a9af76b1e2d899!2sAssistance+%E2%80%93+H%C3%B4pitaux+De+Paris!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361" target="_blank"><strong>View on map</strong></a>--%>
                                            </li>
                                            <li>
                                                <h6>Phone</h6>
                                                <a runat="server" id="txtEmergencyNumber" href="tel://"></a>-
                                                <a runat="server" id="txtMobileNumber" href="tel://"></a>- 
                                                <a runat="server" id="txtTelephoneNumber" href="tel://"></a>-
                                                <a runat="server" id="txtAmbulancePhoneNumber" href="tel://"></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <!-- /profile -->
                            <div class="indent_title_in">
                                <i class="pe-7s-user"></i>
                                <h3>Professional statement</h3>
                                <p>Mussum ipsum cacilds, vidis litro abertis.</p>
                            </div>
                            <div class="wrapper_indent">
                                <p>Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Nullam mollis. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapi.</p>
                                <h6>Specializations</h6>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <ul class="bullets">
                                            <li>Abdominal Radiology</li>
                                            <li>Addiction Psychiatry</li>
                                            <li>Adolescent Medicine</li>
                                            <li>Cardiothoracic Radiology </li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="bullets">
                                            <li>Abdominal Radiology</li>
                                            <li>Addiction Psychiatry</li>
                                            <li>Adolescent Medicine</li>
                                            <li>Cardiothoracic Radiology </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /row-->
                            </div>
                            <!-- /wrapper indent -->
                        </div>
                        <!-- /section_1 -->
                    </div>
                    <!-- /box_general -->
                </div>
                <!-- /col -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </main>
    <!-- /main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

