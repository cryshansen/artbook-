USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[LookupUser]    Script Date: 03/31/2009 17:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LookupUser](@UserId varchar(50))
AS


	Select UserId,Username,F_Name,L_Name,email,sex,DatePart(MM,birthday)as Month1,DatePart(YY,birthday)as Year1,DatePart(DD,birthday)as Day1, imageloc from UserProfile where UserId =@UserId 


return