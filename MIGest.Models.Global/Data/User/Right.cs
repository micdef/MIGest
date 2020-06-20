using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Models.Global.Data.User
{
    public class Right
    {
        public int IdRight { get; set; }
        public string Label { get; set; }
        public string Descr { get; set; }
        public bool IsActive { get; set; }
        public string Comm { get; set; }
    }
}
