using System;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;
using HospitalFinder.ENT;

namespace HospitalFinder.BAL
{
    public abstract class MST_CityBALBase
    {
        #region Private Fields

        private string _Message;

        #endregion Private Fields

        #region Public Properties

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

        #endregion Public Properties

        #region InsertOperation

        public Boolean Insert(MST_CityENT entMST_City)
        {
            MST_CityDAL dalMST_City = new MST_CityDAL();
            if (dalMST_City.Insert(entMST_City))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_City.Message;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(MST_CityENT entMST_City)
        {
            MST_CityDAL dalMST_City = new MST_CityDAL();
            if (dalMST_City.Update(entMST_City))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_City.Message;
                return false;
            }
        }

        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 StateID)
        {
            MST_CityDAL dalMST_City = new MST_CityDAL();
            if (dalMST_City.Delete(StateID))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_City.Message;
                return false;
            }
        }

        #endregion DeleteOperation

        #region SelectOperation

        public MST_CityENT SelectPK(SqlInt32 StateID)
        {
            MST_CityDAL dalMST_City = new MST_CityDAL();
            return dalMST_City.SelectPK(StateID);
        }
        public DataTable SelectAll()
        {
            MST_CityDAL dalMST_City = new MST_CityDAL();
            return dalMST_City.SelectAll();
        }

        #endregion SelectOperation

    }

}