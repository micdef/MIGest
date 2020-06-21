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

        public static Right ToRight(this IDataRecord dr)
        {
            return new Right()
            {
                IdRight = (int)dr["DatabaseId"],
                Label = dr["Label"].ToString(),
                Descr = dr["Descr"].ToString(),
                IsActive = (bool)dr["IsActive"],
                Comm = dr["Comment"].ToString()
            };
        }

        public static UserRight ToUserRight(this IDataRecord dr)
        {
            return new UserRight()
            {
                IdUserRight = (int)dr["DatabaseId"],
                IdUser = (int)dr["DatabaseIdUser"],
                Right = new Right()
                {
                    IdRight = (int)dr["DatabaseIdRight"],
                    Label = dr["Label"].ToString(),
                    Descr = dr["Descr"].ToString(),
                    IsActive = (bool)dr["IsActive"],
                    Comm = dr["CommentRight"].ToString()
                },
                IsReadable = (bool)dr["IsReadable"],
                IsWriteable = (bool)dr["IsWriteable"],
                Comm = dr["Comment"].ToString()
            };
        }

        #endregion
    }
}
