﻿<%@ Page Title="" EnableTheming="true" Theme="Admin" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_CategoryTypeList.aspx.cs" Inherits="AdminPanel_Master_MST_CategoryType_MST_CategoryTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageHeader" runat="Server">
    Hospital Category Type
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadCrumb" runat="Server">
    <li>
        <i class="fa fa-home"></i>
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Default.aspx">Home</asp:HyperLink>
        <i class="fa fa-angle-right"></i>
    </li>
    <li>
        <a href="MST_CategoryTypeList.aspx">CategoryTypeList</a>
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContent" runat="Server">
    <%--Repeater Start--%>
    <div class="portlet light" style="padding: 10px 20px 0px 10px; margin-bottom: 0px">

        <div class="portlet-title">

            <asp:Panel ID="pnlAlert" runat="server" Visible="false">
                <div class="alert alert-danger alert-dismissable ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="false"></asp:Label>
                </div>
            </asp:Panel>

            <div class="caption">
                <b>Hospital Category Type List</b>&nbsp;<small>(<asp:Label ID="lblCount" runat="server" Text="Hospital Category Type Count"></asp:Label>)</small>
                <asp:Label ID="lblSearchResultHeader" SkinID="lblSearchResultHeaderText" runat="server"></asp:Label>
                <%--<label class="control-label pull-right">
                    <asp:Label ID="lblRecordInfoTop" Text="No entries found" CssClass="pull-right" runat="server"></asp:Label>
                </label>--%>
            </div>
            <div class="actions">
                <asp:HyperLink ID="hlAddCategoryType" runat="server" NavigateUrl="~/AdminPanel/Master/MST_CategoryType/MST_CategoryTypeAddEdit.aspx"
                    CssClass="btn btn-success" Text="<i class='fa fa-plus-circle'></i>&nbsp;Add Hospital Category Type">
                </asp:HyperLink>
            </div>
        </div>

        <br />

        <div class="form-group ">
            <div class="col-md-3 pull-right">
                <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="-------Search Hospital Category Type-------" onkeyup="SearchFunction()"></asp:TextBox>
            </div>
        </div>

        <div class="portlet-body">
            <div class="row">
                <div class="col-md-12">
                    <div id="TableContent" style="overflow-x: auto;">
                        <table class="table table-responsive table-bordered table-striped table-hover" id="tbCategoryType">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        <asp:Label ID="lbhCategoryName" runat="server" Text="Category Type"></asp:Label>
                                    </th>
                                    <th class="text-center">
                                        <asp:Label ID="lbhUserName" runat="server" Text="UserName"></asp:Label>
                                    </th>
                                    <th class="text-center">
                                        <asp:Label ID="lbhCreationDate" runat="server" Text="Creation Date"></asp:Label>
                                    </th>
                                    <th class="text-center">
                                        <asp:Label ID="lbhModificationDate" runat="server" Text="Modification Date"></asp:Label>
                                    </th>
                                    <th class="text-center">
                                        <asp:Label ID="lblAction" runat="server" Text="Action"></asp:Label>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptCategoryTypeList" runat="server" OnItemCommand="rptCategoryTypeList_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%#Eval("CategoryType") %></td>
                                            <td class="text-center"><%#Eval("UserName") %></td>
                                            <td class="text-center"><%#Eval("CreationDate","{0:dd-MM-yyyy}") %></td>
                                            <td class="text-center"><%#Eval("ModificationDate","{0:dd-MM-yyyy}") %></td>
                                            <td class="tdaction text-nowrap text-center">
                                                <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" SkinID="Edit" NavigateUrl='<%# "~/AdminPanel/Master/MST_CategoryType/MST_CategoryTypeAddEdit.aspx?CategoryTypeID=" + Eval("CategoryTypeID") %>'>
                                                </asp:HyperLink>

                                                <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" SkinID="Delete" CommandName="DeleteRecord" CommandArgument='<%# Eval("CategoryTypeID") %>'>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Repeater End--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
    <script type="text/javascript">
        const SearchFunction = () => {
            let myinput = document.getElementById('cphContent_txtSearch').value.toUpperCase();
            let mytable = document.getElementById('tbCategoryType');
            let tr = mytable.getElementsByTagName('tr');

            for (i = 0; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName('td')[0];
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
