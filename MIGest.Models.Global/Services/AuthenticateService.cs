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
    public class AuthenticateService : IAuthenticateService<User, UserRight>
    {
        public User Login(string username, string pwd)
        {
            Command cmd = new Command("User.SP_User_User_Check", true);
            cmd.AddParameter("@Username", username);
            cmd.AddParameter("@Password", pwd);
            return ServiceLocator.Instance.Connection.ExecuteReader(cmd, u => u.ToUser()).SingleOrDefault();
        }

        public void ChangePassword(int idUser, string oldPassword, string newPassword)
        {
            Command cmd = new Command("Select Username FROM [User].[V_Users] WHERE DatabaseId = @id");
            cmd.AddParameter("@id", idUser);
            string username = ServiceLocator.Instance.Connection.ExecuteScalar(cmd).ToString();
            cmd = new Command("User.SP_User_User_Check", true);
            cmd.AddParameter("@Username", username);
            cmd.AddParameter("@Password", oldPassword);
            List<User> uList = ServiceLocator.Instance.Connection.ExecuteReader(cmd, u => u.ToUser()).ToList();
            if (uList.Count < 1)
                throw new Exception("Le mot de passe actuel n'est pas valide");
            cmd = new Command("User.SP_User_User_ChangePassword", true);
            cmd.AddParameter("@IdUser", idUser);
            cmd.AddParameter("@Password", newPassword);
            ServiceLocator.Instance.Connection.ExecuteNonQuery(cmd);
        }

        public IEnumerable<UserRight> GetRights(int idUser)
        {
            Command cmd = new Command("SELECT * FROM [User].[V_UserRights] WHERE [DatabaseIdUser] = @idUser");
            cmd.AddParameter("@idUser", idUser);
            return ServiceLocator.Instance.Connection.ExecuteReader(cmd, ur => ur.ToUserRight());
        }
    }
}
