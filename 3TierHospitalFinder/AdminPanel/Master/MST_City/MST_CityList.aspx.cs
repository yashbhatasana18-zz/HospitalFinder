using HospitalFinder.BAL;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_City_MST_CityList : System.Web.UI.Page
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
        MST_CityBAL balMST_City = new MST_CityBAL();
        rptCityList.DataSource = balMST_City.SelectAll(); ;
        rptCityList.DataBind();
        int Count = rptCityList.Items.Count;
        lblCount.Text = Count.ToString();
    }
    #endregion 15.2 Search Function

    #region Function - Delete City
    protected void rptCityList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        pnlAlert.Visible = true;
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            try
            {
                MST_CityBAL balMST_City = new MST_CityBAL();
                balMST_City.Delete(Convert.ToInt32(e.CommandArgument));
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
    #endregion Function - Delete City
}