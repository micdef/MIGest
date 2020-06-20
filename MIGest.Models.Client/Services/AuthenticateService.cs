using MIGest.Models.Client.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Mappers;
using MIGest.Repositories;
using GU = MIGest.Models.Global.Data.User;
using GS = MIGest.Models.Global.Services;

namespace MIGest.Models.Client.Services
{
    public class AuthenticateService : IAuthenticateService<User>
    {
        private readonly IAuthenticateService<GU.User> _globalService;

        public AuthenticateService()
        {
            _globalService = new GS.AuthenticateService();
        }

        public User Login(string username, string pwd)
        {
            return _globalService.Login(username, pwd)?.ToClient();
        }

        public void ChangePassword(int iduser, string oldPassword, string newPassword)
        {
            _globalService.ChangePassword(iduser, oldPassword, newPassword);
        }
    }
}
