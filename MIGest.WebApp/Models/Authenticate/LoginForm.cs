using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;

namespace MIGest.WebApp.Models.Authenticate
{
    public class LoginForm
    {
        [Required(ErrorMessage = "Le champ est requis")]
        [MinLength(2, ErrorMessage = "Le champ doit contenir au minimum 2 caractères")]
        [MaxLength(50, ErrorMessage = "Le champ doit contenir au maximum 50 caractères")]
        [DisplayName("Login")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Le champ est requis")]
        [MinLength(8, ErrorMessage = "Le champ doit contenir au minimum 8 caractères")]
        [MaxLength(50, ErrorMessage = "Le champ doit contenir au maximum 50 caractères")]
        [DisplayName("Mot de passe")]
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-=]).{8,50}$", ErrorMessage = "Le mot de passe doit correspondre aux exigences de complexité. Ex: Test1234=")]
        public string Password { get; set; }
    }
}