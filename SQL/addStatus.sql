USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddStatus]    Script Date: 03/31/2009 17:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddStatus](@UserId int ,@PostText text)
as

Insert into UserStatus(UserId,myStatus,dateposted)
Values(@UserId,@PostText,getDate())
return