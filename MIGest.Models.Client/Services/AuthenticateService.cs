using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Mappers;
using MIGest.Repositories;
using GU = MIGest.Models.Global.Data.User;
using GS = MIGest.Models.Global.Services.ServiceLocator;
using MIGest.Models.Client.Data;

namespace MIGest.Models.Client.Services
{
    public class AuthenticateService : IAuthenticateService<User>
    {
        public User Login(string username, string pwd)
        {
            return GS.Instance.AuthenticateService.Login(username, pwd)?.ToClient();
        }

        public void ChangePassword(int iduser, string oldPassword, string newPassword)
        {
            GS.Instance.AuthenticateService.ChangePassword(iduser, oldPassword, newPassword);
        }
    }
}
