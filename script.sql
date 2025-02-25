USE [master]
GO
/****** Object:  Database [FastFood_DB]    Script Date: 22/12/2024 14:29:03 ******/
CREATE DATABASE [FastFood_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastFood_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FastFood_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FastFood_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FastFood_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FastFood_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastFood_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastFood_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastFood_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastFood_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastFood_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastFood_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastFood_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastFood_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastFood_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastFood_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastFood_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastFood_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastFood_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastFood_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastFood_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastFood_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FastFood_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastFood_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastFood_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastFood_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastFood_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastFood_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastFood_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastFood_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [FastFood_DB] SET  MULTI_USER 
GO
ALTER DATABASE [FastFood_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastFood_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastFood_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastFood_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FastFood_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FastFood_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FastFood_DB', N'ON'
GO
ALTER DATABASE [FastFood_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FastFood_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FastFood_DB]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[categoria_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[cliente_id] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](100) NOT NULL,
	[apellidos] [nvarchar](100) NOT NULL,
	[direccion] [nvarchar](100) NOT NULL,
	[telefono] [nvarchar](100) NULL,
	[correo] [nvarchar](100) NULL,
	[fecha_registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ordenes]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ordenes](
	[orden_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orden_id] ASC,
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[empleado_id] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](100) NOT NULL,
	[apellidos] [nvarchar](100) NOT NULL,
	[posicion] [nvarchar](100) NOT NULL,
	[sucursal_id] [int] NULL,
	[rol] [nvarchar](100) NOT NULL,
	[Departamento] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mensajeros]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mensajeros](
	[mensajero_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[es_externo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mensajero_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordenes]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenes](
	[orden_id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NULL,
	[empleado_id] [int] NULL,
	[sucursal_id] [int] NULL,
	[mensajero_id] [int] NULL,
	[tipo_pago_id] [int] NULL,
	[origen_id] [int] NULL,
	[horario_venta] [nvarchar](50) NULL,
	[total_compra] [decimal](10, 2) NOT NULL,
	[km_recorrer] [decimal](10, 2) NOT NULL,
	[fecha_despacho] [datetime] NULL,
	[fecha_entrega] [datetime] NULL,
	[fecha_orden_tomada] [datetime] NULL,
	[fecha_orden_lista] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[orden_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[origen_orden]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[origen_orden](
	[origen_id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[origen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[producto_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[categoria_id] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[sucursal_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[direccion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_pago]    Script Date: 22/12/2024 14:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_pago](
	[tipo_pago_id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tipo_pago_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalle_ordenes]  WITH CHECK ADD FOREIGN KEY([orden_id])
REFERENCES [dbo].[ordenes] ([orden_id])
GO
ALTER TABLE [dbo].[detalle_ordenes]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([producto_id])
GO
ALTER TABLE [dbo].[empleados]  WITH NOCHECK ADD FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([sucursal_id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([cliente_id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([empleado_id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([mensajero_id])
REFERENCES [dbo].[mensajeros] ([mensajero_id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([origen_id])
REFERENCES [dbo].[origen_orden] ([origen_id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([sucursal_id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([tipo_pago_id])
REFERENCES [dbo].[tipos_pago] ([tipo_pago_id])
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([categoria_id])
GO
USE [master]
GO
ALTER DATABASE [FastFood_DB] SET  READ_WRITE 
GO
