using System;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;
using HospitalFinder.ENT;

namespace HospitalFinder.BAL
{
    public abstract class MST_HospitalBALBase
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

        public Boolean Insert(MST_HospitalENT entMST_Hospital)
        {
            MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();
            if (dalMST_Hospital.Insert(entMST_Hospital))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_Hospital.Message;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(MST_HospitalENT entMST_Hospital)
        {
            MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();
            if (dalMST_Hospital.Update(entMST_Hospital))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_Hospital.Message;
                return false;
            }
        }

        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 HospitalID)
        {
            MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();
            if (dalMST_Hospital.Delete(HospitalID))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_Hospital.Message;
                return false;
            }
        }

        #endregion DeleteOperation

        #region SelectOperation

        public MST_HospitalENT SelectPK(SqlInt32 HospitalID)
        {
            MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();
            return dalMST_Hospital.SelectPK(HospitalID);
        }
        public DataTable SelectAll()
        {
            MST_HospitalDAL dalMST_Hospital = new MST_HospitalDAL();
            return dalMST_Hospital.SelectAll();
        }

        #endregion SelectOperation

    }

}