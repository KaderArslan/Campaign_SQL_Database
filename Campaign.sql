USE [master]
GO
/****** Object:  Database [Campaign]    Script Date: 22.04.2022 10:59:38 ******/
CREATE DATABASE [Campaign]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Campaign', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Campaign.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Campaign_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Campaign_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Campaign] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Campaign].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Campaign] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Campaign] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Campaign] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Campaign] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Campaign] SET ARITHABORT OFF 
GO
ALTER DATABASE [Campaign] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Campaign] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Campaign] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Campaign] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Campaign] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Campaign] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Campaign] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Campaign] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Campaign] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Campaign] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Campaign] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Campaign] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Campaign] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Campaign] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Campaign] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Campaign] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Campaign] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Campaign] SET RECOVERY FULL 
GO
ALTER DATABASE [Campaign] SET  MULTI_USER 
GO
ALTER DATABASE [Campaign] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Campaign] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Campaign] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Campaign] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Campaign] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Campaign] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Campaign', N'ON'
GO
ALTER DATABASE [Campaign] SET QUERY_STORE = OFF
GO
USE [Campaign]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Account (Hesap) Tablosu oluþturma*/
/*NOT NULL=Boþ olamaz, NULL=Boþ kalabilir*/
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_name] [varchar](40) NOT NULL,
	[Account_description] [varchar](40) NULL,
	[Account_phone] [int] NOT NULL,
	[Biling_address] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountContactRole]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*AccountContactRole (Hesap Ýletiþim Rolü) Tablosu oluþturma*/
CREATE TABLE [dbo].[AccountContactRole](
	[AccountContactRole_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
 CONSTRAINT [PK_AccountContactRole] PRIMARY KEY CLUSTERED 
(
	[AccountContactRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Campaign (Kampanya) Tablosu oluþturma*/
CREATE TABLE [dbo].[Campaign](
	[Campaign_ID] [int] IDENTITY(1,1) NOT NULL,
	[Campaign_name] [varchar](40) NOT NULL,
	[Campaign_objectives] [varchar](40) NOT NULL,
	[Campaign_sponsor] [varchar](40) NOT NULL,
	[Campaign_start_date] [date] NOT NULL,
	[Campaign_end_date] [date] NOT NULL,
	[Campaign_other_details] [varchar](40) NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[Campaign_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignMember]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*CampaignMember (Kampanya Üyesi) Tablosu oluþturma*/
CREATE TABLE [dbo].[CampaignMember](
	[CampaignMember_ID] [int] IDENTITY(1,1) NOT NULL,
	[Campaign_ID] [int] NOT NULL,
	[Lead_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
 CONSTRAINT [PK_CampaignMember] PRIMARY KEY CLUSTERED 
(
	[CampaignMember_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Case]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Case (Durum) Tablosu oluþturma*/
CREATE TABLE [dbo].[Case](
	[Case_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_ID] [int] NOT NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[Case_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Contact (Ýletiþim) Tablosu oluþturma*/
CREATE TABLE [dbo].[Contact](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Contact_address] [varchar](40) NOT NULL,
	[Contact_contact_details] [varchar](40) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Contract (Sözleþme) Tablosu oluþturma*/
CREATE TABLE [dbo].[Contract](
	[Contract_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Contract_status] [varchar](40) NOT NULL,
	[Contract_approval] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Contract_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lead]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Lead (Öncülük etmek) Tablosu oluþturma*/
CREATE TABLE [dbo].[Lead](
	[Lead_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lead_firestname] [varchar](40) NOT NULL,
	[Lead_surname] [varchar](40) NOT NULL,
	[Lead_other_details] [varchar](40) NULL,
 CONSTRAINT [PK_Lead] PRIMARY KEY CLUSTERED 
(
	[Lead_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opportunity]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Opportunity (Fýrsat) Tablosu oluþturma*/
CREATE TABLE [dbo].[Opportunity](
	[Opportunity_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Opportunity_description] [varchar](40) NULL,
	[Opportunity_details] [varchar](40) NULL,
	[Opportunity_stage] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Opportunity] PRIMARY KEY CLUSTERED 
(
	[Opportunity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpportunityContactRole]    Script Date: 22.04.2022 10:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*OpportunityContactRole (Fýrsat Ýletiþim Rolü) Tablosu oluþturma*/
CREATE TABLE [dbo].[OpportunityContactRole](
	[OpportunityContactRole_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_ID] [int] NOT NULL,
	[Opportunity_ID] [int] NOT NULL,
	[Date_time] [datetime2](7) NOT NULL,
	[Other_details] [varchar](40) NULL,
 CONSTRAINT [PK_OpportunityContactRole] PRIMARY KEY CLUSTERED 
(
	[OpportunityContactRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountContactRole]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRole_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[AccountContactRole] CHECK CONSTRAINT [FK_AccountContactRole_Account]
GO
ALTER TABLE [dbo].[AccountContactRole]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRole_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[AccountContactRole] CHECK CONSTRAINT [FK_AccountContactRole_Contact]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_CampaignMember] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_CampaignMember]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_CampaignMember1] FOREIGN KEY([Campaign_ID])
REFERENCES [dbo].[Campaign] ([Campaign_ID])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_CampaignMember1]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_Lead] FOREIGN KEY([Lead_ID])
REFERENCES [dbo].[Lead] ([Lead_ID])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_Lead]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_Contact]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
ALTER TABLE [dbo].[Opportunity]  WITH CHECK ADD  CONSTRAINT [FK_Opportunity_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Opportunity] CHECK CONSTRAINT [FK_Opportunity_Account]
GO
ALTER TABLE [dbo].[OpportunityContactRole]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRole_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[OpportunityContactRole] CHECK CONSTRAINT [FK_OpportunityContactRole_Contact]
GO
ALTER TABLE [dbo].[OpportunityContactRole]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRole_Opportunity] FOREIGN KEY([Opportunity_ID])
REFERENCES [dbo].[Opportunity] ([Opportunity_ID])
GO
ALTER TABLE [dbo].[OpportunityContactRole] CHECK CONSTRAINT [FK_OpportunityContactRole_Opportunity]
GO
USE [master]
GO
ALTER DATABASE [Campaign] SET  READ_WRITE 
GO
