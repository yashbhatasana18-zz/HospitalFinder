using System;
using System.Data;
using HospitalFinder.DAL;

namespace HospitalFinder.BAL
{
    public abstract class DashboardBALBase
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

        #region Hospital Count
        public DataTable HospitalCount()
        {
            DashboardDAL dalDashboard = new DashboardDAL();
            return dalDashboard.HospitalCount();
        }
        #endregion Hospital Count

        #region State Count
        public DataTable StateCount()
        {
            DashboardDAL dalDashboard = new DashboardDAL();
            return dalDashboard.StateCount();
        }
        #endregion Hospital Count

        #region City Count
        public DataTable CityCount()
        {
            DashboardDAL dalDashboard = new DashboardDAL();
            return dalDashboard.CityCount();
        }
        #endregion Hospital Count

        #region User Count
        public DataTable UserCount()
        {
            DashboardDAL dalDashboard = new DashboardDAL();
            return dalDashboard.UserCount();
        }
        #endregion Hospital Count
    }
}