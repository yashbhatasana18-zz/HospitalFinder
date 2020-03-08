using System;
using System.Data;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Data.SqlClient;
using HospitalFinder.ENT;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace HospitalFinder.DAL
{
    public abstract class MST_CategoryTypeDALBase : DataBaseConfig
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

        public Boolean Insert(MST_CategoryTypeENT entMST_CategoryType)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_CategoryType_Insert");

                sqlDB.AddInParameter(dbCMD, "@CategoryType", SqlDbType.VarChar, entMST_CategoryType.CategoryType);
                sqlDB.AddInParameter(dbCMD, "@CreationDate", SqlDbType.DateTime, entMST_CategoryType.CreationDate);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_CategoryType.ModificationDate);

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

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(MST_CategoryTypeENT entMST_CategoryType)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_CategoryType_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "@CategoryTypeID", SqlDbType.Int, entMST_CategoryType.CategoryTypeID);
                sqlDB.AddInParameter(dbCMD, "@CategoryType", SqlDbType.VarChar, entMST_CategoryType.CategoryType);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_CategoryType.ModificationDate);

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

        public Boolean Delete(SqlInt32 CategoryTypeID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_CategoryType_DeleteByPK");

                sqlDB.AddInParameter(dbCMD, "@CategoryTypeID", SqlDbType.Int, CategoryTypeID);

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

        public MST_CategoryTypeENT SelectPK(SqlInt32 CategoryTypeID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_CategoryType_SelectByPK");

                sqlDB.AddInParameter(dbCMD, "@CategoryTypeID", SqlDbType.Int, CategoryTypeID);

                MST_CategoryTypeENT entMST_CategoryType = new MST_CategoryTypeENT();
                DataBaseHelper DBH = new DataBaseHelper();
                using (IDataReader dr = DBH.ExecuteReader(sqlDB, dbCMD))
                {
                    while (dr.Read())
                    {
                        if (!dr["CategoryTypeID"].Equals(System.DBNull.Value))
                            entMST_CategoryType.CategoryTypeID = Convert.ToInt32(dr["CategoryTypeID"]);

                        if (!dr["CategoryType"].Equals(System.DBNull.Value))
                            entMST_CategoryType.CategoryType = Convert.ToString(dr["CategoryType"]);
                    }
                }
                return entMST_CategoryType;
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
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_CategoryType_SelectAll");

                DataTable dtMST_CategoryType = new DataTable("PR_MST_CategoryType_SelectAll");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtMST_CategoryType);

                return dtMST_CategoryType;
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