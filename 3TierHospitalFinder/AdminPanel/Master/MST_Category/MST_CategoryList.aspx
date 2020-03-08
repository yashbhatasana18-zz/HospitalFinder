<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_CategoryList.aspx.cs" Inherits="AdminPanel_Master_MST_Category_MST_CategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    <asp:Label ID="lblHeader" runat="server" Text="Hospital Category List"></asp:Label>
                    (<asp:Label ID="lblCount" runat="server" Text="State Count"></asp:Label>)
                </h1>
                <br />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <div>
                <asp:HyperLink ID="hlAddCategory" runat="server" NavigateUrl="~/AdminPanel/Master/MST_Category/MST_CategoryAddEdit.aspx" Text="Add Hospital Category" CssClass="btn btn-outline-primary m-3"></asp:HyperLink>
            </div>
            <div class="col-md-12 m-3">
                <div class="form-group row d-flex">
                    <asp:Label ID="lblSearch" runat="server" Text="Search :" CssClass="col-md-1 font-weight-bold col-form-label p-2 ml-auto"></asp:Label>
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="col-md-2 form-control" placeholder="---Enter Name---" onkeyup="SearchFunction()"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-12 mt-3">
                <div style="overflow-x: auto;">
                    <table class="table table-hover" id="tbCategory">
                        <thead>
                            <tr>
                                <th>
                                    <asp:Label ID="lbhCategoryName" runat="server" Text="Category Name"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="lbhCreationDate" runat="server" Text="Creation Date"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="lbhModificationDate" runat="server" Text="Modification Date"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="lbhEdit" runat="server" Text="Edit"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="lbhDelete" runat="server" Text="Delete"></asp:Label>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptCategoryList" runat="server" OnItemCommand="rptCategoryList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("CategoryName") %></td>
                                        <td><%#Eval("CreationDate") %></td>
                                        <td><%#Eval("ModificationDate") %></td>
                                        <td>
                                            <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-outline-warning ml-3" NavigateUrl='<%# "~/AdminPanel/Master/MST_Category/MST_CategoryAddEdit.aspx?CategoryID=" + Eval("CategoryID") %>'>
                                            </asp:HyperLink>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CssClass="btn btn-outline-danger ml-3" CommandName="DeleteRecord" CommandArgument='<%# Eval("CategoryID") %>'>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="Server">
    <script type="text/javascript">
        const SearchFunction = () => {
            let myinput = document.getElementById('cphContent_txtSearch').value.toUpperCase();
            let mytable = document.getElementById('tbCategory');
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

