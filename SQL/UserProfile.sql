USE [NaitBook]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 03/31/2009 17:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[passwrd] [varchar](50) NOT NULL,
	[F_Name] [varchar](50) NOT NULL,
	[L_Name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sex] [char](1) NULL,
	[birthday] [datetime] NULL,
	[imageloc] [varchar](50) NULL,
	[InvalidLogonAttempts] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF