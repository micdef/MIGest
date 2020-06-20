using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MIGest.WebApp.Models.User
{
    public class GetProfile
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Email { get; set; }
        public string Comm { get; set; }
    }
}