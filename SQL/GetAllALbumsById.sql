USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAlbumsById]    Script Date: 04/06/2009 08:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Drop Proc [dbo].[GetAllAlbumsById]
Create Proc [dbo].[GetAllAlbumsById](@UserId int)
as
Select UserAlbums.*,'..\images\'+ AlbumPhotos.PhotoName as url from UserAlbums,AlbumPhotos 
where UserAlbums.AlbumId=AlbumPhotos.AlbumId and UserId=1 and Album_Cover=1

insert into AlbumPhotos([AlbumId],[PhotoName],[Photo_caption],[Album_Cover])
values( 1,'Question.jpg',' ',0);