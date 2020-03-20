﻿<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RegisterRoutes(System.Web.Routing.RouteTable.Routes); 
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
    public static void RegisterRoutes(System.Web.Routing.RouteCollection routes)
    {
        routes.Ignore("{resource}.axd/{*pathInfo}");
        
        routes.MapPageRoute(
            "Default",
            "ClientPanel/Search",
            "~/ClientPanel/Default.aspx"
            );

        routes.MapPageRoute(
            "StateWiseHospital",
            "ClientPanel/StateWiseHospital",
            "~/ClientPanel/StateWiseHospital.aspx"
            );

        routes.MapPageRoute(
            "CityWiseHospital",
            "ClientPanel/CityWiseHospital",
            "~/ClientPanel/CityWiseHospital.aspx"
            );

        routes.MapPageRoute(
            "StateWiseHospitalList",
            "ClientPanel/StateWiseHospitalList/{StateID}",
            "~/ClientPanel/StateWiseHospitalList.aspx"
            );

        routes.MapPageRoute(
            "CityWiseHospitalList",
            "ClientPanel/CityWiseHospitalList/{CityID}",
            "~/ClientPanel/CityWiseHospitalList.aspx"
            );

        routes.MapPageRoute(
            "HospitalDetails",
            "ClientPanel/HospitalDetails/{HospitalID}",
            "~/ClientPanel/HospitalDetails.aspx"
            );
        
    }
</script>
