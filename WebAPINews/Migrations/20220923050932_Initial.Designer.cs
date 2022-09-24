﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using WebAPINews.Modelos;

namespace WebAPINews.Migrations
{
    [DbContext(typeof(NotiBlazorContext))]
    [Migration("20220923050932_Initial")]
    partial class Initial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.0");

            modelBuilder.Entity("WebAPINews.Modelos.Categoria", b =>
                {
                    b.Property<int>("Idcat")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("idcat")
                        .UseIdentityColumn();

                    b.Property<string>("Nombre")
                        .HasMaxLength(50)
                        .HasColumnType("nchar(50)")
                        .IsFixedLength(true);

                    b.HasKey("Idcat")
                        .HasName("PK_Categoria");

                    b.ToTable("Categorias");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Modulo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Nombre")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.ToTable("Modulos");
                });

            modelBuilder.Entity("WebAPINews.Modelos.News", b =>
                {
                    b.Property<int>("IdNews")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Body")
                        .HasMaxLength(150)
                        .HasColumnType("nchar(150)")
                        .IsFixedLength(true);

                    b.Property<int?>("CategIdcat")
                        .HasColumnType("int");

                    b.Property<int?>("IdCat")
                        .HasColumnType("int");

                    b.Property<string>("Titulo")
                        .HasMaxLength(50)
                        .HasColumnType("nchar(50)")
                        .IsFixedLength(true);

                    b.HasKey("IdNews");

                    b.HasIndex("CategIdcat");

                    b.HasIndex("IdCat");

                    b.ToTable("News");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Operacione", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id")
                        .UseIdentityColumn();

                    b.Property<int?>("Idmodulo")
                        .HasColumnType("int")
                        .HasColumnName("idmodulo");

                    b.Property<string>("Operacion")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("operacion");

                    b.HasKey("Id");

                    b.HasIndex("Idmodulo");

                    b.ToTable("Operaciones");
                });

            modelBuilder.Entity("WebAPINews.Modelos.RolOperacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<int?>("Idoper")
                        .HasColumnType("int")
                        .HasColumnName("idoper");

                    b.Property<int?>("Idrol")
                        .HasColumnType("int")
                        .HasColumnName("idrol");

                    b.HasKey("Id");

                    b.HasIndex("Idoper");

                    b.HasIndex("Idrol");

                    b.ToTable("rol_operacion");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Usuario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Email")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("email");

                    b.Property<DateTime?>("Fecha")
                        .HasColumnType("datetime")
                        .HasColumnName("fecha");

                    b.Property<int?>("IdRol")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Password")
                        .HasMaxLength(200)
                        .IsUnicode(false)
                        .HasColumnType("varchar(200)")
                        .HasColumnName("password");

                    b.HasKey("Id");

                    b.HasIndex("IdRol");

                    b.ToTable("Usuarios");
                });

            modelBuilder.Entity("WebAPINews.Modelos.News", b =>
                {
                    b.HasOne("WebAPINews.Modelos.Categoria", "Categ")
                        .WithMany()
                        .HasForeignKey("CategIdcat");

                    b.HasOne("WebAPINews.Modelos.Categoria", "IdCatNavigation")
                        .WithMany("News")
                        .HasForeignKey("IdCat")
                        .HasConstraintName("FK_News_Categoria");

                    b.Navigation("Categ");

                    b.Navigation("IdCatNavigation");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Operacione", b =>
                {
                    b.HasOne("WebAPINews.Modelos.Modulo", "IdmoduloNavigation")
                        .WithMany("Operaciones")
                        .HasForeignKey("Idmodulo")
                        .HasConstraintName("FK_Operaciones_Modulos");

                    b.Navigation("IdmoduloNavigation");
                });

            modelBuilder.Entity("WebAPINews.Modelos.RolOperacion", b =>
                {
                    b.HasOne("WebAPINews.Modelos.Operacione", "IdoperNavigation")
                        .WithMany("RolOperacions")
                        .HasForeignKey("Idoper")
                        .HasConstraintName("FK_rol_operacion_Operaciones");

                    b.HasOne("WebAPINews.Modelos.Role", "IdrolNavigation")
                        .WithMany("RolOperacions")
                        .HasForeignKey("Idrol")
                        .HasConstraintName("FK_rol_operacion_Roles");

                    b.Navigation("IdoperNavigation");

                    b.Navigation("IdrolNavigation");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Usuario", b =>
                {
                    b.HasOne("WebAPINews.Modelos.Role", "IdRolNavigation")
                        .WithMany("Usuarios")
                        .HasForeignKey("IdRol")
                        .HasConstraintName("FK_Usuarios_Roles");

                    b.Navigation("IdRolNavigation");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Categoria", b =>
                {
                    b.Navigation("News");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Modulo", b =>
                {
                    b.Navigation("Operaciones");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Operacione", b =>
                {
                    b.Navigation("RolOperacions");
                });

            modelBuilder.Entity("WebAPINews.Modelos.Role", b =>
                {
                    b.Navigation("RolOperacions");

                    b.Navigation("Usuarios");
                });
#pragma warning restore 612, 618
        }
    }
}
