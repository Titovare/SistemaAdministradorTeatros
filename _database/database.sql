USE [master]
GO
/****** Object:  Database [SISTEMA_TEATROS]    Script Date: 7/21/2020 9:50:07 PM ******/
CREATE DATABASE [SISTEMA_TEATROS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SISTEMA_TEATROS', FILENAME = N'D:\Development\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\SISTEMA_TEATROS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SISTEMA_TEATROS_log', FILENAME = N'D:\Development\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\SISTEMA_TEATROS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SISTEMA_TEATROS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SISTEMA_TEATROS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SISTEMA_TEATROS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET RECOVERY FULL 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET  MULTI_USER 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SISTEMA_TEATROS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SISTEMA_TEATROS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SISTEMA_TEATROS', N'ON'
GO
ALTER DATABASE [SISTEMA_TEATROS] SET QUERY_STORE = OFF
GO
USE [SISTEMA_TEATROS]
GO
/****** Object:  User [pepito]    Script Date: 7/21/2020 9:50:07 PM ******/
CREATE USER [pepito] FOR LOGIN [pepito] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [app_teatroadmin]    Script Date: 7/21/2020 9:50:07 PM ******/
CREATE USER [app_teatroadmin] FOR LOGIN [app_teatroadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [app_sysadmin]    Script Date: 7/21/2020 9:50:07 PM ******/
CREATE USER [app_sysadmin] FOR LOGIN [app_sysadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [TeatroAgentes]    Script Date: 7/21/2020 9:50:08 PM ******/
CREATE ROLE [TeatroAgentes]
GO
/****** Object:  DatabaseRole [TeatroAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
CREATE ROLE [TeatroAdministradores]
GO
/****** Object:  DatabaseRole [SistemaAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
CREATE ROLE [SistemaAdministradores]
GO
ALTER ROLE [db_owner] ADD MEMBER [pepito]
GO
ALTER ROLE [TeatroAdministradores] ADD MEMBER [app_teatroadmin]
GO
ALTER ROLE [SistemaAdministradores] ADD MEMBER [app_sysadmin]
GO
GRANT CONNECT TO [app_sysadmin] AS [dbo]
GO
GRANT CONNECT TO [app_teatroadmin] AS [dbo]
GO
GRANT CONNECT TO [pepito] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Asientos] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Asientos] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Asientos] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Asientos] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Asientos] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Asientos] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Asientos] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Asientos] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Asientos] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Asientos] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Asientos] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Asientos] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[AsientosxReservaciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[AsientosxReservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[AsientosxReservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[AsientosxReservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[AsientosxReservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[AsientosxReservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[AsientosxReservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[AsientosxReservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[AsientosxReservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[AsientosxReservaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[AsientosxReservaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[AsientosxReservaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[AsientosxReservaciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[BloquePrecios]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[BloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[BloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[BloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[BloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[BloquePrecios] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[BloquePrecios] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[BloquePrecios] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[BloquePrecios] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[BloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[BloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[BloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[BloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Bloques]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Bloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Bloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Bloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Bloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Bloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Bloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Bloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Bloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Bloques] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Bloques] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Bloques] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Bloques] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Clientes] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Clientes] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Clientes] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Clientes] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Clientes] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Clientes] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Clientes] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Clientes] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Clientes] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Clientes] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Clientes] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Clientes] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Empleados] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Empleados] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Empleados] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Empleados] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Empleados] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Empleados] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Empleados] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Empleados] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Empleados] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Empleados] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Empleados] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Empleados] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Filas]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Filas] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Filas] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Filas] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Filas] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Filas] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Filas] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Filas] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Filas] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Filas] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Filas] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Filas] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Filas] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Presentaciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Presentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Presentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Presentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Presentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Presentaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Presentaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Presentaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Presentaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Presentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Presentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Presentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Presentaciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Producciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Producciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Producciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Producciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Producciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Producciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Producciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Producciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Producciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Producciones] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Producciones] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Producciones] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Producciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[ProduccionEstados]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[ProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[ProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[ProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[ProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[ProduccionEstados] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[ProduccionEstados] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[ProduccionEstados] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[ProduccionEstados] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[ProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[ProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[ProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[ProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[ProduccionTipos]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[ProduccionTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[ProduccionTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[ProduccionTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[ProduccionTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[ProduccionTipos] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[ProduccionTipos] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[ProduccionTipos] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[ProduccionTipos] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[ProduccionTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[ProduccionTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[ProduccionTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[ProduccionTipos] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Reservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Reservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Reservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Reservaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Reservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Reservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Reservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Reservaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Reservaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Reservaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Reservaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Reservaciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[SistemaAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SistemaAdministradores](
	[Id] [int] NOT NULL,
 CONSTRAINT [PkSistemaAdministradores_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[SistemaAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[SistemaAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[SistemaAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[SistemaAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[SistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[SistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[SistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[SistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[SistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[SistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[SistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[SistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[TeatroAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[TeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[TeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[TeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[TeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[TeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[TeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[TeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[TeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[TeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[TeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[TeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[TeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[TeatroAgentes]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[TeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[TeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[TeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[TeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[TeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[TeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[TeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[TeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[TeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[TeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[TeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[TeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Table [dbo].[Teatros]    Script Date: 7/21/2020 9:50:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
DENY DELETE ON [dbo].[Teatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Teatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Teatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Teatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Teatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY INSERT ON [dbo].[Teatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY SELECT ON [dbo].[Teatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY UPDATE ON [dbo].[Teatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY DELETE ON [dbo].[Teatros] TO [TeatroAgentes] AS [dbo]
GO
DENY INSERT ON [dbo].[Teatros] TO [TeatroAgentes] AS [dbo]
GO
DENY SELECT ON [dbo].[Teatros] TO [TeatroAgentes] AS [dbo]
GO
DENY UPDATE ON [dbo].[Teatros] TO [TeatroAgentes] AS [dbo]
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
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (1, N'A', 11)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (2, N'A', 11)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (3, N'A', 11)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (4, N'A', 11)
INSERT [dbo].[Asientos] ([AsientoId], [FilaId], [BloqueId]) VALUES (5, N'A', 11)
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
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (11, N'BLOQUE1', 8)
INSERT [dbo].[Bloques] ([Id], [Nombre], [IdTeatro]) VALUES (12, N'BLOQUE2', 8)
SET IDENTITY_INSERT [dbo].[Bloques] OFF
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (111111111, N'agente1', CAST(N'2020-07-20' AS Date), N'M', N'xd', NULL, NULL, NULL, N'agente1@gmail.com', N'Pepito2022', N'$2a$04$pSs2bZJGVMten5nBEGvSyeJIRGeRQvs50ej8p99C1PdEh/4x4Qjwq')
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (123456787, N'jost', CAST(N'2020-07-08' AS Date), N'M', N'xd', NULL, NULL, NULL, N'pepito@gmail.com', N'Pepito2021', N'$2a$04$KbiBP44i1AiYe4EN9p7FB.hMeEYFZseL/lM4LaBOkPfc3ih2ogLhq')
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (123456788, N'Pepillo', CAST(N'2020-07-08' AS Date), N'M', N'Turrialba, Cartago', NULL, N'8888-8888', NULL, N'pepito@gmail.com', N'Pepillo', N'$2a$04$oqBio/3AM.agHzxF8EspS.7RKUfsKmF.ZUyXozv30oBBjPZSmnaQy')
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (123456789, N'Pepito', CAST(N'2020-05-19' AS Date), N'M', N'Turrialba, Cartago', N'8888-8888', N'8888-8888', N'8888-8888', N'pepito@gmail.com', N'Pepito2020', N'$2a$04$EItaPLCWyAlonvXss6F8sewVgZiaQGN4mmONYv/GCrLL6mruLDCqS')
INSERT [dbo].[Empleados] ([Id], [Nombre], [FechaNacimiento], [Sexo], [Direccion], [TelefonoCasa], [TelefonoCelular], [TelefonoOtro], [Email], [Usuario], [Password]) VALUES (222222222, N'PRUEBA_NUEVA', CAST(N'2020-07-09' AS Date), N'M', N'xd', NULL, NULL, NULL, N'jost@gmail.com', N'PRUEBA_NUEVA', N'$2a$04$b7O21NJucphM3DRSI4moq.3UgQPUXiae/9r2NwYE7VWtcQ.bItN/q')
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 1, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'B', 1, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 2, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 3, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'B', 3, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 4, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 8, 5)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 9, 10)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'B', 9, 10)
INSERT [dbo].[Filas] ([FilaId], [BloqueId], [NumeroAsientos]) VALUES (N'A', 11, 5)
INSERT [dbo].[SistemaAdministradores] ([Id]) VALUES (123456789)
INSERT [dbo].[TeatroAdministradores] ([Id], [IdTeatro]) VALUES (123456787, 1)
INSERT [dbo].[TeatroAdministradores] ([Id], [IdTeatro]) VALUES (222222222, 8)
INSERT [dbo].[TeatroAgentes] ([Id], [IdTeatro]) VALUES (111111111, 1)
SET IDENTITY_INSERT [dbo].[Teatros] ON 

INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (1, N'TEATRO1', 20, N'teatro1@gmail.com', N'www.teatro1.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (2, N'TEATRO2', 15, N'teatro2@gmail.com', N'www.teatro2.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (3, N'TEATRO3', 0, N'teatro3@gmail.com', N'teatro3.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (4, N'TEATRO4', 0, N'teatro@gmail.com', N'www.teatroxd.com', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (5, N'TEATRO5', 0, N'teatro5@gmail.com', N'www.teatro5.com', N'12345678', N'12345678')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (6, N'TEATRO6', 20, N't@gmail.com', N'asdasd', N'8888-8888', N'8888-8888')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (7, N'TEATRO7', 0, N'andres@gmail.com', N'adssadasd', N'12345678', N'12345678')
INSERT [dbo].[Teatros] ([Id], [Nombre], [Capacidad], [Correo], [SitioWeb], [TelefonoAdministracion], [TelefonoBoleteria]) VALUES (8, N'TEATRONUEVO', 5, N'teatro1@gmail.com', N'www.teatro.com', N'8888-8888', N'8888-8888')
SET IDENTITY_INSERT [dbo].[Teatros] OFF
/****** Object:  Index [UnBloquePrecios_BloqueProduccion]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[BloquePrecios] ADD  CONSTRAINT [UnBloquePrecios_BloqueProduccion] UNIQUE NONCLUSTERED 
(
	[IdBloque] ASC,
	[IdProduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnBloques_NombreIdTeatro]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[Bloques] ADD  CONSTRAINT [UnBloques_NombreIdTeatro] UNIQUE NONCLUSTERED 
(
	[IdTeatro] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnClientes_Nombre]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [UnClientes_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnEmpleados_Nombre]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [UnEmpleados_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnEmpleados_Usuario]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [UnEmpleados_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnProducciones_Nombre]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[Producciones] ADD  CONSTRAINT [UnProducciones_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnProduccionEstados_Nombre]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[ProduccionEstados] ADD  CONSTRAINT [UnProduccionEstados_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnProduccionTipos_Nombre]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[ProduccionTipos] ADD  CONSTRAINT [UnProduccionTipos_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnTeatros_Nombre]    Script Date: 7/21/2020 9:50:08 PM ******/
ALTER TABLE [dbo].[Teatros] ADD  CONSTRAINT [UnTeatros_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[CreateBloquePrecios]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[CreateBloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateBloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateBloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateBloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateBloquePrecios] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[CreateBloquePrecios] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateBloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateBloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateBloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateBloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateBloquePrecios] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreateBloques]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[CreateBloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateBloques] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreateFilas]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[CreateFilas] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateFilas] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreatePresentacion]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[CreatePresentacion] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreatePresentacion] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreatePresentacion] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreatePresentacion] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreatePresentacion] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[CreatePresentacion] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreatePresentacion] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreatePresentacion] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreatePresentacion] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreatePresentacion] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreatePresentacion] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreateProduccion]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[CreateProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateProduccion] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[CreateProduccion] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateProduccion] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreateTeatroAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
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
	
GO
GRANT EXECUTE ON [dbo].[CreateTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreateTeatroAgentes]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateTeatroAgentes] 
@Id int,
@nombre nvarchar(30) ,
@IdTeatro int,
@fecha date,
@sexo char,
@direccion nvarchar(40),
@email nvarchar(20),
@usuario nvarchar(20),
@password char(60),
@tCasa varchar(9) = NULL,
@tMovil  varchar(9) = NULL,
@tOtro varchar(9) = NULL

AS
INSERT INTO Empleados(Id,Nombre,FechaNacimiento,Sexo,Direccion,TelefonoCasa,TelefonoCelular,TelefonoOtro,Email,Usuario,Password)

VALUES(@Id,@nombre,@fecha,@sexo,@direccion,@tCasa,@tMovil,@tOtro,@email,@usuario,@password)

INSERT INTO TeatroAgentes(Id,IdTeatro)

VALUES (@Id,@IdTeatro)
GO
DENY ALTER ON [dbo].[CreateTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[CreateTeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CreateTeatros]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[CreateTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[CreateTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[CreateTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[CreateTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[CreateTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[CreateTeatros] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByIdProduccionEstados]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[GetByIdProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByIdProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByIdProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByIdProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByIdProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetByIdProduccionEstados] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByIdProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByIdProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByIdProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByIdProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByIdProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByIdTeatroAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[GetByIdTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByIdTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByIdTeatros]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetByIdTeatros]
	@IdTeatro Int
AS
	SELECT * FROM Teatros WHERE Id = @IdTeatro
GO
DENY ALTER ON [dbo].[GetByIdTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByIdTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByIdTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByIdTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByIdTeatros] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetByIdTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByIdTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByIdTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByIdTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByIdTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByIdTeatros] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByLetraFilas]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[GetByLetraFilas] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByLetraFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByLetraFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByLetraFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByLetraFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByLetraFilas] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByLetraFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByLetraFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByLetraFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByLetraFilas] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByLetraFilas] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreBloques]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[GetByNombreBloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreBloques] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreProduccion]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[GetByNombreProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreProduccion] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetByNombreProduccion] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreProduccion] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreTeatroAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[GetByNombreTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByNombreTeatros]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetByNombreTeatros]
	@NombreTeatro VARCHAR(30)
AS
	SELECT * FROM Teatros WHERE Nombre = @NombreTeatro;
GO
GRANT EXECUTE ON [dbo].[GetByNombreTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByNombreTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByNombreTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByNombreTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByNombreTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByNombreTeatros] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByProduccionIdPresentaciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[GetByProduccionIdPresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByProduccionIdPresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByProduccionIdPresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByProduccionIdPresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByProduccionIdPresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetByProduccionIdPresentaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByProduccionIdPresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByProduccionIdPresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByProduccionIdPresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByProduccionIdPresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByProduccionIdPresentaciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByTeatroIdBloques]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[GetByTeatroIdBloques] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByTeatroIdBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByTeatroIdBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByTeatroIdBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByTeatroIdBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByTeatroIdBloques] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByTeatroIdBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByTeatroIdBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByTeatroIdBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByTeatroIdBloques] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByTeatroIdBloques] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByUsernameSistemaAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
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
GRANT EXECUTE ON [dbo].[GetByUsernameSistemaAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByUsernameSistemaAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetByUsuarioTeatroAdministradores]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetByUsuarioTeatroAdministradores]
	@Usuario VARCHAR(20)
AS
	SELECT *
	FROM Empleados INNER JOIN TeatroAdministradores ON (Empleados.Id = TeatroAdministradores.Id)
	WHERE Empleados.Usuario = @Usuario;
GO
DENY ALTER ON [dbo].[GetByUsuarioTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByUsuarioTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByUsuarioTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByUsuarioTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByUsuarioTeatroAdministradores] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetByUsuarioTeatroAdministradores] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetByUsuarioTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetByUsuarioTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetByUsuarioTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetByUsuarioTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetByUsuarioTeatroAdministradores] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[getProducciones]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getProducciones]
AS
SELECT * 
FROM Producciones
GO
DENY ALTER ON [dbo].[getProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[getProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[getProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[getProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[getProducciones] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[getProducciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[getProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[getProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[getProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[getProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[getProducciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetProduccionEstados]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[GetProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetProduccionEstados] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetProduccionEstados] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetProduccionEstados] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetProduccionesTipos]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[GetProduccionesTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetProduccionesTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetProduccionesTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetProduccionesTipos] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetProduccionesTipos] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[GetProduccionesTipos] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetProduccionesTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetProduccionesTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetProduccionesTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetProduccionesTipos] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetProduccionesTipos] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[GetTeatros]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTeatros]
AS
	SELECT Id, Nombre, Capacidad, Correo, SitioWeb, TelefonoAdministracion, TelefonoBoleteria
	FROM Teatros;
GO
GRANT EXECUTE ON [dbo].[GetTeatros] TO [SistemaAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetTeatros] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[GetTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[GetTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[GetTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[GetTeatros] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[GetTeatros] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[UpdateIdEstadoProduccion]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[UpdateIdEstadoProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[UpdateIdEstadoProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[UpdateIdEstadoProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[UpdateIdEstadoProduccion] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[UpdateIdEstadoProduccion] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[UpdateIdEstadoProduccion] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[UpdateIdEstadoProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[UpdateIdEstadoProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[UpdateIdEstadoProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[UpdateIdEstadoProduccion] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[UpdateIdEstadoProduccion] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[ValidateDatePresentaciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[ValidateDatePresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateDatePresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateDatePresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateDatePresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateDatePresentaciones] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[ValidateDatePresentaciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[ValidateDatePresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateDatePresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateDatePresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateDatePresentaciones] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateDatePresentaciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[ValidateIdTeatroAgentes]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateIdTeatroAgentes] 
@Id int
AS
SELECT *
FROM Empleados
WHERE Id = @ID
GO
DENY ALTER ON [dbo].[ValidateIdTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateIdTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateIdTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateIdTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateIdTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[ValidateIdTeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[ValidateIdTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateIdTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateIdTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateIdTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateIdTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[ValidateNameProducciones]    Script Date: 7/21/2020 9:50:08 PM ******/
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
DENY ALTER ON [dbo].[ValidateNameProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateNameProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateNameProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateNameProducciones] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateNameProducciones] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[ValidateNameProducciones] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[ValidateNameProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateNameProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateNameProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateNameProducciones] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateNameProducciones] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[ValidateNameTeatroAgentes]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateNameTeatroAgentes]
@Nombre nvarchar(30)
AS
Select *
FROM Empleados
WHERE @Nombre = Nombre
GO
DENY ALTER ON [dbo].[ValidateNameTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateNameTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateNameTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateNameTeatroAgentes] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[ValidateNameTeatroAgentes] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[ValidateNameTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateNameTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateNameTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateNameTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateNameTeatroAgentes] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[ValidateUsername]    Script Date: 7/21/2020 9:50:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateUsername]
@Username nvarchar(20)
AS
Select *
FROM Empleados
WHERE @Username = usuario
GO
GRANT EXECUTE ON [dbo].[ValidateUsername] TO [SistemaAdministradores] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[ValidateUsername] TO [TeatroAdministradores] AS [dbo]
GO
DENY ALTER ON [dbo].[ValidateUsername] TO [TeatroAgentes] AS [dbo]
GO
DENY CONTROL ON [dbo].[ValidateUsername] TO [TeatroAgentes] AS [dbo]
GO
DENY EXECUTE ON [dbo].[ValidateUsername] TO [TeatroAgentes] AS [dbo]
GO
DENY TAKE OWNERSHIP ON [dbo].[ValidateUsername] TO [TeatroAgentes] AS [dbo]
GO
DENY VIEW DEFINITION ON [dbo].[ValidateUsername] TO [TeatroAgentes] AS [dbo]
GO
/****** Object:  Trigger [dbo].[Trg_FilasIns]    Script Date: 7/21/2020 9:50:08 PM ******/
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
USE [master]
GO
ALTER DATABASE [SISTEMA_TEATROS] SET  READ_WRITE 
GO
