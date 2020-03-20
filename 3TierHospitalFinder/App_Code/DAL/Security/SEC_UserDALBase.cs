using System;
using System.Data;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using HospitalFinder.ENT;

namespace HospitalFinder.DAL
{
    public abstract class SEC_UserDALBase : DataBaseConfig
    {
        #region Properties

        private string _Message;
        public string Message
        {
            get
            {
                return _Message;
            }
            set
            {
                _Message = value;
            }
        }

        #endregion Properties

        #region InsertOperation

        public Boolean Insert(SEC_UserENT entSEC_User)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_Insert");
                
                sqlDB.AddInParameter(dbCMD, "@UserName", SqlDbType.VarChar, entSEC_User.UserName);
                sqlDB.AddInParameter(dbCMD, "@Password", SqlDbType.VarChar, entSEC_User.Password);
                sqlDB.AddInParameter(dbCMD, "@Email", SqlDbType.VarChar, entSEC_User.Email);
                sqlDB.AddInParameter(dbCMD, "@CreationDate", SqlDbType.DateTime, entSEC_User.CreationDate);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entSEC_User.ModificationDate);

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.ExecuteNonQuery(sqlDB, dbCMD);

                //entSEC_User.UserID = (SqlInt32)Convert.ToInt32(dbCMD.Parameters["@UserID"].Value);

                return true;
            }
            catch (SqlException sqlex)
            {
                Message = SQLDataExceptionMessage(sqlex);
                if (SQLDataExceptionHandler(sqlex))
                    throw;
                return false;
            }
            catch (Exception ex)
            {
                Message = ExceptionMessage(ex);
                if (ExceptionHandler(ex))
                    throw;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(SEC_UserENT entSEC_User)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_Update");

                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, entSEC_User.UserID);
                sqlDB.AddInParameter(dbCMD, "@UserName", SqlDbType.VarChar, entSEC_User.UserName);
                sqlDB.AddInParameter(dbCMD, "@Password", SqlDbType.VarChar, entSEC_User.Password);
                sqlDB.AddInParameter(dbCMD, "@Email", SqlDbType.VarChar, entSEC_User.Email);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entSEC_User.ModificationDate);

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.ExecuteNonQuery(sqlDB, dbCMD);

                return true;
            }
            catch (SqlException sqlex)
            {
                Message = SQLDataExceptionMessage(sqlex);
                if (SQLDataExceptionHandler(sqlex))
                    throw;
                return false;
            }
            catch (Exception ex)
            {
                Message = ExceptionMessage(ex);
                if (ExceptionHandler(ex))
                    throw;
                return false;
            }
        }

        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_Delete");

                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, UserID);

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.ExecuteNonQuery(sqlDB, dbCMD);

                return true;
            }
            catch (SqlException sqlex)
            {
                Message = SQLDataExceptionMessage(sqlex);
                if (SQLDataExceptionHandler(sqlex))
                    throw;
                return false;
            }
            catch (Exception ex)
            {
                Message = ExceptionMessage(ex);
                if (ExceptionHandler(ex))
                    throw;
                return false;
            }
        }

        #endregion DeleteOperation

        #region SelectOperation

        public SEC_UserENT SelectPK(SqlInt32 UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_SelectByPK");

                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, UserID);

                SEC_UserENT entSEC_User = new SEC_UserENT();
                DataBaseHelper DBH = new DataBaseHelper();
                using (IDataReader dr = DBH.ExecuteReader(sqlDB, dbCMD))
                {
                    while (dr.Read())
                    {
                        if (!dr["UserID"].Equals(System.DBNull.Value))
                            entSEC_User.UserID = Convert.ToInt32(dr["UserID"]);

                        if (!dr["UserName"].Equals(System.DBNull.Value))
                            entSEC_User.UserName = Convert.ToString(dr["UserName"]);

                        if (!dr["Password"].Equals(System.DBNull.Value))
                            entSEC_User.Password = Convert.ToString(dr["Password"]);

                        if (!dr["Email"].Equals(System.DBNull.Value))
                            entSEC_User.Email = Convert.ToString(dr["Email"]);

                        if (!dr["CreationDate"].Equals(System.DBNull.Value))
                            entSEC_User.CreationDate = Convert.ToDateTime(dr["CreationDate"]);

                        if (!dr["ModificationDate"].Equals(System.DBNull.Value))
                            entSEC_User.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);

                    }
                }
                return entSEC_User;
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
        public DataTable SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_SEC_User_SelectAll");

                DataTable dtSEC_User = new DataTable("PR_SEC_User_SelectAll");

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
       
        #endregion SelectOperation
    }
}