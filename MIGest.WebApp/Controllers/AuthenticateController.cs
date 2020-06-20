using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MIGest.Models.Client.Data;
using MIGest.Models.Client.Services;
using MIGest.Repositories;
using MIGest.WebApp.Infrastructure;
using MIGest.WebApp.Infrastructure.Attributes;
using MIGest.WebApp.Models.Authenticate;

namespace MIGest.WebApp.Controllers
{
    public class AuthenticateController : Controller
    {
        private IAuthenticateService<User> _service;

        public AuthenticateController()
        {
            _service = new AuthenticateService();
        }

        [AnonymousRequired]
        public ActionResult Index()
        {
            return RedirectToAction("Login");
        }

        [AnonymousRequired]
        public ActionResult Login()
        {
            return View();
        }

        [AnonymousRequired]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginForm loginForm)
        {
            if (ModelState.IsValid)
                try
                {
                    User u = _service.Login(loginForm.Username, loginForm.Password);
                    if (!(u is null))
                    {
                        SessionManager.User = u;
                        if (u.IsMustChangePassword)
                            return RedirectToAction("ChangePassword");
                        return RedirectToAction("Index", "Home");
                    }
                    ViewBag.Error = "La combinaison nom d'utilisateur/mot de passe est invalide.";
                }
                catch (Exception e)
                {
                    ViewBag.Error = e.Message;
                }
            return View(loginForm);
        }

        [AuthenticatedRequired]
        public ActionResult LogOut()
        {
            if (SessionManager.User != null)
                SessionManager.Abandon();
            return RedirectToAction("Login");
        }

        [AuthenticatedRequired]
        public ActionResult ChangePassword()
        {
            return View();
        }

        [AuthenticatedRequired]
        [HttpPost]
        public ActionResult ChangePassword(ChangePwdForm changePwdForm)
        {
            if (ModelState.IsValid)
                try
                {
                    _service.ChangePassword(SessionManager.User.Id, changePwdForm.OldPassword, changePwdForm.NewPassword1);
                    return RedirectToAction("LogOut");
                }
                catch (Exception e)
                {
                    ViewBag.Error = e.Message;
                }
            return View(changePwdForm);
        }
    }
}