using HospitalFinder.BAL;
using HospitalFinder.ENT;
using HospitalFinder;
using System;
using System.Web.UI;

public partial class AdminPanel_Master_MST_City_MST_CityAddEdit : System.Web.UI.Page
{
    #region 11.0 Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login/Login.aspx");
            }

            #region 11.3 DropDown List Fill Section

            FillDropDownList();

            #endregion 11.3 DropDown List Fill Section

            #region 11.4 Set Control Default Value

            if (Request.QueryString["CityID"] != null)
            {
                #region Load Data in Edit Mode

                lblPageHeader.Text = "City Edit";
                btnAdd.Text = "Update";

                #endregion Load Data in Edit Mode

                #region 11.5 Fill Controls

                FillControls(Convert.ToInt32(Request.QueryString["CityID"]));

                #endregion 11.5 Fill Controls
            }
            else
            {
                lblPageHeader.Text = "City Add";
            }

            #endregion 11.4 Set Control Default Value
        }
    }

    #endregion 11.0 Page Load Event

    #region 13.0 Fill DropDownList

    private void FillDropDownList()
    {
        CommonFillMethods.FillDropDownListStateID(ddlState);
    }

    #endregion 13.0 Fill DropDownList

    #region 14.0 FillControls By PK

    private void FillControls(Int32 CityID)
    {
        //lblPageHeader.Text = CV.PageHeaderEdit + " City";

        MST_CityBAL balMST_City = new MST_CityBAL();
        MST_CityENT entMST_City = new MST_CityENT();
        entMST_City = balMST_City.SelectPK(CityID);

        if (!entMST_City.CityName.IsNull)
            txtCityName.Text = entMST_City.CityName.Value.ToString();

        if (!entMST_City.STDCode.IsNull)
            txtSTDCode.Text = entMST_City.STDCode.Value.ToString();

        if (!entMST_City.StateID.IsNull)
            ddlState.SelectedValue = entMST_City.StateID.Value.ToString();
    }

    #endregion 14.0 FillControls By PK

    #region 15.0 Save Button Event

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["CityID"] == null)
        {
            MST_CityENT entMST_City = new MST_CityENT();

            if (txtCityName.Text.ToString().Trim() != "")
            {
                entMST_City.CityName = txtCityName.Text.ToString().Trim();
            }
            //if (txtPinCode.Text.ToString().Trim() != "")
            //{
            //    entMST_City.PinCode = txtPinCode.Text.ToString().Trim();
            //}
            if (txtSTDCode.Text.ToString().Trim() != "")
            {
                entMST_City.STDCode = txtSTDCode.Text.ToString().Trim();
            }
            if (ddlState.SelectedIndex > 0)
            {
                entMST_City.StateID = Convert.ToInt32(ddlState.SelectedValue);
            }

            entMST_City.CreationDate = DateTime.Now;

            entMST_City.ModificationDate = DateTime.Now;

            entMST_City.UserID = Convert.ToInt32(Session["UserID"]);

            MST_CityBAL balMST_City = new MST_CityBAL();

            if (balMST_City.Insert(entMST_City))
            {
                pnlAlert.Visible = true;
                lblMessage.Text = "Data Inserted Successfully.";
                ClearControls();
            }
        }
        else
        {
            MST_CityENT entMST_City = new MST_CityENT();
            if (txtCityName.Text.ToString().Trim() != "")
            {
                entMST_City.CityName = txtCityName.Text.ToString().Trim();
            }
            //if (txtPinCode.Text.ToString().Trim() != "")
            //{
            //    entMST_City.PinCode = txtPinCode.Text.ToString().Trim();
            //}
            if (txtSTDCode.Text.ToString().Trim() != "")
            {
                entMST_City.STDCode = txtSTDCode.Text.ToString().Trim();
            }
            if (ddlState.SelectedIndex > 0)
            {
                entMST_City.StateID = Convert.ToInt32(ddlState.SelectedValue);
            }

            entMST_City.CityID = Convert.ToInt32(Request.QueryString["CityID"]);

            entMST_City.ModificationDate = DateTime.Now;

            entMST_City.UserID = Convert.ToInt32(Session["UserID"]);

            MST_CityBAL balMST_City = new MST_CityBAL();

            if (balMST_City.Update(entMST_City))
            {
                Response.Redirect("~/AdminPanel/Master/MST_City/MST_CityList.aspx");
            }
        }
    }

    #endregion 15.0 Save Button Event

    #region 16.0 Clear Controls

    private void ClearControls()
    {
        txtCityName.Text = String.Empty;
        //txtPinCode.Text = String.Empty;
        txtSTDCode.Text = String.Empty;
        ddlState.SelectedIndex = 0;
        txtCityName.Focus();
    }

    #endregion 16.0 Clear Controls
}