USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetUserroles]    Script Date: 03/31/2009 17:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetUserroles](@UserId int)
As

Set NoCount On
Select * from UserAccounts_Roles where UserLogonId=@UserId