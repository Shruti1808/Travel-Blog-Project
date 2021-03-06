USE [TravelBlog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/20/2017 3:16:15 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 4/20/2017 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[ExperienceId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LocationId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[ExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/20/2017 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 4/20/2017 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People_Experiences]    Script Date: 4/20/2017 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People_Experiences](
	[PersonId] [int] NOT NULL,
	[ExperienceId] [int] NOT NULL,
 CONSTRAINT [PK_People_Experiences] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[ExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170420165924_Initial', N'1.0.0-rtm-21431')
SET IDENTITY_INSERT [dbo].[Experiences] ON 

INSERT [dbo].[Experiences] ([ExperienceId], [Description], [LocationId], [Title]) VALUES (1, N'It was fun', 1, N'Empire State Building')
INSERT [dbo].[Experiences] ([ExperienceId], [Description], [LocationId], [Title]) VALUES (2, N'great view from the top', 2, N'Space Needle')
SET IDENTITY_INSERT [dbo].[Experiences] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [Description], [Name]) VALUES (1, N'Big Apple', N'New York')
INSERT [dbo].[Locations] ([LocationId], [Description], [Name]) VALUES (2, N'Emerald City', N'Seattle')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [Name]) VALUES (1, N'Shruti Priya')
INSERT [dbo].[People] ([PersonId], [Name]) VALUES (2, N'Katy Daviscourt')
INSERT [dbo].[People] ([PersonId], [Name]) VALUES (3, N'Tammy Dang')
INSERT [dbo].[People] ([PersonId], [Name]) VALUES (4, N'Keely Glenn')
INSERT [dbo].[People] ([PersonId], [Name]) VALUES (6, N'Nicole')
SET IDENTITY_INSERT [dbo].[People] OFF
INSERT [dbo].[People_Experiences] ([PersonId], [ExperienceId]) VALUES (1, 2)
INSERT [dbo].[People_Experiences] ([PersonId], [ExperienceId]) VALUES (2, 1)
INSERT [dbo].[People_Experiences] ([PersonId], [ExperienceId]) VALUES (2, 2)
INSERT [dbo].[People_Experiences] ([PersonId], [ExperienceId]) VALUES (3, 1)
INSERT [dbo].[People_Experiences] ([PersonId], [ExperienceId]) VALUES (4, 1)
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Locations_LocationId]
GO
ALTER TABLE [dbo].[People_Experiences]  WITH CHECK ADD  CONSTRAINT [FK_People_Experiences_Experiences_ExperienceId] FOREIGN KEY([ExperienceId])
REFERENCES [dbo].[Experiences] ([ExperienceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People_Experiences] CHECK CONSTRAINT [FK_People_Experiences_Experiences_ExperienceId]
GO
ALTER TABLE [dbo].[People_Experiences]  WITH CHECK ADD  CONSTRAINT [FK_People_Experiences_People_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People_Experiences] CHECK CONSTRAINT [FK_People_Experiences_People_PersonId]
GO
