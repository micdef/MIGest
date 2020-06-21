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
using System.Security.Policy;

namespace MIGest.Models.Client.Services
{
    public class AuthenticateService : IAuthenticateService<User, UserRight>
    {
        public User Login(string username, string pwd)
        {
            return GS.Instance.AuthenticateService.Login(username, pwd)?.ToClient();
        }

        public void ChangePassword(int iduser, string oldPassword, string newPassword)
        {
            GS.Instance.AuthenticateService.ChangePassword(iduser, oldPassword, newPassword);
        }

        public IEnumerable<UserRight> GetRights(int idUser)
        {
            List<UserRight> URList = new List<UserRight>();
            foreach (GU.UserRight ur in GS.Instance.AuthenticateService.GetRights(idUser))
                URList.Add(ur.ToClient());
            return URList;
        }
    }
}
