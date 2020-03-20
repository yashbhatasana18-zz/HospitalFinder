using HospitalFinder.BAL;
using HospitalFinder.ENT;
using System;
using System.Data;
using System.Data.SqlTypes;
using System.Web.UI;

public partial class Login_Signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserName.Focus();
    }

    #region Signup
    protected void lbtnSignup_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            try
            {
                SEC_UserBAL balSEC_User = new SEC_UserBAL();
                SEC_UserENT entSEC_User = new SEC_UserENT();

                #region 15.1 Validate Fields

                String ErrorMsg = String.Empty;

                if (txtUserName.Text.Trim() == String.Empty)
                {
                    ErrorMsg += " - UserName is Required Field  <br />";
                }
                if (txtPassword.Text.Trim() == String.Empty)
                {
                    ErrorMsg += " - Password is Required Field <br />";
                }
                if (txtEmail.Text.Trim() == String.Empty)
                {
                    ErrorMsg += " - Email is Required Field <br />";
                }

                if (ErrorMsg != String.Empty)
                {
                    ErrorMsg = "Please Correct follwing error <br />" + ErrorMsg;
                    lblErrorMsg.Text = ErrorMsg;
                    return;
                }

                #endregion

                #region FillData

                if (txtUserName.Text.Trim() != String.Empty)
                    entSEC_User.UserName = txtUserName.Text.Trim();

                if (txtPassword.Text.Trim() != String.Empty)
                    entSEC_User.Password = txtPassword.Text.Trim();

                if (txtEmail.Text.Trim() != String.Empty)
                    entSEC_User.Email = txtEmail.Text.Trim();

                entSEC_User.CreationDate = DateTime.Now;

                entSEC_User.ModificationDate = DateTime.Now;

                #endregion FillData

                if (CheckDuplicate(txtUserName.Text.Trim(), txtEmail.Text.Trim()))
                {
                    #region 15.3 Insert

                    if (balSEC_User.Insert(entSEC_User))
                    {
                        pnlErrorMsg.Visible = true;
                        lblErrorMsg.Text = "SignUP Successfully";
                        ClearControls();
                        //Response.Redirect("~/AdminPanel/Login.aspx");
                    }

                    #endregion 15.3 Insert
                }
                else
                {
                    pnlErrorMsg.Visible = true;
                    lblErrorMsg.Text = "User OR Email Already Exists.";
                }
            }
            catch (Exception ex)
            {
                pnlErrorMsg.Visible = true;
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
    #endregion Signup

    #region Cancel
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login/Login.aspx");
    }
    #endregion Cancel

    #region CheckDuplicate
    private Boolean CheckDuplicate(SqlString UserName, SqlString Email)
    {
        SEC_UserBAL balSEC_User = new SEC_UserBAL();
        DataTable dt = balSEC_User.SelectDuplicate(UserName, Email);
        if (dt.Rows.Count > 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    #endregion CheckDuplicate

    #region 16.0 Clear Controls

    private void ClearControls()
    {
        txtUserName.Text = String.Empty;
        txtPassword.Text = String.Empty;
        txtPasswordRetype.Text = String.Empty;
        txtEmail.Text = String.Empty;
        txtUserName.Focus();
    }

    #endregion 16.0 Clear Controls
}