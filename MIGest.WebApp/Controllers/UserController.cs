using MIGest.Models.Client.Data;
using MIGest.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MIGest.WebApp.Controllers
{
    public class UserController : Controller
    {
        public UserController()
        {
            
        }

        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetProfile(int id)
        {

            return View();
        }
    }
}