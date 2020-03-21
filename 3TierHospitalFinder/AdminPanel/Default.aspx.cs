using HospitalFinder.BAL;
using System;
using System.Data;

public partial class AdminPanel_Default : System.Web.UI.Page
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
            Count();
        }
    }
    #endregion Page Load Event

    #region Count Function
    private void Count()
    {
        DashboardBAL balDashboard = new DashboardBAL();
        DataTable dtHospital = balDashboard.HospitalCount();
        if (dtHospital != null && dtHospital.Rows.Count > 0)
        {
            foreach (DataRow dr in dtHospital.Rows)
            {
                if (!dr["HospitalCount"].Equals(DBNull.Value))
                {
                    lblHospitalCount.Text = Convert.ToString(dr["HospitalCount"]);
                }
            }
        }

        DataTable dtState = balDashboard.StateCount();
        if (dtState != null && dtState.Rows.Count > 0)
        {
            foreach (DataRow dr in dtState.Rows)
            {
                if (!dr["StateCount"].Equals(DBNull.Value))
                {
                    lblStateCount.Text = Convert.ToString(dr["StateCount"]);
                }
            }
        }
        DataTable dtCity = balDashboard.CityCount();
        if (dtCity != null && dtCity.Rows.Count > 0)
        {
            foreach (DataRow dr in dtCity.Rows)
            {
                if (!dr["CityCount"].Equals(DBNull.Value))
                {
                    lblCityCount.Text = Convert.ToString(dr["CityCount"]);
                }
            }
        }
        DataTable dtUser = balDashboard.UserCount();
        if (dtUser != null && dtUser.Rows.Count > 0)
        {
            foreach (DataRow dr in dtUser.Rows)
            {
                if (!dr["UserCount"].Equals(DBNull.Value))
                {
                    lblUserCount.Text = Convert.ToString(dr["UserCount"]);
                }
            }
        }
    }
    #endregion Count Function
}