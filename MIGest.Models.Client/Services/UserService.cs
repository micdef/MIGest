using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Data;
using MIGest.Repositories;

namespace MIGest.Models.Client.Services
{
    class UserService : IUserService<User>
    {
        public User Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
