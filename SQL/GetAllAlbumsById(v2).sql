USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAlbumsById]    Script Date: 04/05/2009 15:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetAllAlbumsById](@UserId int)
as
Select UserAlbums.*,'..\images\'+AlbumPhotos.location + AlbumPhotos.PhotoName as url from UserAlbums,AlbumPhotos 
where UserAlbums.AlbumId=AlbumPhotos.AlbumId and UserId=1 and Album_Cover=1

Drop Proc [dbo].[GetAllAlbumsById](@UserId int)

Update AlbumPhotos 
Set location='' where AlbumId=20