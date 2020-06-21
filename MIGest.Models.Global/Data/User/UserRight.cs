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
        public Right Right { get; set; }
        public bool IsReadable { get; set; }
        public bool IsWriteable { get; set; }
        public string Comm { get; set; }
    }
}
