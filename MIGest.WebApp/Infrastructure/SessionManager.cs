using MIGest.Models.Client.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MIGest.WebApp.Infrastructure
{
    public static class SessionManager
    {
        public static User User
        {
            get { return (User)HttpContext.Current.Session[nameof(User)]; }
            set { HttpContext.Current.Session[nameof(User)] = value; }
        }

        public static void Abandon()
        {
            if(SessionManager.User != null)
                HttpContext.Current.Session.Abandon();
        }
    }
}