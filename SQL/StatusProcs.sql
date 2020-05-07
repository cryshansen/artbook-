USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 03/26/2009 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddStatus](@UserId int ,@PostText text)
as

Insert into UserStatus(UserId,myStatus,dateposted)
Values(@UserId,@PostText,getDate())
return

Create Proc [dbo].[GetStatusById](@userid int)
as
Select myStatus, dateposted from UserStatus where UserId=@userid
return