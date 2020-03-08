using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace HospitalFinder.ENT
{
    public abstract class MST_CategoryTypeENTBase
    {
        #region Properties

        protected SqlInt32 _CategoryTypeID;
        public SqlInt32 CategoryTypeID
        {
            get
            {
                return _CategoryTypeID;
            }
            set
            {
                _CategoryTypeID = value;
            }
        }

        protected SqlString _CategoryType;
        public SqlString CategoryType
        {
            get
            {
                return _CategoryType;
            }
            set
            {
                _CategoryType = value;
            }
        }

        protected SqlDateTime _CreationDate;
        public SqlDateTime CreationDate
        {
            get
            {
                return _CreationDate;
            }
            set
            {
                _CreationDate = value;
            }
        }

        protected SqlDateTime _ModificationDate;
        public SqlDateTime ModificationDate
        {
            get
            {
                return _ModificationDate;
            }
            set
            {
                _ModificationDate = value;
            }
        }

        protected SqlDateTime _UserID;
        public SqlDateTime UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        #endregion Properties
    }
}