USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetStatusById]    Script Date: 03/31/2009 17:31:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetStatusById](@userid int)
as
Select myStatus, dateposted from UserStatus 
where UserId=@userid 
order by dateposted desc
return