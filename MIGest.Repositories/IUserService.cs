using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Repositories
{
    public interface IUserService<TUser>
    {
        TUser Get(int id);
    }
}
