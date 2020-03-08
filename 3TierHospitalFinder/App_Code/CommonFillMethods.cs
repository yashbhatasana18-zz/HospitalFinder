using System.Web.UI.WebControls;
using HospitalFinder.BAL;
namespace HospitalFinder
{
    public class CommonFillMethods
    {
        public CommonFillMethods()
        {
        }
        public static void FillDropDownListStateID(DropDownList ddl)
        {
            MST_StateBAL balMST_State = new MST_StateBAL();
            ddl.DataSource = balMST_State.SelectComboBox();
            ddl.DataValueField = "StateID";
            ddl.DataTextField = "StateName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("---Select State---", "-99"));
        }
        public static void FillDropDownListCityID(DropDownList ddl)
        {
            MST_CityBAL balMST_City = new MST_CityBAL();
            ddl.DataSource = balMST_City.SelectComboBox();
            ddl.DataValueField = "CityID";
            ddl.DataTextField = "CityName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("---Select City---", "-99"));
        }
        public static void FillDropDownListCategoryID(DropDownList ddl)
        {
            MST_CategoryBAL balMST_Category = new MST_CategoryBAL();
            ddl.DataSource = balMST_Category.SelectComboBox();
            ddl.DataValueField = "CategoryID";
            ddl.DataTextField = "CategoryName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("---Select Category Name---", "-99"));
        }
        public static void FillDropDownListCategoryTypeID(DropDownList ddl)
        {
            MST_CategoryTypeBAL balMST_CategoryType = new MST_CategoryTypeBAL();
            ddl.DataSource = balMST_CategoryType.SelectComboBox();
            ddl.DataValueField = "CategoryTypeID";
            ddl.DataTextField = "CategoryType";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("---Select Category Type---", "-99"));
        }
    }
}
