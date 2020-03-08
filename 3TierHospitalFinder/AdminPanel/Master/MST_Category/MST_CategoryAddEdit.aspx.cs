using System;
using System.Web.UI;
using HospitalFinder.BAL;
using HospitalFinder.ENT;

public partial class AdminPanel_Master_MST_Category_MST_CategoryAddEdit : System.Web.UI.Page
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

            if (Request.QueryString["CategoryID"] != null)
            {
                #region Load Data in Edit Mode

                lblPageHeader.Text = "Category Edit";
                btnAdd.Text = "Update";
                FillControls(Convert.ToInt32(Request.QueryString["CategoryID"]));
                #endregion Load Data in Edit Mode
            }
            else
            {
                lblPageHeader.Text = "Category Add";
            }

            #endregion 11.4 Set Control Default Value

        }
    }

    #endregion 11.0 Page Load Event

    #region 14.0 FillControls By PK

    private void FillControls(Int32 CategoryID)
    {
        //lblPageHeader.Text = CV.PageHeaderEdit + " Category";

        MST_CategoryBAL balMST_Category = new MST_CategoryBAL();
        MST_CategoryENT entMST_Category = new MST_CategoryENT();
        entMST_Category = balMST_Category.SelectPK(CategoryID);

        if (!entMST_Category.CategoryName.IsNull)
            txtCategoryName.Text = entMST_Category.CategoryName.Value.ToString();
    }

    #endregion 14.0 FillControls By PK

    #region 15.0 Save Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["CategoryID"] == null)
        {
            MST_CategoryENT entMST_Category = new MST_CategoryENT();

            if (txtCategoryName.Text.ToString().Trim() != "")
            {
                entMST_Category.CategoryName = txtCategoryName.Text.ToString().Trim();
            }

            entMST_Category.CreationDate = DateTime.Now;
            entMST_Category.ModificationDate = DateTime.Now;
            entMST_Category.UserID = Convert.ToInt32(Session["UserID"]);

            MST_CategoryBAL balMST_Category = new MST_CategoryBAL();
            if (balMST_Category.Insert(entMST_Category))
            {
                pnlAlert.Visible = true;
                lblMessage.Text = "Data Inserted Successfully.";
                ClearControls();
            }
        }
        else
        {
            MST_CategoryENT entMST_Category = new MST_CategoryENT();
            if (txtCategoryName.Text.ToString().Trim() != "")
            {
                entMST_Category.CategoryName = txtCategoryName.Text.ToString().Trim();
            }
            entMST_Category.CategoryID = Convert.ToInt32(Request.QueryString["CategoryID"]);
            entMST_Category.ModificationDate = DateTime.Now;
            entMST_Category.UserID = Convert.ToInt32(Session["UserID"]);
            MST_CategoryBAL balMST_Category = new MST_CategoryBAL();
            if (balMST_Category.Update(entMST_Category))
            {
                Response.Redirect("~/AdminPanel/Master/MST_Category/MST_CategoryList.aspx");
            }
        }
    }
    #endregion 15.0 Save Button Event

    #region 16.0 Clear Controls

    private void ClearControls()
    {
        txtCategoryName.Text = String.Empty;
        txtCategoryName.Focus();
    }

    #endregion 16.0 Clear Controls

}