using System;

public partial class Default_MasterPages_MasterPage : System.Web.UI.MasterPage
{
    #region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        lblUser.Text = Session["UserName"].ToString();
    }
    #endregion PageLoad

    #region Logout Button Click

    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login/Login.aspx");
    }

    #endregion Logout Button Click

    # region Change Password

    protected void lbtnChangePassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/ChangePassword.aspx");
    }

    #endregion Change Password
}
