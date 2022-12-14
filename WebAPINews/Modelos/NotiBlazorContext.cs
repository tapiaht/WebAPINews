using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


#nullable disable

namespace WebAPINews.Modelos
{
    public partial class NotiBlazorContext : DbContext
    {
        //private readonly IConfiguration configuration;
        //public NotiBlazorContext(IConfiguration config)
        //{
        //    configuration = config;
        //}
        public NotiBlazorContext()
        { }
        //public NotiBlazorContext(DbContextOptions<NotiBlazorContext> options): base(options)
        //{
        //}
        public NotiBlazorContext(DbContextOptions<NotiBlazorContext> options) : base(options)
        {
        }
        //DbContextOptions<NotiBlazorContext>

        public virtual DbSet<Categoria> Categorias { get; set; }
        public virtual DbSet<Modulo> Modulos { get; set; }
        public virtual DbSet<News> News { get; set; }
        
        public virtual DbSet<Operacione> Operaciones { get; set; }
        public virtual DbSet<RolOperacion> RolOperacions { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }


        //private readonly IConfiguration configuration;
        //public NotiBlazorContext(IConfiguration config)
        //{
        //    configuration = config;
        //}
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {



            if (!optionsBuilder.IsConfigured)
            {

                //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                //optionsBuilder.UseSqlServer("myrealconnectionstring");
                //optionsBuilder.UseSqlServer()
                //;
                //optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=NotiBlazor; Trusted_Connection=True;");

                optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=NotiBlazor; Trusted_Connection=True;");

                //optionsBuilder.UseMySQL("server=localhost;database=notiblazor;user=root;password=toor");

                //optionsBuilder.UseNpgsql(@"Host=localhost;Database=NotiBlazor;Username=postgres;Password=postgres");

                //optionsBuilder.UseSqlServer("Server=tcp:webapinewsdbserver.database.windows.net,1433;Initial Catalog=NotiBlazor;Persist Security Info=False;User ID=htd7;Password=Esf@cilit0;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");


            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categoria>(entity =>
            {
                entity.HasKey(e => e.Idcat)
                    .HasName("PK_Categoria");

                entity.Property(e => e.Idcat).HasColumnName("idcat");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsFixedLength(true);
                entity.Property(e => e.Foto)
                    .HasMaxLength(150)
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Modulo>(entity =>
            {
                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<News>(entity =>
            {
                entity.HasKey(e => e.IdNews);

                entity.Property(e => e.Titulo)
                    .HasMaxLength(50)
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdCatNavigation)
                    .WithMany(p => p.News)
                    .HasForeignKey(d => d.IdCat)
                    .HasConstraintName("FK_News_Categoria");

                //entity.HasOne(d => d.IdCatNavigation)
                //    .WithMany()
                //    .HasForeignKey(d => d.Cate);

                entity.Property(e => e.Body)
                    .HasMaxLength(150)
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Operacione>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Idmodulo).HasColumnName("idmodulo");

                entity.Property(e => e.Operacion)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("operacion");

                entity.HasOne(d => d.IdmoduloNavigation)
                    .WithMany(p => p.Operaciones)
                    .HasForeignKey(d => d.Idmodulo)
                    .HasConstraintName("FK_Operaciones_Modulos");
            });

            modelBuilder.Entity<RolOperacion>(entity =>
            {
                entity.ToTable("rol_operacion");

                entity.Property(e => e.Idoper).HasColumnName("idoper");

                entity.Property(e => e.Idrol).HasColumnName("idrol");

                entity.HasOne(d => d.IdoperNavigation)
                    .WithMany(p => p.RolOperacions)
                    .HasForeignKey(d => d.Idoper)
                    .HasConstraintName("FK_rol_operacion_Operaciones");

                entity.HasOne(d => d.IdrolNavigation)
                    .WithMany(p => p.RolOperacions)
                    .HasForeignKey(d => d.Idrol)
                    .HasConstraintName("FK_rol_operacion_Roles");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.Fecha)
                    .HasColumnType("datetime")
                    .HasColumnName("fecha");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdRol)
                    .HasConstraintName("FK_Usuarios_Roles");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
