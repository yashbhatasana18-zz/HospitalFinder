using System;
using System.Data;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace HospitalFinder.DAL
{
    public class SEC_UserDAL : SEC_UserDALBase
    {
        #region SelectDuplicate
        public DataTable SelectDuplicate(SqlInt32 UserID, SqlString Email)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_Verify");

                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, UserID);
                sqlDB.AddInParameter(dbCMD, "@Email", SqlDbType.VarChar, Email);

                DataTable dt = new DataTable("PR_SEC_User_Verify");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dt);

                return dt;
            }
            catch (SqlException sqlex)
            {
                Message = SQLDataExceptionMessage(sqlex);
                if (SQLDataExceptionHandler(sqlex))
                    throw;
                return null;
            }
            catch (Exception ex)
            {
                Message = ExceptionMessage(ex);
                if (ExceptionHandler(ex))
                    throw;
                return null;
            }
        }
        #endregion SelectDuplicate

        #region UserLogIn
        public DataTable UserLogIn(SqlString UserName, SqlString Password)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_Login");

                sqlDB.AddInParameter(dbCMD, "@UserName", SqlDbType.VarChar, UserName);
                sqlDB.AddInParameter(dbCMD, "@Password", SqlDbType.VarChar, Password);

                DataTable dtSEC_User = new DataTable("PR_SEC_User_Login");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtSEC_User);

                return dtSEC_User;
            }
            catch (SqlException sqlex)
            {
                Message = SQLDataExceptionMessage(sqlex);
                if (SQLDataExceptionHandler(sqlex))
                    throw;
                return null;
            }
            catch (Exception ex)
            {
                Message = ExceptionMessage(ex);
                if (ExceptionHandler(ex))
                    throw;
                return null;
            }
        }
        #endregion UserLogIn

        #region Check Password

        public DataTable CheckPassword(SqlInt32 UserID, SqlString UserName, SqlString UserPassword)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_CheckPassword");

                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, UserID);
                sqlDB.AddInParameter(dbCMD, "@UserName", SqlDbType.VarChar, UserName);
                sqlDB.AddInParameter(dbCMD, "@UserPassword", SqlDbType.VarChar, UserPassword);

                DataTable dtSEC_User = new DataTable("PR_SEC_User_CheckPassword");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtSEC_User);

                return dtSEC_User;
            }
            catch (SqlException sqlex)
            {
                Message = SQLDataExceptionMessage(sqlex);
                if (SQLDataExceptionHandler(sqlex))
                    throw;
                return null;
            }
            catch (Exception ex)
            {
                Message = ExceptionMessage(ex);
                if (ExceptionHandler(ex))
                    throw;
                return null;
            }
        }

        #endregion Check Password
    }
}