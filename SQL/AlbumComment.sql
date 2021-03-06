USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 04/17/2009 15:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddComment](@UserId int ,@PostText text,@AlbumId int,@postedby int)
as

Insert into AlbumComment(UserId,AlbumId,postedBy,myPost,dateposted)
Values(@UserId,@AlbumId,@postedby,@PostText,getDate())
return

Create Table AlbumComment(
	[CommentId] int Identity (1,1) not null primary key,
	[AlbumID] int  not null FOREIGN KEY REFERENCES UserAlbums (AlbumId),
	[UserId] [int] NOT NULL FOREIGN KEY REFERENCES UserProfile (UserId),
	[postedBy] int not null foreign key references UserProfile (UserId),
	[myPost] text not null,
	dateposted datetime not null DEFAULT (getdate())
)

Alter Proc [dbo].[GetAlbumCommentsById](@userid int,@albumId int)
as
Select AC.postedBy, convert(varchar,AC.dateposted,107) as Postdate,AC.myPost,
P.F_Name + ' ' + P.L_Name as Name, 
'..\images\'+ P.imageloc as ImageLoc
from AlbumComment AC, UserProfile P ,UserAlbums A
where AC.AlbumId = A.AlbumId and A.UserId = AC.UserId and P.UserId = AC.postedBy and AC.UserId= 1--1@userid 
and AC.AlbumId = 9 --@albumId
order by dateposted desc
return