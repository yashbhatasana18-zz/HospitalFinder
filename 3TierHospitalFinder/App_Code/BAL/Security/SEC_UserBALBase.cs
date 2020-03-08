using System;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;
using HospitalFinder.ENT;

namespace HospitalFinder.BAL
{
    public abstract class SEC_UserBALBase
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

        public Boolean Insert(SEC_UserENT entSEC_User)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            if (dalSEC_User.Insert(entSEC_User))
            {
                return true;
            }
            else
            {
                this.Message = dalSEC_User.Message;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(SEC_UserENT entSEC_User)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            if (dalSEC_User.Update(entSEC_User))
            {
                return true;
            }
            else
            {
                this.Message = dalSEC_User.Message;
                return false;
            }
        }

        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 UserID)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            if (dalSEC_User.Delete(UserID))
            {
                return true;
            }
            else
            {
                this.Message = dalSEC_User.Message;
                return false;
            }
        }

        #endregion DeleteOperation

        #region SelectOperation

        public SEC_UserENT SelectPK(SqlInt32 UserID)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            return dalSEC_User.SelectPK(UserID);
        }
        public DataTable SelectAll()
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            return dalSEC_User.SelectAll();
        }
       
        #endregion SelectOperation

    }

}