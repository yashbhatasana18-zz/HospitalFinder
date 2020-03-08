using HospitalFinder.BAL;
using HospitalFinder.DAL;
using HospitalFinder.ENT;
using System;
using System.Data;
using System.Web.UI;

public partial class AdminPanel_ChangePassword : System.Web.UI.Page
{
    #region Page Load event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        txtOldPassword.Focus();
        if(!Page.IsPostBack)
        {
            lblPageHeader.Text = "Change Password";
        }
    }
    #endregion Page Load event

    #region Save button event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            SEC_UserENT entSEC_User = new SEC_UserENT();
            SEC_UserBAL balSEC_User = new SEC_UserBAL();
            DataTable dt = dalSEC_User.CheckPassword(Convert.ToInt32(Session["UserID"]), Convert.ToString(Session["UserName"]), txtOldPassword.Text.Trim());
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    entSEC_User.UserID = Convert.ToInt32(dr["UserID"]);
                    entSEC_User.UserName = dr["UserName"].ToString();
                    entSEC_User.Password = txtNewPassword.Text.Trim();
                    entSEC_User.Email = Convert.ToString(dr["Email"]);
                    entSEC_User.CreationDate = DateTime.Now;
                    entSEC_User.ModificationDate = DateTime.Now;

                    balSEC_User.Update(entSEC_User);
                    pnlAlert.Visible = true;
                    lblErrorMsg.Text = "Password Successfully Changed.";
                    //ucMessage.ShowSuccess("Password Successfully Changed.");
                }
            }
            else
            {
                lblOldPassword.Text = "Old Password is wrong.";
            }
        }
        else
        {
            Response.Redirect("~/Login/Login.aspx");
        }
    }
    #endregion Save button event

}