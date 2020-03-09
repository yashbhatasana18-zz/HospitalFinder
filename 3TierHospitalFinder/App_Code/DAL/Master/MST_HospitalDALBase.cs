using System;
using System.Data;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Data.SqlClient;
using HospitalFinder.ENT;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace HospitalFinder.DAL
{
    public abstract class MST_HospitalDALBase : DataBaseConfig
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

        public Boolean Insert(MST_HospitalENT entMST_Hospital)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Hospital_Insert");

                sqlDB.AddInParameter(dbCMD, "@HospitalName", SqlDbType.VarChar, entMST_Hospital.HospitalName);
                sqlDB.AddInParameter(dbCMD, "@CityID", SqlDbType.Int, entMST_Hospital.CityID);
                sqlDB.AddInParameter(dbCMD, "@CategoryID", SqlDbType.Int, entMST_Hospital.CategoryID);
                sqlDB.AddInParameter(dbCMD, "@CategoryTypeID", SqlDbType.Int, entMST_Hospital.CategoryTypeID);
                sqlDB.AddInParameter(dbCMD, "@Address", SqlDbType.VarChar, entMST_Hospital.Address);
                sqlDB.AddInParameter(dbCMD, "@MobileNumber", SqlDbType.VarChar, entMST_Hospital.MobileNumber);
                sqlDB.AddInParameter(dbCMD, "@TelePhoneNumber", SqlDbType.VarChar, entMST_Hospital.TelePhoneNumber);
                sqlDB.AddInParameter(dbCMD, "@Fax", SqlDbType.VarChar, entMST_Hospital.Fax);
                sqlDB.AddInParameter(dbCMD, "@Website", SqlDbType.VarChar, entMST_Hospital.Website);
                sqlDB.AddInParameter(dbCMD, "@EmailID", SqlDbType.VarChar, entMST_Hospital.EmailID);
                sqlDB.AddInParameter(dbCMD, "@AmbulancePhoneNumber", SqlDbType.VarChar, entMST_Hospital.AmbulancePhoneNumber);
                sqlDB.AddInParameter(dbCMD, "@EmergencyNumber", SqlDbType.VarChar, entMST_Hospital.EmergencyNumber);
                sqlDB.AddInParameter(dbCMD, "@CreationDate", SqlDbType.DateTime, entMST_Hospital.CreationDate);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_Hospital.ModificationDate);
                sqlDB.AddInParameter(dbCMD, "@UserID", SqlDbType.Int, entMST_Hospital.UserID);

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

        public Boolean Update(MST_HospitalENT entMST_Hospital)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Hospital_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "@HospitalID", SqlDbType.Int, entMST_Hospital.HospitalID);
                sqlDB.AddInParameter(dbCMD, "@HospitalName", SqlDbType.VarChar, entMST_Hospital.HospitalName);
                sqlDB.AddInParameter(dbCMD, "@CityID", SqlDbType.Int, entMST_Hospital.CityID);
                sqlDB.AddInParameter(dbCMD, "@CategoryTypeID", SqlDbType.Int, entMST_Hospital.CategoryTypeID);
                sqlDB.AddInParameter(dbCMD, "@CategoryID", SqlDbType.Int, entMST_Hospital.CategoryID);
                sqlDB.AddInParameter(dbCMD, "@Address", SqlDbType.VarChar, entMST_Hospital.Address);
                sqlDB.AddInParameter(dbCMD, "@MobileNumber", SqlDbType.VarChar, entMST_Hospital.MobileNumber);
                sqlDB.AddInParameter(dbCMD, "@TelePhoneNumber", SqlDbType.VarChar, entMST_Hospital.TelePhoneNumber);
                sqlDB.AddInParameter(dbCMD, "@Fax", SqlDbType.VarChar, entMST_Hospital.Fax);
                sqlDB.AddInParameter(dbCMD, "@Website", SqlDbType.VarChar, entMST_Hospital.Website);
                sqlDB.AddInParameter(dbCMD, "@EmailID", SqlDbType.VarChar, entMST_Hospital.EmailID);
                sqlDB.AddInParameter(dbCMD, "@AmbulancePhoneNumber", SqlDbType.VarChar, entMST_Hospital.AmbulancePhoneNumber);
                sqlDB.AddInParameter(dbCMD, "@EmergencyNumber", SqlDbType.VarChar, entMST_Hospital.EmergencyNumber);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate", SqlDbType.DateTime, entMST_Hospital.ModificationDate);

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

        public Boolean Delete(SqlInt32 HospitalID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Hospital_DeleteByPK");

                sqlDB.AddInParameter(dbCMD, "@HospitalID", SqlDbType.Int, HospitalID);

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

        public MST_HospitalENT SelectPK(SqlInt32 HospitalID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Hospital_SelectByPK");

                sqlDB.AddInParameter(dbCMD, "@HospitalID", SqlDbType.Int, HospitalID);

                MST_HospitalENT entMST_Hospital = new MST_HospitalENT();
                DataBaseHelper DBH = new DataBaseHelper();
                using (IDataReader dr = DBH.ExecuteReader(sqlDB, dbCMD))
                {
                    while (dr.Read())
                    {
                        if (!dr["HospitalID"].Equals(System.DBNull.Value))
                            entMST_Hospital.HospitalID = Convert.ToInt32(dr["HospitalID"]);

                        if (!dr["HospitalName"].Equals(System.DBNull.Value))
                            entMST_Hospital.HospitalName = Convert.ToString(dr["HospitalName"]);

                        if (!dr["CityID"].Equals(System.DBNull.Value))
                            entMST_Hospital.CityID = Convert.ToInt32(dr["CityID"]);

                        if (!dr["CategoryID"].Equals(System.DBNull.Value))
                            entMST_Hospital.CategoryID = Convert.ToInt32(dr["CategoryID"]);

                        if (!dr["CategoryTypeID"].Equals(System.DBNull.Value))
                            entMST_Hospital.CategoryTypeID = Convert.ToInt32(dr["CategoryTypeID"]);

                        if (!dr["Address"].Equals(System.DBNull.Value))
                            entMST_Hospital.Address = Convert.ToString(dr["Address"]);

                        if (!dr["MobileNumber"].Equals(System.DBNull.Value))
                            entMST_Hospital.MobileNumber = Convert.ToString(dr["MobileNumber"]);

                        if (!dr["TelephoneNumber"].Equals(System.DBNull.Value))
                            entMST_Hospital.TelePhoneNumber = Convert.ToString(dr["TelephoneNumber"]);

                        if (!dr["Fax"].Equals(System.DBNull.Value))
                            entMST_Hospital.Fax = Convert.ToString(dr["Fax"]);

                        if (!dr["Website"].Equals(System.DBNull.Value))
                            entMST_Hospital.Website = Convert.ToString(dr["Website"]);

                        if (!dr["EmailID"].Equals(System.DBNull.Value))
                            entMST_Hospital.EmailID = Convert.ToString(dr["EmailID"]);

                        if (!dr["AmbulancePhoneNumber"].Equals(System.DBNull.Value))
                            entMST_Hospital.AmbulancePhoneNumber = Convert.ToString(dr["AmbulancePhoneNumber"]);

                        if (!dr["EmergencyNumber"].Equals(System.DBNull.Value))
                            entMST_Hospital.EmergencyNumber = Convert.ToString(dr["EmergencyNumber"]);
                    }
                }
                return entMST_Hospital;
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
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_MST_Hospital_SelectAll");

                DataTable dtMST_Hospital = new DataTable("PR_MST_Hospital_SelectAll");

                DataBaseHelper DBH = new DataBaseHelper();
                DBH.LoadDataTable(sqlDB, dbCMD, dtMST_Hospital);

                return dtMST_Hospital;
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