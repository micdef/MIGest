using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Data;
using MIGest.Models.Client.Mappers;
using MIGest.Repositories;
using GS = MIGest.Models.Global.Services.ServiceLocator;

namespace MIGest.Models.Client.Services
{
    class UserService : IUserService<User>
    {
        public User Get(int id)
        {
            return GS.Instance.UserService.Get(id)?.ToClient();
        }
    }
}
