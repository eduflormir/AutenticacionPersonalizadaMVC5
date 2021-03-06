USE [master]
GO
/****** Object:  Database [Autenticacion]    Script Date: 24/11/2015 13:46:09 ******/
CREATE DATABASE [Autenticacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Autenticacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Autenticacion.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Autenticacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Autenticacion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Autenticacion] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Autenticacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Autenticacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Autenticacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Autenticacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Autenticacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Autenticacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Autenticacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Autenticacion] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Autenticacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Autenticacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Autenticacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Autenticacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Autenticacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Autenticacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Autenticacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Autenticacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Autenticacion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Autenticacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Autenticacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Autenticacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Autenticacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Autenticacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Autenticacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Autenticacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Autenticacion] SET RECOVERY FULL 
GO
ALTER DATABASE [Autenticacion] SET  MULTI_USER 
GO
ALTER DATABASE [Autenticacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Autenticacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Autenticacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Autenticacion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Autenticacion', N'ON'
GO
USE [Autenticacion]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 24/11/2015 13:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](50) NOT NULL,
	[url] [nchar](500) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 24/11/2015 13:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolesMenu]    Script Date: 24/11/2015 13:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesMenu](
	[idRol] [int] NOT NULL,
	[idMenu] [int] NOT NULL,
	[orden] [int] NOT NULL,
 CONSTRAINT [PK_RolesMenu] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/11/2015 13:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nchar](500) NOT NULL,
	[password] [nchar](500) NOT NULL,
	[nombre] [nchar](500) NULL,
	[imagen] [nchar](500) NULL,
	[apellidos] [nchar](500) NULL,
	[idRol] [int] NOT NULL,
	[email] [nchar](250) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([id], [nombre]) VALUES (1, N'Admin                                             ')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [login], [password], [nombre], [imagen], [apellidos], [idRol], [email]) VALUES (1, N'luis                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'7110eda4d09e062aa5e4a390b0a572ac0d2c0220                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Luis                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'url                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Gil                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', 1, N'XMN0t6qp/PCtadqKHpH2bSF7jK5QeMfheU/ihajUjAnWpSBgZ9Jq70u3+2VYKifP                                                                                                                                                                                          ')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[RolesMenu]  WITH CHECK ADD  CONSTRAINT [FK_RolesMenu_Menu] FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[RolesMenu] CHECK CONSTRAINT [FK_RolesMenu_Menu]
GO
ALTER TABLE [dbo].[RolesMenu]  WITH CHECK ADD  CONSTRAINT [FK_RolesMenu_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[RolesMenu] CHECK CONSTRAINT [FK_RolesMenu_Rol]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [Autenticacion] SET  READ_WRITE 
GO
