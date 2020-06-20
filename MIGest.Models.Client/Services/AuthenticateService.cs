using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Mappers;
using MIGest.Repositories;
using GU = MIGest.Models.Global.Data.User;
using GS = MIGest.Models.Global.Services;
using MIGest.Models.Client.Data;

namespace MIGest.Models.Client.Services
{
    public class AuthenticateService : IAuthenticateService<User>
    {
        private readonly IAuthenticateService<GU.User> _srvLoc;

        public AuthenticateService()
        {
            _srvLoc = GS.ServiceLocatorG.Instance.AuthenticateService;
        }
        public User Login(string username, string pwd)
        {
            return _srvLoc.Login(username, pwd)?.ToClient();
        }

        public void ChangePassword(int iduser, string oldPassword, string newPassword)
        {
            _srvLoc.ChangePassword(iduser, oldPassword, newPassword);
        }
    }
}
