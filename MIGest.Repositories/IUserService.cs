using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Repositories
{
    public interface IUserService<TUser>
    {
        bool Insert(TUser user);
        bool Update(TUser user);
        bool Delete(TUser user);
    }
}
