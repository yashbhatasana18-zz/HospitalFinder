using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HospitalFinder.BAL;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_CategoryType_MST_CategoryTypeList : System.Web.UI.Page
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
        MST_CategoryTypeBAL balMST_CategoryType = new MST_CategoryTypeBAL();
        rptCategoryTypeList.DataSource = balMST_CategoryType.SelectAll(); ;
        rptCategoryTypeList.DataBind();
        int Count = rptCategoryTypeList.Items.Count;
        lblCount.Text = Count.ToString();
    }
    #endregion 15.2 Search Function

    #region Function - Delete State
    protected void rptCategoryTypeList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            try
            {
                MST_CategoryTypeBAL balMST_CategoryType = new MST_CategoryTypeBAL();
                balMST_CategoryType.Delete(Convert.ToInt32(e.CommandArgument));
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
    #endregion Function - Delete State
}