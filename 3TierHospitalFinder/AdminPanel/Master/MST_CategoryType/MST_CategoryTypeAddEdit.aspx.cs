using System;
using System.Web.UI;
using HospitalFinder.BAL;
using HospitalFinder.ENT;

public partial class AdminPanel_Master_MST_CategoryType_MST_CategoryTypeAddEdit : System.Web.UI.Page
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

            #region 11.4 Set Control Default Value

            if (Request.QueryString["CategoryTypeID"] != null)
            {
                #region Load Data in Edit Mode
                lblPageHeader.Text = "Category Type Edit";
                btnAdd.Text = "Update";
                FillControls(Convert.ToInt32(Request.QueryString["CategoryTypeID"]));
                #endregion Load Data in Edit Mode
            }
            else
            {
                lblPageHeader.Text = "Category Type Add";
            }

            #endregion 11.4 Set Control Default Value

        }
    }

    #endregion 11.0 Page Load Event

    #region 14.0 FillControls By PK

    private void FillControls(Int32 CategoryTypeID)
    {
        //lblPageHeader.Text = CV.PageHeaderEdit + " CategoryType";

        MST_CategoryTypeBAL balMST_CategoryType = new MST_CategoryTypeBAL();
        MST_CategoryTypeENT entMST_CategoryType = new MST_CategoryTypeENT();
        entMST_CategoryType = balMST_CategoryType.SelectPK(CategoryTypeID);

        if (!entMST_CategoryType.CategoryType.IsNull)
            txtCategoryType.Text = entMST_CategoryType.CategoryType.Value.ToString();
    }

    #endregion 14.0 FillControls By PK

    #region 15.0 Save Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["CategoryTypeID"] == null)
        {
            MST_CategoryTypeENT entMST_CategoryType = new MST_CategoryTypeENT();

            if (txtCategoryType.Text.ToString().Trim() != "")
            {
                entMST_CategoryType.CategoryType = txtCategoryType.Text.ToString().Trim();
            }

            entMST_CategoryType.CreationDate = DateTime.Now;
            entMST_CategoryType.ModificationDate = DateTime.Now;
            entMST_CategoryType.UserID = Convert.ToInt32(Session["UserID"]);

            MST_CategoryTypeBAL balMST_CategoryType = new MST_CategoryTypeBAL();
            if (balMST_CategoryType.Insert(entMST_CategoryType))
            {
                pnlAlert.Visible = true;
                lblMessage.Text = "Data Inserted Successfully.";
                ClearControls();
            }
        }
        else
        {
            MST_CategoryTypeENT entMST_CategoryType = new MST_CategoryTypeENT();
            if (txtCategoryType.Text.ToString().Trim() != "")
            {
                entMST_CategoryType.CategoryType = txtCategoryType.Text.ToString().Trim();
            }
            entMST_CategoryType.CategoryTypeID = Convert.ToInt32(Request.QueryString["CategoryTypeID"]);
            entMST_CategoryType.ModificationDate = DateTime.Now;
            entMST_CategoryType.UserID = Convert.ToInt32(Session["UserID"]);
            MST_CategoryTypeBAL balMST_CategoryType = new MST_CategoryTypeBAL();
            if (balMST_CategoryType.Update(entMST_CategoryType))
            {
                Response.Redirect("~/AdminPanel/Master/MST_CategoryType/MST_CategoryTypeList.aspx");
            }
        }
    }
    #endregion 15.0 Save Button Event

    #region 16.0 Clear Controls

    private void ClearControls()
    {
        txtCategoryType.Text = String.Empty;
        txtCategoryType.Focus();
    }

    #endregion 16.0 Clear Controls
}