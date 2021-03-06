USE [NaitBook]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 04/01/2009 16:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
create table Friends
(
	Friend1Id int NOT NULL references UserProfile(UserId),
	Friend2Id int NOT NULL references UserProfile(UserId),
	FriendshipStatus char not null,
	CONSTRAINT friends_primary_key PRIMARY KEY (Friend1Id, Friend2Id)
)
select * from Friends

select * from UserProfile

insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (1, 22, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (10, 18, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (1, 10, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (1, 13, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (25, 22, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (21, 25, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (1, 21, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (12, 19, 'Y');
insert into Friends (Friend1Id, Friend2Id, FriendshipStatus)
values (18, 20, 'Y');
Drop Procedure GetMemberFriends
CREATE Procedure GetMemberFriends (@UserId int)
As
	select UserId, UserProfile.F_Name + ' ' + UserProfile.L_Name as Full_Name,'..\images\'+ UserProfile.imageloc as ImageLoc
	from UserProfile, Friends
	where 
	(UserProfile.UserId = Friends.Friend1Id 
			and	Friends.Friend2Id = @UserId)
	or
	(UserProfile.UserId = Friends.Friend2Id 
			and Friends.Friend1Id = @UserId)
	
go
exec GetMemberFriends 1