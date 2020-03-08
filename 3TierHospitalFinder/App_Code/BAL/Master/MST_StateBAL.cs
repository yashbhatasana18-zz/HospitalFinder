using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlTypes;
using HospitalFinder.DAL;

namespace HospitalFinder.BAL
{
    public class MST_StateBAL : MST_StateBALBase
    {
        public DataTable SelectComboBox()
        {
            MST_StateDAL dalMST_State = new MST_StateDAL();
            return dalMST_State.SelectComboBox();
        }
    }
}