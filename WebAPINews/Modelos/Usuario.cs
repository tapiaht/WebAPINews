﻿using System;
using System.Collections.Generic;

#nullable disable

namespace WebAPINews.Modelos
{
    public partial class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTime? Fecha { get; set; }
        public int? IdRol { get; set; }

        public virtual Role IdRolNavigation { get; set; }
    }
}
