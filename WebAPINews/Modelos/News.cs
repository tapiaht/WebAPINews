using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class News
    {
        public int IdNews { get; set; }
        public string Titulo { get; set; }
        public int? IdCat { get; set; }
        public string Body { get; set; }
        public virtual Categoria IdCatNavigation { get; set; }
    }
}
