using HospitalFinder.BAL;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_State_MST_StateList : System.Web.UI.Page
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
        MST_StateBAL balMST_State = new MST_StateBAL();
        rptStateList.DataSource = balMST_State.SelectAll();
        rptStateList.DataBind();
        int Count = rptStateList.Items.Count;
        lblCount.Text = Count.ToString();
    }
    #endregion 15.2 Search Function

    #region Function - Delete State
    protected void rptStateList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName== "DeleteRecord" && e.CommandArgument!=null)
        {
            try
            {
                MST_StateBAL balMST_State = new MST_StateBAL();
                balMST_State.Delete(Convert.ToInt32(e.CommandArgument));
            }
            catch (Exception ex)
            {
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
