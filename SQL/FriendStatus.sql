USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAlbumsById]    Script Date: 04/06/2009 13:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Drop Proc [dbo].[GetAllAlbumsById]
Create Proc [dbo].[GetAllAlbumsById](@UserId int)
as
Select UserAlbums.*,'..\images\'+ AlbumPhotos.PhotoName as url from UserAlbums,AlbumPhotos 
where UserAlbums.AlbumId=AlbumPhotos.AlbumId and UserId=@UserId and Album_Cover=1

Drop Proc [dbo].[GetFriendsById ]
Create Proc [dbo].[GetFriendsById ](@UserId int)
as
Select Friends.*,userProfile.F_Name + ' ' + userProfile.L_Name as FullName from Friends, userProfile 
where (UserProfile.UserId = Friends.Friend1Id 
			and	Friends.Friend2Id = @UserId and FriendshipStatus='p')
	or
	(UserProfile.UserId = Friends.Friend2Id 
			and Friends.Friend1Id = @UserId and FriendshipStatus='p')
and FriendshipStatus='p' or Friend2Id=1
--@UserId 
and FriendshipStatus = 'p' --@UserId


Insert into Friends(Friend1Id,Friend2Id,FriendshipStatus)
Values (1,20,'p');
Drop Proc AddFriendship
Create Proc [dbo].AddFriendship(@FriendshipId int,@UserId int)
as
Update Friends
Set FriendshipStatus= 'y' where Friend1Id=@UserId and Friend2Id=@FriendshipId or Friend1Id=@FriendshipId and Friend2Id=@UserId
--Insert into Friends(Friend1Id,Friend2Id,FriendshipStatus)
--Values (@UserId,@FriendshipId,'y'); 
Drop Proc RejectFriendship
Create Proc [dbo].RejectFriendship(@FriendshipId int,@UserId int)
as
Update Friends
Set FriendshipStatus= 'n' where Friend1Id=@UserId and Friend2Id=@FriendshipId or Friend1Id=@FriendshipId and Friend2Id=@UserId

Create Proc [dbo].[LookupFriends]
as
Select * from friends where FriendshipStatus='p';

Create Proc [dbo].RejectFriendship(@FriendshipId int,@UserId int)
as
Update Friends
Set FriendshipStatus= 'p' where Friend1Id=1 and Friend2Id=19 or Friend1Id=19 and Friend2Id=1
--Insert into Friends(Friend1Id,Friend2Id,FriendshipStatus)
