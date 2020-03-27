using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Services;
using HospitalFinder;
using HospitalFinder.BAL;

/// <summary>
/// Summary description for FillMenu
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class FillMenu : System.Web.Services.WebService
{

    //public FillMenu()
    //{

    //    //Uncomment the following line if using designed components 
    //    //InitializeComponent(); 
    //}

    //[WebMethod]
    //public string HelloWorld()
    //{
    //    return "Hello World";
    //}

    //[WebMethod]
    //public String FillMenuByUserGroupID(Int32 UserGroupID)
    //{
    //    SqlInt32 CompanyID = SqlInt32.Null;
    //    string strDomainURL = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + CV.AppendForMenu;
    //    String MenuData = LoadMenu(UserGroupID, CompanyID, strDomainURL);
    //    return MenuData;
    //}

    //#region Menu Function
    //private String LoadMenu(SqlInt32 UserGroupID, SqlInt32 CompanyID, String strDomainURL)
    //{
    //    String CurrentURL = HttpContext.Current.Request.Url.AbsoluteUri;
    //    String strMenu = "";

    //    DataTable dtMenu = new DataTable();
    //    SEC_MenuBAL balSEC_Menu = new SEC_MenuBAL();

    //    dtMenu = balSEC_Menu.SelectMenuHierarchyByUserGroupID(UserGroupID);

    //    if (dtMenu != null && dtMenu.Rows.Count > 0)
    //    {
    //        DataTable dtParentMenu = dtMenu.Select("ParentMenuID IS NULL").Distinct().CopyToDataTable().DefaultView.ToTable();
    //        foreach (DataRow drParentMenu in dtParentMenu.Rows)
    //        {
    //            if (dtMenu.Select("ParentMenuID = " + drParentMenu["MenuID"]).Length > 0)
    //            {
    //                strMenu += FillSubMenu(Convert.ToInt32(drParentMenu["MenuID"]), dtMenu, drParentMenu, strDomainURL);
    //            }
    //            else
    //            {
    //                strMenu += " <li>";
    //                strMenu += " <a href='" + drParentMenu["MenuURL"].ToString().Replace("~", strDomainURL) + "'>" + drParentMenu["MenuName"].ToString() + " </a>";
    //                strMenu += " </li>";
    //            }
    //        }
    //    }
    //    return strMenu;
    //}

    //private String FillSubMenu(SqlInt32 ParentMenuID, DataTable dtMenu, DataRow drMenu, String strDomainURL)
    //{
    //    String strMenu = String.Empty;

    //    if (dtMenu.Select("ParentMenuID = " + ParentMenuID.Value).Length > 0)
    //    {
    //        DataTable dtChildMenu = dtMenu.Select("ParentMenuID = " + ParentMenuID.Value).Distinct().CopyToDataTable().DefaultView.ToTable();
    //        if (!drMenu["HierarchyLevel"].Equals(DBNull.Value) && Convert.ToInt32(drMenu["HierarchyLevel"]) == 1)
    //        {
    //            strMenu += "<li class='menu-dropdown classic-menu-dropdown'>";
    //            //if (!drMenu["IconClassName"].Equals(DBNull.Value))
    //            //{
    //            //    strMenu += "<i class='" + drMenu["IconClassName"] .ToString()+ "'></i>";
    //            //}
    //            strMenu += " <a data-hover='megamenu-dropdown' data-close-others='true' data-toggle='dropdown' href='javascript:;' class='hover-initialized'>" + drMenu["MenuName"].ToString() + " <i class='fa fa-angle-down'></i></a>";
    //            strMenu += "<ul class='dropdown-menu pull-left'>";
    //        }
    //        else
    //        {
    //            strMenu += "<li class=' dropdown-submenu'>";
    //            strMenu += " <a href='javascript:;'>"  + drMenu["MenuName"].ToString() + " </a>";
    //            strMenu += "<ul class='dropdown-menu'>";
    //        }

    //        foreach (DataRow drChildMenu in dtChildMenu.Rows)
    //        {
    //            strMenu += FillSubMenu(Convert.ToInt32(drChildMenu["MenuID"]), dtMenu, drChildMenu, strDomainURL);
    //        }

    //        strMenu += "</ul>";
    //        strMenu += "</li>";
    //    }
    //    else
    //    {
    //        strMenu += "<li class=' '><a href='" + drMenu["MenuURL"].ToString().Replace("~", strDomainURL) + "'>" + drMenu["MenuName"].ToString() + "</a></li>";
    //    }

    //    return strMenu;
    //}

    
    //#endregion Menu Function
}
