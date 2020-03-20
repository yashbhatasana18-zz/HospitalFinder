using System;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;
using HospitalFinder.ENT;

namespace HospitalFinder.BAL
{
    public class SEC_UserBAL : SEC_UserBALBase
    {
        public DataTable SelectDuplicate(SqlString UserName, SqlString Email)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            return dalSEC_User.SelectDuplicate(UserName, Email);
        }
        public DataTable UserLogIn(SqlString UserName, SqlString Password)
        {
            SEC_UserDAL dalSEC_User = new SEC_UserDAL();
            return dalSEC_User.UserLogIn(UserName, Password);
        }
    }

}