USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 03/31/2009 17:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddPost](@UserId int ,@PostText text,@postedby int)
as

Insert into UserPosts(UserId,postedby,myPost,dateposted)
Values(@UserId,@postedby,@PostText,getDate())
return