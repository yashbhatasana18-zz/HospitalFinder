using System;
using System.Data;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Data.SqlClient;
using HospitalFinder.ENT;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace HospitalFinder.DAL
{
    public abstract class MST_CityDALBase : DataBaseConfig
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

        public Boolean Insert(MST_CityENT entMST_City)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_City_Insert");

                sqlDB.AddInParameter(dbCMD, "@StateID", SqlDbType.Int, entMST_City.StateID);
                sqlDB.AddInParameter(dbCMD, "@CityName", SqlDbType.VarChar, entMST_City.CityName);
                sqlDB.AddInParameter(dbCMD, "@PinCode", SqlDbType.VarChar, entMST_City.PinCode);
                sqlDB.AddInParameter(dbCMD, "@STDCode", SqlDbType.VarChar, entMST_City.STDCode);
                sqlDB.AddInParameter(dbCMD, "@CreationDate", SqlDbType.DateTime, entMST_City.CreationDate);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_City.ModificationDate);

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

        public Boolean Update(MST_CityENT entMST_City)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_City_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "@CityID", SqlDbType.Int, entMST_City.CityID);
                sqlDB.AddInParameter(dbCMD, "@StateID", SqlDbType.Int, entMST_City.StateID);
                sqlDB.AddInParameter(dbCMD, "@CityName", SqlDbType.VarChar, entMST_City.CityName);
                sqlDB.AddInParameter(dbCMD, "@PinCode", SqlDbType.VarChar, entMST_City.PinCode);
                sqlDB.AddInParameter(dbCMD, "@STDCode", SqlDbType.VarChar, entMST_City.STDCode);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_City.ModificationDate);

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

        public Boolean Delete(SqlInt32 CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_City_DeleteByPK");

                sqlDB.AddInParameter(dbCMD, "@CityID", SqlDbType.Int, CityID);

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

        public MST_CityENT SelectPK(SqlInt32 CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_City_SelectByPK");

                sqlDB.AddInParameter(dbCMD, "@CityID", SqlDbType.Int, CityID);

                MST_CityENT entMST_City = new MST_CityENT();
                DataBaseHelper DBH = new DataBaseHelper();
                using (IDataReader dr = DBH.ExecuteReader(sqlDB, dbCMD))
                {
                    while (dr.Read())
                    {
                        if (!dr["CityID"].Equals(System.DBNull.Value))
                            entMST_City.CityID = Convert.ToInt32(dr["CityID"]);

                        if (!dr["StateID"].Equals(System.DBNull.Value))
                            entMST_City.StateID = Convert.ToInt32(dr["StateID"]);

                        if (!dr["CityName"].Equals(System.DBNull.Value))
                            entMST_City.CityName = Convert.ToString(dr["CityName"]);

                        if (!dr["PinCode"].Equals(System.DBNull.Value))
                            entMST_City.PinCode = Convert.ToString(dr["PinCode"]);

                        if (!dr["STDCode"].Equals(System.DBNull.Value))
                            entMST_City.STDCode = Convert.ToString(dr["STDCode"]);
                    }
                }
                return entMST_City;
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
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_City_SelectAll");

                DataTable dtMST_City = new DataTable("PR_MST_City_SelectAll");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtMST_City);

                return dtMST_City;
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