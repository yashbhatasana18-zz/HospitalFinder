<%@ Page Title="" EnableTheming="true" Theme="Admin" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_CityAddEdit.aspx.cs" Inherits="AdminPanel_Master_MST_City_MST_CityAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" runat="Server">
    City 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadCrumb" runat="Server">
    <li>
        <i class="fa fa-home"></i>
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Default.aspx">Home</asp:HyperLink>
        <i class="fa fa-angle-right"></i>
    </li>
    <li>
        <a href="MST_cityList.aspx">City</a>
        <i class="fa fa-angle-right"></i>
    </li>
    <li>CityAddEdit
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
                            <span class="required">*</span>
                            <span>City Name</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtCityName" type="text" class="form-control" placeholder="Enter City Name" />
                            <asp:RequiredFieldValidator ID="rfvCityName" runat="server"
                                ControlToValidate="txtCityName" ErrorMessage="Enter City Name" Display="Dynamic"
                                SetFocusOnError="True" ValidationGroup="master" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span class="required">*</span>
                            <span>Pin Code</span>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ID="txtPinCode" type="text" class="form-control" placeholder="Enter PinCode" MaxLength="6" />
                            <asp:RequiredFieldValidator ID="rfvPinCode" runat="server"
                                ControlToValidate="txtPinCode" ErrorMessage="Enter PinCode" Display="Dynamic"
                                SetFocusOnError="True" ValidationGroup="master" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <asp:Label runat="server" ID="lblRemarks">STD Code</asp:Label>
                        </label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtSTDCode" runat="server" class="form-control" placeholder="Enter STD Code"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <span class="required">*</span>
                            <span>State</span>
                        </label>
                        <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="ddlState" CssClass="form-control select2me"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server"
                                ControlToValidate="ddlState" Display="Dynamic" InitialValue="-99"
                                ErrorMessage="Select State Name" ValidationGroup="master" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:LinkButton ID="btnAdd" runat="server" SkinID="btnSave" ValidationGroup="master" OnClick="btnAdd_Click" />
                                <asp:HyperLink ID="hlCancel" runat="server" SkinID="hlCancel" CausesValidation="false" NavigateUrl="~/AdminPanel/Master/MST_City/MST_CityList.aspx" />
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
