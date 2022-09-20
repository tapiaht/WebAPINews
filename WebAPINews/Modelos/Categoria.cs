using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class Categoria
    {
        public Categoria()
        {
            News = new HashSet<News>();
        }

        public int Idcat { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<News> News { get; set; }
    }
}
