using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class Role
    {
        public Role()
        {
            RolOperacions = new HashSet<RolOperacion>();
            Usuarios = new HashSet<Usuario>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<RolOperacion> RolOperacions { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
