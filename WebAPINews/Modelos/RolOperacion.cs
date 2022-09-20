using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class RolOperacion
    {
        public int Id { get; set; }
        public int? Idrol { get; set; }
        public int? Idoper { get; set; }

        public virtual Operacione IdoperNavigation { get; set; }
        public virtual Role IdrolNavigation { get; set; }
    }
}
