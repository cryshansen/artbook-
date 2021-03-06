USE [NaitBook]
GO
/****** Object:  Table [dbo].[UserAccounts_Roles]    Script Date: 04/01/2009 12:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAlbums](
	[AlbumID] int IDENTITY(1,1) not null primary key,
	[UserId] [int] NOT NULL FOREIGN KEY REFERENCES UserProfile (UserId),
	[AlbumName] [varchar](50) NOT NULL,
	[location][varchar](125) not null,
	[Album_desc] [text] null,
	[privacy] [varchar](75) null
)
insert into UserAlbums([UserId],[AlbumName],[location],[Album_desc],[privacy])
values( 1,'Bath Reno','home','My upstairs bathroom pre renovation photos.','Everyone');
insert into UserAlbums([UserId],[AlbumName],[location],[Album_desc],[privacy])
values( 1,'Chaeleas Room','home','My Daughter''s Room photos. After the painting.','Only Friends');


Select * from UserAlbums where userid=1
Drop Table AlbumPhotos
CREATE TABLE [dbo].[AlbumPhotos](
	[PhotoID] int IDENTITY(1,1) not null primary key,
	[AlbumID] int NOT NULL FOREIGN KEY REFERENCES UserAlbums (AlbumID),
	[PhotoName] [varchar](200) NOT NULL,
	[Photo_caption] [text] null,
	[Album_Cover][int] not null Default (0)
)
Select * from AlbumPhotos where albumid=1
Update AlbumPhotos
set PhotoName = 'admin\ChaeleasRoom\chaeleasRm1.jpg', ALbum_Cover=1 where PhotoId=2
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 2,'admin\ChaeleasRoom\chaeleasRm3.jpg','My Daughter''s Room photos. After the painting.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 2,'admin\ChaeleasRoom\chaeleasRm4.jpg','My Daughter''s Room photos. After the painting.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 2,'admin\ChaeleasRoom\chaeleasRm5.jpg','My Daughter''s Room photos. After the painting.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 2,'admin\ChaeleasRoom\chaeleasRm6.jpg','My Daughter''s Room photos. After the painting.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 2,'admin\ChaeleasRoom\chaeleasRm7.jpg','My Daughter''s Room photos. After the painting.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 2,'admin\ChaeleasRoom\chaeleasRm8.jpg','My Daughter''s Room photos. After the painting.',0);

Update AlbumPhotos
set PhotoName = 'admin\BathReno\bathimage.jpg',location='admin\BathReno\' where PhotoId=1
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage2.jpg','My upstairs bathroom pre renovation photos.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage3.jpg','My upstairs bathroom pre renovation photos.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage4.jpg','My upstairs bathroom pre renovation photos.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage5.jpg','My upstairs bathroom pre renovation photos.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage6.jpg','My upstairs bathroom pre renovation photos.',1);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage7.jpg','My upstairs bathroom pre renovation photos.',0);
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'admin\BathReno\bathimage8.jpg','My upstairs bathroom pre renovation photos.',0);

Drop TABLE [dbo].[UserAlbums]
Alter table UserAlbums
add Album_Cover Varchar(50)


Drop Proc GetAllAlbums
Create Proc GetAllAlbumsById(@UserId int)
as
Select UserAlbums.*,AlbumPhotos.location + AlbumPhotos.PhotoName as url from UserAlbums,AlbumPhotos 
where UserAlbums.AlbumId=AlbumPhotos.AlbumId and UserId=1 and Album_Cover=1
Drop Proc AddUserAlbums
Create Proc [dbo].[AddUserAlbums](@UserId int, @AlbumName varchar(50),@location varchar(125),@albumDesc text,@privacy varchar(75))
as
insert into UserAlbums([UserId],[AlbumName],[location],[Album_desc],[privacy])
values( @UserId,@AlbumName,@location,@albumDesc,@privacy);
return @@Identity
insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'bathimage2.jpg','admin\BathReno\','My upstairs bathroom pre renovation photos.',0);

Create Proc [dbo].[LookupFriends]
as
Select * from friends where FriendshipStatus='p';
