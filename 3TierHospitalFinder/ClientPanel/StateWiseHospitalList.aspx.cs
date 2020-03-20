using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using HospitalFinder.DAL;
public partial class ClientPanel_StateWiseHospitalList : System.Web.UI.Page
{
    #region Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillRepeater();
        }
    }
    #endregion Load Event

    #region FillRepeater
    private void FillRepeater()
    {
        using (SqlConnection objConn = new SqlConnection(DataBaseConfig.myConnectionString))
        {
            objConn.Open();
            using (SqlCommand objCmd = objConn.CreateCommand())
            {
                try
                {
                    #region Prepare Command
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_MST_Hospital_StateWiseHospital";
                    objCmd.Parameters.AddWithValue("@StateID", Page.RouteData.Values["StateID"].ToString());
                    #endregion Prepare Command

                    SqlDataReader objSDR = objCmd.ExecuteReader();
                    DataTable dtState = new DataTable();
                    dtState.Load(objSDR);

                    rpHospitalListByStateName.DataSource = dtState;
                    rpHospitalListByStateName.DataBind();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = ex.Message.ToString();
                }
                finally
                {
                    if (objConn.State == ConnectionState.Open)
                    {
                        objConn.Close();
                    }
                }
            }
        }
    }
    #endregion FillRepeater
}