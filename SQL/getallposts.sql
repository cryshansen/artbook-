USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetPostsById]    Script Date: 03/31/2009 14:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetAllPosts]
as
Select postedby,UserProfile.Username,UserProfile.F_Name + ' ' + UserProfile.L_Name as Name,UserPosts.UserId,
myPost,convert(varchar,dateposted,107) as Postdate,'..\images\'+ UserProfile.imageloc as ImageLoc, UserProfile.imageloc as proImage  from UserPosts 
inner join UserProfile on UserProfile.userid=UserPosts.postedby 
--inner join UserAccounts on UserProfile.userid=UserAccounts.UserId
