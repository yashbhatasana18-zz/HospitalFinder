<%@ Page Title="" EnableTheming="true" Theme="Admin" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_HospitalAddEdit.aspx.cs" Inherits="AdminPanel_Master_MST_Hospital_MST_HospitalAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" runat="Server">
    Hospital
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadCrumb" runat="Server">
    <li>
        <i class="fa fa-home"></i>
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Default.aspx">Home</asp:HyperLink>
        <i class="fa fa-angle-right"></i>
    </li>
    <li>
        <a href="MST_HospitalList.aspx">Hospital</a>
        <i class="fa fa-angle-right"></i>
    </li>
    <li>HospitalAddEdit
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContent" runat="Server">

    <asp:Panel ID="pnlAlert" runat="server" Visible="false">
        <div class="alert alert-success alert-dismissable ">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
            <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
        </div>
    </asp:Panel>

    <div style="padding-right: 25px; float: right;">
        <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="javascript:history.go(-1)">
	        [ Back to page ]
        </asp:HyperLink>
    </div>

    <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <asp:Label SkinID="lblFormHeaderIcon" ID="lblFormHeaderIcon" runat="server"></asp:Label>
                <span class="caption-subject font-green-sharp bold uppercase">
                    <asp:Label runat="server" ID="lblPageHeader"></asp:Label>
                </span>
            </div>
        </div>

        <div class="portlet-body form">
            <div class="form-horizontal" role="form">
                <div class="form-body">

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Hospital Name  <span class="required">*</span>
                            </span>
                        </label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtHospitalName" type="text" class="form-control" placeholder="Enter Hospital Name" />
                            <asp:RequiredFieldValidator ID="rfvCityName" runat="server"
                                ControlToValidate="txtHospitalName" ErrorMessage="Enter City Name" Display="Dynamic"
                                SetFocusOnError="True" ValidationGroup="HospitalAddEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">

                            <span>Hospital Address<span class="required">*</span></span>
                        </label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter Hospital Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAdderss" runat="server" ErrorMessage="Enter Hospital Address" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="HospitalAddEdit" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Email Address<span class="required">*</span>
                            </span>
                        </label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailAddress" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="HospitalAddEdit" ErrorMessage="Enter Email Properly Ex : abc@gmail.com"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter Email" ValidationGroup="HospitalAddEdit"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Fax</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtFax" CssClass="form-control" placeholder="Enter Fax"></asp:TextBox>
                        </div>
                        <label class="col-md-3 control-label">
                            <span>Website</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtWebsite" CssClass="form-control" placeholder="Enter Website"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Mobile Number</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtMobileNumber" CssClass="form-control" placeholder="Enter MobileNo"></asp:TextBox>
                        </div>
                        <label class="col-md-3 control-label">
                            <span>AmbulancePhoneNumber</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtAmbulancePhoneNumber" CssClass="form-control" placeholder="Enter AmbulancePhoneNumber"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>TelePhoneNumber</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtTelePhoneNumber" CssClass="form-control" placeholder="Enter TelePhoneNumber"></asp:TextBox>
                        </div>
                        <label class="col-md-3 control-label">
                            <span>EmergencyNumber</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtEmergencyNumber" CssClass="form-control" placeholder="Enter EmergencyNumber"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Select Category  <span class="required">*</span>
                            </span>
                        </label>
                        <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control select2me"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="ddlCategory" Display="Dynamic" InitialValue="-99"
                                ErrorMessage="Select State Name" ValidationGroup="HospitalAddEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <label class="col-md-3 control-label">
                            <span>Select CategoryType <span class="required">*</span>
                            </span>
                        </label>
                        <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="ddlCategoryType" CssClass="form-control select2me"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="ddlCategoryType" Display="Dynamic" InitialValue="-99"
                                ErrorMessage="Select Category Type" ValidationGroup="HospitalAddEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Select City   <span class="required">*</span>
                            </span>
                        </label>
                        <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-control select2me"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                ControlToValidate="ddlCity" Display="Dynamic" InitialValue="-99"
                                ErrorMessage="Select City Name" ValidationGroup="HospitalAddEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <label class="col-md-3 control-label">
                            <span>Location Coordinates<span class="required">*</span>
                            </span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtLocationCoordinates" type="text" class="form-control" placeholder="Enter Location Coordinates" />
                            <asp:RequiredFieldValidator ID="rfvLocationCoordinates" runat="server"
                                ControlToValidate="txtLocationCoordinates" ErrorMessage="Enter Location Coordinates" Display="Dynamic"
                                SetFocusOnError="True" ValidationGroup="HospitalAddEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span>Image Upload</span>
                        </label>
                        <div class="col-md-3">
                            <asp:FileUpload ID="fuHospitalImage" runat="server" />
                            <asp:Label ID="lblImagePath" runat="server" Visible="False"></asp:Label>
                            <asp:Image ID="imgHospitalImage" runat="server" Visible="false" Height="100px" Width="100px" />
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:LinkButton ID="btnAdd" runat="server" SkinID="btnSave" ValidationGroup="HospitalAddEdit" OnClick="btnAdd_Click" />
                                <asp:HyperLink ID="hlCancel" runat="server" SkinID="hlCancel" CausesValidation="false" NavigateUrl="~/AdminPanel/Master/MST_Hospital/MST_HospitalList.aspx" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
</asp:Content>
