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
            return new GU.User() 
            { 
                Firstname = entity.Firstname, 
                Lastname = entity.Lastname, 
                Username = entity.Username, 
                Password = entity.Password, 
                Email = entity.Email, 
                IsActive = entity.IsActive, 
                IsMustChangePwd = entity.IsMustChangePassword, 
                Comm = entity.Comm
            };
        }

        internal static User ToClient(this GU.User entity)
        {
            return new User(entity.IdUser, entity.Username, entity.Firstname, entity.Lastname, entity.Email, entity.IsActive, entity.IsMustChangePwd, entity.Comm);
        }

        internal static GU.Right ToGlobal(this Right entity)
        {
            return new GU.Right()
            {
                Label = entity.Label, 
                Descr = entity.Descr, 
                Comm = entity.Comm, 
                IsActive = entity.IsActive
            };
        }

        internal static Right ToClient(this GU.Right entity)
        {
            return new Right(entity.IdRight, entity.Label, entity.Descr, entity.Comm, entity.IsActive);
        }

        internal static GU.UserRight ToGlobal(this UserRight entity)
        {
            return new GU.UserRight()
            {
                IdUser = entity.IdUser,
                Right = entity.Right.ToGlobal(),
                IsReadable = entity.IsReadable,
                IsWriteable = entity.IsWriteable,
                Comm = entity.Comm
            };
        }

        internal static UserRight ToClient(this GU.UserRight entity)
        {
            return new UserRight(entity.IdUserRight, entity.IdUser, entity.Right.ToClient(), entity.IsReadable, entity.IsWriteable, entity.Comm);
        }
    }
}
