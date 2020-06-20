using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Models.Global.Data.User
{
    public class UserRight
    {
        public int IdUserRight { get; set; }
        public int IdUser { get; set; }
        public int IdRight { get; set; }
        public bool IsReadable { get; set; }
        public bool IsWriteable { get; set; }
        public string comm { get; set; }
    }
}
