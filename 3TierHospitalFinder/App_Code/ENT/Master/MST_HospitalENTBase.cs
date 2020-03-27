using System.Data.SqlTypes;

namespace HospitalFinder.ENT
{
    public abstract class MST_HospitalENTBase
    {
        #region Properties

        protected SqlInt32 _HospitalID;

        public SqlInt32 HospitalID
        {
            get
            {
                return _HospitalID;
            }
            set
            {
                _HospitalID = value;
            }
        }

        protected SqlString _HospitalName;

        public SqlString HospitalName
        {
            get
            {
                return _HospitalName;
            }
            set
            {
                _HospitalName = value;
            }
        }

        protected SqlInt32 _CityID;

        public SqlInt32 CityID
        {
            get
            {
                return _CityID;
            }
            set
            {
                _CityID = value;
            }
        }

        protected SqlInt32 _CategoryID;

        public SqlInt32 CategoryID
        {
            get
            {
                return _CategoryID;
            }
            set
            {
                _CategoryID = value;
            }
        }

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

        protected SqlString _Address;

        public SqlString Address
        {
            get
            {
                return _Address;
            }
            set
            {
                _Address = value;
            }
        }

        protected SqlString _PinCode;

        public SqlString PinCode
        {
            get
            {
                return _PinCode;
            }
            set
            {
                _PinCode = value;
            }
        }

        protected SqlString _MobileNumber;

        public SqlString MobileNumber
        {
            get
            {
                return _MobileNumber;
            }
            set
            {
                _MobileNumber = value;
            }
        }

        protected SqlString _TelePhoneNumber;

        public SqlString TelePhoneNumber
        {
            get
            {
                return _TelePhoneNumber;
            }
            set
            {
                _TelePhoneNumber = value;
            }
        }

        protected SqlString _Fax;

        public SqlString Fax
        {
            get
            {
                return _Fax;
            }
            set
            {
                _Fax = value;
            }
        }

        protected SqlString _Website;

        public SqlString Website
        {
            get
            {
                return _Website;
            }
            set
            {
                _Website = value;
            }
        }

        protected SqlString _EmailID;

        public SqlString EmailID
        {
            get
            {
                return _EmailID;
            }
            set
            {
                _EmailID = value;
            }
        }

        protected SqlString _AmbulancePhoneNumber;

        public SqlString AmbulancePhoneNumber
        {
            get
            {
                return _AmbulancePhoneNumber;
            }
            set
            {
                _AmbulancePhoneNumber = value;
            }
        }

        protected SqlString _EmergencyNumber;

        public SqlString EmergencyNumber
        {
            get
            {
                return _EmergencyNumber;
            }
            set
            {
                _EmergencyNumber = value;
            }
        }

        protected SqlString _HospitalImage;

        public SqlString HospitalImage
        {
            get
            {
                return _HospitalImage;
            }
            set
            {
                _HospitalImage = value;
            }
        }

        protected SqlString _MapCode;

        public SqlString MapCode
        {
            get
            {
                return _MapCode;
            }
            set
            {
                _MapCode = value;
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

        protected SqlInt32 _UserID;

        public SqlInt32 UserID
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