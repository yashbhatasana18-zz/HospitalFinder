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
                <asp:Panel ID="pnlSearch" runat="server" Visible="false">
                    <div class="col-md-12 m-3">
                        <div class="form-group row d-flex">
                            <asp:Label ID="lblSearch" runat="server" Text="Search :" CssClass="col-md-1 font-weight-bold col-form-label p-2 ml-auto"></asp:Label>
                            <asp:TextBox runat="server" ID="txtSearch1" CssClass="col-md-2 form-control" placeholder="---Enter Name---" onkeyup="SearchFunction()"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3">
                        <div style="overflow-x: auto;">
                            <table class="table table-hover" id="tbState">
                                <thead style="background-color: #ffccff;">
                                    <tr>
                                        <th>
                                            <asp:Label ID="lbhSrNo" runat="server" Text="SrNo"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lbhHospitalName" runat="server" Text="Hospital"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lbhCityNamee" runat="server" Text="City"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lblCategoryName" runat="server" Text="Category"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lblCategoryType" runat="server" Text="CategoryType"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lbhEdit" runat="server" Text="Details"></asp:Label>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptHospitalList" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("SrNo") %></td>
                                                <td><%#Eval("HospitalName") %></td>
                                                <td><%#Eval("CityName") %></td>
                                                <td><%#Eval("CategoryName") %></td>
                                                <td><%#Eval("CategoryType") %></td>
                                                <td>
                                                    <asp:HyperLink ID="hlShow" runat="server" Text="Show Details" CssClass="btn btn-outline-warning ml-3" NavigateUrl='<%# "~/ClientPanel/HospitalDetails/" + Eval("HospitalID") %>'>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
            let mytable = document.getElementById('tbState');
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

