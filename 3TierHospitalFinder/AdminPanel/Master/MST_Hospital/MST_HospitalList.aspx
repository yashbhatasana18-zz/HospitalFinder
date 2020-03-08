<%@ Page Title="" Language="C#" MasterPageFile="~/Default/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MST_HospitalList.aspx.cs" Inherits="AdminPanel_Master_MST_Hospital_MST_HospitalList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    <asp:Label ID="lblHeader" runat="server" Text="Hospital List"></asp:Label>
                    (<asp:Label ID="lblCount" runat="server" Text="State Count"></asp:Label>)
                </h1>
                <br />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <div class="col-md-12">
                <asp:HyperLink ID="hlAddHospital" runat="server" NavigateUrl="~/AdminPanel/Master/MST_Hospital/MST_HospitalAddEdit.aspx" Text="Add Hospital" CssClass="btn btn-outline-primary m-3"></asp:HyperLink>
            </div>
            <div class="col-md-12 m-3">
                <div class="form-group row d-flex">
                    <asp:Label ID="lblSearch" runat="server" Text="Search :" CssClass="col-md-1 font-weight-bold col-form-label p-2 ml-auto"></asp:Label>
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="col-md-2 form-control" placeholder="---Enter Name---" onkeyup="SearchFunction()"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="col-md-12 mt-3">
            <div style="overflow-x: auto;">
                <table class="table table-hover" id="tbHospital">
                    <thead>
                        <tr>
                            <th>
                                <asp:Label ID="lbhHospitalName" runat="server" Text="Hospital Name"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhAddress" runat="server" Text="Address"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhCityName" runat="server" Text="City"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhStateName" runat="server" Text="State"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhCategoryName" runat="server" Text="Category"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhCategoryType" runat="server" Text="Category Type"></asp:Label>
                            </th>
                            <%--                            <th>
                                <asp:Label ID="lbhEmailID" runat="server" Text="EmailID"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhMobileNumber" runat="server" Text="MobileNumber"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhTelephoneNumber" runat="server" Text="TelephoneNumber"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhFax" runat="server" Text="Fax"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhWebsite" runat="server" Text="Website"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhAmbulancePhoneNumber" runat="server" Text="AmbulancePhoneNumber"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhEmergencyNumber" runat="server" Text="EmergencyNumber"></asp:Label>
                            </th>
                            <%--                            <th>
                                <asp:Label ID="lbhCreationDate" runat="server" Text="Creation Date"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhModificationDate" runat="server" Text="Modification Date"></asp:Label>
                            </th>--%>
                            <th>
                                <asp:Label ID="lbhEdit" runat="server" Text="Edit"></asp:Label>
                            </th>
                            <th>
                                <asp:Label ID="lbhDelete" runat="server" Text="Delete"></asp:Label>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptHospitalList" runat="server" OnItemCommand="rptHospitalList_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("HospitalName") %></td>
                                    <td><%#Eval("Address") %></td>
                                    <td><%#Eval("CityName") %></td>
                                    <td><%#Eval("StateName") %></td>
                                    <td><%#Eval("CategoryName") %></td>
                                    <td><%#Eval("CategoryType") %></td>
                                    <%--                                    <td><%#Eval("EmailID") %></td>
                                    <td><%#Eval("MobileNumber") %></td>
                                    <td><%#Eval("TelephoneNumber") %></td>
                                    <td><%#Eval("Fax") %></td>
                                    <td><%#Eval("Website") %></td>
                                    <td><%#Eval("AmbulancePhoneNumber") %></td>
                                    <td><%#Eval("EmergencyNumber") %></td>
                                    <td><%#Eval("CreationDate") %></td>
                                    <td><%#Eval("ModificationDate") %></td>--%>
                                    <td>
                                        <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-outline-warning ml-3" NavigateUrl='<%# "~/AdminPanel/Master/MST_Hospital/MST_HospitalAddEdit.aspx?HospitalID=" + Eval("HospitalID") %>'>
                                        </asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CssClass="btn btn-outline-danger ml-3" CommandName="DeleteRecord" CommandArgument='<%# Eval("HospitalID") %>'>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="Server">
    <script type="text/javascript">
        const SearchFunction = () => {
            let myinput = document.getElementById('cphContent_txtSearch').value.toUpperCase();
            let mytable = document.getElementById('tbHospital');
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
