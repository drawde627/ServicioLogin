USE [master]
GO
/****** Object:  Database [Prueba]    Script Date: 8/08/2021 5:53:57 p. m. ******/
CREATE DATABASE [Prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Prueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Prueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prueba] SET  MULTI_USER 
GO
ALTER DATABASE [Prueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Prueba] SET QUERY_STORE = OFF
GO
USE [Prueba]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesPermisos]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesPermisos](
	[rolId] [int] NOT NULL,
	[PermisoId] [int] NOT NULL,
 CONSTRAINT [PK_PerfilesPermisos] PRIMARY KEY CLUSTERED 
(
	[rolId] ASC,
	[PermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Nombre] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[NombresCompletos] [varchar](200) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Edad] [int] NULL,
	[RolId] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON 

INSERT [dbo].[Permisos] ([Id], [Descripcion]) VALUES (1, N'Mensaje de bienvenida')
INSERT [dbo].[Permisos] ([Id], [Descripcion]) VALUES (2, N'Noticias de la empresa')
INSERT [dbo].[Permisos] ([Id], [Descripcion]) VALUES (4, N'Listar usuarios, filtrar por nombre y filtrar por rol')
INSERT [dbo].[Permisos] ([Id], [Descripcion]) VALUES (5, N'Edición de los datos de cualquier usuario')
INSERT [dbo].[Permisos] ([Id], [Descripcion]) VALUES (6, N'Crear y eliminar usuarios')
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([Id], [nombre]) VALUES (2, N'Editor')
INSERT [dbo].[Roles] ([Id], [nombre]) VALUES (3, N'Asistente')
INSERT [dbo].[Roles] ([Id], [nombre]) VALUES (4, N'Visitante')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (1, 1)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (1, 4)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (1, 5)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (1, 6)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (2, 1)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (2, 4)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (2, 5)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (3, 1)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (3, 4)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (4, 1)
INSERT [dbo].[RolesPermisos] ([rolId], [PermisoId]) VALUES (4, 2)
GO
INSERT [dbo].[Usuarios] ([Nombre], [Password], [NombresCompletos], [Direccion], [Telefono], [Email], [Edad], [RolId]) VALUES (N'admon', N'123', N'Jose Perez', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit,', N'1234567', N'jperez@correo.com', 38, 1)
GO
ALTER TABLE [dbo].[RolesPermisos]  WITH CHECK ADD  CONSTRAINT [FK_PerfilesPermisos_Perfiles] FOREIGN KEY([rolId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolesPermisos] CHECK CONSTRAINT [FK_PerfilesPermisos_Perfiles]
GO
ALTER TABLE [dbo].[RolesPermisos]  WITH CHECK ADD  CONSTRAINT [FK_PerfilesPermisos_Permisos] FOREIGN KEY([PermisoId])
REFERENCES [dbo].[Permisos] ([Id])
GO
ALTER TABLE [dbo].[RolesPermisos] CHECK CONSTRAINT [FK_PerfilesPermisos_Permisos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
/****** Object:  StoredProcedure [dbo].[SV_DEL_USUARIO]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SV_DEL_USUARIO] 
	@Nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Usuarios
	where Nombre=  @Nombre
	

END
GO
/****** Object:  StoredProcedure [dbo].[SV_INS_USUARIO]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SV_INS_USUARIO] 
	@Nombre varchar(50),
	@Password varchar(50),
	@NombresCompletos VARCHAR(200),
	@Direccion VARCHAR(200),
	@Telefono VARCHAR(50),
	@Email VARCHAR(50),
	@Edad INT,
	@RolId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Usuarios
	(
	Nombre,
	Password,
	NombresCompletos,
	Direccion,
	Telefono,
	Email,
	Edad,
	RolId
	)
	VALUES(@Nombre,@Password,@NombresCompletos,@Direccion,@Telefono,@Email,@Edad,@RolId)
	
	

END
GO
/****** Object:  StoredProcedure [dbo].[SV_SEL_LOGIN]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SV_SEL_LOGIN]
	@Nombre varchar(50),
	@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	declare @rol as int=0

	select @rol=U.RolId from Usuarios U
	where U.Nombre=@Nombre
	and U.Password=@Password


	SELECT U.Nombre,
	ISNULL(U.NombresCompletos,'') as NombresCompletos,
	ISNULL(U.Direccion,'') as Direccion,
	ISNULL(U.Telefono,'') as Telefono,
	ISNULL(U.Email,'') as Email,
	ISNULL(U.Edad,0) as Edad,
	U.RolId,
	R.nombre as RolNombre
	from Usuarios U with(nolock)
	inner join Roles R with(nolock) on R.Id=U.RolId
	where U.Nombre=@Nombre
	and U.Password=@Password

	select RP.PermisoId as Id,
	P.Descripcion
	from RolesPermisos RP
	inner join Permisos P on P.Id=RP.PermisoId
	where RolId=@rol
END
GO
/****** Object:  StoredProcedure [dbo].[SV_SEL_ROL]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SV_SEL_ROL]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	
	SELECT 
	R.Id,
	R.nombre
	from Roles R with(nolock) 

	
END
GO
/****** Object:  StoredProcedure [dbo].[SV_SEL_USUARIO]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SV_SEL_USUARIO]
	@Nombre varchar(50)='0',
	@RolId int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	
	SELECT U.Nombre,
	ISNULL(U.NombresCompletos,'') as NombresCompletos,
	ISNULL(U.Direccion,'') as Direccion,
	ISNULL(U.Telefono,'') as Telefono,
	ISNULL(U.Email,'') as Email,
	ISNULL(U.Edad,0) as Edad,
	U.RolId,
	R.nombre as RolNombre
	from Usuarios U with(nolock)
	inner join Roles R with(nolock) on R.Id=U.RolId
	where U.Nombre= case when @Nombre<>'0'
						then @Nombre
						else U.Nombre
					end
	
	and U.RolId=case when @RolId<>0
						then @RolId
						else U.RolId
					end

	
END
GO
/****** Object:  StoredProcedure [dbo].[SV_UPD_USUARIO]    Script Date: 8/08/2021 5:53:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SV_UPD_USUARIO] 
	@Nombre varchar(50),
	@NombresCompletos VARCHAR(200),
	@Direccion VARCHAR(200),
	@Telefono VARCHAR(50),
	@Email VARCHAR(50),
	@Edad INT,
	@RolId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Usuarios
	SET
	NombresCompletos=@NombresCompletos,
	Direccion=@Direccion,
	Telefono=@Telefono,
	Email=@Email,
	Edad=@Edad,
	RolId=@RolId
	
	where Nombre=  @Nombre
	

END
GO
USE [master]
GO
ALTER DATABASE [Prueba] SET  READ_WRITE 
GO
