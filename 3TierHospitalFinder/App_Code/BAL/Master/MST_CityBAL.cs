using System.Data;
using HospitalFinder.DAL;

namespace HospitalFinder.BAL
{
    public class MST_CityBAL : MST_CityBALBase
    {
        public DataTable SelectComboBox()
        {
            MST_CityDAL dalMST_City = new MST_CityDAL();
            return dalMST_City.SelectComboBox();
        }
    }
}