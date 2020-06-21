using MIGest.Models.Global.Data.User;
using MIGest.Models.Global.Mappers;
using MIGest.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToolBox;

namespace MIGest.Models.Global.Services
{
    class UserService : IUserService<User>
    {
        public User Get(int id)
        {
            Command cmd = new Command("SELECT * FROM V_Users WHERE DatabaseId = @id");
            cmd.AddParameter("@id", id);
            return ServiceLocator.Instance.Connection.ExecuteReader(cmd, u => u.ToUser()).SingleOrDefault();
        }
    }
}
