using System.Data;
using HospitalFinder.DAL;

namespace HospitalFinder.BAL
{
    public class MST_CategoryTypeBAL : MST_CategoryTypeBALBase
    {
        public DataTable SelectComboBox()
        {
            MST_CategoryTypeDAL dalMST_CategoryType = new MST_CategoryTypeDAL();
            return dalMST_CategoryType.SelectComboBox();
        }
    }
}