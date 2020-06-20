using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MIGest.WebApp.Models.Authenticate
{
    public class ChangePwdForm
    {
        [Required(ErrorMessage = "Le champ est requis")]
        [MinLength(8, ErrorMessage = "Le champ doit contenir au minimum 8 caractères")]
        [MaxLength(50, ErrorMessage = "Le champ doit contenir au maximum 50 caractères")]
        [DisplayName("Ancien mot de passe")]
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-=]).{8,50}$", ErrorMessage = "Le mot de passe doit correspondre aux exigences de complexité. Ex: Test1234=")]
        public string OldPassword { get; set; }

        [Required(ErrorMessage = "Le champ est requis")]
        [MinLength(8, ErrorMessage = "Le champ doit contenir au minimum 8 caractères")]
        [MaxLength(50, ErrorMessage = "Le champ doit contenir au maximum 50 caractères")]
        [DisplayName("Nouveau mot de passe")]
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-=]).{8,50}$", ErrorMessage = "Le mot de passe doit correspondre aux exigences de complexité. Ex: Test1234=")]
        public string NewPassword1 { get; set; }
        
        [Required]
        [DisplayName("Confirmez le mot de passe")]
        [DataType(DataType.Password)]
        [Compare(nameof(NewPassword1))]
        public string NewPassword2 { get; set; }
    }
}