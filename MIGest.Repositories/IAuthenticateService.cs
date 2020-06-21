using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Repositories
{
    public interface IAuthenticateService<TUser, TUserRight>
    {
        TUser Login(string username, string pwd);
        void ChangePassword(int idUser, string oldPassword, string newPassword);
        IEnumerable<TUserRight> GetRights(int idUser);
    }
}
