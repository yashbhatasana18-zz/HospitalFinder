using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using HospitalFinder.BAL;
using HospitalFinder.ENT;
using HospitalFinder;


public partial class AdminPanel_Master_MST_State_MST_StateAddEdit : System.Web.UI.Page
{
    #region 11.0 Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            #region 11.4 Set Control Default Value

            if (Request.QueryString["StateID"] != null)
            {
                #region Load Data in Edit Mode

                lblPageHeader.Text = "State Edit";
                btnAdd.Text = "Update";
                FillControls(Convert.ToInt32(Request.QueryString["StateID"]));

                #endregion Load Data in Edit Mode
            }
            else
            {
                lblPageHeader.Text = "State Add";
            }

            #endregion 11.4 Set Control Default Value

        }
    }

    #endregion 11.0 Page Load Event

    #region 14.0 FillControls By PK

    private void FillControls( Int32 StateID)
    {
        //lblPageHeader.Text = CV.PageHeaderEdit + " State";

        MST_StateBAL balMST_State = new MST_StateBAL();
        MST_StateENT entMST_State = new MST_StateENT();
        entMST_State = balMST_State.SelectPK(StateID);

        if (!entMST_State.StateName.IsNull)
            txtStateName.Text = entMST_State.StateName.Value.ToString();
    }

    #endregion 14.0 FillControls By PK

    #region 15.0 Save Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["StateID"] == null)
        {
            MST_StateENT entMST_State = new MST_StateENT();

            if (txtStateName.Text.ToString().Trim() != "")
            {
                entMST_State.StateName = txtStateName.Text.ToString().Trim();
            }

            entMST_State.CreationDate = DateTime.Now;
            entMST_State.ModificationDate = DateTime.Now;

            MST_StateBAL balMST_State = new MST_StateBAL();
            if (balMST_State.Insert(entMST_State))
            {
                lblMessage.Text = "Data Inserted Successfully.";
                ClearControls();
            }
        }
        else
        {
            MST_StateENT entMST_State = new MST_StateENT();
            if (txtStateName.Text.ToString().Trim() != "")
            {
                entMST_State.StateName = txtStateName.Text.ToString().Trim();
            }
            entMST_State.StateID = Convert.ToInt32(Request.QueryString["StateID"]);
            entMST_State.ModificationDate = DateTime.Now;
            MST_StateBAL balMST_State = new MST_StateBAL();
            if (balMST_State.Update(entMST_State))
            {
                Response.Redirect("~/AdminPanel/Master/MST_State/MST_StateList.aspx");
            }
        }
    }
    #endregion 15.0 Save Button Event

    #region 16.0 Clear Controls

    private void ClearControls()
    {
        txtStateName.Text = String.Empty;
        txtStateName.Focus();
    }

    #endregion 16.0 Clear Controls

}
