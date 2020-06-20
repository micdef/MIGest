using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIGest.Models.Client.Data;
using GU = MIGest.Models.Global.Data.User;

namespace MIGest.Models.Client.Mappers
{
    internal static class Mappers
    {
        internal static GU.User ToGlobal(this User entity)
        {
            return new GU.User() { IdUser = entity.Id, Firstname = entity.Firstname, Lastname = entity.Lastname, Username = entity.Username, Password = entity.Password, 
                Email = entity.Email, IsActive = entity.IsActive, IsMustChangePwd = entity.IsMustChangePassword, Comm = entity.Comm};
        }

        internal static User ToClient(this GU.User entity)
        {
            return new User(entity.IdUser, entity.Username, entity.Firstname, entity.Lastname, entity.Email, entity.IsActive, entity.IsMustChangePwd, entity.Comm);
        }
    }
}
