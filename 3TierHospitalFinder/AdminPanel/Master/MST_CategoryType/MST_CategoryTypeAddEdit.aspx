<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_CategoryTypeAddEdit.aspx.cs" Inherits="AdminPanel_Master_MST_CategoryType_MST_CategoryTypeAddEdit" %>

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
            <div class="col-md-12 m-3">
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label">Category Type<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-sm-9">
                        <asp:TextBox runat="server" ID="txtCategoryType" CssClass="form-control"></asp:TextBox>
                        <small id="passwordHelpBlock" class="form-text text-muted ">
                            <asp:RequiredFieldValidator ID="rfvCategoryType" runat="server" Display="Dynamic" ErrorMessage="Enter Category Type" ControlToValidate="txtCategoryType" ValidationGroup="CategoryTypeAddEdit" ForeColor="#ff0000"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                </div>
            </div>
            <div class="col-md-12 offset-10">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-outline-success" ValidationGroup="CategoryTypeAddEdit" OnClick="btnAdd_Click" />
                <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/AdminPanel/Master/MST_CategoryType/MST_CategoryTypeList.aspx" Text="Cancel" CssClass="btn btn-outline-danger"></asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

