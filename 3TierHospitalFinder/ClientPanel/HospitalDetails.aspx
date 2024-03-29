﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/ClientPanel.master" AutoEventWireup="true" CodeFile="HospitalDetails.aspx.cs" Inherits="ClientPanel_HospitalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    
    <style>
        #map {
            margin: 0;
            padding: 0;
            color: red;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <main>
        <div id="breadcrumb">
            <div class="container">
                <ul style="text-align: right">
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/ClientPanel/Default.aspx">Home</asp:HyperLink></li>
                    <li>HospitalDetails</li>
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
                                <li><a>General info</a></li>
                                <li></li>
                            </ul>
                        </div>
                    </nav>
                    <div id="section_1">
                        <div class="box_general_3">
                            <div class="profile">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <figure>
                                            <asp:Image ID="imgHospitalImage" runat="server" alt="" Style="width: 100%; height: 50%" />
                                        </figure>
                                    </div>
                                    <div class="col-md-6">
                                        <small>Primary care - Internist</small>
                                        <h1 id="txtHospitalName" runat="server"></h1>
                                        <span class="rating">
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star voted"></i>
                                            <i class="icon_star"></i>
                                            <small>(145)</small>
                                            <%--    <a href="badges.html" data-toggle="tooltip" data-placement="top" data-original-title="Badge Level" class="badge_list_1">
                                                <img src="img/badges/badge_1.svg" width="15" height="15" alt=""></a>--%>
                                        </span>
                                        <ul class="statistic">
                                            <li>854 Views</li>
                                            <li>124 Patients</li>
                                        </ul>
                                        <ul class="contacts">
                                            <li>
                                                <%--<iframe src="" id="ifmap"></iframe>--%>
                                            </li>
                                            <li>
                                                <h6>Address</h6>
                                                <span id="txtAddress" runat="server"></span>
                                                <%--<a href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x0:0xa6a9af76b1e2d899!2sAssistance+%E2%80%93+H%C3%B4pitaux+De+Paris!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361" target="_blank"><strong>View on map</strong></a>--%>
                                            </li>
                                            <li>
                                                <h6>EmergencyNumber : <a runat="server" id="txtEmergencyNumber" href="tel://"></a></h6>
                                            </li>
                                            <li>
                                                <h6>AmbulancePhoneNumber : <a runat="server" id="txtAmbulancePhoneNumber" href="tel://"></a></h6>
                                            </li>
                                            <li>
                                                <h6>MobileNumber : <a runat="server" id="txtMobileNumber" href="tel://"></a></h6>
                                            </li>
                                            <li>
                                                <h6>TelephoneNumber : <a runat="server" id="txtTelephoneNumber" href="tel://"></a></h6>
                                            </li>
                                            <li>
                                                <h6>EmailID : <a runat="server" id="txtEmailID" href="mailto://"></a></h6>
                                            </li>
                                            <li>
                                                <h6>Website : <a runat="server" id="txtWebsite" target="_blank"></a></h6>
                                            </li>
                                            <li>
                                                <h6>Fax : <a runat="server" id="txtFax" href="mailto://"></a></h6>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">

                                        <div id="map"></div>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-10"></div>
                                <div class="col-sm-2">
                                    <asp:HyperLink ID="hlhome" runat="server" Text="Back to Home" CssClass=" btn btn-primary" NavigateUrl="~/ClientPanel/Default.aspx"></asp:HyperLink>
                                </div>
                            </div>
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

    <script>
        var map = new MapmyIndia.Map("map", { center: [22.248282, 70.792237], zoomControl: true, hybrid: true });
        var myIcon = L.icon({
            iconUrl: '../../Default/ClientAssets/img/pin.png',

            iconSize: [35, 40],
            //iconAnchor: [22, 94],
            popupAnchor: [-3, -76],
            //shadowUrl: 'images.png',
            shadowSize: [68, 95],
            shadowAnchor: [22, 94]
        });

        L.marker([11.059821, 78.387451], { icon: myIcon }).addTo(map);
        L.marker([17.123184, 79.208824], { icon: myIcon }).addTo(map);
        L.marker([23.473324, 77.947998], { icon: myIcon }).addTo(map);
        L.marker([23.473324, 77.947998], { icon: myIcon }).addTo(map);
        L.marker([29.238478, 76.431885], { icon: myIcon }).addTo(map);
        L.marker([29.065773, 76.040497], { icon: myIcon }).addTo(map);
        L.marker([25.794033, 78.116531], { icon: myIcon }).addTo(map);
        L.marker([19.601194, 75.552979], { icon: myIcon }).addTo(map);
        L.marker([23.745127, 91.746826], { icon: myIcon }).addTo(map);
        L.marker([17.874857, 78.100815], { icon: myIcon }).addTo(map);
        L.marker([15.317277, 75.713890], { icon: myIcon }).addTo(map);
        L.marker([10.850516, 76.271080], { icon: myIcon }).addTo(map);
        L.marker([28.207609, 79.826660], { icon: myIcon }).addTo(map);
        L.marker([26.244156, 92.537842], { icon: myIcon }).addTo(map);
        L.marker([19.663280, 75.300293], { icon: myIcon }).addTo(map);
        L.marker([11.127123, 78.656891], { icon: myIcon }).addTo(map);
        L.marker([15.317277, 75.713890], { icon: myIcon }).addTo(map);
        L.marker([22.978624, 87.747803], { icon: myIcon }).addTo(map);
        L.marker([22.309425, 72.136230], { icon: myIcon }).addTo(map);
        L.marker([20.940920, 84.803467], { icon: myIcon }).addTo(map);
        L.marker([27.391277, 73.432617], { icon: myIcon }).addTo(map);
        L.marker([32.084206, 77.571167], { icon: myIcon }).addTo(map);
  //  L.marker().addTo(map);

    </script>

</asp:Content>

