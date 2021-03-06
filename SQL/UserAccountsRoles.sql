USE [NaitBook]
GO
/****** Object:  Table [dbo].[UserAccounts_Roles]    Script Date: 03/31/2009 17:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccounts_Roles](
	[UserLogonId] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserLogonId] ASC,
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserAccounts_Roles]  WITH CHECK ADD  CONSTRAINT [UserProfile_Roles_RoleName] FOREIGN KEY([RoleName])
REFERENCES [dbo].[Roles] ([RoleName])
GO
ALTER TABLE [dbo].[UserAccounts_Roles] CHECK CONSTRAINT [UserProfile_Roles_RoleName]
GO
ALTER TABLE [dbo].[UserAccounts_Roles]  WITH CHECK ADD  CONSTRAINT [UserProfile_Roles_UserId] FOREIGN KEY([UserLogonId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[UserAccounts_Roles] CHECK CONSTRAINT [UserProfile_Roles_UserId]