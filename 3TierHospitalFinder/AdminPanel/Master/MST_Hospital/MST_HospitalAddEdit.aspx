<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_HospitalAddEdit.aspx.cs" Inherits="AdminPanel_Master_MST_Hospital_MST_HospitalAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    <asp:Label ID="lblPageHeader" runat="server"></asp:Label>
                </h1>
                <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-success"></asp:Label>
            </div>
            <div class="col-md-12 m-2">
                <div class="form-group row">
                    <label for="HospitalName" class="col-md-3 col-form-label">Hospital Name<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="txtHospitalName" CssClass="form-control"></asp:TextBox>
                        <small id="passwordHelpBlock" class="form-text text-muted ">
                            <asp:RequiredFieldValidator ID="rfvHospitalName" runat="server" ErrorMessage="Enter Hospital Name" ControlToValidate="txtHospitalName" Display="Dynamic" ValidationGroup="HospitalAddEdit" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="HospitalAddress" class="col-md-3 col-form-label">Hospital Address<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        <small id="Small5" class="form-text text-muted ">
                            <asp:RequiredFieldValidator ID="rfvAdderss" runat="server" ErrorMessage="Enter Hospital Address" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="HospitalAddEdit" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="EmailAddress" class="col-md-3 col-form-label">Email Address:</label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Fax" class="col-md-3 col-form-label">Fax :</label>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txtFax" CssClass="form-control"></asp:TextBox>
                    </div>
                    <label for="Website" class="col-md-3 col-form-label">Website :</label>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txtWebsite" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="MobileNumber" class="col-md-3 col-form-label">Mobile Number :</label>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txtMobileNumber" CssClass="form-control"></asp:TextBox>
                    </div>
                    <label for="AmbulancePhoneNumber" class="col-md-3 col-form-label">AmbulancePhoneNumber :</label>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txtAmbulancePhoneNumber" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="TelePhoneNumber" class="col-md-3 col-form-label">TelePhoneNumber :</label>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txtTelePhoneNumber" CssClass="form-control"></asp:TextBox>
                    </div>
                    <label for="EmergencyNumber" class="col-md-3 col-form-label">EmergencyNumber :</label>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txtEmergencyNumber" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Category" class="col-md-3 col-form-label">Select Category<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                        <small id="Small2" class="form-text text-muted">
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="Select Category" ControlToValidate="ddlCategory" Display="Dynamic" ValidationGroup="HospitalAddEdit" ForeColor="#FF3300" InitialValue="-99"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                    <label for="CategoryType" class="col-md-3 col-form-label">Select Category Type<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategoryType" CssClass="form-control" runat="server"></asp:DropDownList>
                        <small id="Small3" class="form-text text-muted">
                            <asp:RequiredFieldValidator ID="rfvCategoryType" runat="server" ErrorMessage="Select Category Type" ControlToValidate="ddlCategoryType" Display="Dynamic" ValidationGroup="HospitalAddEdit" ForeColor="#FF3300" InitialValue="-99"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="City" class="col-md-3 col-form-label">Select City<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server"></asp:DropDownList>
                        <small id="Small1" class="form-text text-muted">
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Select City Name" ControlToValidate="ddlCity" Display="Dynamic" ValidationGroup="HospitalAddEdit" ForeColor="#FF3300" InitialValue="-99"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                </div>
            </div>
            <div class="col-md-12 offset-10">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-outline-success" ValidationGroup="HospitalAddEdit" OnClick="btnAdd_Click" />
                <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/AdminPanel/Master/MST_Hospital/MST_HospitalList.aspx" Text="Cancel" CssClass="btn btn-outline-danger"></asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

