using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Models.Client.Data
{
    public class UserRight
    {
        private int _idUserRight, _idUser;
        private Right _right;
        private bool _isReadable, _isWriteable;
        private string _comm;

        public UserRight(int idUser, Right right, bool isReadable, bool isWriteable, string comm)
        {
            IdUser = idUser;
            Right = right;
            IsReadable = isReadable;
            IsWriteable = isWriteable;
            Comm = comm;
        }

        internal UserRight(int idUserRight, int idUser, Right right, bool isReadable, bool isWriteable, string comm)
        {
            IdUserRight = idUserRight;
            IdUser = idUser;
            Right = right;
            IsReadable = isReadable;
            IsWriteable = isWriteable;
            Comm = comm;
        }

        public int IdUserRight
        {
            get { return _idUserRight; }
            set
            {
                if (value < 1)
                    throw new ArgumentException("Argument non valide : IdUserRight");
                _idUserRight = value;
            }
        }

        public int IdUser
        {
            get { return _idUser; }
            set
            {
                if (value < 1)
                    throw new ArgumentException("Argument non valide : IdUser");
                _idUser = value;
            }
        }

        public Right Right
        {
            get { return _right; }
            set
            {
                if (value is null)
                    throw new ArgumentException("Argument non valide : Right");
                _right = value;
            }
        }

        public bool IsReadable
        {
            get { return _isReadable; }
            set { _isReadable = value; }
        }

        public bool IsWriteable
        {
            get { return _isWriteable; }
            set { _isWriteable = value; }
        }

        public string Comm
        {
            get { return _comm; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Comm");
                _comm = value;
            }
        }
    }
}
