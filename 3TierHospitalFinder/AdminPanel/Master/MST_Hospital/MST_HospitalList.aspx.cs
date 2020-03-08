using HospitalFinder.BAL;
using System;
using System.Data.SqlTypes;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_Hospital_MST_HospitalList : System.Web.UI.Page
{
    

    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            

            RepeaterFill();
        }
    }
    #endregion Page Load Event

    #region RepeaterFill Function
    private void RepeaterFill()
    {
        MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();
        rptHospitalList.DataSource = balMST_Hospital.SelectAll(); ;
        rptHospitalList.DataBind();
        int Count = rptHospitalList.Items.Count;
        lblCount.Text = Count.ToString();
    }
    #endregion RepeaterFill Function

    #region Function - Delete City
    protected void rptHospitalList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            try
            {
                MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();
                balMST_Hospital.Delete(Convert.ToInt32(e.CommandArgument));
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
            finally
            {
                RepeaterFill();
            }
        }
    }
    #endregion Function - Delete City
}
