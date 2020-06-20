using MIGest.Models.Global.Data.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Repositories;
using ToolBox;
using System.Configuration;
using System.Data.SqlClient;
using MIGest.Models.Global.Mappers;

namespace MIGest.Models.Global.Services
{
    public class AuthenticateService : IAuthenticateService<User>
    {
        public User Login(string username, string pwd)
        {
            ServiceLocatorG srvLoc = ServiceLocatorG.Instance;
            Command cmd = new Command("User.SP_User_Check", true);
            cmd.AddParameter("@Username", username);
            cmd.AddParameter("@Password", pwd);
            return srvLoc.Connection.ExecuteReader(cmd, u => u.ToUser()).SingleOrDefault();
        }

        public void ChangePassword(int idUser, string oldPassword, string newPassword)
        {
            ServiceLocatorG srvLoc = ServiceLocatorG.Instance;
            Command cmd = new Command("Select Username FROM [User].[V_Users] WHERE DatabaseId = @id");
            cmd.AddParameter("@id", idUser);
            string username = srvLoc.Connection.ExecuteScalar(cmd).ToString();
            cmd = new Command("User.SP_User_Check", true);
            cmd.AddParameter("@Username", username);
            cmd.AddParameter("@Password", oldPassword);
            List<User> uList = srvLoc.Connection.ExecuteReader(cmd, u => u.ToUser()).ToList();
            if (uList.Count < 1)
                throw new Exception("Le mot de passe actuel n'est pas valide");
            cmd = new Command("User.SP_User_ChangePassword", true);
            cmd.AddParameter("@IdUser", idUser);
            cmd.AddParameter("@Password", newPassword);
            srvLoc.Connection.ExecuteNonQuery(cmd);
        }
    }
}
