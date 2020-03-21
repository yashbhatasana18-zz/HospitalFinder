using HospitalFinder.BAL;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_Category_MST_CategoryList : System.Web.UI.Page
{
    #region 12.0 Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Search();
        }
    }
    #endregion 12.0 Page Load Event

    #region 15.2 Search Function

    private void Search()
    {
        MST_CategoryBAL balMST_Category = new MST_CategoryBAL();
        rptCategoryList.DataSource = balMST_Category.SelectAll(); ;
        rptCategoryList.DataBind();
        int Count = rptCategoryList.Items.Count;
        lblCount.Text = Count.ToString();
    }
    #endregion 15.2 Search Function

    #region Function - Delete Category
    protected void rptCategoryList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            try
            {
                MST_CategoryBAL balMST_Category = new MST_CategoryBAL();
                balMST_Category.Delete(Convert.ToInt32(e.CommandArgument));
            }
            catch (Exception ex)
            {
                pnlAlert.Visible = true;
                lblMsg.Text = ex.Message;
            }
            finally
            {
                Search();
            }
        }
    }
    #endregion Function - Delete Category
}