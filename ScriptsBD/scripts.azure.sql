/****** Object:  Table [dbo].[Menu]    Script Date: 24/11/2015 13:45:53 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 24/11/2015 13:45:53 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[RolesMenu]    Script Date: 24/11/2015 13:45:53 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/11/2015 13:45:53 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

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
