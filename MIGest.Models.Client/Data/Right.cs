using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MIGest.Models.Client.Data
{
    public class Right
    {
        private int _idRight;
        private string _label, _descr, _comm;
        private bool _isActive;

        public Right(string label, string descr, string comm)
        {
            Label = label;
            Descr = descr;
            Comm = comm;
        }

        internal Right(int idRight, string label, string descr, string comm, bool isActive)
        {
            IdRight = idRight;
            Label = label;
            Descr = descr;
            Comm = comm;
            IsActive = isActive;
        }

        public int IdRight
        {
            get { return _idRight; }
            set
            {
                if (value < 1)
                    throw new ArgumentException("Argument non valide : IdRight");
                _idRight = value;
            }
        }

        public string Label
        {
            get { return _label; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Label");
                _label = value;
            }
        }

        public string Descr
        {
            get { return _descr; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Argument non valide : Descr");
                _descr = value;
            }
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

        public bool IsActive
        {
            get { return _isActive; }
            set { _isActive = value; }
        }
    }
}
