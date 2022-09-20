using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class Operacione
    {
        public Operacione()
        {
            RolOperacions = new HashSet<RolOperacion>();
        }

        public int Id { get; set; }
        public string Operacion { get; set; }
        public int? Idmodulo { get; set; }

        public virtual Modulo IdmoduloNavigation { get; set; }
        public virtual ICollection<RolOperacion> RolOperacions { get; set; }
    }
}
