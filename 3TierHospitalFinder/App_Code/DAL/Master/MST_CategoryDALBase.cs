using System;
using System.Data;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Data.SqlClient;
using HospitalFinder.ENT;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace HospitalFinder.DAL
{
    public abstract class MST_CategoryDALBase : DataBaseConfig
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

        public Boolean Insert(MST_CategoryENT entMST_Category)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Category_Insert");

                sqlDB.AddInParameter(dbCMD, "@CategoryName", SqlDbType.VarChar, entMST_Category.CategoryName);
                sqlDB.AddInParameter(dbCMD, "@CreationDate", SqlDbType.DateTime, entMST_Category.CreationDate);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_Category.ModificationDate);
                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, entMST_Category.UserID);

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

        public Boolean Update(MST_CategoryENT entMST_Category)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Category_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "@CategoryID", SqlDbType.Int, entMST_Category.CategoryID);
                sqlDB.AddInParameter(dbCMD, "@CategoryName", SqlDbType.VarChar, entMST_Category.CategoryName);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_Category.ModificationDate);

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

        public Boolean Delete(SqlInt32 CategoryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Category_DeleteByPK");

                sqlDB.AddInParameter(dbCMD, "@CategoryID", SqlDbType.Int, CategoryID);

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

        public MST_CategoryENT SelectPK(SqlInt32 CategoryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Category_SelectByPK");

                sqlDB.AddInParameter(dbCMD, "@CategoryID", SqlDbType.Int, CategoryID);

                MST_CategoryENT entMST_Category = new MST_CategoryENT();
                DataBaseHelper DBH = new DataBaseHelper();
                using (IDataReader dr = DBH.ExecuteReader(sqlDB, dbCMD))
                {
                    while (dr.Read())
                    {
                        if (!dr["CategoryID"].Equals(System.DBNull.Value))
                            entMST_Category.CategoryID = Convert.ToInt32(dr["CategoryID"]);

                        if (!dr["CategoryName"].Equals(System.DBNull.Value))
                            entMST_Category.CategoryName = Convert.ToString(dr["CategoryName"]);
                    }
                }
                return entMST_Category;
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
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Category_SelectAll");

                DataTable dtMST_Category = new DataTable("PR_MST_Category_SelectAll");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtMST_Category);

                return dtMST_Category;
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