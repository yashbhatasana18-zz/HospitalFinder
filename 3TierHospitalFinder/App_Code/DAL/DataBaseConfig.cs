using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HospitalFinder.DAL
{
    public class DataBaseConfig
    {
        public string myConnectionString = ConfigurationManager.ConnectionStrings["HFConnectionString"].ConnectionString;

        public string GetErrorMessage(int Error)
        {
            return "";
        }

        public string Error547 = "This record cannot be inserted or deleted.\n Violation of foreignkey";
        public string Error547Delete = "This record cannot be inserted or deleted.\n Violation of foreignkey";
        public string Error2627 = "Duplicate value cannot be inserted.\nViolation of uniqueness.";
        public string Error2601 = "Duplicate value cannot be inserted.\nViolation of uniqueness.";
        public string SQLDataExceptionMessage(SqlException sqlex)
        {
            switch (sqlex.Number)
            {
                case 17:
                    //     SQL Server does not exist or access denied. 
                    return "SQL Server does not exist or access denied.";
                //case 4060:
                //    // Invalid Database  
                //    return "Invalid Database";
                case 18456:
                    // Login Failed 
                    return "Login Failed ";
                case 547:
                    // ForeignKey Violation 
                    return Error547;
                case 2627:
                    // Unique Index/Constriant Violation 
                    return Error2627;
                case 2601:
                    // Unique Index/Constriant Violation 
                    return Error2601;
                default:
                    // throw a general DAL Exception 
                    return sqlex.Message;
            }
        }
        public Boolean SQLDataExceptionHandler(SqlException sqlex)
        {
            return true;
        }
        public bool SQLDataExceptionLogger(SqlException sqlex)
        {
            return false;
        }
        public string ExceptionMessage(Exception ex)
        {
            return "";
        }
        public Boolean ExceptionHandler(Exception ex)
        {
            return true;
        }
    }
}
