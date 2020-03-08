<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_CategoryAddEdit.aspx.cs" Inherits="AdminPanel_Master_MST_Category_MST_CategoryAddEdit" %>

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
                    <label for="name" class="col-sm-3 col-form-label">Category Name<span style="color:red;font-size:20px;">*</span> :</label>
                    <div class="col-sm-9">
                        <asp:TextBox runat="server" ID="txtCategoryName" CssClass="form-control"></asp:TextBox>
                        <small id="passwordHelpBlock" class="form-text text-muted ">
                            <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" Display="Dynamic" ErrorMessage="Enter Category Name" ControlToValidate="txtCategoryName" ValidationGroup="CategoryAddEdit" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </small>
                    </div>
                </div>
            </div>
            <div class="col-md-12 offset-10">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-outline-success" ValidationGroup="CategoryAddEdit" OnClick="btnAdd_Click" />
                <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/AdminPanel/Master/MST_Category/MST_CategoryList.aspx" Text="Cancel" CssClass="btn btn-outline-danger"></asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

