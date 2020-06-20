using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Models.Client.Data
{
    public class User
    {
        private int _id;
        private string _username, _password, _firstname, _lastname, _email, _comm;
        private bool _isActive, _isMustChangePassword;

        public User(string username, string password, string firstname, string lastname, string email, bool isActive, bool isMustChangePwd, string comm = null)
        {
            this.Username = username;
            this.Password = password;
            this.Firstname = firstname;
            this.Lastname = lastname;
            this.Email = email;
            this.IsActive = isActive;
            this.IsMustChangePassword = isMustChangePwd;
            this.Comm = comm;
        }

        internal User(int id, string username, string firstname, string lastname, string email, bool isActive, bool isMustChangePwd, string comm = null)
        {
            this.Id = id;
            this.Username = username;
            this.Firstname = firstname;
            this.Lastname = lastname;
            this.Email = email;
            this.IsActive = isActive;
            this.IsMustChangePassword = isMustChangePwd;
            this.Comm = comm;
        }

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Username
        {
            get { return _username; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Login");
                _username = value;
            }
        }

        public string Password
        {
            get { return _password; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Mot de passe");
                _password = value;
            }
        }

        public string Firstname
        {
            get { return _firstname; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Prénom");
                _firstname = value;
            }
        }

        public string Lastname
        {
            get { return _lastname; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Nom de famille");
                _lastname = value;
            }
        }

        public string Email
        {
            get { return _email; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Email");
                _email = value;
            }
        }

        public bool IsActive
        {
            get { return _isActive; }
            set { _isActive = value; }
        }

        public bool IsMustChangePassword
        {
            get { return _isMustChangePassword; }
            set { _isMustChangePassword = value; }
        }

        public string Comm
        {
            get { return _comm; }
            set { _comm = value; }
        }
    }
}
