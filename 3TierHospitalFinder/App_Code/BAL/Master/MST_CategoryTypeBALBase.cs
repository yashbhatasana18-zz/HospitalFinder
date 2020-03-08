using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;
using HospitalFinder.ENT;

namespace HospitalFinder.BAL
{
    public abstract class MST_CategoryTypeBALBase
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

        public Boolean Insert(MST_CategoryTypeENT entMST_CategoryType)
        {
            MST_CategoryTypeDAL dalMST_CategoryType = new MST_CategoryTypeDAL();
            if (dalMST_CategoryType.Insert(entMST_CategoryType))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_CategoryType.Message;
                return false;
            }
        }

        #endregion InsertOperation

        #region UpdateOperation

        public Boolean Update(MST_CategoryTypeENT entMST_CategoryType)
        {
            MST_CategoryTypeDAL dalMST_CategoryType = new MST_CategoryTypeDAL();
            if (dalMST_CategoryType.Update(entMST_CategoryType))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_CategoryType.Message;
                return false;
            }
        }

        #endregion UpdateOperation

        #region DeleteOperation

        public Boolean Delete(SqlInt32 CategoryTypeID)
        {
            MST_CategoryTypeDAL dalMST_CategoryType = new MST_CategoryTypeDAL();
            if (dalMST_CategoryType.Delete(CategoryTypeID))
            {
                return true;
            }
            else
            {
                this.Message = dalMST_CategoryType.Message;
                return false;
            }
        }

        #endregion DeleteOperation

        #region SelectOperation

        public MST_CategoryTypeENT SelectPK(SqlInt32 CategoryTypeID)
        {
            MST_CategoryTypeDAL dalMST_CategoryType = new MST_CategoryTypeDAL();
            return dalMST_CategoryType.SelectPK(CategoryTypeID);
        }
        public DataTable SelectAll()
        {
            MST_CategoryTypeDAL dalMST_CategoryType = new MST_CategoryTypeDAL();
            return dalMST_CategoryType.SelectAll();
        }

        #endregion SelectOperation

    }

}