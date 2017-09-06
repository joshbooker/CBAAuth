/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*
USE CBAAuth
GO

/****** Object:  Table [dbo].[Permissions]    Script Date: 9/1/2017 2:48:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[Created] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[Modified] [datetimeoffset](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 9/1/2017 2:48:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RoleName] [nvarchar](128) NOT NULL,
	[PermissionId] [nvarchar](322) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePerms]    Script Date: 9/1/2017 2:48:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePerms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[Created] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[Modified] [datetimeoffset](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[RolePerm_Permission] [int] NOT NULL,
	[Role_RolePerm] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/1/2017 2:48:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[Created] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[Modified] [datetimeoffset](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/1/2017 2:48:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[Created] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[Modified] [datetimeoffset](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[UserRole_Role] [int] NOT NULL,
	[UserRole_User] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/1/2017 2:48:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[SPUser] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[Created] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[Modified] [datetimeoffset](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
*/
SET IDENTITY_INSERT [dbo].[Permissions] ON 
DECLARE @AdminUser as nvarchar(max) = N'josh@joshbooker.com'

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (1, N'Users_CanInsert', @AdminUser, CAST(N'2017-08-31T13:20:26.3674241+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-09-01T04:28:20.0592933+00:00' AS DateTimeOffset))

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (2, N'Users_CanUpdate', @AdminUser, CAST(N'2017-08-31T13:21:18.7149740+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:21:18.7149740+00:00' AS DateTimeOffset))

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (3, N'Providers_CanInsert', @AdminUser, CAST(N'2017-08-31T13:21:44.4429072+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T19:19:37.1435042+00:00' AS DateTimeOffset))

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (4, N'Providers_CanUpdate', @AdminUser, CAST(N'2017-08-31T13:21:58.6284449+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:21:58.6284449+00:00' AS DateTimeOffset))

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (5, N'Clients_CanInsert', @AdminUser, CAST(N'2017-08-31T17:47:40.0586643+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:50:46.2564564+00:00' AS DateTimeOffset))

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (6, N'Clients_CanUpdate', @AdminUser, CAST(N'2017-08-31T17:47:50.6171299+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:51:00.8704864+00:00' AS DateTimeOffset))

INSERT [dbo].[Permissions] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (7, N'Clients_CanDelete', @AdminUser, CAST(N'2017-08-31T17:48:06.7693605+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:51:14.0240711+00:00' AS DateTimeOffset))

SET IDENTITY_INSERT [dbo].[Permissions] OFF

SET IDENTITY_INSERT [dbo].[RolePerms] ON 


INSERT [dbo].[RolePerms] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [RolePerm_Permission], [Role_RolePerm]) VALUES (1, @AdminUser, CAST(N'2017-08-31T13:22:35.6328852+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:22:35.6328852+00:00' AS DateTimeOffset), 1, 1)

INSERT [dbo].[RolePerms] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [RolePerm_Permission], [Role_RolePerm]) VALUES (2, @AdminUser, CAST(N'2017-08-31T13:22:35.6328852+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:22:35.6328852+00:00' AS DateTimeOffset), 2, 1)

INSERT [dbo].[RolePerms] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [RolePerm_Permission], [Role_RolePerm]) VALUES (3, @AdminUser, CAST(N'2017-08-31T13:23:57.7786557+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:23:57.7786557+00:00' AS DateTimeOffset), 3, 2)

INSERT [dbo].[RolePerms] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [RolePerm_Permission], [Role_RolePerm]) VALUES (4, @AdminUser, CAST(N'2017-08-31T13:23:57.7786557+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:23:57.7786557+00:00' AS DateTimeOffset), 4, 2)

INSERT [dbo].[RolePerms] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [RolePerm_Permission], [Role_RolePerm]) VALUES (5, @AdminUser, CAST(N'2017-08-31T17:49:30.9312014+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:49:30.9312014+00:00' AS DateTimeOffset), 5, 3)

INSERT [dbo].[RolePerms] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [RolePerm_Permission], [Role_RolePerm]) VALUES (6, @AdminUser, CAST(N'2017-08-31T17:49:30.9312014+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:49:30.9312014+00:00' AS DateTimeOffset), 6, 3)

SET IDENTITY_INSERT [dbo].[RolePerms] OFF

SET IDENTITY_INSERT [dbo].[Roles] ON 


INSERT [dbo].[Roles] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (1, N'Admin Role', @AdminUser, CAST(N'2017-08-31T13:22:35.6328852+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:30:17.6387363+00:00' AS DateTimeOffset))

INSERT [dbo].[Roles] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (2, N'Add Edit Provider Role', @AdminUser, CAST(N'2017-08-31T13:23:57.7786557+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:31:00.5922504+00:00' AS DateTimeOffset))

INSERT [dbo].[Roles] ([Id], [Name], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (3, N'Add Edit Client Role', @AdminUser, CAST(N'2017-08-31T17:49:30.9312014+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:49:30.9312014+00:00' AS DateTimeOffset))

SET IDENTITY_INSERT [dbo].[Roles] OFF

SET IDENTITY_INSERT [dbo].[UserRoles] ON 


INSERT [dbo].[UserRoles] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [UserRole_Role], [UserRole_User]) VALUES (1, @AdminUser, CAST(N'2017-08-31T13:23:01.0279789+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:23:01.0279789+00:00' AS DateTimeOffset), 1, 1)

INSERT [dbo].[UserRoles] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [UserRole_Role], [UserRole_User]) VALUES (2, @AdminUser, CAST(N'2017-08-31T13:29:15.6827410+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:29:15.6827410+00:00' AS DateTimeOffset), 2, 1)

INSERT [dbo].[UserRoles] ([Id], [CreatedBy], [Created], [ModifiedBy], [Modified], [UserRole_Role], [UserRole_User]) VALUES (3, @AdminUser, CAST(N'2017-08-31T17:49:46.5480478+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T17:49:46.5480478+00:00' AS DateTimeOffset), 3, 1)

SET IDENTITY_INSERT [dbo].[UserRoles] OFF

SET IDENTITY_INSERT [dbo].[Users] ON 


INSERT [dbo].[Users] ([Id], [Email], [Name], [SPUser], [CreatedBy], [Created], [ModifiedBy], [Modified]) VALUES (1, @AdminUser, @AdminUser, @AdminUser, @AdminUser, CAST(N'2017-08-31T13:18:55.6324005+00:00' AS DateTimeOffset), @AdminUser, CAST(N'2017-08-31T13:18:55.6324005+00:00' AS DateTimeOffset))

SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/*
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[RolePerms] ADD  DEFAULT ((0)) FOR [RolePerm_Permission]
GO
ALTER TABLE [dbo].[RolePerms] ADD  DEFAULT ((0)) FOR [Role_RolePerm]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[UserRoles] ADD  DEFAULT ((0)) FOR [UserRole_Role]
GO
ALTER TABLE [dbo].[UserRoles] ADD  DEFAULT ((0)) FOR [UserRole_User]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('') FOR [SPUser]
GO
ALTER TABLE [dbo].[RolePerms]  WITH CHECK ADD  CONSTRAINT [Role_RolePerm] FOREIGN KEY([Role_RolePerm])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolePerms] CHECK CONSTRAINT [Role_RolePerm]
GO
ALTER TABLE [dbo].[RolePerms]  WITH CHECK ADD  CONSTRAINT [RolePerm_Permission] FOREIGN KEY([RolePerm_Permission])
REFERENCES [dbo].[Permissions] ([Id])
GO
ALTER TABLE [dbo].[RolePerms] CHECK CONSTRAINT [RolePerm_Permission]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [UserRole_Role] FOREIGN KEY([UserRole_Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [UserRole_Role]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [UserRole_User] FOREIGN KEY([UserRole_User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [UserRole_User]
GO
*/