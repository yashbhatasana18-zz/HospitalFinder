using System.Data;
using HospitalFinder.DAL;

namespace HospitalFinder.BAL
{
    public class MST_CategoryBAL : MST_CategoryBALBase
    {
        public DataTable SelectComboBox()
        {
            MST_CategoryDAL dalMST_Category = new MST_CategoryDAL();
            return dalMST_Category.SelectComboBox();
        }
    }
}