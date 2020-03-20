<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Login_Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>SignUP | HospitalFinder</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/font-awesome/css/font-awesome.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/simple-line-icons/simple-line-icons.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap/css/bootstrap.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/uniform/css/uniform.default.css") %>" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/select2/select2.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/admin/pages/css/login3.css") %>" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="<%=ResolveClientUrl("~/Default/assets/global/css/components.css") %>" id="style_components" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/css/plugins.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/admin/layout/css/layout.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/admin/layout/css/themes/default.css") %>" rel="stylesheet" type="text/css" id="style_color" />
    <link href="<%=ResolveClientUrl("~/Default/assets/admin/layout/css/custom.css") %>" rel="stylesheet" type="text/css" />
    <!-- END THEME STYLES -->
    <style>
        h3 {
            margin-bottom: 14px !important;
        }

        .content {
            padding-top: 10px !important;
        }


        .login {
            background-color: #a0a0a0 !important;
        }

        .input-icon {
            border-radius: 20px !important;
        }

        .login .content .input-icon .form-control {
            border-radius: 20px !important;
            border-color: darkgrey;
        }

        .input-icon > .form-control {
            border-radius: 20px !important;
        }

        .form-control {
            border-radius: 20px !important;
        }

        div, input, select, textarea, span, img, table, label, td, th, p, a, button, ul, code, pre, li {
            border-radius: 20px !important;
        }
    </style>
</head>
<body class="login">
    <form id="form1" runat="server">
        <asp:Panel ID="cpPanel" runat="server" Style="margin-top: 50px;">
            <!-- BEGIN LOGIN -->
            <div class="content" style="border-radius: 10px !important; background-color: #ffffff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <h1 class="text-center"><span class="text-danger">Hospital</span>Finder</h1>

                <!-- BEGIN LOGIN FORM -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="form-title text-center">Signup your account</h4>
                        <asp:Panel runat="server" Visible="false" ID="pnlErrorMsg">
                            <asp:Label ID="lblErrorMsg" runat="server" CssClass="alert alert-success">
                            </asp:Label>
                            <br />
                            <br />
                        </asp:Panel>
                        <%--<div>
                        <ucMessage:ShowMessage ID="ucMessage" runat="server" />
                    </div>--%>
                        <div class="form-group">
                            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                            <%--<label class="control-label "><span class="text-danger">*</span>&nbsp;Username</label>--%>
                            <div class="input-icon">
                                <i class="fa fa-user"></i>
                                <asp:TextBox ID="txtUserName" CssClass="form-control placeholder-no-fix" runat="server" placeholder="Enter UserName"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter UserName" ValidationGroup="SignUP"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <div class="input-icon">
                                <i class="fa fa-lock"></i>
                                <asp:TextBox ID="txtPassword" CssClass="form-control placeholder-no-fix" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter Password" ValidationGroup="SignUP"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <div class="input-icon">
                                <i class="fa fa-lock"></i>
                                <asp:TextBox ID="txtPasswordRetype" CssClass="form-control placeholder-no-fix" runat="server" placeholder="Enter Password Again" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:CompareValidator ID="cvmatch" runat="server" ControlToValidate="txtPasswordRetype" ErrorMessage="password is not match" ControlToCompare="txtPassword" Display="dynamic" SetFocusOnError="true" ForeColor="red"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="rfvPasswordRetype" runat="server" ControlToValidate="txtPasswordRetype" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter Password Again" ValidationGroup="SignUP"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <div class="input-icon">
                                <i class="fa fa-lock"></i>
                                <asp:TextBox ID="txtEmail" CssClass="form-control placeholder-no-fix" runat="server" placeholder="Enter Email"></asp:TextBox>
                            </div>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter Email Properly Ex : abc@gmail.com" ValidationGroup="SignUP"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter Email" ValidationGroup="SignUP"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:LinkButton ID="btnSignUP" runat="server" CssClass="btn green-haze pull-right" Text="SignUP" ValidationGroup="SignUP" OnClick="lbtnSignup_Click">
                                SignUP <i class="m-icon-swapright m-icon-white"></i>
                            </asp:LinkButton>
                            <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-primary pull-right" OnClick="btncancel_Click"></asp:Button>
                        </div>
                    </div>
                </div>
                <!-- END SingUP FORM -->
            </div>
        </asp:Panel>
    </form>

    <div class="copyright">
        <%=DateTime.Now.Year %> &copy; WebExpanders
    </div>
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery-migrate.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap/js/bootstrap.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery.blockui.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/uniform/jquery.uniform.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery.cokie.min.js") %>" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery-validation/js/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script type="text/javascript" src="<%=ResolveClientUrl("~/Default/assets/global/plugins/select2/select2.min.js") %>"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="<%=ResolveClientUrl("~/Default/assets/global/scripts/metronic.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/admin/layout/scripts/layout.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/admin/layout/scripts/demo.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Default/assets/admin/pages/scripts/login.js") %>" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
        jQuery(document).ready(function () {
            Metronic.init(); // init metronic core components
            Layout.init(); // init current layout
            //  Login.init();
            Demo.init();
        });

    </script>
    <!-- END JAVASCRIPTS -->
</body>
</html>
