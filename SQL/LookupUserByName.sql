USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[LookupUserByName]    Script Date: 03/31/2009 17:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LookupUserByName](@Username varchar(50))
AS


	Select UserId from UserProfile where Username = @Username 


return