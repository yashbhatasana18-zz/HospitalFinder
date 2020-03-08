using HospitalFinder.DAL;
using System;
using System.Data;

public partial class Login_Login : System.Web.UI.Page
{
    #region Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserName.Focus();
    }

    #endregion Page Load Event

    #region Button Click Event

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text != String.Empty)
        {
            if (txtPassword.Text != String.Empty)
            {
                
                SEC_UserDAL dalSEC_Admin = new SEC_UserDAL();
                DataTable dt = dalSEC_Admin.UserLogIn(txtUserName.Text.Trim(), txtPassword.Text.Trim());

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (dr["UserID"].ToString() != String.Empty)
                        {
                            Session["UserID"] = Convert.ToInt32(dr["UserID"]);
                        }
                        if (dr["UserName"].ToString() != String.Empty)
                        {
                            Session["UserName"] = dr["UserName"].ToString();
                        }
                        //if (dr["Email"].ToString() != String.Empty)
                        //{
                        //    Session["Email"] = dr["Email"].ToString();
                        //}
                    }
                    Response.Redirect("~/AdminPanel/Default.aspx");
                }
                else
                {
                    lblMessage.Text = "The username or password you entered is incorrect.";
                }
            }
            else
            {
                lblMessage.Text = "Enter your Password.";
            }
        }
        else
        {
            lblMessage.Text = "Enter your Username.";
        }
    }

    #endregion Button Click Event
}