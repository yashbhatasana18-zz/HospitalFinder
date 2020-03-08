using System;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;
using HospitalFinder.ENT;

namespace HospitalFinder.BAL
{
    public abstract class MST_StateBALBase
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

        public Boolean Insert(MST_StateENT entMST_State)
        {
            MST_StateDAL dalMST_State = new MST_StateDAL();
            if (dalMST_State.Insert(entMST_State))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_State.Message;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(MST_StateENT entMST_State)
        {
            MST_StateDAL dalMST_State = new MST_StateDAL();
            if (dalMST_State.Update(entMST_State))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_State.Message;
                return false;
            }
        }

        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 StateID)
        {
            MST_StateDAL dalMST_State = new MST_StateDAL();
            if (dalMST_State.Delete(StateID))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_State.Message;
                return false;
            }
        }

        #endregion DeleteOperation

        #region SelectOperation

        public MST_StateENT SelectPK(SqlInt32 StateID)
        {
            MST_StateDAL dalMST_State = new MST_StateDAL();
            return dalMST_State.SelectPK(StateID);
        }
        public DataTable SelectAll()
        {
            MST_StateDAL dalMST_State = new MST_StateDAL();
            return dalMST_State.SelectAll();
        }
        //public DataTable SelectView(SqlInt32 StateID)
        //{
        //    MST_StateDAL dalMST_State = new MST_StateDAL();
        //    return dalMST_State.SelectView(StateID);
        //}

        #endregion SelectOperation

    }

}