USE [SISTEMA_TEATROS]
GO
/****** Object:  User [app_sysadmin]    Script Date: 20/7/2020 11:33:56 ******/
CREATE USER [app_sysadmin] FOR LOGIN [app_sysadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [app_teatroadmin]    Script Date: 20/7/2020 11:33:56 ******/
CREATE USER [app_teatroadmin] FOR LOGIN [app_teatroadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [app_sysadmin]
GO
ALTER ROLE [db_owner] ADD MEMBER [app_teatroadmin]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 20/7/2020 11:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[AsientoId] [int] NOT NULL,
	[FilaId] [char](1) NOT NULL,
	[BloqueId] [int] NOT NULL,
 CONSTRAINT [PkAsientos_Id] PRIMARY KEY CLUSTERED 
(
	[BloqueId] ASC,
	[FilaId] ASC,
	[AsientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsientosxReservaciones]    Script Date: 20/7/2020 11:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsientosxReservaciones](
	[AsientoId] [int] NOT NULL,
	[FilaId] [char](1) NOT NULL,
	[BloqueId] [int] NOT NULL,
	[ReservacionId] [int] NOT NULL,
 CONSTRAINT [PkAsientosxReservaciones_Id] PRIMARY KEY CLUSTERED 
(
	[BloqueId] ASC,
	[FilaId] ASC,
	[AsientoId] ASC,
	[ReservacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloquePrecios]    Script Date: 20/7/2020 11:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloquePrecios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[IdBloque] [int] NOT NULL,
	[IdProduccion] [int] NOT NULL,
 CONSTRAINT [PkBloquePrecios_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bloques]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloques](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[IdTeatro] [int] NOT NULL,
 CONSTRAINT [PkBloques_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Telefono] [varchar](9) NOT NULL,
 CONSTRAINT [PkClientes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Direccion] [varchar](40) NOT NULL,
	[TelefonoCasa] [varchar](9) NULL,
	[TelefonoCelular] [varchar](9) NULL,
	[TelefonoOtro] [varchar](9) NULL,
	[Email] [varchar](40) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Password] [char](60) NOT NULL,
 CONSTRAINT [PkEmpleados_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filas]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filas](
	[FilaId] [char](1) NOT NULL,
	[BloqueId] [int] NOT NULL,
	[NumeroAsientos] [int] NOT NULL,
 CONSTRAINT [PkFilas_Id] PRIMARY KEY CLUSTERED 
(
	[BloqueId] ASC,
	[FilaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentaciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentaciones](
	[PresentacionId] [int] NOT NULL,
	[ProduccionId] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
 CONSTRAINT [PkPresentaciones_Id] PRIMARY KEY CLUSTERED 
(
	[ProduccionId] ASC,
	[PresentacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[FechaInicial] [date] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[IdEstado] [int] NOT NULL,
	[IdTeatro] [int] NOT NULL,
	[IdTipo] [int] NOT NULL,
 CONSTRAINT [PkProducciones_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduccionEstados]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduccionEstados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PkProduccionEstados_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduccionTipos]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduccionTipos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PkProduccionTipos_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[PresentacionId] [int] NOT NULL,
 CONSTRAINT [PkReservaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SistemaAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SistemaAdministradores](
	[Id] [int] NOT NULL,
 CONSTRAINT [PkSistemaAdministradores_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeatroAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeatroAdministradores](
	[Id] [int] NOT NULL,
	[IdTeatro] [int] NOT NULL,
 CONSTRAINT [PkTeatroAdministradores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeatroAgentes]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeatroAgentes](
	[Id] [int] NOT NULL,
	[IdTeatro] [int] NOT NULL,
 CONSTRAINT [PkTeatroAgentes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teatros]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teatros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Correo] [nvarchar](30) NOT NULL,
	[SitioWeb] [nvarchar](30) NOT NULL,
	[TelefonoAdministracion] [varchar](9) NOT NULL,
	[TelefonoBoleteria] [varchar](9) NOT NULL,
 CONSTRAINT [PkTeatros_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'B', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'B', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'B', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'B', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'B', 1)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 2)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 2)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 2)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 2)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 2)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'B', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'B', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'B', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'B', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'B', 3)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 4)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 4)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 4)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 4)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 4)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 8)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 8)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 8)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 8)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 8)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (6, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (7, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (8, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (9, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (10, N'A', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (6, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (7, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (8, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (9, N'B', 9)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (10, N'B', 9)
SET IDENTITY_INSERT [dbo].[Bloques] ON 

INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (1, N'BLOQUE1', 1)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (2, N'BLOQUE2', 1)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (5, N'bloquenuevo', 1)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (8, N'bloquesito', 1)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (3, N'BLOQUE1', 2)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (4, N'BLOQUE2', 2)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (6, N'NUEVO_BLOQUE', 3)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (7, N'BLOQUE1', 4)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (9, N'BLOQUE1', 6)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (10, N'BLOQUE2', 6)
SET IDENTITY_INSERT [dbo].[Bloques] OFF
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (123456788, N'Pepillo', CAST(N'2020-07-08' AS Date), N'M', N'Turrialba, Cartago', NULL, N'8888-8888', NULL, N'pepito@gmail.com', N'Pepillo', N'$2a$04$oqBio/3AM.agHzxF8EspS.7RKUfsKmF.ZUyXozv30oBBjPZSmnaQy')
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (123456789, N'Pepito', CAST(N'2020-05-19' AS Date), N'M', N'Turrialba, Cartago', N'8888-8888', N'8888-8888', N'8888-8888', N'pepito@gmail.com', N'Pepito2020', N'$2a$04$EItaPLCWyAlonvXss6F8sewVgZiaQGN4mmONYv/GCrLL6mruLDCqS')
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 1, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'B', 1, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 2, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 3, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'B', 3, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 4, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 8, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 9, 10)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'B', 9, 10)
INSERT [dbo].[SistemaAdministradores] ([Id]) VALUES (123456789)
SET IDENTITY_INSERT [dbo].[Teatros] ON 

INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (1, N'TEATRO1', 20, N'teatro1@gmail.com', N'www.teatro1.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (2, N'TEATRO2', 15, N'teatro2@gmail.com', N'www.teatro2.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (3, N'TEATRO3', 0, N'teatro3@gmail.com', N'teatro3.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (4, N'TEATRO4', 0, N'teatro@gmail.com', N'www.teatroxd.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (5, N'TEATRO5', 0, N'teatro5@gmail.com', N'www.teatro5.com', N'12345678', N'12345678')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (6, N'TEATRO6', 20, N't@gmail.com', N'asdasd', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (7, N'TEATRO7', 0, N'andres@gmail.com', N'adssadasd', N'12345678', N'12345678')
SET IDENTITY_INSERT [dbo].[Teatros] OFF
/****** Object:  Index [UnBloquePrecios_BloqueProduccion]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[BloquePrecios] ADD  CONSTRAINT [UnBloquePrecios_BloqueProduccion] UNIQUE NONCLUSTERED 
(
	[IdBloque] ASC,
	[IdProduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnBloques_NombreIdTeatro]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[Bloques] ADD  CONSTRAINT [UnBloques_NombreIdTeatro] UNIQUE NONCLUSTERED 
(
	[IdTeatro] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnClientes_Nombre]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [UnClientes_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnEmpleados_Nombre]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [UnEmpleados_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnEmpleados_Usuario]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [UnEmpleados_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnProducciones_Nombre]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[Producciones] ADD  CONSTRAINT [UnProducciones_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnProduccionEstados_Nombre]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[ProduccionEstados] ADD  CONSTRAINT [UnProduccionEstados_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnProduccionTipos_Nombre]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[ProduccionTipos] ADD  CONSTRAINT [UnProduccionTipos_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnTeatros_Nombre]    Script Date: 20/7/2020 11:33:57 ******/
ALTER TABLE [dbo].[Teatros] ADD  CONSTRAINT [UnTeatros_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asientos]  WITH CHECK ADD  CONSTRAINT [FkAsientos_IdFilas] FOREIGN KEY([BloqueId], [FilaId])
REFERENCES [dbo].[Filas] ([BloqueId], [FilaId])
GO
ALTER TABLE [dbo].[Asientos] CHECK CONSTRAINT [FkAsientos_IdFilas]
GO
ALTER TABLE [dbo].[AsientosxReservaciones]  WITH CHECK ADD  CONSTRAINT [FkAsientosxReservaciones_IdAsientos] FOREIGN KEY([BloqueId], [FilaId], [AsientoId])
REFERENCES [dbo].[Asientos] ([BloqueId], [FilaId], [AsientoId])
GO
ALTER TABLE [dbo].[AsientosxReservaciones] CHECK CONSTRAINT [FkAsientosxReservaciones_IdAsientos]
GO
ALTER TABLE [dbo].[AsientosxReservaciones]  WITH CHECK ADD  CONSTRAINT [FkAsientosxReservaciones_IdReservaciones] FOREIGN KEY([ReservacionId])
REFERENCES [dbo].[Reservaciones] ([Id])
GO
ALTER TABLE [dbo].[AsientosxReservaciones] CHECK CONSTRAINT [FkAsientosxReservaciones_IdReservaciones]
GO
ALTER TABLE [dbo].[BloquePrecios]  WITH CHECK ADD  CONSTRAINT [FkBloquePrecios_IdBloque] FOREIGN KEY([IdBloque])
REFERENCES [dbo].[Bloques] ([Id])
GO
ALTER TABLE [dbo].[BloquePrecios] CHECK CONSTRAINT [FkBloquePrecios_IdBloque]
GO
ALTER TABLE [dbo].[BloquePrecios]  WITH CHECK ADD  CONSTRAINT [FkBloquePrecios_IdProduccion] FOREIGN KEY([IdProduccion])
REFERENCES [dbo].[Producciones] ([Id])
GO
ALTER TABLE [dbo].[BloquePrecios] CHECK CONSTRAINT [FkBloquePrecios_IdProduccion]
GO
ALTER TABLE [dbo].[Bloques]  WITH CHECK ADD  CONSTRAINT [FkBloques_IdTeatro] FOREIGN KEY([IdTeatro])
REFERENCES [dbo].[Teatros] ([Id])
GO
ALTER TABLE [dbo].[Bloques] CHECK CONSTRAINT [FkBloques_IdTeatro]
GO
ALTER TABLE [dbo].[Filas]  WITH CHECK ADD  CONSTRAINT [FkFilas_IdBloque] FOREIGN KEY([BloqueId])
REFERENCES [dbo].[Bloques] ([Id])
GO
ALTER TABLE [dbo].[Filas] CHECK CONSTRAINT [FkFilas_IdBloque]
GO
ALTER TABLE [dbo].[Presentaciones]  WITH CHECK ADD  CONSTRAINT [FkPresentaciones_IdProduccion] FOREIGN KEY([ProduccionId])
REFERENCES [dbo].[Producciones] ([Id])
GO
ALTER TABLE [dbo].[Presentaciones] CHECK CONSTRAINT [FkPresentaciones_IdProduccion]
GO
ALTER TABLE [dbo].[Producciones]  WITH CHECK ADD  CONSTRAINT [FkProducciones_IdEstado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[ProduccionEstados] ([Id])
GO
ALTER TABLE [dbo].[Producciones] CHECK CONSTRAINT [FkProducciones_IdEstado]
GO
ALTER TABLE [dbo].[Producciones]  WITH CHECK ADD  CONSTRAINT [FkProducciones_IdTeatro] FOREIGN KEY([IdTeatro])
REFERENCES [dbo].[Teatros] ([Id])
GO
ALTER TABLE [dbo].[Producciones] CHECK CONSTRAINT [FkProducciones_IdTeatro]
GO
ALTER TABLE [dbo].[Producciones]  WITH CHECK ADD  CONSTRAINT [FkProducciones_IdTipo] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[ProduccionTipos] ([Id])
GO
ALTER TABLE [dbo].[Producciones] CHECK CONSTRAINT [FkProducciones_IdTipo]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FkReservaciones_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FkReservaciones_IdCliente]
GO
ALTER TABLE [dbo].[SistemaAdministradores]  WITH CHECK ADD  CONSTRAINT [FkSistemaAdministradores_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[SistemaAdministradores] CHECK CONSTRAINT [FkSistemaAdministradores_Id]
GO
ALTER TABLE [dbo].[TeatroAdministradores]  WITH CHECK ADD  CONSTRAINT [FkTeatroAdministradores_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[TeatroAdministradores] CHECK CONSTRAINT [FkTeatroAdministradores_Id]
GO
ALTER TABLE [dbo].[TeatroAdministradores]  WITH CHECK ADD  CONSTRAINT [FkTeatroAdministradores_IdTeatro] FOREIGN KEY([IdTeatro])
REFERENCES [dbo].[Teatros] ([Id])
GO
ALTER TABLE [dbo].[TeatroAdministradores] CHECK CONSTRAINT [FkTeatroAdministradores_IdTeatro]
GO
ALTER TABLE [dbo].[TeatroAgentes]  WITH CHECK ADD  CONSTRAINT [FkTeatroAgentes_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[TeatroAgentes] CHECK CONSTRAINT [FkTeatroAgentes_Id]
GO
ALTER TABLE [dbo].[TeatroAgentes]  WITH CHECK ADD  CONSTRAINT [FkTeatroAgentes_IdTeatro] FOREIGN KEY([IdTeatro])
REFERENCES [dbo].[Teatros] ([Id])
GO
ALTER TABLE [dbo].[TeatroAgentes] CHECK CONSTRAINT [FkTeatroAgentes_IdTeatro]
GO
/****** Object:  StoredProcedure [dbo].[CreateBloquePrecios]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateBloquePrecios]
@Monto Decimal(10,2),
@IdBloque INT,
@IdProduccion INT
AS
INSERT INTO BloquePrecios(Monto,IdBloque,IdProduccion)
VALUES (@Monto,@IdBloque,@IdProduccion)
GO
/****** Object:  StoredProcedure [dbo].[CreateBloques]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateBloques]
	@Nombre NVARCHAR(20),
	@IdTeatro INT
AS
	INSERT INTO Bloques(Nombre, IdTeatro) VALUES(@Nombre, @IdTeatro);
GO
/****** Object:  StoredProcedure [dbo].[CreateFilas]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateFilas]
	@FilaId CHAR,
	@BloqueId INT,
	@NumeroAsientos INT
AS
	DECLARE @TeatroId INT;
	INSERT INTO Filas(FilaId, BloqueId, NumeroAsientos) VALUES(@FilaId, @BloqueId, @NumeroAsientos);
	SELECT @TeatroId = Bloques.IdTeatro FROM Bloques WHERE Bloques.Id = @BloqueId;
	UPDATE Teatros SET Capacidad = Capacidad + @NumeroAsientos WHERE Id = @TeatroId;
GO
/****** Object:  StoredProcedure [dbo].[CreatePresentacion]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreatePresentacion]
@IdProd int,
@Id int,
@Fecha Date,
@Hora Time

AS
	INSERT INTO Presentaciones(ProduccionId,PresentacionId,Fecha,Hora)
	VALUES(@IdProd,@Id,@Fecha,@Hora)

GO
/****** Object:  StoredProcedure [dbo].[CreateProduccion]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateProduccion]
@name nvarchar(30),
@desc text,
@dateI DATE,
@dateF DATE,
@IdE int,
@IdTe int,
@IdTi int
AS
INSERT INTO Producciones(Descripcion,FechaInicial,FechaFinal,Nombre,IdEstado,IdTeatro,IdTipo)
VALUES(@desc,@dateI,@dateF,@name,@IdE,@IdTe,@IdTi)
GO
/****** Object:  StoredProcedure [dbo].[CreateTeatroAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTeatroAdministradores]
	@Id INT,
	@Nombre VARCHAR(30),
	@IdTeatro INT,
	@FechaNacimiento DATE,
	@Sexo CHAR,
	@Direccion VARCHAR(40),
	@TelefonoCasa VARCHAR(9) = NULL, --DEFAULT VALUES
	@TelefonoCelular VARCHAR(9) = NULL,
	@TelefonoOtro VARCHAR(9) = NULL,
	@Email VARCHAR(40),
	@Usuario VARCHAR(20),
	@Password CHAR(60)
AS
	INSERT INTO Empleados(Id, Nombre, FechaNacimiento, Sexo, Direccion,
	TelefonoCasa, TelefonoCelular, TelefonoOtro, Email, Usuario, Password)
	VALUES(@Id, @Nombre, @FechaNacimiento, @Sexo, @Direccion, @TelefonoCasa, 
	@TelefonoCelular, @TelefonoOtro, @Email, @Usuario, @Password)

	INSERT INTO TeatroAdministradores(Id, IdTeatro)
	VALUES(@Id, @IdTeatro);

DELETE FROM TeatroAdministradores;

EXEC CreateTeatroAdministradores 123456789, 'Pepito', 1, '2020-05-19', 'M', 'Turrialba, Cartago', '8888-8888', '8888-8888', '8888-8888',
'pepito@gmail.com', 'Pepito2020', '$2a$04$EItaPLCWyAlonvXss6F8sewVgZiaQGN4mmONYv/GCrLL6mruLDCqS'

GO
/****** Object:  StoredProcedure [dbo].[CreateTeatros]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTeatros]
	@Nombre NVARCHAR(30),
	@Capacidad INT,
	@Correo NVARCHAR(30),
	@SitioWeb NVARCHAR(30),
	@TelefonoAdministracion VARCHAR(9),
	@TelefonoBoleteria VARCHAR(9)
AS
	INSERT INTO Teatros(Nombre, Capacidad, Correo, SitioWeb, TelefonoAdministracion, TelefonoBoleteria)
	VALUES(@Nombre, @Capacidad, @Correo, @SitioWeb, @TelefonoAdministracion, @TelefonoBoleteria);
GO
/****** Object:  StoredProcedure [dbo].[GetByIdProduccionEstados]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetByIdProduccionEstados]
@Id int
AS
SELECT *
FROM ProduccionEstados
Where Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[GetByIdTeatroAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetByIdTeatroAdministradores]
	@Id INT
AS
	SELECT Id, Nombre, Direccion, TelefonoCasa, TelefonoCelular, TelefonoOtro,
		Email, Sexo, FechaNacimiento
	FROM Empleados
	WHERE Empleados.Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[GetByIdTeatros]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetByIdTeatros]
	@IdTeatro Int
AS
	SELECT * FROM Teatros WHERE Id = @IdTeatro
GO
/****** Object:  StoredProcedure [dbo].[GetByLetraFilas]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetByLetraFilas]
	@Letra CHAR,
	@IdBloque INT
AS
	SELECT * FROM Filas WHERE FilaId = @Letra AND BloqueId = @IdBloque;
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreBloques]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetByNombreBloques]
	@NombreBloque NVARCHAR(20),
	@IdTeatro INT
AS
	SELECT * FROM Bloques WHERE Bloques.Nombre = @NombreBloque AND Bloques.IdTeatro = @IdTeatro;
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreProduccion]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetByNombreProduccion]	
@nombre nvarchar(30)
AS
SELECT *
FROM Producciones
WHERE nombre =  @nombre
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreTeatroAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetByNombreTeatroAdministradores]
	@Nombre VARCHAR(30)
AS
	SELECT Id, Nombre, Direccion, TelefonoCasa, TelefonoCelular, TelefonoOtro,
		Email, Sexo, FechaNacimiento
	FROM Empleados
	WHERE Empleados.Nombre = @Nombre;
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreTeatros]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetByNombreTeatros]
	@NombreTeatro VARCHAR(30)
AS
	SELECT * FROM Teatros WHERE Nombre = @NombreTeatro;
GO
/****** Object:  StoredProcedure [dbo].[GetByProduccionIdPresentaciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetByProduccionIdPresentaciones]
@Id int
AS
SELECT *
FROM Presentaciones
WHERE ProduccionId = @Id
Order by Fecha,Hora
GO
/****** Object:  StoredProcedure [dbo].[GetByTeatroIdBloques]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetByTeatroIdBloques]
	@IdTeatro INT
AS 
	SELECT Id, Nombre, IdTeatro
	FROM Bloques WHERE Bloques.IdTeatro = @IdTeatro;
GO
/****** Object:  StoredProcedure [dbo].[GetByUsernameSistemaAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetByUsernameSistemaAdministradores]
	@Username VARCHAR(20)
AS
	SELECT * 
	FROM SistemaAdministradores
	INNER JOIN Empleados ON (SistemaAdministradores.Id = Empleados.Id)
	WHERE Usuario = @Username;
GO
/****** Object:  StoredProcedure [dbo].[GetByUsernameSistemaTeatroAdmin]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetByUsernameSistemaTeatroAdmin] @Usuario nvarchar(20)
AS
SELECT * FROM TeatroAdministradores WHERE Usuario = @Usuario
GO
/****** Object:  StoredProcedure [dbo].[GetByUsuarioTeatroAdministradores]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetByUsuarioTeatroAdministradores]
	@Usuario VARCHAR(20)
AS
	SELECT Empleados.Id, Nombre, Direccion, TelefonoCasa, TelefonoCelular, TelefonoOtro,
		Email, Sexo, FechaNacimiento, Usuario
	FROM Empleados
	WHERE Empleados.Usuario = @Usuario;
GO
/****** Object:  StoredProcedure [dbo].[getProducciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getProducciones]
AS
SELECT * 
FROM Producciones
GO
/****** Object:  StoredProcedure [dbo].[GetProduccionEstados]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProduccionEstados]
AS
SELECT *
FROM ProduccionEstados
Order by Id 
GO
/****** Object:  StoredProcedure [dbo].[GetProduccionesTipos]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProduccionesTipos]
AS
SELECT * 
FROM ProduccionTipos
Order By ID
GO
/****** Object:  StoredProcedure [dbo].[GetTeatros]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTeatros]
AS
	SELECT Id, Nombre, Capacidad, Correo, SitioWeb, TelefonoAdministracion, TelefonoBoleteria
	FROM Teatros;
GO
/****** Object:  StoredProcedure [dbo].[UpdateIdEstadoProduccion]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateIdEstadoProduccion]
@Id int,
@Estado int
AS
UPDATE Producciones
SET IdEstado = @Estado
WHERE Id = @Id

GO
/****** Object:  StoredProcedure [dbo].[ValidateDatePresentaciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateDatePresentaciones]
@IdProd int,
@fecha date,
@hora time
AS
SELECT *
FROM Presentaciones
WHERE ProduccionId = @IdProd AND Fecha = @fecha AND Hora = @hora

GO
/****** Object:  StoredProcedure [dbo].[ValidateIdTeatroAgentes]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateIdTeatroAgentes] 
@Id int
AS
SELECT *
FROM TeatroAgentes
WHERE Id = @ID
GO
/****** Object:  StoredProcedure [dbo].[ValidateNameProducciones]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateNameProducciones]
@Nombre nvarchar(30)
AS
Select *
FROM Producciones
WHERE @Nombre = Nombre
GO
/****** Object:  StoredProcedure [dbo].[ValidateNameTeatroAgentes]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateNameTeatroAgentes]
@Nombre nvarchar(30)
AS
Select *
FROM TeatroAgentes
WHERE @Nombre = Nombre
GO
/****** Object:  StoredProcedure [dbo].[ValidateUsernameTeatroAgentes]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ValidateUsernameTeatroAgentes]
@Username nvarchar(20)
AS
Select *
FROM TeatroAgentes
WHERE @Username = usuario
GO
/****** Object:  Trigger [dbo].[Trg_FilasIns]    Script Date: 20/7/2020 11:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Trg_FilasIns]
	ON [dbo].[Filas]
	FOR INSERT
	AS
		DECLARE @NumeroAsientos INT;
		DECLARE @FilaId CHAR;
		DECLARE @BloqueId INT;
		DECLARE @contador INT;
		SET @contador = 0;

		SELECT @NumeroAsientos = inserted.NumeroAsientos, @FilaId = inserted.FilaId, @BloqueId = inserted.BloqueId 
		FROM inserted;

		WHILE @contador < @NumeroAsientos
			BEGIN
				INSERT INTO Asientos(AsientoId, FilaId, BloqueId) VALUES(@contador + 1, @FilaId, @BloqueId);
				SET @contador = @contador + 1;
			END
GO
ALTER TABLE [dbo].[Filas] ENABLE TRIGGER [Trg_FilasIns]
GO
