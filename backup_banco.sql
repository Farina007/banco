USE [master]
GO
/****** Object:  Database [dele_gacia]    Script Date: 15/02/2024 16:04:30 ******/
CREATE DATABASE [dele_gacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dele_gacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dele_gacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dele_gacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dele_gacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dele_gacia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dele_gacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dele_gacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dele_gacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dele_gacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dele_gacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dele_gacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [dele_gacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dele_gacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dele_gacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dele_gacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dele_gacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dele_gacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dele_gacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dele_gacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dele_gacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dele_gacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dele_gacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dele_gacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dele_gacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dele_gacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dele_gacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dele_gacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dele_gacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dele_gacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dele_gacia] SET  MULTI_USER 
GO
ALTER DATABASE [dele_gacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dele_gacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dele_gacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dele_gacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dele_gacia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dele_gacia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dele_gacia] SET QUERY_STORE = ON
GO
ALTER DATABASE [dele_gacia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dele_gacia]
GO
/****** Object:  Table [dbo].[arma]    Script Date: 15/02/2024 16:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arma](
	[idArma] [int] NOT NULL,
	[descricao] [varchar](40) NOT NULL,
	[fabricante] [varchar](20) NOT NULL,
	[tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_arma] PRIMARY KEY CLUSTERED 
(
	[idArma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[criminoso]    Script Date: 15/02/2024 16:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[criminoso](
	[codigoCriminoso] [bit] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[cpf] [numeric](11, 0) NOT NULL,
	[rg] [varchar](20) NOT NULL,
	[datanasc] [date] NOT NULL,
	[foto] [nvarchar](50) NULL,
	[impressao] [image] NULL,
 CONSTRAINT [PK_criminoso] PRIMARY KEY CLUSTERED 
(
	[codigoCriminoso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ocorrencia]    Script Date: 15/02/2024 16:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ocorrencia](
	[idOcorrencia] [smallint] NOT NULL,
	[descricao] [nvarchar](100) NOT NULL,
	[local] [varchar](30) NOT NULL,
	[data] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[codVitima] [int] NOT NULL,
	[codCriminoso] [bit] NOT NULL,
	[codArma] [int] NOT NULL,
	[codPolicial] [bigint] NOT NULL,
 CONSTRAINT [PK_ocorrencia] PRIMARY KEY CLUSTERED 
(
	[idOcorrencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[policial]    Script Date: 15/02/2024 16:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policial](
	[idPolicia] [bigint] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[cpf] [numeric](11, 0) NOT NULL,
	[rg] [varchar](20) NOT NULL,
	[telefone] [nvarchar](25) NOT NULL,
	[cargo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_policial] PRIMARY KEY CLUSTERED 
(
	[idPolicia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vitima]    Script Date: 15/02/2024 16:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vitima](
	[idvitima] [int] NOT NULL,
	[nomeVitima] [varchar](80) NOT NULL,
	[CPF] [numeric](11, 0) NOT NULL,
	[RG] [varchar](20) NOT NULL,
	[telefone] [varchar](20) NOT NULL,
	[email] [varchar](60) NOT NULL,
	[datanasc] [date] NOT NULL,
 CONSTRAINT [PK_vitima] PRIMARY KEY CLUSTERED 
(
	[idvitima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_ocorrencia_arma] FOREIGN KEY([codArma])
REFERENCES [dbo].[arma] ([idArma])
GO
ALTER TABLE [dbo].[ocorrencia] CHECK CONSTRAINT [FK_ocorrencia_arma]
GO
ALTER TABLE [dbo].[ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_ocorrencia_criminoso] FOREIGN KEY([codCriminoso])
REFERENCES [dbo].[criminoso] ([codigoCriminoso])
GO
ALTER TABLE [dbo].[ocorrencia] CHECK CONSTRAINT [FK_ocorrencia_criminoso]
GO
ALTER TABLE [dbo].[ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_ocorrencia_policial] FOREIGN KEY([codPolicial])
REFERENCES [dbo].[policial] ([idPolicia])
GO
ALTER TABLE [dbo].[ocorrencia] CHECK CONSTRAINT [FK_ocorrencia_policial]
GO
ALTER TABLE [dbo].[ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_ocorrencia_vitima] FOREIGN KEY([codVitima])
REFERENCES [dbo].[vitima] ([idvitima])
GO
ALTER TABLE [dbo].[ocorrencia] CHECK CONSTRAINT [FK_ocorrencia_vitima]
GO
USE [master]
GO
ALTER DATABASE [dele_gacia] SET  READ_WRITE 
GO
