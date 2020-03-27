<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/ClientPanel.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ClientPanel_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <main>
        <asp:ScriptManager ID="sm" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <div class="hero_home version_1">
                    <div class="content">
                        <h3>Find a Hospital!</h3>
                        <asp:Label ID="lblMsg" runat="server" CssClass="badge badge-danger m-3"></asp:Label>
                        <div id="custom-search-input">
                            <div class="input-group">
                                <asp:TextBox ID="txtsearch" runat="server" CssClass="search-query" placeholder="Search Hospital"></asp:TextBox>
                                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn_search" ValidationGroup="Search" OnClick="btnSearch_Click" />
                            </div>
                            <ul>
                                <li class="col-md-5">
                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                                </li>
                                <li class="col-md-5">
                                    <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li class="col-md-5">
                                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                </li>
                                <li class="col-md-5">
                                    <asp:DropDownList ID="ddlCategoryType" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <br />



                <asp:Panel ID="pnlSearch" runat="server" Visible="false">
                    <%--<div class="container">
                        <div class="form-group row">
                            <asp:Label ID="Label1" runat="server" Text="Search :" CssClass="col-md-1 font-weight-bold col-form-label p-2 ml-auto"></asp:Label>
                            <asp:TextBox runat="server" ID="TextBox1" CssClass="col-md-2 form-control" placeholder="---Enter Name---" onkeyup="SearchFunction()"></asp:TextBox>
                        </div>
                        <div class="row">--%>
                    
                            <asp:Repeater ID="rptHospitalList" runat="server">
                                <ItemTemplate>
                                    <div class="card card-primary col-md-3">
                                        <div class="col-md-12">
                                            <asp:Image runat="server" ID="Image1" ImageUrl='<%#Eval("HospitalImage") %>' alt="Lights" CssClass="img img-responsive"/> 
                                            <div class=""><%#Eval("HospitalName") %></div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-4">
                                                <h3><%#Eval("CityName") %></h3>
                                                  </div>
                                            <div class="col-md-4">
                                                <h3><%#Eval("CategoryName") %></h3>
                                            </div>
                                            <div class="col-md-4">
                                                <h3><%#Eval("CategoryType") %></h3>
                                            </div>
                                        </div>
                                    </div>

                                    <%--<div class="col-lg-4 col-md-6">
                                        <a href="<%# "/ClientPanel/HospitalDetails/" + Eval("HospitalID") %>" class="box_cat_home">
                                            <img src="img/icon_cat_1.svg" width="60" height="60" alt="">
                                            <h3><%#Eval("HospitalName") %></h3>
                                            <ul class="clearfix">
                                                <li><strong><%#Eval("CityName") %></strong></li>
                                                <li><strong><%#Eval("CategoryName") %></strong></li>
                                            </ul>
                                        </a>
                                    </div>--%>
                                </ItemTemplate>
                            </asp:Repeater>
                        
                     <%--   </div>
                    </div>--%>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
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
    <script type="text/javascript">
        const SearchFunction = () => {
            let myinput = document.getElementById('cphContent_txtSearch1').value.toUpperCase();
            let mytable = document.getElementById('rptHospitalList');
            let tr = mytable.getElementsByTagName('tr');

            for (i = 0; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName('td')[1];
                if (td) {
                    let textvalue = td.textContent || td.innerHTML;
                    if (textvalue.toUpperCase().indexOf(myinput) > -1) {
                        tr[i].style.display = "";
                    }
                    else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</asp:Content>

