USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[UpdateImageLoc]    Script Date: 03/31/2009 17:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UpdateImageLoc](@imageLocation varchar(50), @UserId int)
as

Set Nocount On
Update UserProfile
set imageloc = @imageLocation
where UserId=@UserId