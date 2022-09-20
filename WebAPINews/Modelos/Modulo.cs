using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class Modulo
    {
        public Modulo()
        {
            Operaciones = new HashSet<Operacione>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Operacione> Operaciones { get; set; }
    }
}
