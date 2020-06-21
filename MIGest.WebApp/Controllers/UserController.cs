using MIGest.Models.Client.Data;
using MIGest.Models.Client.Services;
using MIGest.Repositories;
using MIGest.WebApp.Infrastructure;
using MIGest.WebApp.Infrastructure.Attributes;
using MIGest.WebApp.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MIGest.WebApp.Controllers
{
    [AuthenticatedRequired]
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult GetProfile(int id)
        {
            // Récupération de l'utilisateur
            User u = ServiceLocator.Instance.UserService.Get(SessionManager.User.Id);

            // Transformation vers le model
            GetProfile model = new GetProfile()
            {
                Id = u.Id, 
                Firstname = u.Firstname, 
                Lastname = u.Lastname, 
                Username = u.Username, 
                Email = u.Email,
                Comm = u.Comm
            };
            return View(model);
        }

        public ActionResult GetListUser()
        {
            return View();
        }
    }
}