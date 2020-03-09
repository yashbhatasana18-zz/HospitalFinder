using HospitalFinder.BAL;
using HospitalFinder.ENT;
using HospitalFinder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Master_MST_Hospital_MST_HospitalAddEdit : System.Web.UI.Page
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

            if (Request.QueryString["HospitalID"] != null)
            {
                #region Load Data in Edit Mode

                lblPageHeader.Text = "Hospital Edit";
                btnAdd.Text = "Update";

                #endregion Load Data in Edit Mode

                #region 11.5 Fill Controls

                FillControls(Convert.ToInt32(Request.QueryString["HospitalID"]));

                #endregion 11.5 Fill Controls
            }
            else
            {
                lblPageHeader.Text = "Hospital Add";
            }

            #endregion 11.4 Set Control Default Value
        }
    }

    #endregion 11.0 Page Load Event

    #region 13.0 Fill DropDownList

    private void FillDropDownList()
    {
        CommonFillMethods.FillDropDownListCityID(ddlCity);
        CommonFillMethods.FillDropDownListCategoryID(ddlCategory);
        CommonFillMethods.FillDropDownListCategoryTypeID(ddlCategoryType);
    }

    #endregion 13.0 Fill DropDownList

    #region 14.0 FillControls By PK

    private void FillControls(Int32 HospitalID)
    {
        //lblPageHeader.Text = CV.PageHeaderEdit + " Hospital";

        MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();
        MST_HospitalENT entMST_Hospital = new MST_HospitalENT();
        entMST_Hospital = balMST_Hospital.SelectPK(HospitalID);

        if (!entMST_Hospital.HospitalName.IsNull)
            txtHospitalName.Text = entMST_Hospital.HospitalName.Value.ToString();

        if (!entMST_Hospital.CityID.IsNull)
            ddlCity.SelectedValue = entMST_Hospital.CityID.Value.ToString();

        if (!entMST_Hospital.CategoryID.IsNull)
            ddlCategory.SelectedValue = entMST_Hospital.CategoryID.Value.ToString();

        if (!entMST_Hospital.CategoryTypeID.IsNull)
            ddlCategoryType.SelectedValue = entMST_Hospital.CategoryTypeID.Value.ToString();

        if (!entMST_Hospital.Address.IsNull)
            txtAddress.Text = entMST_Hospital.Address.Value.ToString();

        if (!entMST_Hospital.MobileNumber.IsNull)
            txtMobileNumber.Text = entMST_Hospital.MobileNumber.Value.ToString();

        if (!entMST_Hospital.TelePhoneNumber.IsNull)
            txtTelePhoneNumber.Text = entMST_Hospital.TelePhoneNumber.Value.ToString();

        if (!entMST_Hospital.Fax.IsNull)
            txtFax.Text = entMST_Hospital.Fax.Value.ToString();

        if (!entMST_Hospital.Website.IsNull)
            txtWebsite.Text = entMST_Hospital.Website.Value.ToString();

        if (!entMST_Hospital.EmailID.IsNull)
            txtEmailAddress.Text = entMST_Hospital.EmailID.Value.ToString();

        if (!entMST_Hospital.AmbulancePhoneNumber.IsNull)
            txtAmbulancePhoneNumber.Text = entMST_Hospital.AmbulancePhoneNumber.Value.ToString();

        if (!entMST_Hospital.EmergencyNumber.IsNull)
            txtEmergencyNumber.Text = entMST_Hospital.EmergencyNumber.Value.ToString();
    }

    #endregion 14.0 FillControls By PK

    #region 15.0 Save Button Event

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["HospitalID"] == null)
        {
            MST_HospitalENT entMST_Hospital = new MST_HospitalENT();

            if (txtHospitalName.Text.ToString().Trim() != "")
            {
                entMST_Hospital.HospitalName = txtHospitalName.Text.ToString().Trim();
            }
            if (ddlCity.SelectedIndex > 0)
            {
                entMST_Hospital.CityID = Convert.ToInt32(ddlCity.SelectedValue);
            }
            if (ddlCategory.SelectedIndex > 0)
            {
                entMST_Hospital.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
            }
            if (ddlCategoryType.SelectedIndex > 0)
            {
                entMST_Hospital.CategoryTypeID = Convert.ToInt32(ddlCategoryType.SelectedValue);
            }
            if (txtAddress.Text.ToString().Trim() != "")
            {
                entMST_Hospital.Address = txtAddress.Text.ToString().Trim();
            }
           
            if (txtMobileNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.MobileNumber = txtMobileNumber.Text.ToString().Trim();
            }
            if (txtTelePhoneNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.TelePhoneNumber = txtTelePhoneNumber.Text.ToString().Trim();
            }
            if (txtFax.Text.ToString().Trim() != "")
            {
                entMST_Hospital.Fax = txtFax.Text.ToString().Trim();
            }
            if (txtWebsite.Text.ToString().Trim() != "")
            {
                entMST_Hospital.Website = txtWebsite.Text.ToString().Trim();
            }
            if (txtEmailAddress.Text.ToString().Trim() != "")
            {
                entMST_Hospital.EmailID = txtEmailAddress.Text.ToString().Trim();
            }
            if (txtAmbulancePhoneNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.AmbulancePhoneNumber = txtAmbulancePhoneNumber.Text.ToString().Trim();
            }
            if (txtEmergencyNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.EmergencyNumber = txtEmergencyNumber.Text.ToString().Trim();
            }

            entMST_Hospital.CreationDate = DateTime.Now;

            entMST_Hospital.ModificationDate = DateTime.Now;

            entMST_Hospital.UserID = Convert.ToInt32(Session["UserID"]);

            MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();

            if (balMST_Hospital.Insert(entMST_Hospital))
            {
                pnlAlert.Visible = true;
                lblMessage.Text = "Data Inserted Successfully.";
                ClearControls();
            }
           
        }
        else
        {
            MST_HospitalENT entMST_Hospital = new MST_HospitalENT();

            if (txtHospitalName.Text.ToString().Trim() != "")
            {
                entMST_Hospital.HospitalName = txtHospitalName.Text.ToString().Trim();
            }
            if (ddlCity.SelectedIndex > 0)
            {
                entMST_Hospital.CityID = Convert.ToInt32(ddlCity.SelectedValue);
            }
            if (ddlCategory.SelectedIndex > 0)
            {
                entMST_Hospital.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
            }
            if (ddlCategoryType.SelectedIndex > 0)
            {
                entMST_Hospital.CategoryTypeID = Convert.ToInt32(ddlCategoryType.SelectedValue);
            }
            if (txtAddress.Text.ToString().Trim() != "")
            {
                entMST_Hospital.Address = txtAddress.Text.ToString().Trim();
            }
            if (txtMobileNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.MobileNumber = txtMobileNumber.Text.ToString().Trim();
            }
            if (txtTelePhoneNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.TelePhoneNumber = txtTelePhoneNumber.Text.ToString().Trim();
            }
            if (txtFax.Text.ToString().Trim() != "")
            {
                entMST_Hospital.Fax = txtFax.Text.ToString().Trim();
            }
            if (txtWebsite.Text.ToString().Trim() != "")
            {
                entMST_Hospital.Website = txtWebsite.Text.ToString().Trim();
            }
            if (txtEmailAddress.Text.ToString().Trim() != "")
            {
                entMST_Hospital.EmailID = txtEmailAddress.Text.ToString().Trim();
            }
            if (txtAmbulancePhoneNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.AmbulancePhoneNumber = txtAmbulancePhoneNumber.Text.ToString().Trim();
            }
            if (txtEmergencyNumber.Text.ToString().Trim() != "")
            {
                entMST_Hospital.EmergencyNumber = txtEmergencyNumber.Text.ToString().Trim();
            }

            entMST_Hospital.HospitalID = Convert.ToInt32(Request.QueryString["HospitalID"]);

            entMST_Hospital.ModificationDate = DateTime.Now;

            entMST_Hospital.UserID = Convert.ToInt32(Session["UserID"]);

            MST_HospitalBAL balMST_Hospital = new MST_HospitalBAL();

            if (balMST_Hospital.Update(entMST_Hospital))
            {
                Response.Redirect("~/AdminPanel/Master/MST_Hospital/MST_HospitalList.aspx");
            }
        }
    }

    #endregion 15.0 Save Button Event

    #region 16.0 Clear Controls

    private void ClearControls()
    {
        txtHospitalName.Text = String.Empty;
        ddlCity.SelectedIndex = 0;
        ddlCategoryType.SelectedIndex = 0;
        ddlCategory.SelectedIndex = 0;
        txtAddress.Text = String.Empty;
        txtMobileNumber.Text = String.Empty;
        txtTelePhoneNumber.Text = String.Empty;
        txtFax.Text = String.Empty;
        txtWebsite.Text = String.Empty;
        txtEmailAddress.Text = String.Empty;
        txtAmbulancePhoneNumber.Text = String.Empty;
        txtEmergencyNumber.Text = String.Empty;

        txtHospitalName.Focus();
    }

    #endregion 16.0 Clear Controls
}