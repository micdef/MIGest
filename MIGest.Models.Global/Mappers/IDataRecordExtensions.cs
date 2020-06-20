using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Global.Data.User;

namespace MIGest.Models.Global.Mappers
{
    public static class IDataRecordExtensions
    {
        #region Schema User

        public static User ToUser(this IDataRecord dr)
        {
            return new User() 
            { 
                IdUser = (int)dr["DatabaseId"], 
                Username = dr["Username"].ToString(),
                Firstname = dr["Firstname"].ToString(),
                Lastname = dr["Lastname"].ToString(),
                Email = dr["Email"].ToString(),
                IsActive = (bool)dr["IsActive"],
                IsMustChangePwd = (bool)dr["IsMustChangePwd"],
                Comm = dr["Comment"].ToString()
            };
        }

        #endregion
    }
}
