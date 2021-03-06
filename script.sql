USE [master]
GO
/****** Object:  Database [PPE3]    Script Date: 13/06/2020 21:08:11 ******/
CREATE DATABASE [PPE3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PPE3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PPE3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PPE3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PPE3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PPE3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PPE3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PPE3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PPE3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PPE3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PPE3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PPE3] SET ARITHABORT OFF 
GO
ALTER DATABASE [PPE3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PPE3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PPE3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PPE3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PPE3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PPE3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PPE3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PPE3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PPE3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PPE3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PPE3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PPE3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PPE3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PPE3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PPE3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PPE3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PPE3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PPE3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PPE3] SET  MULTI_USER 
GO
ALTER DATABASE [PPE3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PPE3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PPE3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PPE3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PPE3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PPE3] SET QUERY_STORE = OFF
GO
USE [PPE3]
GO
/****** Object:  Table [dbo].[LIGNE_DE_FRAIS]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIGNE_DE_FRAIS](
	[ID_NOTE_DE_FRAIS] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Total] [int] NULL,
	[donner] [int] NULL,
	[id_note] [int] NULL,
 CONSTRAINT [PK_LIGNE_DE_FRAIS] PRIMARY KEY CLUSTERED 
(
	[ID_NOTE_DE_FRAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        Total, donner
FROM            dbo.LIGNE_DE_FRAIS
GO
/****** Object:  Table [dbo].[NOTE_DE_FRAIS]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTE_DE_FRAIS](
	[ID_NOTE_DE_FRAIS] [int] IDENTITY(1,1) NOT NULL,
	[DATE_DEPOT] [date] NULL,
	[Nom] [varchar](200) NULL,
	[ID_MISSION] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_NOTE_DE_FRAIS] PRIMARY KEY CLUSTERED 
(
	[ID_NOTE_DE_FRAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.LIGNE_DE_FRAIS.donner, dbo.LIGNE_DE_FRAIS.Total, dbo.LIGNE_DE_FRAIS.Nom, dbo.NOTE_DE_FRAIS.ID_NOTE_DE_FRAIS
FROM            dbo.LIGNE_DE_FRAIS INNER JOIN
                         dbo.NOTE_DE_FRAIS ON dbo.LIGNE_DE_FRAIS.id_note = dbo.NOTE_DE_FRAIS.ID_NOTE_DE_FRAIS
WHERE        (dbo.NOTE_DE_FRAIS.ID_NOTE_DE_FRAIS = 52)
GO
/****** Object:  Table [dbo].[AJOUTER]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AJOUTER](
	[ID_NOTE_DE_FRAIS] [int] NOT NULL,
	[ID_LIGNE_DE_FRAIS] [int] NOT NULL,
 CONSTRAINT [PK_AJOUTER] PRIMARY KEY CLUSTERED 
(
	[ID_NOTE_DE_FRAIS] ASC,
	[ID_LIGNE_DE_FRAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTIENT]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTIENT](
	[ID_TYPE_FRAIS] [char](32) NOT NULL,
	[ID_LIGNE_DE_FRAIS] [int] NOT NULL,
 CONSTRAINT [PK_CONTIENT] PRIMARY KEY CLUSTERED 
(
	[ID_TYPE_FRAIS] ASC,
	[ID_LIGNE_DE_FRAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LES_RESPONSABLE_REGION]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LES_RESPONSABLE_REGION](
	[ID_PERSONNELS] [int] NOT NULL,
	[REGION] [varchar](255) NULL,
	[MATRICULE] [smallint] NULL,
	[NOM] [varchar](255) NULL,
	[PRENOM] [varchar](255) NULL,
	[RUE] [varchar](255) NULL,
	[CP] [smallint] NULL,
	[VILLE] [varchar](255) NULL,
	[DATE_D_EMBAUCHE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MISSION]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MISSION](
	[ID_MISSION] [int] IDENTITY(1,1) NOT NULL,
	[ID_PERSONNELS] [int] NOT NULL,
	[ID_NOTE_DE_FRAIS] [int] NULL,
	[NOM1] [varchar](255) NULL,
	[DATE_MISSION] [date] NULL,
	[ID_PER] [varchar](50) NULL,
	[total] [int] NULL,
	[ID_PER_NOM] [varchar](50) NULL,
 CONSTRAINT [PK_MISSION] PRIMARY KEY CLUSTERED 
(
	[ID_MISSION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MISSION_COMPLEMENTAIRE]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MISSION_COMPLEMENTAIRE](
	[ID_MISSION_COMPLEMENTAIRE] [char](32) NOT NULL,
	[ID_MISSION] [int] NOT NULL,
	[RUE] [varchar](255) NULL,
	[CP] [int] NULL,
	[VILLE] [varchar](255) NULL,
	[THEME] [varchar](255) NULL,
	[NB_INVITER] [int] NULL,
	[NOM] [varchar](255) NULL,
	[DATE_MISSION] [datetime] NULL,
 CONSTRAINT [PK_MISSION_COMPLEMENTAIRE] PRIMARY KEY CLUSTERED 
(
	[ID_MISSION_COMPLEMENTAIRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDONNE]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDONNE](
	[ID_PERSONNELS_R] [char](32) NOT NULL,
	[ID_PERSONNELS_V] [smallint] NOT NULL,
	[DONNENBRDV] [smallint] NULL,
	[DONNEMOIS] [datetime] NULL,
 CONSTRAINT [PK_ORDONNE] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONNELS_R] ASC,
	[ID_PERSONNELS_V] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONNELS]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONNELS](
	[ID_PERSONNELS] [int] IDENTITY(1,1) NOT NULL,
	[MATRICULE] [varchar](255) NULL,
	[NOM] [varchar](255) NULL,
	[PRENOM] [varchar](255) NULL,
	[RUE] [varchar](255) NULL,
	[CP] [int] NULL,
	[VILLE] [varchar](255) NULL,
	[DATE_D_EMBAUCHE] [date] NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[isAdmin] [int] NULL,
 CONSTRAINT [PK_PERSONNELS] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONNELS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRACTICIENS]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRACTICIENS](
	[ID_PERSONNELS] [int] IDENTITY(1,1) NOT NULL,
	[ID_VISITE] [char](32) NOT NULL,
	[ETAT_CIVIL] [varchar](255) NULL,
	[NOTE] [int] NULL,
	[NOTORIETE] [varchar](255) NULL,
	[MENBRE_ASSOCIATION] [bit] NULL,
	[DIPLOME] [varchar](255) NULL,
 CONSTRAINT [PK_PRACTICIENS] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONNELS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPE_DE_FRAIS]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPE_DE_FRAIS](
	[ID_TYPE_FRAIS] [char](32) NOT NULL,
	[LIBELLE] [varchar](255) NULL,
	[PLAFOND] [smallint] NULL,
 CONSTRAINT [PK_TYPE_DE_FRAIS] PRIMARY KEY CLUSTERED 
(
	[ID_TYPE_FRAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VISITE]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITE](
	[ID_VISITE] [char](32) NOT NULL,
	[ID_MISSION] [int] NOT NULL,
	[RUE] [varchar](255) NULL,
	[CP] [int] NULL,
	[VILLE] [varchar](255) NULL,
	[DUREE] [datetime] NULL,
	[NOM] [varchar](255) NULL,
	[DATE_MISSION] [datetime] NULL,
 CONSTRAINT [PK_VISITE] PRIMARY KEY CLUSTERED 
(
	[ID_VISITE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VISITEUR]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITEUR](
	[ID_PERSONNELS] [int] NULL,
	[OBJECTIF] [varchar](255) NULL,
	[PRIME] [int] NULL,
	[BUDGET] [int] NULL,
	[AVANTAGE] [varchar](128) NULL,
	[CV_VOITURE] [char](32) NULL,
	[MATRICULE] [smallint] NULL,
	[NOM] [varchar](255) NULL,
	[PRENOM] [varchar](255) NULL,
	[RUE] [varchar](255) NULL,
	[CP] [smallint] NULL,
	[VILLE] [varchar](255) NULL,
	[DATE_D_EMBAUCHE] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTIENT]  WITH CHECK ADD  CONSTRAINT [FK_CONTIENT_TYPE_DE_FRAIS] FOREIGN KEY([ID_TYPE_FRAIS])
REFERENCES [dbo].[TYPE_DE_FRAIS] ([ID_TYPE_FRAIS])
GO
ALTER TABLE [dbo].[CONTIENT] CHECK CONSTRAINT [FK_CONTIENT_TYPE_DE_FRAIS]
GO
ALTER TABLE [dbo].[LES_RESPONSABLE_REGION]  WITH CHECK ADD  CONSTRAINT [FK_LES_RESPONSABLE_REGION_PERSONNELS1] FOREIGN KEY([ID_PERSONNELS])
REFERENCES [dbo].[PERSONNELS] ([ID_PERSONNELS])
GO
ALTER TABLE [dbo].[LES_RESPONSABLE_REGION] CHECK CONSTRAINT [FK_LES_RESPONSABLE_REGION_PERSONNELS1]
GO
ALTER TABLE [dbo].[LIGNE_DE_FRAIS]  WITH CHECK ADD  CONSTRAINT [FK_LIGNE_DE_FRAIS_NOTE_DE_FRAIS1] FOREIGN KEY([id_note])
REFERENCES [dbo].[NOTE_DE_FRAIS] ([ID_NOTE_DE_FRAIS])
GO
ALTER TABLE [dbo].[LIGNE_DE_FRAIS] CHECK CONSTRAINT [FK_LIGNE_DE_FRAIS_NOTE_DE_FRAIS1]
GO
ALTER TABLE [dbo].[MISSION]  WITH CHECK ADD  CONSTRAINT [FK_MISSION_NOTE_DE_FRAIS] FOREIGN KEY([ID_NOTE_DE_FRAIS])
REFERENCES [dbo].[NOTE_DE_FRAIS] ([ID_NOTE_DE_FRAIS])
GO
ALTER TABLE [dbo].[MISSION] CHECK CONSTRAINT [FK_MISSION_NOTE_DE_FRAIS]
GO
ALTER TABLE [dbo].[MISSION]  WITH CHECK ADD  CONSTRAINT [FK_MISSION_PERSONNELS] FOREIGN KEY([ID_PERSONNELS])
REFERENCES [dbo].[PERSONNELS] ([ID_PERSONNELS])
GO
ALTER TABLE [dbo].[MISSION] CHECK CONSTRAINT [FK_MISSION_PERSONNELS]
GO
ALTER TABLE [dbo].[MISSION_COMPLEMENTAIRE]  WITH CHECK ADD  CONSTRAINT [FK_MISSION_COMPLEMENTAIRE_MISSION] FOREIGN KEY([ID_MISSION])
REFERENCES [dbo].[MISSION] ([ID_MISSION])
GO
ALTER TABLE [dbo].[MISSION_COMPLEMENTAIRE] CHECK CONSTRAINT [FK_MISSION_COMPLEMENTAIRE_MISSION]
GO
ALTER TABLE [dbo].[PRACTICIENS]  WITH CHECK ADD  CONSTRAINT [FK_PRACTICIENS_VISITE] FOREIGN KEY([ID_VISITE])
REFERENCES [dbo].[VISITE] ([ID_VISITE])
GO
ALTER TABLE [dbo].[PRACTICIENS] CHECK CONSTRAINT [FK_PRACTICIENS_VISITE]
GO
ALTER TABLE [dbo].[VISITE]  WITH CHECK ADD  CONSTRAINT [FK_VISITE_MISSION] FOREIGN KEY([ID_MISSION])
REFERENCES [dbo].[MISSION] ([ID_MISSION])
GO
ALTER TABLE [dbo].[VISITE] CHECK CONSTRAINT [FK_VISITE_MISSION]
GO
ALTER TABLE [dbo].[VISITEUR]  WITH CHECK ADD  CONSTRAINT [FK_VISITEUR_PERSONNELS] FOREIGN KEY([ID_PERSONNELS])
REFERENCES [dbo].[PERSONNELS] ([ID_PERSONNELS])
GO
ALTER TABLE [dbo].[VISITEUR] CHECK CONSTRAINT [FK_VISITEUR_PERSONNELS]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Personnel]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Personnel](@P_NOM varchar(100))
AS
BEGIN
		select NOM from PERSONNELS
		delete from PERSONNELS where ID_PERSONNELS = (select ID_PERSONNELS from PERSONNELS where NOM = @P_NOM)
END;
GO
/****** Object:  StoredProcedure [dbo].[Get_Mission_By_Name]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Mission_By_Name](@P_NOM varchar(50))
as begin
	set nocount on;
	select * from MISSION where NOM like '%' +@P_NOM+ '%';
end;
GO
/****** Object:  StoredProcedure [dbo].[Insert_Frais]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Frais](@DATE_DEPOT date,@nom varchar(50))
AS
BEGIN
		
		insert into NOTE_DE_FRAIS(DATE_DEPOT,Nom)
		VALUES (@DATE_DEPOT,@nom)
END;
GO
/****** Object:  StoredProcedure [dbo].[insert_ligne_frais]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insert_ligne_frais](@nom_frais int,@nom varchar(50),@total int,@donner int)
AS
begin

	insert into LIGNE_DE_FRAIS(ID_NOTE_DE_FRAIS,Nom,Total,donner)
	
	
		values (@nom_frais,@nom,@total,@donner)
		end;

		/*(select ID_NOTE_DE_FRAIS from NOTE_DE_FRAIS where nom = @nom_frais)*/
GO
/****** Object:  StoredProcedure [dbo].[Insert_Mission]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Mission](@ID_personne int,@id_note_de_frais int,@nom varchar(50),@date_mission date,@id_per int)
AS
BEGIN
		
		insert into MISSION (ID_PERSONNELS,ID_NOTE_DE_FRAIS,NOM,DATE_MISSION,ID_PER)
		VALUES (@ID_personne,@id_note_de_frais, @nom, @date_mission,@id_per)
END;
GO
/****** Object:  StoredProcedure [dbo].[insert_personnel]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_personnel](@P_MATRICULE varchar(50),@P_NOM varchar(255),@P_PRENOM varchar(255),@P_RUE varchar(255),
@P_CP int,@P_VILLE varchar(255),@P_DATE_D_EMBAUCHE date,@P_email varchar(255),@P_password varchar(255))
AS
begin
		Insert into dbo.PERSONNELS (MATRICULE,NOM,PRENOM,RUE,CP,VILLE,DATE_D_EMBAUCHE,email,password,isAdmin)
		VALUES (@P_MATRICULE,@P_NOM,@P_PRENOM,@P_RUE,@P_CP,@P_VILLE,@P_DATE_D_EMBAUCHE,@P_email,@P_password,0)
end;
GO
/****** Object:  StoredProcedure [dbo].[liste_frais]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[liste_frais]
as
begin
SELECT *
FROM NOTE_DE_FRAIS
INNER JOIN LIGNE_DE_FRAIS ON NOTE_DE_FRAIS.ID_NOTE_DE_FRAIS = LIGNE_DE_FRAIS.ID_NOTE_DE_FRAIS WHERE NOTE_DE_FRAIS.ID_NOTE_DE_FRAIS = LIGNE_DE_FRAIS.ID_NOTE_DE_FRAIS
end
GO
/****** Object:  StoredProcedure [dbo].[liste_list_frais]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[liste_list_frais]
AS
BEGIN
	select * from LIGNE_DE_FRAIS
end;
GO
/****** Object:  StoredProcedure [dbo].[Liste_Mission_all]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure  [dbo].[Liste_Mission_all] as
begin
	SET NOCOUNT ON;

	select * from MISSION



end;

GO
/****** Object:  StoredProcedure [dbo].[Liste_Mission_By_Id]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure  [dbo].[Liste_Mission_By_Id](@P_personne int) as
begin
	SET NOCOUNT ON;
	
	select * from MISSION where ID_PERSONNELS = @P_personne;
end;

GO
/****** Object:  StoredProcedure [dbo].[liste_note_frais]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[liste_note_frais]
AS
BEGIN
	select * from NOTE_DE_FRAIS
end;
GO
/****** Object:  StoredProcedure [dbo].[Liste_Personnel]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Liste_Personnel]
AS
BEGIN
		select * from PERSONNELS
		
END;
GO
/****** Object:  StoredProcedure [dbo].[Me_connecte]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Me_connecte]
AS

BEGIN

		SELECT email,password,isAdmin,NOM,ID_PERSONNELS FROM PERSONNELS

END;
GO
/****** Object:  StoredProcedure [dbo].[update_personnel]    Script Date: 13/06/2020 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_personnel](
@P_ID_PERSONNElS int,
@P_MATRICULE varchar(50),
@P_NOM varchar(255),
@P_PRENOM varchar(255),
@P_RUE varchar(255),
@P_CP int,
@P_VILLE varchar(255),
@P_DATE_D_EMBAUCHE date,
@P_email varchar(255),
@P_password varchar(255))
AS
Begin
			
			Update PERSONNELS SET 
			MATRICULE= @P_MATRICULE, 
			NOM=@P_NOM, 
			PRENOM=@P_PRENOM, 
			RUE=@P_RUE, 
			CP=@P_CP, 
			VILLE=@P_VILLE, 
			DATE_D_EMBAUCHE=@P_DATE_D_EMBAUCHE, 
			email=@P_email, 
			password=@P_password
			WHERE ID_PERSONNELS=@P_ID_PERSONNElS

end;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[18] 2[16] 3) )"
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
         Begin Table = "LIGNE_DE_FRAIS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 215
               Right = 273
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
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
         Begin Table = "LIGNE_DE_FRAIS"
            Begin Extent = 
               Top = 45
               Left = 47
               Bottom = 175
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "NOTE_DE_FRAIS"
            Begin Extent = 
               Top = 45
               Left = 528
               Bottom = 175
               Right = 736
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [PPE3] SET  READ_WRITE 
GO
