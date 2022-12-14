USE [master]
GO
/****** Object:  Database [NotiBlazor]    Script Date: 9/29/2022 10:02:29 PM ******/
CREATE DATABASE [NotiBlazor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NotiBlazor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NotiBlazor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NotiBlazor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NotiBlazor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NotiBlazor] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NotiBlazor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NotiBlazor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NotiBlazor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NotiBlazor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NotiBlazor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NotiBlazor] SET ARITHABORT OFF 
GO
ALTER DATABASE [NotiBlazor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NotiBlazor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NotiBlazor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NotiBlazor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NotiBlazor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NotiBlazor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NotiBlazor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NotiBlazor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NotiBlazor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NotiBlazor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NotiBlazor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NotiBlazor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NotiBlazor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NotiBlazor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NotiBlazor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NotiBlazor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NotiBlazor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NotiBlazor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NotiBlazor] SET  MULTI_USER 
GO
ALTER DATABASE [NotiBlazor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NotiBlazor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NotiBlazor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NotiBlazor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NotiBlazor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NotiBlazor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NotiBlazor] SET QUERY_STORE = OFF
GO
USE [NotiBlazor]
GO
/****** Object:  Table [dbo].[News]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[IdNews] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](200) NULL,
	[IdCat] [int] NULL,
	[Body] [varchar](550) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[IdNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idcat] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Foto] [varchar](350) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idcat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[NC]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NC]
AS
SELECT        dbo.News.IdNews, dbo.News.Titulo, dbo.Categorias.Nombre
FROM            dbo.Categorias INNER JOIN
                         dbo.News ON dbo.Categorias.idcat = dbo.News.IdCat
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulos]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Modulos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operaciones]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operacion] [varchar](50) NULL,
	[idmodulo] [int] NULL,
 CONSTRAINT [PK_Operaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_operacion]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_operacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NULL,
	[idoper] [int] NULL,
 CONSTRAINT [PK_rol_operacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/29/2022 10:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](200) NULL,
	[fecha] [datetime] NULL,
	[IdRol] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (1, N'Nacional1                                         ', N'https://i.ytimg.com/vi/MRtXcFFZ390/maxresdefault.jpg')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (2, N'Internacional                                     ', N'https://www.logaster.com/blog/wp-content/uploads/2020/03/1010.png')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (3, N'Espectaculos                                      ', N'https://thumbs.dreamstime.com/z/video-headline-title-television-news-bar-design-template-lower-third-tv-bars-set-vector-broadcast-media-banner-streaming-sign-162482152.jpg')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (4, N'Tiempo                                            ', N'https://media.istockphoto.com/vectors/news-live-illustration-vector-id930748148?k=6&m=930748148&s=612x612&w=0&h=AgU-GwzsdbE7M8ONqukeUkH3j9-tl-SDI9FcUMpB2_c=')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (5, N'Deportes                                          ', N'https://mediaspy-org-s3.s3.dualstack.ap-southeast-2.amazonaws.com/original/3X/7/3/73b0ee372963704dd3caa886cb387189992e5853.jpg')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (6, N'Economia                                          ', N'https://i.ytimg.com/vi/7ogAr7qi4GE/maxresdefault.jpg')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (7, N'Trafico                                           ', N'https://metacept.com/wp-content/uploads/2020/04/3686937-780x405.jpg')
INSERT [dbo].[Categorias] ([idcat], [Nombre], [Foto]) VALUES (9, N'Arte                                              ', N'https://i.ytimg.com/vi/eX0JGDvfU1Q/maxresdefault.jpg')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Modulos] ON 

INSERT [dbo].[Modulos] ([Id], [Nombre]) VALUES (1, N'usuarios')
INSERT [dbo].[Modulos] ([Id], [Nombre]) VALUES (2, N'roles')
INSERT [dbo].[Modulos] ([Id], [Nombre]) VALUES (3, N'news')
INSERT [dbo].[Modulos] ([Id], [Nombre]) VALUES (4, N'categorias')
INSERT [dbo].[Modulos] ([Id], [Nombre]) VALUES (5, N'modulos')
SET IDENTITY_INSERT [dbo].[Modulos] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (1, N'Opositores creen que el viaje del alcalde es una excusa para zafarse del Cabildo por el Censo                                                                                                           ', 1, N'El Concejo Municipal no logró aunar una postura sobre la retirada de losetas. Piden más información y diálogo con vecinos, aunque no se solicitará al Ejecutivo la detención de la obra
                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (2, N'Sepa dónde ir a buscar y reportar niños extraviados en la Expocruz                                                                                                                                      ', 1, N'El presidente del Concejo Municipal, Israel Alcócer, adelantó que el alcalde de la ciudad, Jhonny Fernández, se reunirá entre esta noche y mañana miércoles con los colegios profesionales e instituciones para buscar el apoyo al plan te pavimentación del centro de la ciudad. El presidente electo de la Sociedad de Ingenieros Bolivia, regional de Santa Cruz, Jorge Franco, confirmó a EL DEBER que la cita está prevista para las 17:30 de hoy en la Quinta Municipal.

                                                                                    ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (3, N'Rueda de Negocios Internacional reunirá a 700 empresas de 16 países                                                                                                                                     ', 1, N'De acuerdo a lo expresado por Alcócer, en la sesión ordinaria del Concejo, la reunión se agenda en respuesta a los hechos violentos vividos la mañana de este martes en la calle Bolívar. Vecinos que rechazan el retiro de las losetas trataron de frenar el avance de las obras. Hasta la zona acudieron grupos de vecinos afines a Fernández para respaldar la obras y confrontar a quienes permanecen en vigilia.

                                                                                                                                             ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (4, N'Gobernación cruceña afirma que Prada se basó en “datos falsos” para desprestigiar a Camacho                                                                                                             ', 3, N'La polémica por el retiro de las losetas se hizo presente en el Concejo Municipal. Por casi dos horas, concejales del oficialismo defendieron la continuidad de las obras alegando que "ya se licitó y adjudicó".

                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (5, N'Sobriedad digital o cómo la tecnología puede ayudar a salvar al planeta                                                                                                                                 ', 2, N'NUPor su parte, los ediles opositores demandaron una pausa temporal a las mismas para iniciar "un diálogo con los vecinos que quieren ser escuchados" por las autoridades.

LL                                                                                                                                                                                                                                                                                                                                                                                      ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (6, N'170.000 Maestros capacitados, la iniciativa de Tigo que nació en Bolivia                                                                                                                                ', 2, N'Más allá del prolongado debate, el Concejo no acordó un posicionamiento conjunto. De forma individual, los concejales remitirán una minuta al Ejecutivo para que se detenga el avance de la obra.

                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (7, N'Coca-Cola y un nuevo paradigma: tocar la vida del consumidor                                                                                                                                            ', 2, N'José Antonio Alberti, edil de Comunidad Autonómica, fue el más específico al proponer "una pausa hasta que pase el 24 de septiembre". También sugirió al presidente del Concejo para que actuase de mediador y propiciase un diálogo que ayude a unificar las posturas.

                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (9, N'Cinco cosas que hay que saber sobre los Emmy 2022                                                                                                                                                       ', 3, N'Los concejales de UCS mantuvieron su respaldo al proyecto en ejecución. Alcócer resaltó "las mesas de socialización que se han realizado con vecinos y juntas vecinales" como el respaldo necesario para validar las obras.

                                                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (10, N'El Salón del Automóvil de Detroit regresa renovado tras pausa por pandemia                                                                                                                              ', 3, N'El cambio de loseta por asfalto flexible contaría, a decir del presidente del Concejo, "con un proyecto integral para revitalizar el centro de la ciudad". A pesar de eso, consideró factible "volver a explicar el proyecto" para que "ya no haya objeciones de nada".

                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (11, N'Disney emociona a fans desvelando imágenes de ‘Indiana Jones’, ‘The Mandalorian’ y ‘Avatar’                                                                                                             ', 3, N'Más incisiva se mostró la concejal oficialista Eunice Rivero. Cuestionó la ausencia de los ediles opositores en las reuniones convocadas por el alcalde con los vecinos. Además, consideró que la demanda vecinal, "más que social se ha tornado política".

                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (12, N'Nominados a los Emmy en las principales categorías                                                                                                                                                      ', 3, N'En este mismo sentido, Gabriela Garzón, también de UCS, pidió "apoyar la modernización". Interpeló los argumentos propuestos por los defensores de las losetas al señalar que "una loseta no es algo histórico. La loseta fue modernización en su momento. Ahora la modernización es el asfalto flexible".

                                                                                                                                                                                                                                                        ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (13, N'El juego del calamar’ busca hacer historia en los premios Emmy                                                                                                                                          ', 3, N'Los ediles de Comunidad Autonómica lamentaron los incidentes ocurridos la mañana de este martes y apuntaron al alcalde como incitador de los mismos. "Es lamentable la alusión del alcalde a los vecinos al decir que son cinco gatos y una bandera", criticó Karina Orihuela.

                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (15, N'Estampida para comprar boletos de avión y dejar Rusia tras anuncio de movilización de Putin                                                                                                             ', 1, N'La propuesta planeada por CA se vincula con la actualización del Plan de Ordenamiento Territorial (PLOT). Alberti presentó un proyecto de ley para actualizar el PLOT "que desde el 2005 no se actualiza".

                                                                                                                                                                                                                                                                                                                                                        ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (16, N'Arce anuncia que no mejorará la relación con EEUU y que persiste el “resentimiento” con la Unión Europea                                                                                                ', 1, N'El trabajo de expertos podría demorarse un par de años pero, asegura, "el PLOT actualizado nos indica hacia dónde vamos con la ciudad". Es una herramienta, explica, que permite planificar a corto, medio y largo plazo.

                                                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (18, N'Evo critica que ningún ministro de Arce acompañe a Andrónico a las entregas de obras                                                                                                                    ', 4, N'La premura en la retirada de la loseta responde a que "es más importante gastar Bs 30 millones porque ahí sí hay negocio" en comparación con otras acciones destinadas a viabilizar proyectos como beneficios tributarios, reordenamiento de tráfico o seguridad.

                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[News] ([IdNews], [Titulo], [IdCat], [Body]) VALUES (22, N'Carlos Lampe, a un partido de igualar el récord de Carlos Trucco en la Verde                                                                                                                            ', 7, N'Cuatro razones para celebrar en esta fecha, el día que inspira y enamora
Cómo funciona la "policía de la moral" acusada de matar a golpes a una joven en Irán, desatando fuertes protestas
                                                                                                                                                                                                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Operaciones] ON 

INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (1, N'agregar', 1)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (2, N'listar', 1)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (3, N'editar', 1)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (4, N'eliminar', 1)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (5, N'agregar', 2)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (6, N'mostrar', 2)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (7, N'editar', 2)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (8, N'eliminar', 2)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (9, N'agregar', 3)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (10, N'ver', 3)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (11, N'editar', 3)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (12, N'eliminar', 3)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (13, N'agregar', 4)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (14, N'ver', 4)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (15, N'editar', 4)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (16, N'eliminar', 4)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (17, N'agregar', 5)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (18, N'ver', 5)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (19, N'editar', 5)
INSERT [dbo].[Operaciones] ([id], [operacion], [idmodulo]) VALUES (20, N'eliminar', 5)
SET IDENTITY_INSERT [dbo].[Operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[rol_operacion] ON 

INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (1, 1, 1)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (2, 1, 2)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (3, 1, 3)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (4, 1, 4)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (5, 1, 5)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (6, 1, 6)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (7, 1, 7)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (8, 1, 8)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (9, 1, 9)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (10, 1, 10)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (11, 1, 11)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (12, 1, 12)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (13, 1, 13)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (14, 1, 14)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (15, 1, 15)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (16, 1, 16)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (17, 1, 17)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (18, 1, 18)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (19, 1, 19)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (20, 1, 20)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (21, 2, 2)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (22, 2, 6)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (23, 2, 10)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (24, 2, 14)
INSERT [dbo].[rol_operacion] ([Id], [idrol], [idoper]) VALUES (25, 2, 18)
SET IDENTITY_INSERT [dbo].[rol_operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [email], [password], [fecha], [IdRol]) VALUES (1, N'Juan', N'juan@gmail.com', N'123', CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [email], [password], [fecha], [IdRol]) VALUES (2, N'Maria', N'maria@gmail.com', N'321', CAST(N'2022-01-02T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Categoria] FOREIGN KEY([IdCat])
REFERENCES [dbo].[Categorias] ([idcat])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Categoria]
GO
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Modulos] FOREIGN KEY([idmodulo])
REFERENCES [dbo].[Modulos] ([Id])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Modulos]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_Operaciones] FOREIGN KEY([idoper])
REFERENCES [dbo].[Operaciones] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_Operaciones]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_Roles] FOREIGN KEY([idrol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_Roles]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Categorias"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "News"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NC'
GO
USE [master]
GO
ALTER DATABASE [NotiBlazor] SET  READ_WRITE 
GO
