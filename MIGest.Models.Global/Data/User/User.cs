using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Models.Global.Data.User
{
    public class User
    {
        public int IdUser { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public bool IsMustChangePwd { get; set; }
        public DateTime DateIn { get; set; }
        public string Comm { get; set; }
    }
}
